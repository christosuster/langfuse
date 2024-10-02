import { api } from "@/src/utils/api";
import { orderBy, type FilterState } from "@langfuse/shared";
import { ExpandListButton } from "@/src/features/dashboard/components/cards/ChevronButton";
import { useMemo, useState } from "react";
import DocPopup from "@/src/components/layouts/doc-popup";
import { DashboardCard } from "@/src/features/dashboard/components/cards/DashboardCard";
import { TotalMetric } from "@/src/features/dashboard/components/TotalMetric";
import { BarList } from "@tremor/react";
import { NoData } from "@/src/features/dashboard/components/NoData";
import { compactNumberFormatter } from "@/src/utils/numbers";
import { useOrderByState } from "@/src/features/orderBy/hooks/useOrderByState";
import { useDetailPageLists } from "@/src/features/navigate-detail-pages/context";
import { useTableDateRange } from "@/src/hooks/useTableDateRange";
import { useQueryFilterState } from "@/src/features/filters/hooks/useFilterState";
import { NumberParam, useQueryParams, withDefault } from "use-query-params";
import { useRowHeightLocalStorage } from "@/src/components/table/data-table-row-height-switch";
import { BaseTimeSeriesChart } from "@/src/features/dashboard/components/BaseTimeSeriesChart";
import { isEmptyTimeSeries } from "@/src/features/dashboard/components/hooks";
import { DashboardDateRangeAggregationOption } from "@/src/utils/date-range-utils";
import { LineChart } from "@tremor/react";

export const SessionsChart = ({
  className,
  projectId,
  globalFilterState,
  agg,
}: {
  className?: string;
  projectId: string;
  globalFilterState: FilterState;
  agg: DashboardDateRangeAggregationOption;
}) => {
  const timeFilter = globalFilterState.map((f) =>
    f.type === "datetime" ? { ...f, column: "timestamp" } : f,
  );

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

    for (let i = 6; i >= 0; i--) {
      const date = new Date(
        today.getTime() - i * 24 * 60 * 60 * 1000,
      ).toDateString();
      groups[date] = [];
    }

    data.map((item) => {
      const date = new Date(item.createdAt).toDateString();
      groups[date].push(item);
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
