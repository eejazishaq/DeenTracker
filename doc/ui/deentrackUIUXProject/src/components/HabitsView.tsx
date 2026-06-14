/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState } from "react";
import { Habit, AppSettings } from "../types";
import { 
  Plus, 
  Trash2, 
  Check, 
  X,
  Flame,
  Sparkles,
  Shield,
  Clock,
  Heart,
  ChevronRight,
  BookOpen
} from "lucide-react";
import { motion, AnimatePresence } from "motion/react";

interface HabitsViewProps {
  settings: AppSettings;
  habits: Habit[];
  onToggleHabit: (id: string) => void;
  onAddHabit: (habit: Omit<Habit, "completed" | "streak" | "totalCompleted">) => void;
  onRemoveHabit: (id: string) => void;
}

export default function HabitsView({
  settings,
  habits,
  onToggleHabit,
  onAddHabit,
  onRemoveHabit,
}: HabitsViewProps) {
  const isAr = settings.language === "ar";
  
  // Tab states for Add Deed sub-views
  const [activeScreen, setActiveScreen] = useState<"list" | "addDeed" | "newDeedForm">("list");
  
  // Weekly Slider Dates mock matching Image 8
  const weekDates = [
    { day: "Wed", num: 10, active: true },
    { day: "Thu", num: 11, active: false },
    { day: "Fri", num: 12, active: false },
    { day: "Sat", num: 13, active: false },
    { day: "Sun", num: 14, active: false },
    { day: "Mon", num: 15, active: false },
    { day: "Tue", num: 16, active: false },
    { day: "Wed", num: 17, active: false },
  ];
  
  const [selectedDate, setSelectedDate] = useState<number>(10);

  // States for interactive preset popup selection
  const [selectedPresetDeed, setSelectedPresetDeed] = useState<{
    name: string;
    arabicName: string;
    category: "quran" | "remembrance" | "night" | "charity" | "custom";
    color: string;
    emoji: string;
    desc: string;
  } | null>(null);

  // Default Repeat indicators for presets
  const [deedRepeatDays, setDeedRepeatDays] = useState<string[]>(["S", "M", "T", "W", "T", "F", "S"]);

  // Manual New Deed Form custom states matching Image 1
  const [customTitle, setCustomTitle] = useState<string>("");
  const [customEmoji, setCustomEmoji] = useState<string>("🕌");
  const [customColor, setCustomColor] = useState<string>("sky");
  const [customFrequency, setCustomFrequency] = useState<string>("Every day");
  const [customGoal, setCustomGoal] = useState<string>("Achieve standard consistence");
  const [customReminder, setCustomReminder] = useState<string>("15 Min before");

  // Presets mapping Image 10 categories
  const learnAndDawahPresets = [
    { name: "Read Islamic books", ar: "قراءة الكتب الإسلامية", cat: "custom" as const, color: "pastel-yellow", emoji: "📚", desc: "Gain beneficial creed and Shariah knowledge" },
    { name: "Listen Quran recitation", ar: "الاستماع للقرآن", cat: "quran" as const, color: "neon-green", emoji: "🎧", desc: "Contemplate verses carefully with tranquil mind" },
    { name: "Commanding good deeds", ar: "الأمر بالمعروف", cat: "custom" as const, color: "sky", emoji: "🗣️", desc: "Inspire loved ones to join daily prayers" },
    { name: "Memorize Quran verses", ar: "حفظ القرآن الكريم", cat: "quran" as const, color: "pastel-yellow", emoji: "📝", desc: "Commit new verses of Surah to memory" },
    { name: "Forbidding standard evil", ar: "النهي عن المنكر", cat: "custom" as const, color: "pastel-rose", emoji: "🚫", desc: "Politely advise against unjust, improper conducts" },
    { name: "Learn Islamic Arabic", ar: "تعلم اللغة العربية", cat: "custom" as const, color: "pastel-purple", emoji: "📖", desc: "Learn Arabic roots to understand word Tafsirs" },
    { name: "Call others to Islam", ar: "الدعوة إلى الله", cat: "custom" as const, color: "neon-green", emoji: "🕊️", desc: "Share peace, truth, and spiritual principles" }
  ];

  const socialPresets = [
    { name: "Visit your parents", ar: "بر الوالدين وزيارتهم", cat: "charity" as const, color: "sky", emoji: "👪", desc: "Keep standard kinship connection and assist daily" },
    { name: "Call sibling / relatives", ar: "صلة الرحم بالهاتف", cat: "charity" as const, color: "pastel-rose", emoji: "📞", desc: "Inquire about well-being to strengthen bonds" },
    { name: "Help neighbor / friend", ar: "مساعدة الجار والصديق", cat: "charity" as const, color: "neon-green", emoji: "🤝", desc: "Perform helpful kindness or share nutrition cleanly" },
    { name: "Give gift to partner", ar: "تقديم هدية للزوجة", cat: "charity" as const, color: "pastel-yellow", emoji: "🎁", desc: "Deepen marriage affection following Sunnah" },
    { name: "Visit sick patients", ar: "عيادة المريض والضعيف", cat: "charity" as const, color: "pastel-purple", emoji: "🩺", desc: "Offer spiritual hope and standard solace to sick" }
  ];

  // Colors dictionary mapping Image 8 & Image 10
  const getTailwindColors = (col?: string) => {
    switch (col) {
      case "sky":
        return {
          border: "border-sky-300 dark:border-sky-900 border-2",
          bg: "bg-sky-50 dark:bg-sky-950/25",
          accent: "text-sky-700 dark:text-sky-305",
          bullet: "bg-sky-500",
          ring: "border-sky-500 hover:bg-sky-50"
        };
      case "neon-green":
        return {
          border: "border-emerald-300 dark:border-emerald-900 border-2",
          bg: "bg-emerald-50 dark:bg-emerald-950/25",
          accent: "text-emerald-700 dark:text-emerald-305",
          bullet: "bg-emerald-500",
          ring: "border-emerald-500 hover:bg-emerald-50"
        };
      case "pastel-yellow":
        return {
          border: "border-amber-300 dark:border-amber-900 border-2",
          bg: "bg-amber-50 dark:bg-amber-950/25",
          accent: "text-amber-750 dark:text-amber-300",
          bullet: "bg-amber-500",
          ring: "border-amber-500 hover:bg-amber-50"
        };
      case "pastel-rose":
        return {
          border: "border-rose-300 dark:border-rose-900 border-2",
          bg: "bg-rose-50 dark:bg-rose-950/25",
          accent: "text-rose-700 dark:text-rose-305",
          bullet: "bg-rose-500",
          ring: "border-rose-500 hover:bg-rose-50"
        };
      case "pastel-purple":
        return {
          border: "border-purple-300 dark:border-purple-900 border-2",
          bg: "bg-purple-50 dark:bg-purple-950/25",
          accent: "text-purple-700 dark:text-purple-305",
          bullet: "bg-purple-500",
          ring: "border-purple-500 hover:bg-purple-50"
        };
      default:
        return {
          border: "border-teal-300 dark:border-zinc-800 border-2",
          bg: "bg-teal-50/50 dark:bg-zinc-900",
          accent: "text-[#103E44] dark:text-teal-305",
          bullet: "bg-teal-500",
          ring: "border-teal-555 hover:bg-teal-50"
        };
    }
  };

  const handleToggleDay = (day: string) => {
    if (deedRepeatDays.includes(day)) {
      setDeedRepeatDays(deedRepeatDays.filter((d) => d !== day));
    } else {
      setDeedRepeatDays([...deedRepeatDays, day]);
    }
  };

  const handleAddPresetSubmit = () => {
    if (!selectedPresetDeed) return;
    onAddHabit({
      id: "preset_" + Date.now(),
      name: selectedPresetDeed.name,
      arabicName: selectedPresetDeed.arabicName,
      category: selectedPresetDeed.category,
      description: selectedPresetDeed.desc,
      iconName: "Bookmark",
      color: selectedPresetDeed.color,
      emoji: selectedPresetDeed.emoji,
      repeatDays: deedRepeatDays,
      repeatFrequency: "Weekly"
    });
    setSelectedPresetDeed(null);
    setActiveScreen("list");
  };

  const handleAddCustomManualSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!customTitle.trim()) return;
    onAddHabit({
      id: "custom_" + Date.now(),
      name: customTitle,
      arabicName: customTitle,
      category: "custom",
      description: customGoal,
      iconName: "Bookmark",
      color: customColor,
      emoji: customEmoji,
      repeatDays: ["S", "M", "T", "W", "T", "F", "S"],
      repeatFrequency: customFrequency,
      goal: customGoal
    });
    setCustomTitle("");
    setActiveScreen("list");
  };

  return (
    <div className="space-y-6 pb-20 text-left relative">
      
      {/* RENDER LIST OF HABITS SCREEN */}
      {activeScreen === "list" && (
        <>
          {/* Header */}
          <div className="flex justify-between items-center bg-[#FAF9F6] dark:bg-zinc-900 rounded-3xl p-4.5 border border-gray-100 dark:border-zinc-800/80">
            <div>
              <h2 className="text-xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100">
                {isAr ? "متابعة السنن والعادات" : "Habit Tracker"}
              </h2>
              <p className="text-[10px] text-gray-400 mt-0.5">
                {isAr 
                  ? "حافظ على تتابع العبادات وأعمال البر اليومية."
                  : "Track daily religious deeds and Sunnah habits with consistency."}
              </p>
            </div>
            
            {/* Floating add helper to add deed screen */}
            <button
              onClick={() => setActiveScreen("addDeed")}
              className="w-10 h-10 rounded-full bg-emerald-700 hover:bg-emerald-800 text-white flex items-center justify-center shadow-md active:scale-95 transition-all cursor-pointer"
            >
              <Plus className="w-5 h-5" />
            </button>
          </div>

          {/* 1. Weekly Dates Slider matching Image 8 */}
          <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-4.5 rounded-3xl space-y-3">
            <span className="text-[10.5px] uppercase font-black text-gray-400 tracking-wider">Weekly Tracker Dates</span>
            
            <div className="flex justify-between overflow-x-auto gap-1 scrollbar-hidden">
              {weekDates.map((dt) => {
                const isSelected = selectedDate === dt.num;
                return (
                  <div
                    key={dt.num}
                    onClick={() => setSelectedDate(dt.num)}
                    className={`flex flex-col items-center p-2 rounded-2xl cursor-pointer w-9.5 shrink-0 transition-all ${
                      isSelected
                        ? "bg-emerald-700 text-white shadow-md font-bold relative"
                        : "bg-slate-50 border border-slate-100 text-slate-800 dark:bg-zinc-850 dark:border-zinc-800 dark:text-slate-205"
                    }`}
                  >
                    <span className="text-[9px] uppercase opacity-75">{dt.day}</span>
                    <span className="text-sm font-black mt-0.5 font-mono">{dt.num}</span>
                    
                    {/* Tiny golden dot beneath if Wed 10 active */}
                    {dt.num === 10 && (
                      <div className={`w-1 h-1 rounded-full mt-1 ${isSelected ? "bg-amber-300" : "bg-emerald-600"}`} />
                    )}
                  </div>
                );
              })}
            </div>
          </div>

          {/* 2. Shiny warning banner matching Image 8 */}
          <div className="bg-emerald-500 text-[#fff] p-4.5 rounded-[24px] flex items-center gap-3.5 shadow-sm border border-emerald-600">
            <div className="w-9 h-9 rounded-xl bg-yellow-405 text-[#103E44] flex items-center justify-center shrink-0">
              <Shield className="w-5 h-5 text-amber-500 fill-amber-500" />
            </div>
            <div>
              <span className="text-xs font-black block text-amber-200">Update Your Habit Data</span>
              <span className="text-[10px] text-emerald-100 opacity-90 leading-normal block">
                Synchronize standard compliance with Al-Aqsa database indicators.
              </span>
            </div>
          </div>

          {/* 3. List of Active Habits Checklist */}
          <div className="space-y-3">
            {habits.map((habit) => {
              const isCompleted = habit.completed;
              const clrs = getTailwindColors(habit.color);

              return (
                <motion.div
                  layoutId={habit.id}
                  key={habit.id}
                  className={`border-2 rounded-[24px] p-4 flex items-center justify-between shadow-sm transition-all relative overflow-hidden bg-white dark:bg-zinc-900 ${
                    isCompleted ? "border-emerald-300 dark:border-emerald-950" : clrs.border
                  }`}
                >
                  {/* Left segment */}
                  <div className="flex items-center gap-3.5 flex-1 select-none pr-3">
                    
                    {/* Emoji in colored bubble base */}
                    <div className={`w-10 h-10 rounded-xl flex items-center justify-center shrink-0 ${clrs.bg}`}>
                      <span className="text-lg">{habit.emoji || "📝"}</span>
                    </div>

                    <div>
                      <div className="flex items-center gap-2">
                        <span className={`text-xs font-black text-slate-800 dark:text-gray-100 ${isCompleted ? "line-through opacity-60" : ""}`}>
                          {isAr ? habit.arabicName : habit.name}
                        </span>
                        
                        {habit.streak > 0 && (
                          <span className="flex items-center gap-0.5 px-2 py-0.5 rounded-full bg-amber-50 text-[9px] text-amber-700 font-bold font-mono">
                            <Flame className="w-2.5 h-2.5 fill-amber-500 stroke-none" />
                            {habit.streak}d
                          </span>
                        )}
                      </div>
                      <p className="text-[10px] text-gray-400 dark:text-gray-500 leading-normal line-clamp-1 mt-0.5">
                        {habit.description}
                      </p>
                    </div>
                  </div>

                  {/* Actions segment wrapper */}
                  <div className="flex items-center gap-2.5">
                    {/* Custom remove tag if created manually */}
                    {habit.category === "custom" && (
                      <button
                        onClick={() => onRemoveHabit(habit.id)}
                        className="p-1.5 rounded-lg text-gray-300 hover:text-rose-500 hover:bg-slate-50 transition-all cursor-pointer"
                      >
                        <Trash2 className="w-3.5 h-3.5" />
                      </button>
                    )}

                    {/* Quick check off tick circle */}
                    <button
                      onClick={() => onToggleHabit(habit.id)}
                      className={`w-8.5 h-8.5 rounded-full border-2 flex items-center justify-center transition-all cursor-pointer relative group ${
                        isCompleted
                          ? "bg-emerald-600 border-emerald-650 text-white"
                          : "bg-white dark:bg-zinc-900 border-slate-200 hover:border-emerald-500"
                      }`}
                    >
                      {isCompleted ? (
                        <Check className="w-4.5 h-4.5 text-white" strokeWidth={3} />
                      ) : (
                        <div className="w-2 h-2 rounded-full bg-slate-300 dark:bg-zinc-800 opacity-60 group-hover:opacity-100" />
                      )}
                    </button>
                  </div>
                </motion.div>
              );
            })}
          </div>
        </>
      )}

      {/* SUBVIEW SCREEN: ADD DEED (PRESETS LIST SELECTION) MATCHING IMAGE 10 */}
      {activeScreen === "addDeed" && (
        <div className="space-y-6">
          <div className="flex items-center justify-between pb-1.5 border-b border-gray-100 dark:border-zinc-850">
            <div className="flex items-center gap-1.5">
              <button 
                onClick={() => setActiveScreen("list")}
                className="p-1 px-2.5 bg-slate-105 dark:bg-zinc-800 rounded-xl text-xs font-bold"
              >
                ← Back
              </button>
              <div>
                <h3 className="text-base font-black text-emerald-950 dark:text-gray-100">Add Deed</h3>
                <span className="text-[9.5px] text-gray-400 block">Choose from recommended actions</span>
              </div>
            </div>
            <span className="text-[10px] bg-sky-50 text-sky-700 px-2.5 py-1 rounded-full font-black">Sunnah List</span>
          </div>

          {/* Recommended Group A: Learning & dawah */}
          <div className="space-y-3">
            <span className="text-[10.5px] text-gray-450 uppercase tracking-widest font-black block">Learning & Dawah</span>
            <div className="flex flex-wrap gap-2">
              {learnAndDawahPresets.map((ps, idx) => (
                <button
                  key={idx}
                  onClick={() => {
                    setSelectedPresetDeed({
                      name: ps.name,
                      arabicName: ps.ar,
                      category: ps.cat,
                      color: ps.color,
                      emoji: ps.emoji,
                      desc: ps.desc
                    });
                    setDeedRepeatDays(["S", "M", "T", "W", "T", "F", "S"]);
                  }}
                  className={`px-3 py-2 text-xs rounded-2xl border font-bold flex items-center gap-1.5 cursor-pointer transition-all hover:scale-105 ${
                    ps.color === "pastel-yellow" 
                      ? "bg-amber-50 border-amber-205 text-amber-800" 
                      : ps.color === "neon-green" 
                      ? "bg-emerald-50 border-emerald-205 text-emerald-800"
                      : "bg-blue-50 border-blue-200 text-blue-800"
                  }`}
                >
                  <span>{ps.emoji}</span>
                  <span>{ps.name}</span>
                </button>
              ))}
            </div>
          </div>

          {/* Recommended Group B: Social Kinship */}
          <div className="space-y-3">
            <span className="text-[10.5px] text-gray-450 uppercase tracking-widest font-black block">Social Kinship</span>
            <div className="flex flex-wrap gap-2">
              {socialPresets.map((ps, idx) => (
                <button
                  key={idx}
                  onClick={() => {
                    setSelectedPresetDeed({
                      name: ps.name,
                      arabicName: ps.ar,
                      category: ps.cat,
                      color: ps.color,
                      emoji: ps.emoji,
                      desc: ps.desc
                    });
                    setDeedRepeatDays(["S", "M", "T", "W", "T", "F", "S"]);
                  }}
                  className={`px-3 py-2 text-xs rounded-2xl border font-bold flex items-center gap-1.5 cursor-pointer transition-all hover:scale-105 ${
                    ps.color === "sky" 
                      ? "bg-sky-50 border-sky-00 text-sky-800" 
                      : ps.color === "pastel-rose" 
                      ? "bg-rose-50 border-rose-205 text-rose-800"
                      : "bg-purple-50 border-purple-200 text-purple-800"
                  }`}
                >
                  <span>{ps.emoji}</span>
                  <span>{ps.name}</span>
                </button>
              ))}
            </div>
          </div>

          {/* Form route to manual button creator */}
          <div className="pt-3 border-t border-gray-100 dark:border-zinc-800 text-center">
            <button
              onClick={() => setActiveScreen("newDeedForm")}
              className="w-full bg-slate-900 dark:bg-zinc-800 text-white font-bold py-3.5 rounded-2xl text-xs tracking-wider transition-all active:scale-95"
            >
              Create Custom Manual Deed
            </button>
          </div>
        </div>
      )}

      {/* SUBVIEW SCREEN: NEW DEED MANUAL CREATOR FORM MATCHING IMAGE 1 */}
      {activeScreen === "newDeedForm" && (
        <form onSubmit={handleAddCustomManualSubmit} className="space-y-5">
          <div className="flex items-center justify-between pb-1 border-b border-gray-100 dark:border-zinc-800">
            <div className="flex items-center gap-2">
              <button 
                type="button"
                onClick={() => setActiveScreen("addDeed")}
                className="p-1 px-2.5 bg-slate-100 dark:bg-zinc-800 rounded-xl text-xs font-bold"
              >
                ← Back
              </button>
              <span className="text-base font-black text-slate-800 dark:text-gray-100">New Deed Form</span>
            </div>
          </div>

          {/* Input field */}
          <div className="space-y-1 bg-white dark:bg-zinc-900 border border-gray-150 p-4.5 rounded-[24px]">
            <label className="text-[10px] font-bold text-gray-550 uppercase tracking-widest block">Deed Title Title</label>
            <input 
              type="text" 
              required
              className="w-full text-sm font-bold bg-transparent border-b border-slate-200 py-2 focus:outline-none focus:border-emerald-600 text-zinc-900 dark:text-zinc-100"
              placeholder="Enter habit title (e.g. Pray rawatib)..."
              value={customTitle}
              onChange={(e) => setCustomTitle(e.target.value)}
            />
          </div>

          {/* Double choice Row: Emoji + Color picker */}
          <div className="grid grid-cols-2 gap-4 bg-white dark:bg-zinc-900 border border-gray-150 p-4 rounded-[24px]">
            
            {/* Emoji pick */}
            <div className="space-y-1.5">
              <span className="text-[10px] font-bold text-gray-550 uppercase tracking-widest block">Select Emoji</span>
              <div className="flex flex-wrap gap-1">
                {["🕌", "📚", "🤲", "🌙", "☀️", "👪", "🎁", "🩺", "🤝"].map((em) => (
                  <button
                    key={em}
                    type="button"
                    onClick={() => setCustomEmoji(em)}
                    className={`w-7.5 h-7.5 rounded-lg text-sm flex items-center justify-center transition-all ${
                      customEmoji === em ? "bg-slate-900 text-white scale-110" : "bg-slate-100 dark:bg-zinc-800 hover:bg-slate-205"
                    }`}
                  >
                    {em}
                  </button>
                ))}
              </div>
            </div>

            {/* Pastel color pick */}
            <div className="space-y-1.5">
              <span className="text-[10px] font-bold text-gray-550 uppercase tracking-widest block">Color Highlight</span>
              <div className="flex flex-wrap gap-1.5 pt-1">
                {["sky", "neon-green", "pastel-yellow", "pastel-rose", "pastel-purple"].map((col) => {
                  const details = getTailwindColors(col);
                  return (
                    <button
                      key={col}
                      type="button"
                      onClick={() => setCustomColor(col)}
                      className={`w-6 h-6 rounded-full border border-gray-200 transition-all ${details.bullet} ${
                        customColor === col ? "scale-125 ring-2 ring-emerald-600" : ""
                      }`}
                    />
                  );
                })}
              </div>
            </div>

          </div>

          {/* Repeat Frequency selector */}
          <div className="space-y-2 bg-white dark:bg-zinc-900 border border-gray-150 p-4.5 rounded-[24px]">
            <span className="text-[10px] font-bold text-gray-550 uppercase tracking-widest block">Repeat Schedule</span>
            <div className="grid grid-cols-3 gap-1.5">
              {["Every day", "Every week", "Specific days"].map((f) => (
                <button
                  key={f}
                  type="button"
                  onClick={() => setCustomFrequency(f)}
                  className={`py-2 px-1 text-center rounded-xl text-[10.5px] font-bold border transition-all ${
                    customFrequency === f
                      ? "bg-slate-950 border-black text-white"
                      : "bg-slate-50 border-slate-100 text-slate-650"
                  }`}
                >
                  {f}
                </button>
              ))}
            </div>
          </div>

          {/* Goal note info */}
          <div className="space-y-2 bg-white dark:bg-zinc-900 border border-gray-150 p-4.5 rounded-[24px]">
            <span className="text-[10px] font-bold text-gray-550 uppercase tracking-widest block font-bold">Goal Target Note</span>
            <input 
              type="text" 
              className="w-full text-xs bg-slate-50 border border-slate-100 p-3 rounded-xl text-zinc-800"
              placeholder="e.g. Read at least 2 pages..."
              value={customGoal}
              onChange={(e) => setCustomGoal(e.target.value)}
            />
          </div>

          {/* Submit add to list */}
          <button
            type="submit"
            className="w-full bg-emerald-650 hover:bg-emerald-700 text-white font-black py-4 rounded-2xl text-xs tracking-wider shadow-md transition-all active:scale-95"
          >
            Add to My List
          </button>
        </form>
      )}

      {/* HIGHLIGHTED POPUP DRAWER SHEET: PRESET DAY CONFIGURATOR MATCHING IMAGE 2 */}
      <AnimatePresence>
        {selectedPresetDeed && (
          <>
            {/* Dark sheet background */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.4 }}
              exit={{ opacity: 0 }}
              onClick={() => setSelectedPresetDeed(null)}
              className="absolute inset-0 bg-black/45 z-45"
            />
            
            {/* Drawer body container */}
            <motion.div
              initial={{ y: "100%" }}
              animate={{ y: 0 }}
              exit={{ y: "100%" }}
              transition={{ type: "spring", damping: 25 }}
              className="absolute bottom-0 left-0 right-0 bg-white dark:bg-zinc-900 rounded-t-[32px] p-6 z-50 flex flex-col space-y-4 shadow-2xl text-center"
            >
              {/* Drawer pull bar */}
              <div className="w-12 h-1 bg-gray-200 dark:bg-zinc-800 rounded-full mx-auto" />
              
              {/* Header X */}
              <div className="flex justify-between items-center w-full">
                <div className="w-6 h-6" /> {/* spacer */}
                <div className="w-12 h-12 rounded-full bg-yellow-45 flex items-center justify-center text-amber-500 scale-110">
                  <span className="text-2xl">{selectedPresetDeed.emoji}</span>
                </div>
                <button 
                  onClick={() => setSelectedPresetDeed(null)}
                  className="w-7 h-7 rounded-full bg-slate-50 dark:bg-zinc-800 flex items-center justify-center text-gray-400"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>

              {/* Deed info */}
              <div>
                <h4 className="text-sm font-black text-slate-800 dark:text-gray-100">
                  {selectedPresetDeed.name}
                </h4>
                <p className="text-[10px] text-gray-400 mt-1 leading-normal max-w-[280px] mx-auto">
                  {selectedPresetDeed.desc}
                </p>
              </div>

              {/* Day selection bubbles matching Image 2 */}
              <div className="space-y-2 py-1">
                <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest block mb-1">Repeat Days Schedule</span>
                <div className="flex justify-center gap-2">
                  {["S", "M", "T", "W", "T", "F", "S"].map((day, idx) => {
                    const isSelected = deedRepeatDays.includes(day);
                    return (
                      <button
                        key={idx}
                        type="button"
                        onClick={() => handleToggleDay(day)}
                        className={`w-9 h-9 rounded-full font-black text-xs transition-all flex items-center justify-center cursor-pointer ${
                          isSelected
                            ? "bg-emerald-650 text-white scale-110 shadow"
                            : "bg-slate-100 text-slate-400 dark:bg-zinc-800"
                        }`}
                      >
                        {day}
                      </button>
                    );
                  })}
                </div>
              </div>

              {/* Green glossy submit button */}
              <button
                type="button"
                onClick={handleAddPresetSubmit}
                className="w-full bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-3.5 rounded-2xl text-xs tracking-wider transition-all active:scale-95 cursor-pointer"
              >
                Add to My List
              </button>
            </motion.div>
          </>
        )}
      </AnimatePresence>

    </div>
  );
}
