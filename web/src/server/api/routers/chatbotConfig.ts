import { z } from "zod";
import {
  createTRPCRouter,
  protectedProjectProcedure,
} from "@/src/server/api/trpc";
import {
  GetObjectCommand,
  PutObjectCommand,
  S3Client,
} from "@aws-sdk/client-s3";
import {
  CloudFrontClient,
  CreateInvalidationCommand,
} from "@aws-sdk/client-cloudfront";
import { ConfigType } from "@/src/utils/types";
import { throwIfNoProjectAccess } from "@/src/features/rbac/utils/checkProjectAccess";

const configSchema = z.object({
  fullScreenChatbotUrl: z.string().optional(),
  publicChatApi: z.string().url(),
  langfuseHost: z.string().url(),
  langfusePublicKey: z.string(),
  popup: z.enum(["left", "right"]).optional(),
  warningMessage: z.string().optional(),
  greetingMessage: z.string().optional(),
  botAvatar: z.string().url().optional(),
  botName: z.string().optional(),
  botNameColor: z.string().optional(),
  userAvatar: z.string().url().optional(),
  userName: z.string().optional(),
  userNameColor: z.string().optional(),
  popupLogo: z.string().url().optional(),
  popupTitle: z.string().optional(),
  popupSubtitle: z.string().optional(),
  themeColor: z.string().optional(),
  quickChat: z
    .object({
      title: z.string().optional(),
      subtitle: z.string().optional(),
      items: z
        .array(
          z.object({
            id: z.number(),
            title: z.string(),
            image: z.string().url().optional(),
            imagePosition: z.enum(["left", "right", "cover"]).optional(),
            textXPosition: z.enum(["textLeft", "textRight"]).optional(),
            textYPosition: z.enum(["textTop", "textBottom"]).optional(),
          }),
        )
        .optional(),
    })
    .optional(),
  chatSuggestionsList: z.array(z.string()).optional(),
  TOSMessage: z.string().optional(),
  uploadFileMessage: z.string().optional(),
});

const s3Client = new S3Client({
  region: "eu-west-1",
});

const cloudfrontClient = new CloudFrontClient({
  region: "eu-west-1",
});

const distributionId = "E1EV5LMHFSDHNO";

const bucketName = "nettalliansen-prod-bucket";

export const chatbotConfigRouter = createTRPCRouter({
  getConfig: protectedProjectProcedure
    .input(
      z.object({
        projectId: z.string(),
        projectName: z.string(),
        chatbotType: z.enum(["popup", "fullscreen"]),
      }),
    )
    .query(async ({ input, ctx }) => {
      const keyName = `${input.projectName}/${input.chatbotType}-config.json`;

      const res = await s3Client.send(
        new GetObjectCommand({
          Bucket: bucketName,
          Key: keyName,
        }),
      );

      const data = await res.Body?.transformToString();

      const parsedData = JSON.parse(data || "");

      // const parsedData = JSON.parse("");

      return parsedData as ConfigType;
    }),
  update: protectedProjectProcedure
    .input(
      z.object({
        projectId: z.string(),
        newConfigData: configSchema,
        projectName: z.string(),
        chatbotType: z.enum(["popup", "fullscreen"]),
      }),
    )
    .mutation(async ({ input, ctx }) => {
      throwIfNoProjectAccess({
        session: ctx.session,
        projectId: input.projectId,
        scope: "project:update",
      });

      const keyName = `${input.projectName}/${input.chatbotType}-config.json`;

      const res = await s3Client.send(
        new PutObjectCommand({
          Bucket: bucketName,
          Key: keyName,
          Body: JSON.stringify(input.newConfigData),
        }),
      );

      const invalidationParam = {
        DistributionId: distributionId,
        InvalidationBatch: {
          CallerReference: `${Date.now()}`,
          Paths: {
            Quantity: 1,
            Items: ["/*"],
          },
        },
      };

      const invalidationCommand = new CreateInvalidationCommand(
        invalidationParam,
      );

      const data = await cloudfrontClient.send(invalidationCommand);

      console.log("Invalidation data", data);

      return true;
    }),
});
