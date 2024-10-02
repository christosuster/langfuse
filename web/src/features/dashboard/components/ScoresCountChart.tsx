import DocPopup from "@/src/components/layouts/doc-popup";
import { NoData } from "@/src/features/dashboard/components/NoData";
import { DashboardCard } from "@/src/features/dashboard/components/cards/DashboardCard";
import { DashboardTable } from "@/src/features/dashboard/components/cards/DashboardTable";
import {
  type ScoreDataType,
  type ScoreSource,
  type FilterState,
} from "@langfuse/shared";
import { api } from "@/src/utils/api";
import { compactNumberFormatter } from "@/src/utils/numbers";
import { RightAlignedCell } from "./RightAlignedCell";
import { LeftAlignedCell } from "@/src/features/dashboard/components/LeftAlignedCell";
import { TotalMetric } from "./TotalMetric";
import { createTracesTimeFilter } from "@/src/features/dashboard/lib/dashboard-utils";
import { getScoreDataTypeIcon } from "@/src/features/scores/components/ScoreDetailColumnHelpers";
import { isCategoricalDataType } from "@/src/features/scores/lib/helpers";
import { type DatabaseRow } from "@/src/server/api/services/query-builder";
import { DonutChart, Legend } from "@tremor/react";

const dropValuesForCategoricalScores = (
  value: number,
  scoreDataType: ScoreDataType,
): string => {
  return isCategoricalDataType(scoreDataType)
    ? "-"
    : compactNumberFormatter(value);
};

const scoreNameSourceDataTypeMatch =
  (scoreName: string, scoreSource: ScoreSource, scoreDataType: ScoreDataType) =>
  (item: DatabaseRow) =>
    item.scoreName === scoreName &&
    item.scoreSource === scoreSource &&
    item.scoreDataType === scoreDataType;

export const ScoresCountChart = ({
  className,
  projectId,
  globalFilterState,
}: {
  className: string;
  projectId: string;
  globalFilterState: FilterState;
}) => {
  const dataFormatter = (number: number) =>
    `$ ${Intl.NumberFormat("us").format(number).toString()}`;

  const totalMetricsLocalFilters = createTracesTimeFilter(
    globalFilterState,
    "timestamp",
  );

  const scoredMetricsLocalFilters = createTracesTimeFilter(
    globalFilterState,
    "scoreTimestamp",
  );

  const scoredMetricsData = api.dashboard.chart.useQuery(
    {
      projectId,
      from: "traces_scores",
      select: [
        { column: "value" },
        { column: "scoreName" },
        { column: "value", agg: "COUNT" }, // Count the occurrences of each value
      ],
      filter: [
        ...scoredMetricsLocalFilters,
        {
          column: "scoreName",
          operator: "=",
          value: "User Feedback",
          type: "string",
        },
      ],
      groupBy: [
        { column: "value", type: "number" }, // Group by 'value'
        { column: "scoreName", type: "string" }, // Group by 'scoreName'
      ],
    },
    {
      trpc: {
        context: {
          skipBatch: true,
        },
      },
    },
  );

  const totalMetricsData = api.dashboard.chart.useQuery(
    {
      projectId,
      from: "traces",
      select: [{ column: "traceName" }, { column: "traceId", agg: "COUNT" }],
      groupBy: [{ type: "string", column: "traceName" }],
      filter: [...totalMetricsLocalFilters],
    },
    {
      trpc: {
        context: {
          skipBatch: true,
        },
      },
    },
  );

  const chatTraces = totalMetricsData.data?.find(
    (item) => item.traceName === "LlamaIndex Chat",
  );

  const scoredTraces = scoredMetricsData.data;

  const totalTracesCount = chatTraces?.countTraceId
    ? (chatTraces.countTraceId as number)
    : 0;

  const totalScoredTracesCount = scoredTraces
    ? scoredTraces.reduce(
        (acc, item) =>
          acc + (item.countValue ? parseInt(item.countValue as string) : 0),
        0,
      )
    : 0;

  const combinedData = [
    {
      label: "Postive",
      value:
        scoredTraces && scoredTraces.find((e) => e.value === 1)?.countValue
          ? scoredTraces.find((e) => e.value === 1)?.countValue
          : 0,
    },
    {
      label: "Negative",
      value:
        scoredTraces && scoredTraces.find((e) => e.value === 0)?.countValue
          ? scoredTraces.find((e) => e.value === 0)?.countValue
          : 0,
    },
    {
      label: "Not Scored",
      value: totalTracesCount - totalScoredTracesCount,
    },
  ];

  return (
    <DashboardCard
      className={className}
      title="Message Scores"
      isLoading={scoredMetricsData.isLoading || totalMetricsData.isLoading}
    >
      <TotalMetric
        metric={
          chatTraces?.countTraceId
            ? compactNumberFormatter(chatTraces.countTraceId as number)
            : "0"
        }
        description="Messages"
      />
      {!totalTracesCount ? (
        <NoData noDataText="No data" />
      ) : (
        <div className="flex flex-col items-center justify-center space-y-3">
          <DonutChart
            data={combinedData}
            variant="pie"
            index="label"
            category="value"
            colors={["green", "rose", "stone"]}
          />
          <Legend
            categories={combinedData.map((item) => {
              return item.label;
            })}
            className="max-w-sm"
            colors={["green", "rose", "stone"]}
          />
        </div>
      )}
    </DashboardCard>
  );
};
