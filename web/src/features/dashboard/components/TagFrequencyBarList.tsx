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
import { tr } from "date-fns/locale";

export const TagFrequencyBarList = ({
  className,
  projectId,
  globalFilterState,
}: {
  className?: string;
  projectId: string;
  globalFilterState: FilterState;
}) => {
  const [isExpanded, setIsExpanded] = useState(false);

  const timeFilter = globalFilterState.map((f) =>
    f.type === "datetime" ? { ...f, column: "timestamp" } : f,
  );

  const traces = api.traces.all.useQuery(
    {
      projectId,
      filter: timeFilter as FilterState,
      orderBy: null,
      searchQuery: null,
      limit: 500,
      page: 0,
    },
    {
      trpc: {
        context: {
          skipBatch: true,
        },
      },
    },
  );

  type TagCountType = {
    [key: string]: number;
  };

  type TagCountItem = {
    name: string;
    value: number;
  };

  const tagCount: TagCountType = traces?.data?.traces
    ? traces.data.traces.reduce((acc, obj) => {
        const tag = obj.tags[0];
        if (acc[tag]) {
          acc[tag] += 1; // Increment the count if the tag is already in the accumulator
        } else {
          acc[tag] = 1; // Initialize count to 1 if it's the first time the tag appears
        }
        return acc;
      }, {} as TagCountType)
    : {};

  const tagCountArray: TagCountItem[] = Object.entries(tagCount).map(
    ([name, value]) => ({
      name,
      value,
    }),
  );

  console.log(tagCountArray);

  console.log(tagCount);

  const maxNumberOfEntries = { collapsed: 4, expanded: 20 };

  const adjustedData = isExpanded
    ? tagCountArray.slice(0, maxNumberOfEntries.expanded)
    : tagCountArray.slice(0, maxNumberOfEntries.collapsed);

  return (
    <DashboardCard
      className={className}
      title={"Message Categories"}
      description={null}
      isLoading={traces.isLoading}
    >
      <>
        <TotalMetric
          metric={traces.data?.traces?.length || 0}
          description={"Messages"}
        />
        {tagCountArray.length > 0 ? (
          <>
            <BarList
              data={adjustedData}
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
        <ExpandListButton
          isExpanded={isExpanded}
          setExpanded={setIsExpanded}
          totalLength={tagCountArray.length}
          maxLength={maxNumberOfEntries.collapsed}
          expandText={
            tagCountArray.length > maxNumberOfEntries.expanded
              ? `Show top ${maxNumberOfEntries.expanded}`
              : "Show all"
          }
        />
      </>
    </DashboardCard>
  );
};
