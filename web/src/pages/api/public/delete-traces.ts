import { prisma } from "@langfuse/shared/src/db";
import type { NextApiRequest, NextApiResponse } from "next";
import { env } from "@/src/env.mjs";
// import { env } from "../../env";

const SECRET_KEY = env.DELETE_TRACES_SECRET_KEY;

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse,
) {
  console.log("SECRET_KEY", SECRET_KEY);

  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" });
  }

  const { secretKey } = req.body;
  if (secretKey !== SECRET_KEY) {
    return res.status(403).json({ error: "Invalid key" });
  }

  try {
    const sessions = await prisma.trace.findMany({
      where: {
        name: "File Upload",
      },
      select: {
        sessionId: true,
      },
    });

    const sessionIds = sessions
      .filter(
        (session: { sessionId: string | null }) => session.sessionId !== null,
      )
      .map(
        (session: { sessionId: string | null }) => session.sessionId as string,
      );

    if (sessionIds.length === 0) {
      console.log("No sessions with name 'File Upload' found.");
      return res.status(200).json({
        status: "OK",
        message: "No sessions with name 'File Upload' found.",
      });
    }

    const traces = await prisma.trace.findMany({
      where: {
        sessionId: {
          in: sessionIds,
        },
      },
      select: {
        id: true,
      },
    });

    const traceIds = traces.map((trace: { id: string }) => trace.id);

    if (traceIds.length === 0) {
      console.log("No traces with sessionId found.");
      return res.status(200).json({
        status: "OK",
        message: "No traces with sessionId found.",
      });
    }

    await prisma.observation.deleteMany({
      where: {
        traceId: {
          in: traceIds,
        },
      },
    });

    await prisma.score.deleteMany({
      where: {
        traceId: {
          in: traceIds,
        },
      },
    });

    await prisma.trace.deleteMany({
      where: {
        id: {
          in: traceIds,
        },
      },
    });

    await prisma.traceSession.deleteMany({
      where: {
        id: {
          in: sessionIds,
        },
      },
    });

    console.log("Traces deleted successfully.");
    return res.status(200).json({
      status: "OK",
      message: "Traces deleted successfully.",
    });
  } catch (error) {
    console.error("Error deleting traces", error);
    return res.status(500).json({ error: "Error deleting traces" });
  }
}
