/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState, useEffect } from "react";
import { AppSettings, Prayer, Habit } from "./types";
import { 
  Home, 
  Clock, 
  Flame, 
  MapPin, 
  Compass, 
  Calendar, 
  BarChart2, 
  Settings, 
  Palette, 
  Battery, 
  Wifi, 
  Signal,
  Smartphone,
  Maximize2,
  BookOpen,
  Sparkles,
  Layers,
  ChevronRight,
  ChevronLeft
} from "lucide-react";
import { motion, AnimatePresence } from "motion/react";

// Views imports
import HomeView from "./components/HomeView";
import PrayersView from "./components/PrayersView";
import HabitsView from "./components/HabitsView";
import QiblaView from "./components/QiblaView";
import CalendarView from "./components/CalendarView";
import AnalyticsView from "./components/AnalyticsView";
import SettingsView from "./components/SettingsView";
import DesignSystemView from "./components/DesignSystemView";

// Utility helpers
import { getCalibratedPrayerTimes } from "./utils/islamicUtils";

export default function App() {
  // Global layout selection
  const [previewMode, setPreviewMode] = useState<"phone" | "fluid" | "specs">("phone");

  // Interaction: Onboarding slider walkthrough state matching Image 6
  const [isOnboarded, setIsOnboarded] = useState<boolean>(false);
  const [activeSlide, setActiveSlide] = useState<number>(1); // Slide index 0,1,2

  // App settings state
  const [settings, setSettings] = useState<AppSettings>({
    language: "en",
    rtlEnabled: false,
    theme: "light",
    calculationMethod: "Umm Al-Qura University, Makkah",
    locationName: "Mecca, Saudi Arabia",
    latitude: 21.4225,
    longitude: 39.8262,
    azanVolume: 80,
    vibrationOnReminder: true,
    textSize: "normal",
  });

  // Track the active screen tab
  const [activeTab, setActiveTab] = useState<string>("home");

  // Calibrated prayers state
  const [prayers, setPrayers] = useState<Prayer[]>([]);

  useEffect(() => {
    const times = getCalibratedPrayerTimes(settings.latitude, settings.longitude);
    const initialized: Prayer[] = times.map((t, idx) => {
      let startStatus: Prayer["status"] = null;
      if (t.id === "fajr") startStatus = "completed";
      else if (t.id === "dhuhr") startStatus = "jamaah";
      else if (t.id === "asr") startStatus = "late";

      return {
        id: t.id,
        name: t.name,
        arabicName: t.arabicName,
        time: t.time,
        status: startStatus,
        reminderOffset: 15,
        azanSound: t.id === "fajr" ? "Makkah" : "Traditional",
        soundEnabled: idx < 3 ? true : false,
      };
    });
    setPrayers(initialized);
  }, [settings.latitude, settings.longitude]);

  // Prepopulate beautiful 5 daily prayers checklist matching Image 8 precisely
  const [habits, setHabits] = useState<Habit[]>([
    {
      id: "h_fajr",
      name: "Fajr Prayer",
      arabicName: "صلاة الفجر",
      category: "custom",
      description: "Sunnah of Fajr followed by the obligatory prayer",
      completed: true,
      streak: 12,
      totalCompleted: 45,
      iconName: "Bookmark",
      color: "sky",
      emoji: "🌅",
      repeatDays: ["S", "M", "T", "W", "T", "F", "S"]
    },
    {
      id: "h_dhuhr",
      name: "Dhuhr Prayer",
      arabicName: "صلاة الظهر",
      category: "custom",
      description: "Primal noon prayer with rawatib voluntary sunnahs",
      completed: true,
      streak: 12,
      totalCompleted: 45,
      iconName: "Bookmark",
      color: "neon-green",
      emoji: "☀️",
      repeatDays: ["S", "M", "T", "W", "T", "F", "S"]
    },
    {
      id: "h_asr",
      name: "Asr Prayer",
      arabicName: "صلاة العصر",
      category: "custom",
      description: "The middle prayer offering great protective rewards",
      completed: true,
      streak: 12,
      totalCompleted: 45,
      iconName: "Bookmark",
      color: "pastel-yellow",
      emoji: "🌤️",
      repeatDays: ["S", "M", "T", "W", "T", "F", "S"]
    },
    {
      id: "h_maghrib",
      name: "Maghrib Prayer",
      arabicName: "صلاة المغرب",
      category: "custom",
      description: "Sunset prayer following the path of our Creator",
      completed: false,
      streak: 0,
      totalCompleted: 24,
      iconName: "Bookmark",
      color: "pastel-rose",
      emoji: "🌇",
      repeatDays: ["S", "M", "T", "W", "T", "F", "S"]
    },
    {
      id: "h_ishaa",
      name: "Isha'a Prayer",
      arabicName: "صلاة العشاء",
      category: "custom",
      description: "Night prayer leading to tranquil meditation",
      completed: false,
      streak: 0,
      totalCompleted: 24,
      iconName: "Bookmark",
      color: "pastel-purple",
      emoji: "🌙",
      repeatDays: ["S", "M", "T", "W", "T", "F", "S"]
    }
  ]);

  // Handlers
  const handleTogglePrayer = (id: string, newStatus: string | null) => {
    setPrayers((prev) =>
      prev.map((p) => (p.id === id ? { ...p, status: newStatus as any } : p))
    );
  };

  const handleUpdatePrayerConfig = (id: string, updates: Partial<Prayer>) => {
    setPrayers((prev) =>
      prev.map((p) => (p.id === id ? { ...p, ...updates } : p))
    );
  };

  const handleToggleHabit = (id: string) => {
    setHabits((prev) =>
      prev.map((h) => {
        if (h.id === id) {
          const isCompleting = !h.completed;
          return {
            ...h,
            completed: isCompleting,
            streak: isCompleting ? h.streak + 1 : Math.max(0, h.streak - 1),
            totalCompleted: isCompleting ? h.totalCompleted + 1 : Math.max(0, h.totalCompleted - 1),
          };
        }
        return h;
      })
    );
  };

  const handleAddHabit = (newHabit: Omit<Habit, "completed" | "streak" | "totalCompleted">) => {
    setHabits((prev) => [
      ...prev,
      {
        ...newHabit,
        completed: false,
        streak: 0,
        totalCompleted: 0,
      },
    ]);
  };

  const handleRemoveHabit = (id: string) => {
    setHabits((prev) => prev.filter((h) => h.id !== id));
  };

  const handleChangeSettings = (updates: Partial<AppSettings>) => {
    setSettings((prev) => ({ ...prev, ...updates }));
  };

  let accessibilityClass = "text-normal-scale";
  if (settings.textSize === "large") accessibilityClass = "text-large-scale";
  else if (settings.textSize === "extra-large") accessibilityClass = "text-extra-large-scale";

  // Simulate digital phone info
  const [statusBarClock, setStatusBarClock] = useState("08:58");
  useEffect(() => {
    const clockInterval = setInterval(() => {
      const d = new Date();
      const mins = d.getMinutes().toString().padStart(2, "0");
      setStatusBarClock(`${d.getHours()}:${mins}`);
    }, 10000);
    return () => clearInterval(clockInterval);
  }, []);

  return (
    <div className={`min-h-screen bg-[#F0EFEB] dark:bg-zinc-950 font-sans p-2 sm:p-6 transition-all ${settings.theme === "dark" || settings.theme === "dark" ? "dark" : ""}`}>
      
      {/* Dev preview header tools bar */}
      <div className="max-w-4xl mx-auto mb-6 bg-white dark:bg-zinc-900 shadow-sm border border-slate-100 dark:border-zinc-800 rounded-2xl p-2.5 flex flex-wrap gap-2 justify-between items-center z-10 relative">
        <div className="flex items-center gap-2">
          <BookOpen className="w-5 h-5 text-emerald-800 dark:text-emerald-400" />
          <div>
            <span className="text-xs font-black tracking-tight text-emerald-950 dark:text-white uppercase">DeenTrack Studio</span>
            <span className="text-[9px] text-gray-400 block font-mono">Prism Al-Aqsa mobile blueprint edition</span>
          </div>
        </div>

        {/* View Selection button triggers */}
        <div className="flex items-center gap-1.5 p-1 bg-slate-50 dark:bg-zinc-950 rounded-xl border border-slate-100 dark:border-zinc-800">
          <button
            onClick={() => setPreviewMode("phone")}
            className={`py-1.5 px-3 rounded-lg text-xs font-bold cursor-pointer transition-all flex items-center gap-1 ${
              previewMode === "phone"
                ? "bg-white dark:bg-zinc-800 text-emerald-800 dark:text-white shadow-sm font-black"
                : "text-gray-450"
            }`}
          >
            <Smartphone className="w-3.5 h-3.5 text-emerald-700" />
            <span>Simulated Mobile View</span>
          </button>
          
          <button
            onClick={() => {
              setPreviewMode("fluid");
              if (activeTab === "specs") setActiveTab("home");
            }}
            className={`py-1.5 px-3 rounded-lg text-xs font-bold cursor-pointer transition-all flex items-center gap-1 ${
              previewMode === "fluid"
                ? "bg-white dark:bg-zinc-800 text-emerald-800 dark:text-white shadow-sm font-black"
                : "text-gray-450"
            }`}
          >
            <Maximize2 className="w-3.5 h-3.5" />
            <span>Full Canvas View</span>
          </button>

          <button
            onClick={() => setPreviewMode("specs")}
            className={`py-1.5 px-3 rounded-lg text-xs font-bold cursor-pointer transition-all flex items-center gap-1 ${
              previewMode === "specs"
                ? "bg-white dark:bg-zinc-800 text-emerald-800 dark:text-white shadow-sm font-black"
                : "text-gray-450"
            }`}
          >
            <Palette className="w-3.5 h-3.5 text-amber-500" />
            <span>Deen Flutter Tokens</span>
          </button>
        </div>
      </div>

      {/* RENDER STAGES COMPONENT SECTION */}
      <div className="flex justify-center items-start w-full relative">
        <AnimatePresence mode="wait">
          
          {/* OPTION A: MOBILE PREMIUM DEVICE FRAME */}
          {previewMode === "phone" && (
            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              exit={{ opacity: 0, scale: 0.95 }}
              className="w-full max-w-[390px] h-[790px] rounded-[52px] border-12 border-slate-900 bg-[#FAF9F6] dark:bg-zinc-955 shadow-2xl overflow-hidden flex flex-col relative"
            >
              {/* Dynamic Island bar */}
              <div className="absolute top-[8px] left-[50%] transform -translate-x-[50%] w-32 h-6 bg-black rounded-3xl z-40 flex items-center justify-center pointer-events-none">
                <div className="w-3 h-3 rounded-full bg-zinc-900 mr-2" />
                <div className="w-10 h-1 bg-zinc-950 rounded" />
              </div>

              {/* Top phone device status bar */}
              <div className="h-10 px-6.5 pt-4 bg-transparent shrink-0 flex justify-between items-center text-[10.5px] font-black text-gray-900 dark:text-zinc-100 z-30 font-mono pointer-events-none select-none">
                <span>{statusBarClock}</span>
                <div className="flex items-center gap-1.5">
                  <Signal className="w-3 h-3 text-current" />
                  <Wifi className="w-3.5 h-3.5 text-current" />
                  <Battery className="w-4 h-4 text-current" />
                </div>
              </div>

              {/* Inner smart screen container viewport */}
              <div className={`flex-1 overflow-y-auto px-5.5 pt-2 pb-24 scrollbar-hidden ${accessibilityClass}`} id="phone-scroller">
                
                {/* CONDITIONAL ONBOARDING CAROUSEL MATCHING IMAGE 6 */}
                {!isOnboarded ? (
                  <div className="min-h-full flex flex-col justify-between py-4 text-center">
                    
                    {/* Ancient mosque photo backdrop inside slider */}
                    <div className="relative rounded-[32px] overflow-hidden bg-gradient-to-b from-[#103E44] to-[#122A21] h-[260px] p-5 shadow-inner border border-teal-950">
                      <div className="absolute inset-0 opacity-30 bg-[url('https://images.unsplash.com/photo-1590076212975-be02bf376f92?auto=format&fit=crop&q=80&w=600')] bg-cover bg-center pointer-events-none" />
                      
                      {/* CSS/SVG dome overlay decorations */}
                      <div className="absolute inset-x-0 bottom-0 top-18 flex justify-center items-end opacity-25">
                        <svg className="w-2/3 h-2/3" viewBox="0 0 100 100" fill="none">
                          <path d="M10 100 Q 50 10 90 100 Z" fill="#F0C265" />
                        </svg>
                      </div>

                      <div className="relative z-10 flex flex-col justify-between h-full text-white">
                        <div className="flex justify-between items-center">
                          <span className="text-[10px] bg-white/10 px-2.5 py-1 rounded-full uppercase tracking-widest font-black">DeenTrack onboarding</span>
                          <Sparkles className="w-5 h-5 text-amber-300" />
                        </div>
                        <div className="text-left">
                          <span className="text-[10px] text-teal-300 font-bold uppercase tracking-widest">Walkthrough slide {activeSlide} of 3</span>
                          <h4 className="text-xl font-sans font-black text-amber-200">Ar-Raqib Compass</h4>
                        </div>
                      </div>
                    </div>

                    {/* Slides page details dynamic content */}
                    <div className="space-y-4 px-1 py-4">
                      {activeSlide === 1 && (
                        <div className="space-y-2">
                          <h3 className="text-lg font-black text-emerald-950 dark:text-emerald-100">All-in-One Islamic Tools</h3>
                          <p className="text-xs text-gray-500 leading-relaxed">
                            Find everything you need in one place — prayer times, Qibla compass, duas, tasbih counts, and more.
                          </p>
                          
                          {/* Sliding glass mock cards matching Image 6 row */}
                          <div className="flex gap-2 justify-center pt-3 overflow-x-auto scrollbar-hidden">
                            <div className="p-2.5 bg-white border rounded-2xl flex items-center gap-1.5 shrink-0 shadow-sm border-teal-100">
                              <Layers className="w-3.5 h-3.5 text-teal-605" />
                              <span className="text-[10px] font-black text-teal-800">Tasbeeh Counter</span>
                            </div>
                            <div className="p-2.5 bg-white border rounded-2xl flex items-center gap-1.5 shrink-0 shadow-sm border-amber-100">
                              <Compass className="w-3.5 h-3.5 text-amber-550" />
                              <span className="text-[10px] font-black text-amber-700">Qibla Finder</span>
                            </div>
                            <div className="p-2.5 bg-white border rounded-2xl flex items-center gap-1.5 shrink-0 shadow-sm border-emerald-100">
                              <Sparkles className="w-3.5 h-3.5 text-emerald-600" />
                              <span className="text-[10px] font-black text-emerald-800">Daily Hadith</span>
                            </div>
                          </div>
                        </div>
                      )}

                      {activeSlide === 2 && (
                        <div className="space-y-2">
                          <h3 className="text-lg font-black text-[#103E44] dark:text-emerald-100">Weekly Habits Schedules</h3>
                          <p className="text-xs text-gray-500 leading-relaxed">
                            Checkoff your religious deeds and review standard consistency logs over the historic timeline contribution maps.
                          </p>
                          <div className="py-2.5 flex justify-center gap-1">
                            {["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha'a"].map((pname, idx) => (
                              <span key={idx} className="px-2.5 py-1 text-[9px] font-black rounded-lg bg-[#e6f4f5] text-[#103E44]">✓ {pname}</span>
                            ))}
                          </div>
                        </div>
                      )}

                      {activeSlide === 3 && (
                        <div className="space-y-2">
                          <h3 className="text-lg font-black text-emerald-950 dark:text-emerald-100">Azan Alarms Custom Imams</h3>
                          <p className="text-xs text-gray-500 leading-relaxed">
                            Configure automatic sound alerts utilizing legendary Qaris voices such as Sheikh Abdülbasit Abdüssamed.
                          </p>
                        </div>
                      )}
                    </div>

                    {/* Bottom slider controller actions */}
                    <div className="space-y-4 pt-1">
                      {/* Slide DOTS indicator */}
                      <div className="flex justify-center gap-2">
                        {[1, 2, 3].map((num) => (
                          <div 
                            key={num}
                            onClick={() => setActiveSlide(num)}
                            className={`h-2.5 rounded-full transition-all cursor-pointer ${
                              activeSlide === num ? "w-6 bg-emerald-600" : "w-2.5 bg-gray-250"
                            }`}
                          />
                        ))}
                      </div>

                      {/* Glossy green sliding Start Now button */}
                      <button
                        onClick={() => {
                          if (activeSlide < 3) {
                            setActiveSlide((prev) => prev + 1);
                          } else {
                            setIsOnboarded(true);
                          }
                        }}
                        className="w-full bg-emerald-700 hover:bg-emerald-800 text-white font-bold py-3.5 rounded-2xl text-xs tracking-wider transition-all shadow active:scale-95 cursor-pointer max-w-[280px] mx-auto block"
                      >
                        {activeSlide === 3 ? "Start Now" : "Next Slide"}
                      </button>
                    </div>

                  </div>
                ) : (
                  <AnimatePresence mode="wait">
                    {activeTab === "home" && (
                      <HomeView
                        settings={settings}
                        prayers={prayers}
                        habits={habits}
                        onTogglePrayer={handleTogglePrayer}
                        onToggleHabit={handleToggleHabit}
                        setTab={setActiveTab}
                        onChangeLocation={(name) => handleChangeSettings({ locationName: name })}
                      />
                    )}
                    {activeTab === "prayers" && (
                      <PrayersView
                        settings={settings}
                        prayers={prayers}
                        onTogglePrayer={handleTogglePrayer}
                        onUpdatePrayerConfig={handleUpdatePrayerConfig}
                      />
                    )}
                    {activeTab === "habits" && (
                      <HabitsView
                        settings={settings}
                        habits={habits}
                        onToggleHabit={handleToggleHabit}
                        onAddHabit={handleAddHabit}
                        onRemoveHabit={handleRemoveHabit}
                      />
                    )}
                    {activeTab === "qibla" && <QiblaView settings={settings} />}
                    {activeTab === "calendar" && <CalendarView settings={settings} />}
                    {activeTab === "analytics" && <AnalyticsView settings={settings} />}
                    {activeTab === "settings" && (
                      <SettingsView settings={settings} onChangeSettings={handleChangeSettings} />
                    )}
                  </AnimatePresence>
                )}
              </div>

              {/* IOS bottom bar indicator layout */}
              <div className="absolute bottom-[4px] left-[50%] transform -translate-x-[50%] w-24 h-1 bg-gray-300 dark:bg-zinc-700/50 rounded-full z-40 pointer-events-none" />

              {/* Modern bottom tab navigation bar centered around raised Home circle */}
              {isOnboarded && (
                <div className="absolute bottom-4 left-3.5 right-3.5 h-[68px] bg-slate-900/95 dark:bg-zinc-950/95 backdrop-blur-md rounded-[28px] z-45 flex justify-around items-center px-1 border border-white/5 shadow-2xl select-none">
                  
                  {/* Left Side: All Menu + Prayers */}
                  <button
                    onClick={() => {
                      setActiveTab("home");
                      // Direct all menu subview
                      setTimeout(() => {
                        const btn = document.getElementById("timeline-btn-fajr");
                        if (btn) btn.scrollIntoView({ behavior: 'smooth' });
                      }, 100);
                    }}
                    className={`flex flex-col items-center justify-center p-1.5 transition-all w-13 ${
                      activeTab === "home" ? "text-emerald-400" : "text-gray-400"
                    }`}
                  >
                    <Smartphone className="w-4.5 h-4.5" />
                    <span className="text-[8.5px] font-black uppercase mt-0.5">Mock Menu</span>
                  </button>

                  <button
                    onClick={() => setActiveTab("prayers")}
                    className={`flex flex-col items-center justify-center p-1.5 transition-all w-13 ${
                      activeTab === "prayers" ? "text-emerald-400" : "text-gray-400"
                    }`}
                  >
                    <Clock className="w-4.5 h-4.5" />
                    <span className="text-[8.5px] font-black uppercase mt-0.5">Alarms</span>
                  </button>

                  {/* CENTER RAISED DOME: HOME */}
                  <div className="relative -mt-6">
                    <button
                      onClick={() => setActiveTab("home")}
                      className={`w-14 h-14 rounded-full bg-emerald-650 hover:bg-emerald-700 text-white flex items-center justify-center shadow-lg transition-all border-4 border-slate-900 active:scale-90 cursor-pointer ${
                        activeTab === "home" ? "ring-2 ring-emerald-500" : ""
                      }`}
                    >
                      <Home className="w-5.5 h-5.5 text-white" />
                    </button>
                    <span className="text-[7.5px] font-bold text-slate-400 uppercase tracking-wider block text-center mt-1">
                      Home
                    </span>
                  </div>

                  {/* Right Side: Habits + Settings */}
                  <button
                    onClick={() => setActiveTab("habits")}
                    className={`flex flex-col items-center justify-center p-1.5 transition-all w-13 ${
                      activeTab === "habits" ? "text-emerald-400" : "text-gray-400"
                    }`}
                  >
                    <Flame className="w-4.5 h-4.5" />
                    <span className="text-[8.5px] font-black uppercase mt-0.5">Deeds</span>
                  </button>

                  <button
                    onClick={() => setActiveTab("settings")}
                    className={`flex flex-col items-center justify-center p-1.5 transition-all w-13 ${
                      activeTab === "settings" ? "text-emerald-400" : "text-gray-400"
                    }`}
                  >
                    <Settings className="w-4.5 h-4.5" />
                    <span className="text-[8.5px] font-black uppercase mt-0.5">Prefs</span>
                  </button>

                </div>
              )}

            </motion.div>
          )}

          {/* OPTION B: RESPONSIVE DESKTOP DASHBOARD CANVAS */}
          {previewMode === "fluid" && (
            <motion.div
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              className="w-full max-w-4xl bg-[#FAF9F6] dark:bg-zinc-900 rounded-[32px] shadow-lg border border-slate-100 dark:border-zinc-800/80 overflow-hidden min-h-[640px] flex"
            >
              {/* Left sidebar nav */}
              <div className="w-56 shrink-0 bg-slate-900 text-slate-100 p-5 flex flex-col justify-between">
                <div className="space-y-6">
                  <div className="flex gap-2 items-center px-1">
                    <BookOpen className="w-5.5 h-5.5 text-emerald-400" />
                    <div>
                      <span className="text-sm font-black tracking-tight text-white block uppercase leading-none">DeenTrack</span>
                      <span className="text-[9px] text-gray-400">Desktop Workspace</span>
                    </div>
                  </div>

                  {/* Nav links */}
                  <div className="space-y-1">
                    {[
                      { id: "home", label: "Home Dashboard", icon: <Home className="w-4.5 h-4.5" /> },
                      { id: "prayers", label: "Prayers Alarms", icon: <Clock className="w-4.5 h-4.5" /> },
                      { id: "habits", label: "Deeds & Habits", icon: <Flame className="w-4.5 h-4.5" /> },
                      { id: "qibla", label: "Qibla Compass", icon: <Compass className="w-4.5 h-4.5" /> },
                      { id: "calendar", label: "Hijri Calendar", icon: <Calendar className="w-4.5 h-4.5" /> },
                      { id: "analytics", label: "Analytics Stats", icon: <BarChart2 className="w-4.5 h-4.5" /> },
                      { id: "settings", label: "Preferences", icon: <Settings className="w-4.5 h-4.5" /> },
                    ].map((item) => {
                      const isActive = activeTab === item.id;
                      return (
                        <button
                          key={item.id}
                          onClick={() => {
                            setActiveTab(item.id);
                            setIsOnboarded(true); // disable onboarding overlay once active inside desktop
                          }}
                          className={`w-full py-2.5 px-3.5 rounded-xl text-left text-xs font-semibold flex items-center gap-3 transition-all cursor-pointer ${
                            isActive && isOnboarded
                              ? "bg-emerald-800 text-white shadow"
                              : "text-slate-400 hover:bg-slate-800 hover:text-white"
                          }`}
                        >
                          {item.icon}
                          <span>{item.label}</span>
                        </button>
                      );
                    })}
                  </div>
                </div>

                <div className="p-2.5 border border-slate-800 rounded-xl bg-slate-950/40 text-[10.5px] text-slate-400 text-center">
                  <span>DeenTrack Calibrated</span>
                  <div className="mt-1 font-mono text-[9px] text-amber-300">
                    Lat: {settings.latitude.toFixed(4)}<br />
                    Lon: {settings.longitude.toFixed(4)}
                  </div>
                </div>
              </div>

              {/* Right content viewport */}
              <div className={`flex-1 p-8 overflow-y-auto max-h-[750px] ${accessibilityClass}`}>
                
                {/* Walkthrough Slider on fluid if not dismissed */}
                {!isOnboarded ? (
                  <div className="space-y-6 text-center py-6">
                    <h3 className="text-2xl font-black text-[#103E44]">Welcome to DeenTrack Premium Companion</h3>
                    <p className="text-xs text-gray-500 max-w-md mx-auto">
                      Explore detailed coordinate-calibrated prayer times, daily Islamic deed trackers, and a lovely pocket sub-menu workflow.
                    </p>
                    <button 
                      onClick={() => setIsOnboarded(true)}
                      className="px-6 py-3 bg-emerald-700 text-white text-xs font-bold rounded-2xl transition-all shadow hover:bg-emerald-800 cursor-pointer"
                    >
                      Enter Home Dashboard
                    </button>
                  </div>
                ) : (
                  <AnimatePresence mode="wait">
                    {activeTab === "home" && (
                      <HomeView
                        settings={settings}
                        prayers={prayers}
                        habits={habits}
                        onTogglePrayer={handleTogglePrayer}
                        onToggleHabit={handleToggleHabit}
                        setTab={setActiveTab}
                        onChangeLocation={(name) => handleChangeSettings({ locationName: name })}
                      />
                    )}
                    {activeTab === "prayers" && (
                      <PrayersView
                        settings={settings}
                        prayers={prayers}
                        onTogglePrayer={handleTogglePrayer}
                        onUpdatePrayerConfig={handleUpdatePrayerConfig}
                      />
                    )}
                    {activeTab === "habits" && (
                      <HabitsView
                        settings={settings}
                        habits={habits}
                        onToggleHabit={handleToggleHabit}
                        onAddHabit={handleAddHabit}
                        onRemoveHabit={handleRemoveHabit}
                      />
                    )}
                    {activeTab === "qibla" && <QiblaView settings={settings} />}
                    {activeTab === "calendar" && <CalendarView settings={settings} />}
                    {activeTab === "analytics" && <AnalyticsView settings={settings} />}
                    {activeTab === "settings" && (
                      <SettingsView settings={settings} onChangeSettings={handleChangeSettings} />
                    )}
                  </AnimatePresence>
                )}

              </div>
            </motion.div>
          )}

          {/* OPTION C: DESIGN TOKENS SPEC SHEET */}
          {previewMode === "specs" && (
            <motion.div
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              className="w-full max-w-4xl bg-[#FAF9F6] dark:bg-zinc-900 rounded-[32px] p-8 shadow-lg border border-slate-105 dark:border-zinc-800/80 max-h-[780px] overflow-y-auto"
            >
              <DesignSystemView />
            </motion.div>
          )}

        </AnimatePresence>
      </div>

    </div>
  );
}
