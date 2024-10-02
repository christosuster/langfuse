import { api } from "@/src/utils/api";
import { type FilterState } from "@langfuse/shared";
import { ExpandListButton } from "@/src/features/dashboard/components/cards/ChevronButton";
import { useState } from "react";
import DocPopup from "@/src/components/layouts/doc-popup";
import { DashboardCard } from "@/src/features/dashboard/components/cards/DashboardCard";
import { TotalMetric } from "@/src/features/dashboard/components/TotalMetric";
import { BarList } from "@tremor/react";
import { NoData } from "@/src/features/dashboard/components/NoData";
import { compactNumberFormatter } from "@/src/utils/numbers";
import { useOrderByState } from "@/src/features/orderBy/hooks/useOrderByState";

export const OverviewCard = ({
  className,
  projectId,
  globalFilterState,
}: {
  className?: string;
  projectId: string;
  globalFilterState: FilterState;
}) => {
  const timeFilter = globalFilterState.map((f) =>
    f.type === "datetime" ? { ...f, column: "timestamp" } : f,
  );

  const sessionsTimeFilter = timeFilter
    .filter((f) => f.type === "datetime")
    .map((f) => ({
      column: "createdAt",
      type: "datetime",
      operator: f.operator,
      value: f.value,
    }));

  const [orderByState] = useOrderByState({
    column: "createdAt",
    order: "ASC",
  });

  const payloadGetAll = {
    projectId,
    filter: sessionsTimeFilter as FilterState,
    orderBy: orderByState,
    page: 0,
    limit: 1000,
  };

  const sessionData = api.sessions.all.useQuery(payloadGetAll);

  const sessionMetrics = api.sessions.metrics.useQuery(
    {
      projectId,
      sessionIds: sessionData.data?.sessions.map((s) => s.id) ?? [],
    },
    {
      enabled: sessionData.data !== undefined,
    },
  );

  console.log("sessionMetrics", sessionMetrics);

  type SessionType = {
    id: string;
    createdAt: Date;
  };

  const traces = api.dashboard.chart.useQuery(
    {
      projectId,
      from: "traces",
      select: [{ column: "traceName" }],
      filter: timeFilter,
    },
    {
      trpc: {
        context: {
          skipBatch: true,
        },
      },
    },
  );

  const totalDuration =
    sessionMetrics.data?.reduce(
      (total, session) => total + (session.sessionDuration ?? 0),
      0,
    ) || 0;
  const averageSessionDuration =
    totalDuration / (sessionMetrics.data?.length ?? 1);

  const messages = traces.data
    ? traces.data.filter((item) => item.traceName == "LlamaIndex Chat")
    : [];
  const chartData = [
    {
      name: "Messages",
      value: messages.length,
    },
    {
      name: "Conversations",
      value: sessionMetrics.data?.length || 0,
    },
  ];

  return (
    <DashboardCard
      className={className}
      title={"Overview"}
      description={null}
      isLoading={traces.isLoading || sessionMetrics.isLoading}
    >
      <>
        <TotalMetric
          metric={(averageSessionDuration / 60).toFixed(1) || 0}
          description={"Average Session Duration (in minutes)"}
        />
        {chartData[0].value > 0 ? (
          <>
            <BarList
              data={chartData}
              valueFormatter={(number: number) =>
                Intl.NumberFormat("en-US").format(number).toString()
              }
              className="mt-6"
              showAnimation={true}
              color={"indigo"}
            />
          </>
        ) : (
          <NoData noDataText="No data"></NoData>
        )}
      </>
    </DashboardCard>
  );
};
