import { defaultLang, languages } from './languages';
import { ui } from './ui';

/** Translate string fixed label */
export function useTranslations(lang: keyof typeof languages) {
  return function t(key: keyof typeof ui[typeof lang]) {
    return ui[lang][key] || ui[defaultLang][key];
  }
}