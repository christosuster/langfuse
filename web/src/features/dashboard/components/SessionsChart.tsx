import { api } from "@/src/utils/api";
import { type FilterState } from "@langfuse/shared";
import { useMemo } from "react";
import { DashboardCard } from "@/src/features/dashboard/components/cards/DashboardCard";
import { useOrderByState } from "@/src/features/orderBy/hooks/useOrderByState";
import { LineChart } from "@tremor/react";

export const SessionsChart = ({
  className,
  projectId,
  globalFilterState,
}: {
  className?: string;
  projectId: string;
  globalFilterState: FilterState;
}) => {
  const today = useMemo(() => new Date(), []);
  const lastWeek = useMemo(
    () => new Date(today.getTime() - 7 * 24 * 60 * 60 * 1000),
    [today],
  );

  const dateRangeFilter: FilterState = useMemo(
    () => [
      {
        column: "createdAt",
        type: "datetime",
        operator: ">=",
        value: lastWeek,
      },
      {
        column: "createdAt",
        type: "datetime",
        operator: "<=",
        value: today,
      },
    ],
    [lastWeek, today],
  );

  const [orderByState] = useOrderByState({
    column: "createdAt",
    order: "ASC",
  });

  const payloadGetAll = {
    projectId,
    filter: dateRangeFilter,
    orderBy: orderByState,
    page: 0,
    limit: 100,
  };

  const sessions = api.sessions.all.useQuery(payloadGetAll);

  type SessionType = {
    id: string;
    createdAt: Date;
  };

  const groupBy7Days = (data: SessionType[]) => {
    const groups: { [key: string]: SessionType[] } = {};
    const today = new Date();

    // Initialize an empty array for each of the last 7 days
    for (let i = 6; i >= 0; i--) {
      const date = new Date(
        today.getTime() - i * 24 * 60 * 60 * 1000,
      ).toDateString();
      groups[date] = [];
    }

    // Group data by date
    data.forEach((item) => {
      const date = new Date(item.createdAt).toDateString();

      // Ensure that only dates within the last 7 days are included
      if (groups[date]) {
        groups[date].push(item);
      }
    });

    return groups;
  };

  const groupedSessions = groupBy7Days(sessions.data?.sessions || []);

  const transformedSessions = [];

  for (const [key, value] of Object.entries(groupedSessions)) {
    transformedSessions.push({
      date: key,
      Conversation: value.length ? value.length : 0,
    });
  }

  return (
    <DashboardCard
      className={className}
      title="Weekly Conversations"
      description="Conversations of the last 7 days"
      isLoading={sessions.isLoading}
      cardContentClassName="flex flex-col content-end "
    >
      <LineChart
        className="h-80"
        data={transformedSessions}
        index="date"
        noDataText="No data"
        categories={["Conversation"]}
        intervalType="preserveStartEnd"
        colors={["indigo"]}
      />
    </DashboardCard>
  );
};
