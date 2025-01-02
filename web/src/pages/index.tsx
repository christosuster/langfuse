import { OrganizationProjectOverview } from "@/src/features/organizations/components/ProjectOverview";

export default function Home() {
  return (
    <>
      <OrganizationProjectOverview />
    </>
  );
}

// export async function getStaticProps({ locale }: GetStaticPropsContext) {
//   console.log("locale", locale);
//   return {
//     props: {
//       messages: (await import(`../../messages/${locale}.json`)).default,
//     },
//   };
// }
