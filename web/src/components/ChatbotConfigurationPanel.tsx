import { Button } from "@/src/components/ui/button";
import { Card, CardContent, CardTitle } from "@/src/components/ui/card";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/src/components/ui/form";
import { Textarea } from "@/src/components/ui/textarea";
import { api } from "@/src/utils/api";
import React, { useEffect } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import { ErrorPage } from "@/src/components/error-page";
import { useQueryProject } from "@/src/features/projects/hooks";

type ChatbotConfigurationPanelProps = {
  projectId: string;
};

const formSchema = z.object({
  suggested_questions: z.string(),
});

const ChatbotConfigurationPanel = ({
  projectId,
}: ChatbotConfigurationPanelProps) => {
  const { project } = useQueryProject();
  const utils = api.useUtils();

  const [isEditingPopupConfig, setIsEditingPopupConfig] =
    React.useState<boolean>(false);

  const [isEditingFullscreenConfig, setIsEditingFullscreenConfig] =
    React.useState<boolean>(false);

  const submitNewData = api.chatbotConfig.update.useMutation();

  const popupConfigData = api.chatbotConfig.getConfig.useQuery({
    projectId: projectId,
    projectName: project?.name || "",
    chatbotType: "popup",
  });

  const fullscreenConfigData = api.chatbotConfig.getConfig.useQuery({
    projectId: projectId,
    projectName: project?.name || "",
    chatbotType: "fullscreen",
  });

  const popupChatbotForm = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    values: {
      suggested_questions:
        popupConfigData.data?.chatSuggestionsList?.join(", ") || "",
    },
  });

  const fullscreenChatbotForm = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    values: {
      suggested_questions:
        fullscreenConfigData.data?.chatSuggestionsList?.join(", ") || "",
    },
  });

  function onPopupConfigSubmit(values: z.infer<typeof formSchema>) {
    if (!popupConfigData.data) return;

    try {
      const newData = {
        ...popupConfigData.data,
        chatSuggestionsList: values.suggested_questions.split(", "),
      };

      submitNewData.mutate({
        projectId: projectId,
        newConfigData: newData,
        projectName: project?.name || "",
        chatbotType: "popup",
      });

      setIsEditingPopupConfig(false);
    } catch (error) {
      console.error("Form submission error", error);
    }
  }

  function onFullscreenConfigSubmit(values: z.infer<typeof formSchema>) {
    if (!fullscreenConfigData.data) return;

    try {
      const newData = {
        ...fullscreenConfigData.data,
        chatSuggestionsList: values.suggested_questions.split(", "),
      };

      submitNewData.mutate({
        projectId: projectId,
        newConfigData: newData,
        projectName: project?.name || "",
        chatbotType: "fullscreen",
      });

      setIsEditingFullscreenConfig(false);
    } catch (error) {
      console.error("Form submission error", error);
    }
  }

  if (popupConfigData.error?.data?.code === "UNAUTHORIZED")
    return <ErrorPage message="You do not have access to this page." />;
  if (!popupConfigData.data || !fullscreenConfigData.data)
    return <div>Loading...</div>;
  return (
    <div>
      <Card className="mb-4 p-3">
        <CardTitle className="mb-5">Popup Chatbot</CardTitle>
        <Form {...popupChatbotForm}>
          <form
            onSubmit={popupChatbotForm.handleSubmit(onPopupConfigSubmit)}
            className="max-w-3xl space-y-5"
            name="popup-chatbot-form"
          >
            <FormField
              control={popupChatbotForm.control}
              name="suggested_questions"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Suggested Questions</FormLabel>
                  <FormControl>
                    <Textarea
                      disabled={!isEditingPopupConfig}
                      placeholder="Suggested Questions"
                      className="resize-none"
                      {...field}
                    />
                  </FormControl>
                  <FormDescription>
                    Enter questions separated by a comma and a space. E.g.: What
                    can you do?, How do I get started?
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            {isEditingPopupConfig ? (
              <div className="flex gap-2">
                <Button type="submit">Save</Button>
                <Button
                  onClick={() => {
                    utils.chatbotConfig.getConfig.refetch();
                    setIsEditingPopupConfig(false);
                    popupChatbotForm.reset();
                  }}
                >
                  Cancel
                </Button>
              </div>
            ) : (
              <Button onClick={() => setIsEditingPopupConfig(true)}>
                Edit
              </Button>
            )}
          </form>
        </Form>
      </Card>

      <Card className="mb-4 p-3">
        <CardTitle className="mb-5">Fullscreen Chatbot</CardTitle>
        <Form {...fullscreenChatbotForm}>
          <form
            onSubmit={fullscreenChatbotForm.handleSubmit(
              onFullscreenConfigSubmit,
            )}
            className="max-w-3xl space-y-5"
          >
            <FormField
              control={fullscreenChatbotForm.control}
              name="suggested_questions"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Suggested Questions</FormLabel>
                  <FormControl>
                    <Textarea
                      disabled={!isEditingFullscreenConfig}
                      placeholder="Suggested Questions"
                      className="resize-none"
                      {...field}
                    />
                  </FormControl>
                  <FormDescription>
                    Enter questions separated by a comma and a space. E.g.: What
                    can you do?, How do I get started?
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            {isEditingFullscreenConfig ? (
              <div className="flex gap-2">
                <Button type="submit">Save</Button>
                <Button
                  onClick={() => {
                    utils.chatbotConfig.getConfig.refetch();
                    setIsEditingFullscreenConfig(false);
                    fullscreenChatbotForm.reset();
                  }}
                >
                  Cancel
                </Button>
              </div>
            ) : (
              <Button onClick={() => setIsEditingFullscreenConfig(true)}>
                Edit
              </Button>
            )}
          </form>
        </Form>
      </Card>
    </div>
  );
};

export default ChatbotConfigurationPanel;
