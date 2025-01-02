import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/src/components/ui/select";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";

const LanguageSwitcher = () => {
  const router = useRouter();
  const { locale } = router;
  const [languages] = useState([
    { code: "en", label: "English" },
    { code: "de", label: "Deutsch" },
    { code: "no", label: "Norsk" },
    // Add more languages here
  ]);

  const handleLanguageChange = (newLocale: string) => {
    console.log("newLocale", newLocale);
    console.log("router", router);
    // Update the URL to reflect the new language
    router.push(router.asPath, undefined, { locale: newLocale });
  };

  return (
    <div className="mb-4">
      <Select onValueChange={(e) => handleLanguageChange(e)}>
        <SelectTrigger className="w-[180px]">
          <SelectValue
            placeholder={languages.find((e) => e.code == locale)?.label}
          />
        </SelectTrigger>
        <SelectContent>
          {languages.map((lang) => (
            <SelectItem key={lang.code} value={lang.code}>
              {lang.label}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  );
};

export default LanguageSwitcher;
