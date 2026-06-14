/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState } from "react";
import { Prayer, AppSettings } from "../types";
import { 
  Bell, 
  BellOff, 
  Check, 
  Clock, 
  Volume2, 
  X, 
  ChevronRight,
  ChevronDown
} from "lucide-react";
import { motion, AnimatePresence } from "motion/react";

interface PrayersViewProps {
  settings: AppSettings;
  prayers: Prayer[];
  onTogglePrayer: (id: string, status: string | null) => void;
  onUpdatePrayerConfig: (id: string, updates: Partial<Prayer>) => void;
}

export default function PrayersView({
  settings,
  prayers,
  onTogglePrayer,
  onUpdatePrayerConfig,
}: PrayersViewProps) {
  const isAr = settings.language === "ar";
  
  // Custom states for interactive Alert dropdown popup window of Image 3
  const [activeAlertDropdown, setActiveAlertDropdown] = useState<string | null>(null);

  // Fast Log status options
  const statusOptions = [
    { id: "completed", label: "Prayed", labelAr: "تمت", color: "bg-emerald-50 dark:bg-emerald-950/20 text-emerald-700 dark:text-emerald-305 border-emerald-500/25" },
    { id: "late", label: "Late", labelAr: "متأخر", color: "bg-amber-50 dark:bg-amber-950/20 text-amber-700 dark:text-amber-305 border-amber-500/25" },
    { id: "jamaah", label: "Jamaah", labelAr: "جماعة", color: "bg-teal-50 dark:bg-teal-950/20 text-teal-700 dark:text-teal-30F border-teal-500/25" },
    { id: "masjid", label: "Masjid", labelAr: "المسجد", color: "bg-blue-50 dark:bg-blue-950/20 text-blue-700 dark:text-blue-305 border-blue-500/25" },
    { id: "missed", label: "Missed", labelAr: "فاتت", color: "bg-rose-50 dark:bg-rose-950/20 text-rose-700 dark:text-rose-30F border-rose-300/30" }
  ];

  // Reminder pre-time options matching Image 3 dropdown
  const reminderOptions = [
    { label: "Don't remind", val: 0 },
    { label: "5 Min before", val: 5 },
    { label: "15 Min before", val: 15 },
    { label: "30 Min before", val: 30 },
    { label: "45 Min before", val: 45 }
  ];

  return (
    <div className="space-y-6 pb-20 text-left relative">
      
      {/* Header card */}
      <div className="bg-[#FAF9F6] dark:bg-zinc-900 rounded-3xl p-4.5 border border-gray-100 dark:border-zinc-800/80">
        <h2 className="text-xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100 flex items-center gap-2">
          <span>{isAr ? "مواقيت الصلاة والتتبع" : "Salah Companion"}</span>
        </h2>
        <p className="text-[10px] text-gray-400 mt-1">
          {isAr 
            ? "اضبط مواقيت الصلاة ونوع التنبيه المفضل لكل فرض."
            : "Toggle notification alarms, mute alerts, and choose pre-reminder times for each Salah."}
        </p>
      </div>

      {/* List layout of 6 Prayer timings matching Image 3 structure */}
      <div className="space-y-3">
        {prayers.map((prayer) => {
          const isSelected = activeAlertDropdown === prayer.id;
          const hasStatus = prayer.status !== null;
          
          let logLabel = isAr ? "غير مسجل" : "Not Logged";
          let alertLabel = prayer.soundEnabled ? `-${prayer.reminderOffset} Min before` : "Alarms Muted";
          if (prayer.reminderOffset === 0 && prayer.soundEnabled) {
            alertLabel = "Exactly on time";
          }

          if (prayer.status) {
            const opt = statusOptions.find(o => o.id === prayer.status);
            logLabel = isAr ? (opt?.labelAr || "") : (opt?.label || "");
          }

          return (
            <div 
              key={prayer.id}
              className={`bg-white dark:bg-zinc-900 border rounded-3xl p-4.5 shadow-sm transition-all hover:shadow-md flex flex-col space-y-4 relative overflow-hidden ${
                hasStatus 
                  ? "border-emerald-200/65 dark:border-emerald-950/40" 
                  : "border-slate-100 dark:border-zinc-800/80"
              }`}
            >
              {/* Vertical side ribbon marker for active status */}
              {hasStatus && (
                <div className="absolute top-0 bottom-0 left-0 w-[4px] bg-emerald-600" />
              )}

              {/* Grid block content */}
              <div className="flex items-center justify-between">
                
                {/* Left section info */}
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-xl bg-slate-50 dark:bg-zinc-850 flex items-center justify-center text-slate-500">
                    <Clock className="w-4.5 h-4.5 text-[#103E44] dark:text-teal-300" />
                  </div>
                  <div>
                    <span className="font-bold text-sm block text-emerald-950 dark:text-emerald-100">
                      {isAr ? prayer.arabicName : prayer.name}
                    </span>
                    <span className="text-[10px] text-slate-400 uppercase tracking-wider font-semibold">
                      Log: {logLabel}
                    </span>
                  </div>
                </div>

                {/* Right section info and switch */}
                <div className="flex items-center gap-4 text-right">
                  <div>
                    <span className="text-lg font-black font-mono text-amber-550 block">
                      {prayer.time}
                    </span>
                    
                    {/* Pre-alarm drop trigger button matching Image 3 style */}
                    <button
                      onClick={() => setActiveAlertDropdown(isSelected ? null : prayer.id)}
                      className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-xl bg-slate-50 border border-slate-100 hover:bg-slate-100 transition-all text-[9.5px] font-black text-[#103E44] dark:bg-zinc-805 dark:border-zinc-800 dark:text-teal-300 mt-1"
                    >
                      <span>{alertLabel}</span>
                      <ChevronDown className="w-3 h-3 text-slate-600" />
                    </button>
                  </div>

                  {/* Switch toggle control matching Image 3 */}
                  <button
                    onClick={() => {
                      onUpdatePrayerConfig(prayer.id, { soundEnabled: !prayer.soundEnabled });
                    }}
                    className={`w-11 h-6 rounded-full p-0.5 transition-all cursor-pointer ${
                      prayer.soundEnabled ? "bg-emerald-650" : "bg-slate-200 dark:bg-zinc-800"
                    }`}
                  >
                    <div className={`w-5 h-5 bg-white rounded-full shadow transform transition-all ${
                      prayer.soundEnabled ? "translate-x-5" : "translate-x-0"
                    }`} />
                  </button>
                </div>
              </div>

              {/* Fast completion logs row */}
              <div className="grid grid-cols-5 gap-1 pt-2 border-t border-slate-50 dark:border-zinc-805">
                {statusOptions.map((opt) => {
                  const isActive = prayer.status === opt.id;
                  return (
                    <button
                      key={opt.id}
                      onClick={() => onTogglePrayer(prayer.id, isActive ? null : opt.id)}
                      className={`text-[10px] font-bold py-1.5 px-0.5 rounded-lg border text-center transition-all cursor-pointer ${
                        isActive 
                          ? "bg-slate-900 text-white dark:bg-white dark:text-zinc-950 border-black"
                          : `${opt.color} hover:bg-opacity-80`
                      }`}
                    >
                      {isAr ? opt.labelAr : opt.label}
                    </button>
                  );
                })}
              </div>

            </div>
          );
        })}
      </div>

      {/* DETAILED PRAYER ALARMS SELECTION OVERLAY DRAWER SHEET */}
      <AnimatePresence>
        {activeAlertDropdown && (
          <>
            {/* Overlay background */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.4 }}
              exit={{ opacity: 0 }}
              onClick={() => setActiveAlertDropdown(null)}
              className="absolute inset-0 bg-black/40 z-45"
            />
            
            {/* Sheet drawer */}
            <motion.div
              initial={{ y: "100%" }}
              animate={{ y: 0 }}
              exit={{ y: "100%" }}
              transition={{ type: "spring", damping: 25 }}
              className="absolute bottom-0 left-0 right-0 bg-white dark:bg-zinc-900 border-t border-slate-100 dark:border-zinc-800 rounded-t-[32px] p-6 z-50 flex flex-col space-y-4 shadow-2xl"
            >
              {/* Pull handle */}
              <div className="w-12 h-1 bg-gray-200 dark:bg-zinc-800 rounded-full mx-auto" />
              
              <div className="flex justify-between items-center">
                <div>
                  <h4 className="text-sm font-black text-slate-800 dark:text-gray-150">Configure Alert Interval</h4>
                  <span className="text-[9px] uppercase tracking-wider text-gray-400 block mt-0.5 font-mono">Select reminder trigger offset</span>
                </div>
                <button
                  onClick={() => setActiveAlertDropdown(null)}
                  className="w-7 h-7 rounded-full bg-slate-50 dark:bg-zinc-800 flex items-center justify-center text-slate-500 cursor-pointer"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>

              {/* Selection options checklist */}
              <div className="space-y-2 py-1">
                {reminderOptions.map((opt) => {
                  const targetPrayer = prayers.find(p => p.id === activeAlertDropdown);
                  const isSelectedOption = targetPrayer?.reminderOffset === opt.val && targetPrayer?.soundEnabled;

                  return (
                    <button
                      key={opt.val}
                      onClick={() => {
                        onUpdatePrayerConfig(activeAlertDropdown, {
                          reminderOffset: opt.val,
                          soundEnabled: true
                        });
                        setActiveAlertDropdown(null);
                      }}
                      className={`w-full p-3.5 rounded-2xl border transition-all text-left flex items-center justify-between cursor-pointer ${
                        isSelectedOption
                          ? "bg-emerald-50 dark:bg-emerald-950/20 border-emerald-500 text-emerald-950 dark:text-emerald-305"
                          : "bg-white border-slate-100 dark:bg-zinc-900 dark:border-zinc-800 text-slate-700 hover:bg-slate-50"
                      }`}
                    >
                      <span className="text-xs font-bold">{opt.label}</span>
                      {isSelectedOption && (
                        <div className="w-5 h-5 rounded-full bg-emerald-600 text-white flex items-center justify-center">
                          <Check className="w-3 h-3" strokeWidth={3} />
                        </div>
                      )}
                    </button>
                  );
                })}
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>

    </div>
  );
}
