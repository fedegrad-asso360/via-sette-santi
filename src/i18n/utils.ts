import { defaultLang, languages } from './languages';
import { ui } from './ui';

/** Translate string fixed label */
export function useTranslations(lang: keyof typeof languages) {
  return function t(key: keyof typeof ui[typeof lang]) {
    return ui[lang][key] || ui[defaultLang][key];
  }
}



/** Extract the effective current resource route, removing baseUrl and lang from the current navigation URL */
export function getResourceRoute(urlPathname: string) {
  // base path of the site from Vite config
  const baseUrl = import.meta.env.BASE_URL;

  // language codes for regex (es. en|it|fr|de)
  const langs: string = Object.keys(languages).join("|");

  // remove baseUrl + language from the pathname to extract the resource path
  return urlPathname.replace(new RegExp(`^${baseUrl}/(${langs})`), '');
}

