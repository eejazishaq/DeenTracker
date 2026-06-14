/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

export interface Prayer {
  id: string;
  name: string;
  arabicName: string;
  time: string; // "04:32 AM"
  status: "completed" | "late" | "jamaah" | "masjid" | "qadha" | "missed" | null;
  reminderOffset: number; // minutes before
  azanSound: string; // "Traditional", "Makkah", "Madinah", "Silent"
  soundEnabled: boolean;
  notes?: string;
}

export interface Habit {
  id: string;
  name: string;
  arabicName: string;
  category: "quran" | "remembrance" | "night" | "charity" | "custom";
  description: string;
  completed: boolean;
  streak: number;
  totalCompleted: number;
  iconName: string;
  color?: string; // e.g. "sky", "neon-green", "pastel-yellow", "pastel-rose", "pastel-purple"
  emoji?: string; // custom emoji icon
  repeatDays?: string[]; // e.g. ["S", "M", "T", "W", "T", "F", "S"]
  repeatFrequency?: string; // e.g. "Daily", "Weekly"
  goal?: string; // habit target goal description
}

export interface IslamicEvent {
  id: string;
  name: string;
  arabicName: string;
  gregorianDate: string; // "2026-02-18" e.g.
  hijriDate: string; // "1 Ramadan 1447"
  type: "fasting" | "holiday" | "night";
}

export interface DayLog {
  date: string; // YYYY-MM-DD
  prayers: Record<string, string>; // prayerId -> status
  habits: Record<string, boolean>; // habitId -> completed
}

export interface AppSettings {
  language: "en" | "ar";
  rtlEnabled: boolean;
  theme: "light" | "dark";
  calculationMethod: string;
  locationName: string;
  latitude: number;
  longitude: number;
  azanVolume: number;
  vibrationOnReminder: boolean;
  textSize: "normal" | "large" | "extra-large";
}
