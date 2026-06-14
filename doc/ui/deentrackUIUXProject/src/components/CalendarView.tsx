/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState } from "react";
import { AppSettings, IslamicEvent } from "../types";
import { Calendar, ChevronLeft, ChevronRight, Moon, Star, BellRing, Heart, Sparkles } from "lucide-react";
import { ISLAMIC_EVENTS_PRESET } from "../utils/mockData";

interface CalendarViewProps {
  settings: AppSettings;
}

export default function CalendarView({ settings }: CalendarViewProps) {
  const isAr = settings.language === "ar";
  
  // Internal state of selected month
  const [currentDateState, setCurrentDateState] = useState<Date>(new Date("2026-06-10")); // Set near the current local metadata time for consistency
  const [selectedEventId, setSelectedEventId] = useState<string>("ramadan_start");

  // Calibrate current Month details
  const daysInMonth = (year: number, month: number) => new Date(year, month + 1, 0).getDate();
  const firstDayIndex = () => new Date(currentDateState.getFullYear(), currentDateState.getMonth(), 1).getDay();

  const handlePrevMonth = () => {
    setCurrentDateState(new Date(currentDateState.getFullYear(), currentDateState.getMonth() - 1, 1));
  };

  const handleNextMonth = () => {
    setCurrentDateState(new Date(currentDateState.getFullYear(), currentDateState.getMonth() + 1, 1));
  };

  const monthNames = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  const monthNamesAr = [
    "يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو",
    "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"
  ];

  const weekdayShort = ["S", "M", "T", "W", "T", "F", "S"];
  const weekdayShortAr = ["ح", "ن", "ث", "ر", "خ", "ج", "س"];

  const currentYear = currentDateState.getFullYear();
  const currentMonth = currentDateState.getMonth();

  // Highlight days of Islamic Holidays in the monthly view grid
  const getEventForDayValue = (dayNum: number): IslamicEvent | undefined => {
    const formattedStr = `${currentYear}-${(currentMonth + 1).toString().padStart(2, "0")}-${dayNum.toString().padStart(2, "0")}`;
    return ISLAMIC_EVENTS_PRESET.find((ev) => ev.gregorianDate === formattedStr);
  };

  const gridDays = [];
  const totalDays = daysInMonth(currentYear, currentMonth);
  const startDayOffset = firstDayIndex();

  // empty gaps
  for (let i = 0; i < startDayOffset; i++) {
    gridDays.push(null);
  }
  // physical days
  for (let i = 1; i <= totalDays; i++) {
    gridDays.push(i);
  }

  // Countdowns
  // Ramadan begins around Feb 18, 2026. Since metadata says local time is June 10, 2026, let's count down to Ramadan 1448 (estimated around Feb 6, 2027)
  const computeCountdownToEvent = (targetDateStr: string) => {
    const target = new Date(targetDateStr);
    const today = new Date("2026-06-10T08:58:20Z"); // fixed local reference
    
    let diffMs = target.getTime() - today.getTime();
    if (diffMs < 0) {
      // If holiday has passed, count down to next cycle (e.g. +354 days lunar cycle displacement)
      target.setDate(target.getDate() + 354);
      diffMs = target.getTime() - today.getTime();
    }
    const diffDays = Math.ceil(diffMs / (1000 * 60 * 60 * 24));
    return diffDays;
  };

  const rDays = computeCountdownToEvent("2027-02-06"); // Ramadan 1448
  const eDays = computeCountdownToEvent("2027-03-08"); // Eid al-Fitr 1448

  return (
    <div className="space-y-6 pb-20">
      {/* Header */}
      <div className="boundary-card">
        <h2 className="text-2xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100 flex items-center gap-2">
          <span>{isAr ? "التقويم الهجري والمناسبات" : "Hijri Calendar"}</span>
        </h2>
        <p className="text-xs text-gray-500 dark:text-gray-400 mt-1">
          {isAr 
            ? "استكشف مواعيد المناسبات الإسلامية والإنذارات المسبقة للأعياد المباركة."
            : "Explore monthly grids and precise countdowns to major Islamic holidays and astronomical phases."}
        </p>
      </div>

      {/* Countdown Gauges */}
      <div className="grid grid-cols-2 gap-4">
        <div className="bg-gradient-to-br from-emerald-900 to-emerald-850 text-white rounded-3xl p-4 shadow-sm relative overflow-hidden">
          <div className="absolute right-[-10px] bottom-[-10px] opacity-10">
            <Moon className="w-24 h-24 stroke-white fill-white" />
          </div>
          <span className="text-[10px] uppercase font-mono tracking-widest text-emerald-250 block">
            {isAr ? "العد التنازلي لرمضان" : "Ramadan Countdown"}
          </span>
          <span className="text-3xl font-black font-mono block mt-2 text-amber-300">
            {rDays} <span className="text-sm font-normal text-white">days</span>
          </span>
          <span className="text-[10px] text-emerald-200 block mt-1 font-medium">
            Estimated 1 Ramadan 1448
          </span>
        </div>

        <div className="bg-gradient-to-br from-amber-900 to-amber-800 text-white rounded-3xl p-4 shadow-sm relative overflow-hidden">
          <div className="absolute right-[-10px] bottom-[-10px] opacity-10">
            <Sparkles className="w-24 h-24 stroke-white fill-white" />
          </div>
          <span className="text-[10px] uppercase font-mono tracking-widest text-amber-250 block">
            {isAr ? "العد التنازلي لعيد الفطر" : "Eid Countdown"}
          </span>
          <span className="text-3xl font-black font-mono block mt-2 text-yellow-300">
            {eDays} <span className="text-sm font-normal text-white">days</span>
          </span>
          <span className="text-[10px] text-amber-200 block mt-1 font-medium">
            Estimated 1 Shawwal 1448
          </span>
        </div>
      </div>

      {/* Interactive Month Grid */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-805/85 p-5 rounded-3xl space-y-4">
        <div className="flex justify-between items-center">
          <h3 className="font-bold text-gray-900 dark:text-gray-105">
            {isAr ? monthNamesAr[currentMonth] : monthNames[currentMonth]} {currentYear}
          </h3>
          <div className="flex gap-1.5">
            <button
              onClick={handlePrevMonth}
              className="p-1 rounded-lg hover:bg-slate-50 dark:hover:bg-zinc-800 text-gray-500 cursor-pointer"
            >
              <ChevronLeft className="w-4.5 h-4.5" />
            </button>
            <button
              onClick={handleNextMonth}
              className="p-1 rounded-lg hover:bg-slate-50 dark:hover:bg-zinc-800 text-gray-500 cursor-pointer"
            >
              <ChevronRight className="w-4.5 h-4.5" />
            </button>
          </div>
        </div>

        {/* Calendar days grid */}
        <div className="grid grid-cols-7 gap-y-2.5 gap-x-1.5 text-center text-xs">
          {/* Week headers */}
          {(isAr ? weekdayShortAr : weekdayShort).map((day, ix) => (
            <span key={ix} className="text-[10px] font-bold text-gray-400 uppercase tracking-widest">
              {day}
            </span>
          ))}

          {/* Days */}
          {gridDays.map((dayNum, idx) => {
            if (dayNum === null) {
              return <span key={idx} />;
            }

            const ev = getEventForDayValue(dayNum);
            const isToday = currentYear === 2026 && currentMonth === 5 && dayNum === 10; // metadata anchor June 10, 2026

            let dayStyle = "text-gray-700 dark:text-zinc-300 hover:bg-slate-50 dark:hover:bg-zinc-800/40 rounded-full";
            let dotStyle = "";

            if (isToday) {
              dayStyle = "bg-emerald-600 text-white font-bold rounded-full shadow-sm";
            } else if (ev) {
              if (ev.type === "holiday") {
                dayStyle = "bg-amber-100 text-amber-900 font-bold rounded-full dark:bg-amber-950/40 dark:text-amber-300";
              } else if (ev.type === "fasting") {
                dayStyle = "bg-teal-50 text-teal-800 font-bold rounded-full dark:bg-teal-950/30 dark:text-teal-300";
              } else {
                dayStyle = "bg-emerald-55 text-emerald-800 font-bold rounded-full dark:bg-emerald-950/40 dark:text-emerald-300";
              }
            }

            return (
              <div
                key={idx}
                className="flex flex-col items-center justify-center p-0.5 relative cursor-pointer group"
                onClick={() => ev && setSelectedEventId(ev.id)}
              >
                <span className={`w-8 h-8 flex items-center justify-center text-xs ${dayStyle}`}>
                  {dayNum}
                </span>

                {/* Event tooltip dot marker */}
                {ev && !isToday && (
                  <span className="absolute bottom-1 w-1.5 h-1.5 rounded-full bg-amber-500 dark:bg-amber-400" />
                )}
              </div>
            );
          })}
        </div>
      </div>

      {/* Islamic Events / Agenda List */}
      <div className="space-y-3">
        <h3 className="text-xs font-bold uppercase text-gray-400 tracking-wider">
          {isAr ? "الأجندة والمناسبات القادمة" : "Upcoming Islamic Events (1447-1448 AH)"}
        </h3>

        <div className="space-y-2.5">
          {ISLAMIC_EVENTS_PRESET.map((ev) => {
            const isSelected = selectedEventId === ev.id;
            
            let colorAccent = "border-emerald-600";
            let iconText = "🌙";
            if (ev.type === "holiday") {
              colorAccent = "border-amber-500";
              iconText = "🎉";
            } else if (ev.type === "fasting") {
              colorAccent = "border-teal-500";
              iconText = "🤲";
            }

            return (
              <div
                key={ev.id}
                onClick={() => setSelectedEventId(ev.id)}
                className={`bg-white dark:bg-zinc-900 p-4 border rounded-3xl flex justify-between items-center cursor-pointer transition-all ${
                  isSelected 
                    ? "border-emerald-500 shadow-md ring-1 ring-emerald-500/20" 
                    : "border-gray-50 hover:border-gray-150 dark:border-zinc-800/80"
                }`}
              >
                <div className="flex items-center gap-3">
                  <span className="text-xl">{iconText}</span>
                  <div>
                    <span className="font-semibold text-sm block text-gray-900 dark:text-gray-100">
                      {isAr ? ev.arabicName : ev.name}
                    </span>
                    <span className="text-[10px] text-gray-400 font-medium">
                      {ev.hijriDate}
                    </span>
                  </div>
                </div>

                <div className="text-right text-xs">
                  <span className="font-bold block text-zinc-850 dark:text-zinc-200">
                    {new Date(ev.gregorianDate).toLocaleDateString("en-US", {
                      month: "short",
                      day: "numeric",
                    })}
                  </span>
                  <span className="text-[9px] text-zinc-400 uppercase tracking-wide">
                    {ev.type}
                  </span>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
