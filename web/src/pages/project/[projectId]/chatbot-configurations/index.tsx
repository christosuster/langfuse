import ChatbotConfigurationPanel from "@/src/components/ChatbotConfigurationPanel";
import Header from "@/src/components/layouts/header";

import { useRouter } from "next/router";

export default function ChatbotConfigurations() {
  const router = useRouter();
  const projectId = router.query.projectId as string;

  return (
    <div>
      <Header
        title="Chatbot Configurations"
        help={{
          description: "Manage and edit your chatbot configurations.",
        }}
      />
      <ChatbotConfigurationPanel projectId={projectId} />
    </div>
  );
}
