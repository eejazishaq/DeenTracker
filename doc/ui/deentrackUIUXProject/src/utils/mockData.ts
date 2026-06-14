/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { IslamicEvent } from "../types";

/**
 * Generates high-fidelity historic tracking logs for the past 60 days.
 * This simulates a user who consistently tracks their prayers and habits,
 * displaying standard high-fidelity data patterns on the GitHub contribution map.
 */
export function generateMock60DayHistory(): Array<{
  date: string;
  prayersCompletedCount: number;
  habitsCompletedCount: number;
  totalPrayers: number;
  totalHabits: number;
}> {
  const history = [];
  const today = new Date();
  
  for (let i = 59; i >= 0; i--) {
    const date = new Date(today);
    date.setDate(today.getDate() - i);
    const dateStr = date.toISOString().split("T")[0];
    
    // Day-of-week base habits completion fluctuations
    const dayOfWeek = date.getDay();
    let prayerCount = 5;
    let habitCount = 4;
    
    // Simulate some realistic patterns (maybe missed a prayer or skipped habits sometimes)
    if (i === 0) {
      prayerCount = 4; // Today is partially tracked
      habitCount = 2;
    } else {
      if (Math.random() > 0.85) {
        prayerCount = Math.floor(Math.random() * 2) + 3; // 3 or 4
      }
      if (Math.random() > 0.75) {
        habitCount = Math.floor(Math.random() * 3) + 2; // 2 to 4
      }
    }
    
    history.push({
      date: dateStr,
      prayersCompletedCount: prayerCount,
      habitsCompletedCount: habitCount,
      totalPrayers: 5,
      totalHabits: 6
    });
  }
  
  return history;
}

/**
 * Highlighted events of the Islamic calendar
 */
export const ISLAMIC_EVENTS_PRESET: IslamicEvent[] = [
  {
    id: "isra_miraj",
    name: "Isra' and Mi'raj",
    arabicName: "الإسراء والمعراج",
    gregorianDate: "2026-02-15",
    hijriDate: "27 Rajab 1447",
    type: "night"
  },
  {
    id: "ramadan_start",
    name: "Ramadan Begins",
    arabicName: "بداية رمضان",
    gregorianDate: "2026-02-18",
    hijriDate: "1 Ramadan 1447",
    type: "fasting"
  },
  {
    id: "laylat_qadr",
    name: "Laylat al-Qadr",
    arabicName: "ليلة القدر",
    gregorianDate: "2026-03-15",
    hijriDate: "27 Ramadan 1447",
    type: "night"
  },
  {
    id: "eid_fitr",
    name: "Eid al-Fitr",
    arabicName: "عيد الفطر",
    gregorianDate: "2026-03-20",
    hijriDate: "1 Shawwal 1447",
    type: "holiday"
  },
  {
    id: "hajj_start",
    name: "Hajj Season Starts",
    arabicName: "موسم الحج",
    gregorianDate: "2026-05-18",
    hijriDate: "1 Dhu al-Hijjah 1447",
    type: "fasting"
  },
  {
    id: "day_arafah",
    name: "Day of Arafah",
    arabicName: "يوم عرفة",
    gregorianDate: "2026-05-26",
    hijriDate: "9 Dhu al-Hijjah 1447",
    type: "fasting"
  },
  {
    id: "eid_adha",
    name: "Eid al-Adha",
    arabicName: "عيد الأضحى",
    gregorianDate: "2026-05-27",
    hijriDate: "10 Dhu al-Hijjah 1447",
    type: "holiday"
  },
  {
    id: "islamic_new_year",
    name: "Islamic New Year",
    arabicName: "رأس السنة الهجرية",
    gregorianDate: "2026-06-16",
    hijriDate: "1 Muharram 1448",
    type: "holiday"
  }
];

export const DAILY_WORDS_OF_WISDOM = [
  {
    quote: "Perform prayer regularly; indeed, prayer restrains from shameful and unjust deeds.",
    source: "Surah Al-Ankabut 29:45",
    theme: "Mindfulness & Clarity",
    author: "Quran"
  },
  {
    quote: "Be patient; indeed, the promise of Allah is truth.",
    source: "Surah Ar-Rum 30:60",
    theme: "Resilience & Focus",
    author: "Quran"
  },
  {
    quote: "The most beloved of actions to Allah are those that are consistent, even if they are small.",
    source: "Sahih al-Bukhari",
    theme: "Habit Stacking",
    author: "Prophet Muhammad (ﷺ)"
  },
  {
    quote: "And whosoever fears Allah, He will make a way out for him and provide for him from sources he could never imagine.",
    source: "Surah At-Talaq 65:2-3",
    theme: "Trust & Hope",
    author: "Quran"
  },
  {
    quote: "Cleanliness is half of faith.",
    source: "Sahih Muslim",
    theme: "Spiritual Hygiene",
    author: "Prophet Muhammad (ﷺ)"
  },
  {
    quote: "Indeed, with hardship, there will be ease.",
    source: "Surah Ash-Sharh 94:6",
    theme: "Solace & Relief",
    author: "Quran"
  },
  {
    quote: "My Lord, increase me in knowledge.",
    source: "Surah Taha 20:114",
    theme: "Growth Mindset",
    author: "Quran"
  }
];
