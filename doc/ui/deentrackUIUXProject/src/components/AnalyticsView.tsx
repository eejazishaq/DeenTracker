/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState } from "react";
import { AppSettings } from "../types";
import { generateMock60DayHistory } from "../utils/mockData";
import { TrendingUp, Award, Calendar, BarChart2, CheckSquare } from "lucide-react";

interface AnalyticsViewProps {
  settings: AppSettings;
}

export default function AnalyticsView({ settings }: AnalyticsViewProps) {
  const isAr = settings.language === "ar";
  
  // Build 60 days simulation data
  const mockHistoryRef = generateMock60DayHistory();
  const [activeSquareIndex, setActiveSquareIndex] = useState<number | null>(null);

  // Stats calculation
  const totalCompletedPrayers = mockHistoryRef.reduce((sum, day) => sum + day.prayersCompletedCount, 0);
  const prayerCompletionPercentage = Math.round((totalCompletedPrayers / (60 * 5)) * 100);

  const totalCompletedHabits = mockHistoryRef.reduce((sum, day) => sum + day.habitsCompletedCount, 0);
  const habitCompletionPercentage = Math.round((totalCompletedHabits / (60 * 6)) * 100);

  // SVG Line Chart coordinates for previous 7 days
  const last7Days = mockHistoryRef.slice(-7);
  const chartHeight = 80;
  const chartWidth = 280;
  const paddingX = 20;

  // Map 7 days values. Max prayers tracked per day is 5.
  const points = last7Days.map((val, idx) => {
    const x = paddingX + (idx / 6) * (chartWidth - 2 * paddingX);
    // Inverse scale (higher value = lower coordinate)
    const y = chartHeight - (val.prayersCompletedCount / 5) * (chartHeight - 20) - 10;
    return { x, y, value: val.prayersCompletedCount };
  });

  const linePath = points.map((p, idx) => `${idx === 0 ? "M" : "L"} ${p.x} ${p.y}`).join(" ");

  return (
    <div className="space-y-6 pb-20">
      {/* Header */}
      <div className="boundary-card">
        <h2 className="text-2xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100 flex items-center gap-2">
          <span>{isAr ? "تحليل المداومة والتقدم" : "Analytics Hub"}</span>
        </h2>
        <p className="text-xs text-gray-500 dark:text-gray-400 mt-1">
          {isAr 
            ? "تتبع تفاصيل مواظبتك اليومية لتطوير عادات روحية دائمة وثابتة."
            : "Monitor consistency metrics, weekly completion trends, and your total habit streak history."}
        </p>
      </div>

      {/* Metrics Row */}
      <div className="grid grid-cols-2 gap-4">
        <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-4.5 rounded-3xl flex flex-col justify-between space-y-2">
          <span className="text-[10px] text-gray-400 uppercase tracking-widest font-bold">
            {isAr ? "نسبة التزام الصلاة" : "Salah Attendance"}
          </span>
          <div>
            <span className="text-3xl font-mono font-black text-emerald-800 dark:text-emerald-300">
              {prayerCompletionPercentage}%
            </span>
            <div className="w-full h-1.5 bg-slate-100 rounded-full mt-2.5 overflow-hidden">
              <div 
                className="h-full bg-emerald-600 rounded-full" 
                style={{ width: `${prayerCompletionPercentage}%` }} 
              />
            </div>
          </div>
          <span className="text-[9px] text-gray-400 dark:text-gray-500 font-medium">60-Day tracking stats</span>
        </div>

        <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-4.5 rounded-3xl flex flex-col justify-between space-y-2">
          <span className="text-[10px] text-gray-400 uppercase tracking-widest font-bold">
            {isAr ? "المداومة على السنن" : "Habit Consistency"}
          </span>
          <div>
            <span className="text-3xl font-mono font-black text-amber-600 dark:text-amber-400">
              {habitCompletionPercentage}%
            </span>
            <div className="w-full h-1.5 bg-slate-100 rounded-full mt-2.5 overflow-hidden">
              <div 
                className="h-full bg-amber-500 rounded-full" 
                style={{ width: `${habitCompletionPercentage}%` }} 
              />
            </div>
          </div>
          <span className="text-[9px] text-gray-400 dark:text-gray-500 font-medium">Average across 6 categories</span>
        </div>
      </div>

      {/* GitHub-style Contribution Heatmap */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-5 rounded-3xl space-y-4">
        <div className="flex justify-between items-center pb-2 border-b border-slate-50 dark:border-zinc-805/40">
          <h3 className="text-sm font-semibold tracking-wide text-zinc-900 dark:text-zinc-150 flex items-center gap-1.5">
            <Calendar className="w-4 h-4 text-emerald-600" />
            <span>{isAr ? "جدول الالتزام السنوي" : "Spiritual Contribution Grid"}</span>
          </h3>
          <span className="text-[10px] text-gray-400 uppercase tracking-wider font-mono">
            60-Day contribution map
          </span>
        </div>

        {/* The Grid */}
        <div className="flex flex-col items-center">
          <div className="grid grid-flow-col grid-rows-5 gap-1.5 overflow-x-auto max-w-full pb-1">
            {mockHistoryRef.map((day, idx) => {
              // Decide emerald intensity color based on completed prayers
              let colorClasses = "bg-slate-100 dark:bg-zinc-800 hover:scale-110 cursor-pointer";
              if (day.prayersCompletedCount === 5) {
                colorClasses = "bg-emerald-850 dark:bg-emerald-400 hover:scale-110 cursor-pointer";
              } else if (day.prayersCompletedCount === 4) {
                colorClasses = "bg-emerald-650 dark:bg-emerald-500 hover:scale-110 cursor-pointer";
              } else if (day.prayersCompletedCount === 3) {
                colorClasses = "bg-emerald-500 dark:bg-emerald-650 hover:scale-110 cursor-pointer";
              } else if (day.prayersCompletedCount > 0) {
                colorClasses = "bg-emerald-200 dark:bg-emerald-800 hover:scale-110 cursor-pointer";
              }

              return (
                <div
                  key={day.date}
                  onMouseEnter={() => setActiveSquareIndex(idx)}
                  onMouseLeave={() => setActiveSquareIndex(null)}
                  className={`w-4 h-4 rounded-[4px] transition-all relative ${colorClasses}`}
                />
              );
            })}
          </div>

          {/* Grid Metadata Footer */}
          <div className="flex justify-between w-full text-[10px] text-gray-400 mt-2 px-1">
            <span>Less</span>
            <div className="flex gap-1 items-center">
              <div className="w-2.5 h-2.5 rounded bg-slate-100 dark:bg-zinc-800" />
              <div className="w-2.5 h-2.5 rounded bg-emerald-200 dark:bg-emerald-800" />
              <div className="w-2.5 h-2.5 rounded bg-emerald-500 dark:bg-emerald-650" />
              <div className="w-2.5 h-2.5 rounded bg-emerald-850 dark:bg-emerald-400" />
            </div>
            <span>More Effort</span>
          </div>

          {/* Square Tooltip View */}
          <div className="h-10 mt-3 w-full border border-dashed border-gray-100 dark:border-zinc-800 rounded-2xl flex items-center justify-center text-[10.5px] text-gray-500 bg-slate-50/50 dark:bg-zinc-850/50">
            {activeSquareIndex !== null ? (
              <span className="font-mono">
                <strong>{mockHistoryRef[activeSquareIndex].date}</strong>: Completed{" "}
                {mockHistoryRef[activeSquareIndex].prayersCompletedCount}/5 Prayers,{" "}
                {mockHistoryRef[activeSquareIndex].habitsCompletedCount}/6 Habits.
              </span>
            ) : (
              <span>Hover over or tap grids to audit historic records</span>
            )}
          </div>
        </div>
      </div>

      {/* Weekly Progress Linear Chart */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-5 rounded-3xl space-y-4">
        <div className="flex justify-between items-center pb-1">
          <h3 className="text-sm font-semibold tracking-wide text-zinc-900 dark:text-zinc-150 flex items-center gap-1.5">
            <TrendingUp className="w-4.5 h-4.5 text-amber-500 animate-pulse" />
            <span>{isAr ? "اتجاهات الصلوات السبعة الفائتة" : "Weekly Prayer Intensity"}</span>
          </h3>
          <span className="text-[10px] text-gray-400 font-mono tracking-wider font-semibold uppercase">
            Last 7 calendar days
          </span>
        </div>

        {/* Line SVG plot */}
        <div className="flex justify-center">
          <div className="relative">
            <svg width={chartWidth} height={chartHeight} className="overflow-visible">
              {/* Background horizontal guide lines */}
              <line x1="0" y1="10" x2={chartWidth} y2="10" stroke="#f1f5f9" strokeDasharray="3" className="dark:stroke-zinc-800/40" />
              <line x1="0" y1={chartHeight / 2} x2={chartWidth} y2={chartHeight / 2} stroke="#f1f5f9" strokeDasharray="3" className="dark:stroke-zinc-800/40" />
              <line x1="0" y1={chartHeight - 10} x2={chartWidth} y2={chartHeight - 10} stroke="#f1f5f9" strokeDasharray="3" className="dark:stroke-zinc-800/40" />

              {/* Main Line path */}
              <path
                d={linePath}
                fill="none"
                stroke="url(#gradient)"
                strokeWidth="3.5"
                strokeLinecap="round"
              />

              {/* Data Circle plot tags */}
              {points.map((p, idx) => (
                <g key={idx}>
                  <circle
                    cx={p.x}
                    cy={p.y}
                    r="5"
                    className="fill-emerald-600 dark:fill-emerald-400 stroke-white dark:stroke-zinc-900"
                    strokeWidth="2.5"
                  />
                  <text
                    x={p.x}
                    y={p.y - 10}
                    fontSize="9.5"
                    fontWeight="bold"
                    textAnchor="middle"
                    className="fill-gray-500 font-mono"
                  >
                    {p.value}
                  </text>
                </g>
              ))}

              {/* Gradients declaration */}
              <defs>
                <linearGradient id="gradient" x1="0" y1="0" x2="1" y2="0">
                  <stop offset="0%" stopColor="#c5a059" />
                  <stop offset="100%" stopColor="#0d5c3a" />
                </linearGradient>
              </defs>
            </svg>

            {/* X-axis indicators */}
            <div className="flex justify-between mt-3 text-[10px] text-gray-400 px-3 uppercase font-medium tracking-widest font-mono">
              {last7Days.map((d) => {
                const parts = d.date.split("-");
                return <span key={d.date}>{parts[2]}</span>;
              })}
            </div>
          </div>
        </div>
      </div>

      {/* Badges and Milestones rewards */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-5 rounded-3xl space-y-4">
        <h3 className="text-sm font-semibold tracking-wide text-zinc-900 dark:text-zinc-150 flex items-center gap-1.5">
          <Award className="w-4.5 h-4.5 text-emerald-600" />
          <span>{isAr ? "الأوسمة والجوائز المحققة" : "Completed Milestones"}</span>
        </h3>

        <div className="space-y-2.5">
          <div className="flex gap-3 items-center p-3 rounded-2xl bg-emerald-50/50 dark:bg-emerald-950/20 border border-emerald-100/40 dark:border-emerald-900/30">
            <span className="text-2xl">🌱</span>
            <div>
              <span className="text-xs font-bold block text-emerald-900 dark:text-emerald-300">
                Al-Baraa' (The Foundation First)
              </span>
              <span className="text-[10px] text-emerald-600">
                Completed all 5 prayers on-time for 7 consecutive days
              </span>
            </div>
          </div>

          <div className="flex gap-3 items-center p-3 rounded-2xl bg-amber-50/50 dark:bg-amber-950/20 border border-amber-100/40 dark:border-amber-900/30">
            <span className="text-2xl">📖</span>
            <div>
              <span className="text-xs font-bold block text-amber-900 dark:text-amber-300">
                Hafidh Intern (Consistent Quran study)
              </span>
              <span className="text-[10px] text-amber-600">
                Recorded Quran Reading habit for 14 straight days
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
