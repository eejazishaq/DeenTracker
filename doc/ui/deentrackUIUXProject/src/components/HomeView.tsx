/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState, useEffect } from "react";
import { AppSettings, Prayer, Habit } from "../types";
import { 
  Sparkles, 
  Clock,
  MapPin,
  Calendar,
  Compass,
  Heart,
  ChevronRight,
  User,
  Volume2,
  Bell,
  Check,
  Share2,
  Eye,
  BookOpen,
  Info,
  Layers,
  Award,
  Smartphone,
  Play,
  RotateCcw,
  CheckSquare,
  HelpCircle,
  Menu,
  Sunset,
  VolumeX,
  X,
  ChevronDown
} from "lucide-react";
import { motion, AnimatePresence } from "motion/react";
import { getHijriDate } from "../utils/islamicUtils";

interface HomeViewProps {
  settings: AppSettings;
  prayers: Prayer[];
  habits: Habit[];
  onTogglePrayer: (id: string, status: string | null) => void;
  onToggleHabit: (id: string) => void;
  setTab: (tab: string) => void;
  onChangeLocation: (name: string) => void;
}

export default function HomeView({
  settings,
  prayers,
  habits,
  onTogglePrayer,
  onToggleHabit,
  setTab,
  onChangeLocation,
}: HomeViewProps) {
  const isAr = settings.language === "ar";
  
  // Real-time Clock
  const [now, setNow] = useState(new Date());
  useEffect(() => {
    const t = setInterval(() => setNow(new Date()), 1000);
    return () => clearInterval(t);
  }, []);

  // UI state overlays
  const [activeSubView, setActiveSubView] = useState<"dashboard" | "allMenu" | "tasbeeh" | "wuduGuide" | "imams">("dashboard");
  const [selectedImam, setSelectedImam] = useState({
    name: "Abdülbasit Abdüssamed",
    photo: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=120"
  });
  
  // Custom dialogs
  const [activePrayerLog, setActivePrayerLog] = useState<Prayer | null>(null);
  const [tempLogStatus, setTempLogStatus] = useState<string>("completed");
  
  // Tasbeeh state variables
  const [tasbeehCount, setTasbeehCount] = useState<number>(0);
  const [tasbeehTarget, setTasbeehTarget] = useState<number>(33);
  const [tasbeehPhrase, setTasbeehPhrase] = useState<string>("SubhanAllah");
  const tasbeehPhrases = [
    { en: "SubhanAllah", ar: "سبحان الله", desc: "Glory be to Allah" },
    { en: "Alhamdulillah", ar: "الحمد لله", desc: "Praise be to Allah" },
    { en: "Allahu Akbar", ar: "الله أكبر", desc: "Allah is the Greatest" },
    { en: "La ilaha illa Allah", ar: "لا إله إلا الله", desc: "There is no deity but Allah" }
  ];

  // Imam choices list
  const imamsList = [
    { name: "Abdülbasit Abdüssamed", title: "Legendary Egyptian Qari", photo: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=120" },
    { name: "Mishary Rashid Alafasy", title: "Kuwait Grand Masjid", photo: "https://images.unsplash.com/photo-1628157582853-a796fa650a6a?auto=format&fit=crop&q=80&w=120" },
    { name: "Abdurrahman As-Sudais", title: "Makkah Imam Al-Haram", photo: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=120" },
    { name: "Maher Al-Muaiqly", title: "Madinah & Makkah Qari", photo: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=120" }
  ];

  // Share overlay state
  const [showShareNotification, setShowShareNotification] = useState<boolean>(false);

  // Calculate upcoming prayer and remaining seconds
  const [nextPrayerInfo, setNextPrayerInfo] = useState<{
    name: string;
    nameAr: string;
    countdown: string;
    progress: number;
    time: string;
  } | null>(null);

  useEffect(() => {
    if (!prayers || prayers.length === 0) return;
    
    // Convert 12h clock to decimal values
    const parsed = prayers.map((p) => {
      const match = p.time.match(/(\d+):(\d+)\s*(AM|PM)/i);
      let hour = 12;
      let min = 0;
      if (match) {
        hour = parseInt(match[1]);
        min = parseInt(match[2]);
        const isPM = match[3].toUpperCase() === "PM";
        if (isPM && hour < 12) hour += 12;
        if (!isPM && hour === 12) hour = 0;
      }
      return { 
        ...p, 
        decimalTime: hour + min / 60,
        hour,
        min
      };
    });

    const currentDecimal = now.getHours() + now.getMinutes() / 60 + now.getSeconds() / 3600;
    
    // Locate upcoming prayer matches
    let upcoming = parsed.find((p) => p.decimalTime > currentDecimal);
    if (!upcoming) {
      upcoming = parsed[0]; // defaults to tomorrow's Fajr
    }

    // Seconds difference
    const targetDate = new Date(now);
    targetDate.setHours(upcoming.hour, upcoming.min, 0, 0);
    if (targetDate.getTime() < now.getTime()) {
      targetDate.setDate(targetDate.getDate() + 1);
    }

    const diffMs = targetDate.getTime() - now.getTime();
    const diffHours = Math.floor(diffMs / (1000 * 60 * 60));
    const diffMins = Math.floor((diffMs % (1000 * 60 * 60)) / (1000 * 60));
    const diffSecs = Math.floor((diffMs % (1000 * 60)) / 1000);

    const countdownStr = `${diffHours.toString().padStart(2, "0")}:${diffMins.toString().padStart(2, "0")}:${diffSecs.toString().padStart(2, "0")}`;
    
    // Normal interval math (approx 6 hour blocks)
    const totalBlockMs = 6 * 60 * 60 * 1000;
    const progressPercent = Math.max(0, Math.min(100, 100 - (diffMs / totalBlockMs) * 100));

    setNextPrayerInfo({
      name: upcoming.name,
      nameAr: upcoming.arabicName,
      countdown: countdownStr,
      progress: Math.round(progressPercent),
      time: upcoming.time
    });
  }, [now, prayers]);

  // Hijri Date
  const hijri = getHijriDate(now);
  const formattedGregorian = now.toLocaleDateString(isAr ? "ar-EG" : "en-US", {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  });

  // Calculate current date details mapping Image 7 styling
  const customDateString = `${now.getDate()} June ${now.getFullYear()} • ${hijri.day} ${hijri.month} ${hijri.year}`;

  return (
    <div className="space-y-6 pb-20 select-none relative">
      
      {/* RENDER VIEW ACCORDING TO STATE TAB SELECTION */}
      {activeSubView === "dashboard" && (
        <>
          {/* 1. Stunning Al-Aqsa Dome Header background Illustration */}
          <div className="relative rounded-[32px] overflow-hidden bg-gradient-to-b from-[#1b2b3a] via-[#103E44] to-[#122A21] h-[210px] shadow-lg border border-teal-950 flex flex-col justify-between p-4.5 text-white">
            
            {/* Artistic Mosque & Dome Render */}
            <div className="absolute inset-0 z-0 opacity-45 pointer-events-none mix-blend-overlay">
              <svg className="w-full h-full" viewBox="0 0 400 200" fill="none" preserveAspectRatio="none">
                <rect width="400" height="200" fill="url(#bg-gradient)"/>
                {/* Golden Dome outline */}
                <path d="M120 150 C120 70 280 70 280 150 Z" fill="#F0C265" opacity="0.8"/>
                <path d="M190 70 L210 70 L200 40 Z" fill="#F0C265"/>
                <circle cx="200" cy="35" r="4" fill="#F0C265"/>
                {/* Minarets silhouettes */}
                <rect x="70" y="50" width="15" height="100" fill="#0C2023" opacity="0.9"/>
                <path d="M65 50 L90 50 L77.5 25 Z" fill="#F0C265" opacity="0.9"/>
                <rect x="315" y="50" width="15" height="100" fill="#0C2023" opacity="0.9"/>
                <path d="M310 50 L335 50 L322.5 25 Z" fill="#F0C265" opacity="0.9"/>
                {/* Arches */}
                <path d="M20 150 Q 50 120 80 150" stroke="#F0C265" strokeWidth="2" fill="none"/>
                <path d="M320 150 Q 350 120 380 150" stroke="#F0C265" strokeWidth="2" fill="none"/>
                {/* Tiny birds flying */}
                <path d="M100 60 Q105 55 110 60 Q115 55 120 60" stroke="#FAF9F6" strokeWidth="1.5" fill="none"/>
                <path d="M280 40 Q285 35 290 40 Q295 35 300 40" stroke="#FAF9F6" strokeWidth="1.5" fill="none"/>
                
                <defs>
                  <radialGradient id="bg-gradient" cx="50%" cy="50%" r="50%">
                    <stop offset="0%" stopColor="#F5B041" stopOpacity="0.6"/>
                    <stop offset="100%" stopColor="#122A21" stopOpacity="0"/>
                  </radialGradient>
                </defs>
              </svg>
            </div>

            {/* Glowing sunray backlighting */}
            <div className="absolute top-[-30px] left-[50%] transform -translate-x-[50%] w-64 h-32 bg-amber-400/25 blur-3xl rounded-full z-0 pointer-events-none" />

            {/* Control line 1: Date & Controls */}
            <div className="relative z-10 flex justify-between items-center w-full">
              {/* Custom Date Glass pill */}
              <div className="bg-black/25 backdrop-blur-md rounded-full px-3 py-1.5 border border-white/10 flex items-center gap-1.5 text-[10.5px] font-semibold text-white/90">
                <Calendar className="w-3.5 h-3.5 text-amber-300" />
                <span>{customDateString}</span>
              </div>
              
              {/* Badges controls */}
              <div className="flex items-center gap-1.5">
                <button className="w-8 h-8 rounded-full bg-black/25 backdrop-blur-md border border-white/10 flex items-center justify-center text-amber-300 hover:scale-105 active:scale-95 transition-all">
                  <Award className="w-4 h-4" />
                </button>
                <button className="w-8 h-8 rounded-full bg-black/25 backdrop-blur-md border border-white/10 flex items-center justify-center text-emerald-300 hover:scale-105 active:scale-95 transition-all">
                  <Info className="w-4 h-4 text-orange-400" />
                </button>
                <div className="relative">
                  <button className="w-8 h-8 rounded-full bg-black/25 backdrop-blur-md border border-white/10 flex items-center justify-center text-white/90 hover:scale-105 active:scale-95 transition-all">
                    <Bell className="w-4 h-4" />
                  </button>
                  <span className="absolute -top-1 -right-1 bg-red-500 text-white font-mono font-black text-[8px] w-4.5 h-4.5 rounded-full flex items-center justify-center border border-[#1b2b3a] shadow-sm">
                    8
                  </span>
                </div>
              </div>
            </div>

            {/* Control line 2: Location pill and Subtitle */}
            <div className="relative z-10 flex justify-between items-end w-full">
              <div>
                <span className="text-[10px] text-teal-200/80 uppercase font-bold tracking-widest block">Islamic Dev Workspace</span>
                <span className="text-xl font-bold tracking-tight text-white mt-0.5 block font-sans">
                  Al-Aqsa Sanctuary
                </span>
              </div>
              
              {/* Geolocation pill matching Image 7 */}
              <div className="bg-black/35 backdrop-blur-md rounded-xl px-3 py-2 border border-white/15 flex items-center gap-1 text-[11px] font-medium text-amber-200 shadow-lg">
                <MapPin className="w-3.5 h-3.5 text-amber-400" />
                <span className="font-semibold tracking-wide">Riyadh, SAUDI ARABIA</span>
              </div>
            </div>
          </div>

          {/* 2. Side-By-Side Quick Config Cards (NEXT PRAYER + ADHAN VOICE) */}
          <div className="grid grid-cols-2 gap-4">
            
            {/* NEXT PRAYER CARD */}
            <div className="bg-[#1f2e3d] dark:bg-zinc-900 border border-slate-700/50 dark:border-zinc-800 rounded-3xl p-4.5 text-white flex flex-col justify-between space-y-3 shadow-md relative overflow-hidden">
              <div className="absolute top-4 right-4 flex items-center gap-1.5">
                <span className="w-2 h-2 rounded-full bg-emerald-400 animate-ping absolute" />
                <span className="w-2 h-2 rounded-full bg-emerald-400" />
              </div>
              <div>
                <span className="text-[10px] text-gray-400 uppercase tracking-widest font-bold">Next Prayer</span>
                <div className="text-3xl font-black mt-1 font-sans text-amber-300">
                  {nextPrayerInfo ? nextPrayerInfo.countdown : "00:00:00"}
                </div>
              </div>
              <div>
                <div className="flex items-center gap-1.5 text-xs font-semibold text-slate-200">
                  <Sunset className="w-3.5 h-3.5 text-amber-400" />
                  <span>{nextPrayerInfo ? nextPrayerInfo.name : "Dhuhr"}</span>
                </div>
                <span className="text-[10px] text-gray-500 block font-mono mt-0.5">Time Remaining</span>
              </div>
            </div>

            {/* ADHAN VOICE CARD */}
            <div className="bg-[#1f2e3d] dark:bg-zinc-900 border border-slate-700/50 dark:border-zinc-800 rounded-3xl p-4.5 text-white flex flex-col justify-between space-y-2 shadow-md">
              <span className="text-[10px] text-gray-400 uppercase tracking-widest font-bold block">Adhan Voice</span>
              <div className="flex items-center gap-2 pt-1">
                <img 
                  src={selectedImam.photo}
                  alt="Imam" 
                  referrerPolicy="no-referrer"
                  className="w-10 h-10 rounded-full object-cover border border-amber-300" 
                />
                <div className="overflow-hidden">
                  <span className="text-xs font-black block text-gray-200 truncate">{selectedImam.name}</span>
                  <span className="text-[9px] text-slate-400 font-medium">Selected Imam</span>
                </div>
              </div>
              <button 
                onClick={() => setActiveSubView("imams")}
                className="w-full py-1.5 bg-emerald-650 hover:bg-emerald-700 text-white font-bold text-[10.5px] rounded-xl transition-all active:scale-95 cursor-pointer text-center"
              >
                Change Imam
              </button>
            </div>
          </div>

          {/* 3. ALL MENU Quick Slides sliders */}
          <div>
            <div className="flex justify-between items-center mb-2.5">
              <span className="text-xs font-bold text-slate-800 dark:text-gray-300 uppercase tracking-wider block">All Menu</span>
              <button onClick={() => setActiveSubView("allMenu")} className="text-[10.5px] font-bold text-emerald-700 hover:text-emerald-800 flex items-center gap-0.5">
                <span>See All</span>
                <ChevronRight className="w-3 h-3" />
              </button>
            </div>
            
            <div className="grid grid-cols-3 gap-3">
              {/* Habit Tracker tab */}
              <div 
                onClick={() => setTab("habits")}
                className="bg-gradient-to-br from-[#0e5151]/95 to-[#0b3333] border border-emerald-950 rounded-2xl p-3 text-center text-white cursor-pointer hover:scale-[1.03] active:scale-[0.98] transition-all"
              >
                <div className="w-8 h-8 rounded-lg bg-white/10 mx-auto flex items-center justify-center mb-1.5">
                  <CheckSquare className="w-4.5 h-4.5 text-cyan-300" />
                </div>
                <span className="text-[10.5px] font-bold block">Habit Tracker</span>
              </div>

              {/* Quran selection */}
              <div 
                onClick={() => setTab("habits")} // Leads to Quran category list
                className="bg-gradient-to-br from-[#2a2c41] to-[#121421] border border-slate-800 rounded-2xl p-3 text-center text-white cursor-pointer hover:scale-[1.03] active:scale-[0.98] transition-all"
              >
                <div className="w-8 h-8 rounded-lg bg-white/10 mx-auto flex items-center justify-center mb-1.5">
                  <BookOpen className="w-4.5 h-4.5 text-indigo-300" />
                </div>
                <span className="text-[10.5px] font-bold block">Quran Hub</span>
              </div>

              {/* Prayer Times list link */}
              <div 
                onClick={() => setTab("prayers")}
                className="bg-gradient-to-br from-[#123e20] to-[#041d0c]/70 border border-emerald-950 rounded-2xl p-3 text-center text-white cursor-pointer hover:scale-[1.03] active:scale-[0.98] transition-all"
              >
                <div className="w-8 h-8 rounded-lg bg-white/10 mx-auto flex items-center justify-center mb-1.5">
                  <Clock className="w-4.5 h-4.5 text-green-300" />
                </div>
                <span className="text-[10.5px] font-bold block">Prayer Times</span>
              </div>
            </div>
          </div>

          {/* 4. HABIT TRACKER Quick prayer completion checkboxes section */}
          <div className="bg-[#1a2633] dark:bg-zinc-900 border border-slate-800/80 rounded-3xl p-4.5 space-y-3.5">
            <div className="flex justify-between items-center">
              <span className="text-xs font-bold text-gray-300 uppercase tracking-widest">Habit Tracker Quick Checklist</span>
              <span className="text-[9px] font-mono text-amber-300 font-bold">Schedules Checked</span>
            </div>
            
            {/* Horizontal Timeline list row matching Image 4 habits row */}
            <div className="grid grid-cols-5 gap-2.5">
              {prayers.map((p) => {
                const getPrayerBg = (status: string | null) => {
                  if (status === "completed") return "bg-emerald-600/35 border-emerald-500 text-emerald-300";
                  if (status === "late") return "bg-amber-600/35 border-amber-500 text-amber-300";
                  if (status === "jamaah") return "bg-teal-600/35 border-teal-500 text-teal-300";
                  if (status === "missed") return "bg-rose-600/35 border-rose-500 text-rose-300";
                  return "bg-slate-900/40 border-slate-700/60 text-slate-300";
                };

                return (
                  <div 
                    key={p.id} 
                    className={`rounded-2xl border p-2 text-center text-white cursor-pointer transition-all hover:scale-[1.05] active:scale-[0.95] ${getPrayerBg(p.status)}`}
                    onClick={() => {
                      setActivePrayerLog(p);
                      setTempLogStatus(p.status || "completed");
                    }}
                  >
                    <span className="text-[10px] font-bold block truncate">{isAr ? p.arabicName : p.name}</span>
                    <span className="text-[9px] text-gray-400 font-mono block mt-0.5">{p.time.split(" ")[0]}</span>
                    
                    {/* Tick box visual circle below */}
                    <div className="w-5 h-5 mx-auto rounded-full border border-current flex items-center justify-center mt-2">
                      {p.status ? (
                        <Check className="w-3.5 h-3.5 text-amber-300" strokeWidth={3} />
                      ) : (
                        <div className="w-1.5 h-1.5 rounded-full bg-slate-650" />
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          {/* 5. Quran & Qibla Finder double grid buttons side by side */}
          <div className="grid grid-cols-2 gap-4">
            {/* Quran hub */}
            <div 
              onClick={() => setTab("habits")}
              className="relative p-4 rounded-3xl h-26 bg-gradient-to-br from-[#121c2c] to-[#1a2d48] border border-slate-800 text-white flex flex-col justify-between cursor-pointer hover:scale-[1.02] transition-all"
            >
              <BookOpen className="w-6 h-6 text-indigo-400" />
              <div>
                <span className="text-xs font-black text-gray-200">Quran Hub</span>
                <span className="text-[9.5px] text-slate-400 block mt-0.5">Read & Memorize daily Juzs</span>
              </div>
            </div>

            {/* Qibla finder with Kaaba icon */}
            <div 
              onClick={() => setTab("qibla")}
              className="relative p-4 rounded-3xl h-26 bg-gradient-to-br from-[#1b3435] to-[#041c1d] border border-teal-900 text-white flex flex-col justify-between cursor-pointer hover:scale-[1.02] transition-all"
            >
              <Compass className="w-6 h-6 text-teal-400 animate-spin-slow" />
              <div>
                <span className="text-xs font-black text-gray-100">Qibla Finder</span>
                <span className="text-[9.5px] text-slate-400 block mt-0.5">Aligned real-time Kaaba direction</span>
              </div>
            </div>
          </div>

          {/* 6. DUA OF THE DAY custom banner card */}
          <div className="rounded-3xl bg-gradient-to-br from-[#0c3125] to-[#12221b] border border-teal-950 p-5 text-white/95 relative overflow-hidden shadow-md">
            {/* Islamic motif back pattern */}
            <div className="absolute right-[-20px] bottom-[-20px] w-24 h-24 rounded-full bg-[#1b503c]/20 blur-xl pointer-events-none" />
            
            <div className="flex items-center gap-2 pb-2.5 border-b border-white/5 opacity-80">
              <Sparkles className="w-4.5 h-4.5 text-amber-300" />
              <span className="text-[10.5px] uppercase font-bold tracking-widest text-emerald-200">Dua of the Day</span>
            </div>
            
            <div className="space-y-3 pt-3">
              <span className="text-right text-xs font-medium block text-emerald-200" dir="rtl">
                اللهم، علمنا المسؤولية في كل مناحي حياتنا والهمنا بالبر والخير والرحمة.
              </span>
              <p className="text-[11.5px] text-slate-205 leading-relaxed italic">
                "Almighty, infuse in us a spirit of generosity and responsibilities in all parts of our existence."
              </p>
              
              <div className="flex justify-between items-center pt-2.5 border-t border-white/5">
                <button 
                  onClick={() => {
                    setShowShareNotification(true);
                    setTimeout(() => setShowShareNotification(false), 2500);
                  }}
                  className="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-slate-300 cursor-pointer"
                >
                  <Share2 className="w-3.5 h-3.5" />
                </button>
                <button className="bg-emerald-650 hover:bg-emerald-700 text-white text-[10.5px] font-black py-1.5 px-3.5 rounded-full transition-all active:scale-95 cursor-pointer">
                  Read All
                </button>
              </div>
            </div>
          </div>
        </>
      )}

      {/* SUBVIEW: ALL MENU HUB COMPONENT MATCHING IMAGE 5 */}
      {activeSubView === "allMenu" && (
        <div className="space-y-6">
          
          {/* Header */}
          <div className="flex items-center justify-between pb-1.5 border-b border-gray-100 dark:border-zinc-800">
            <div className="flex items-center gap-2">
              <button 
                onClick={() => setActiveSubView("dashboard")}
                className="p-1 px-2.5 bg-slate-100 dark:bg-zinc-800 rounded-xl text-xs font-semibold hover:bg-slate-200"
              >
                ← Back
              </button>
              <div>
                <h3 className="text-base font-black text-emerald-950 dark:text-emerald-100">All Muslim Tools</h3>
                <span className="text-[9.5px] text-gray-400 block">Complete worship companions</span>
              </div>
            </div>
            <span className="text-[11px] font-black text-[#103E44] bg-[#e6f4f5] dark:text-teal-300 dark:bg-teal-950/40 rounded-full px-2.5 py-1">Menu Active</span>
          </div>

          {/* 1. Category: TOOLS */}
          <div className="space-y-3">
            <span className="text-[10.5px] text-gray-450 uppercase tracking-widest font-black block">Worship Tools</span>
            <div className="grid grid-cols-2 gap-3">
              
              {/* Pocket Tasbeeh clickable */}
              <div 
                onClick={() => setActiveSubView("tasbeeh")}
                className="bg-white dark:bg-zinc-900 border border-gray-150 dark:border-zinc-800 rounded-2xl p-3.5 flex items-center gap-3 cursor-pointer hover:shadow hover:border-emerald-500 transition-all"
              >
                <div className="w-9 h-9 rounded-xl bg-teal-50 dark:bg-teal-950/20 text-teal-600 dark:text-teal-300 flex items-center justify-center">
                  <Layers className="w-5 h-5" />
                </div>
                <div>
                  <span className="text-xs font-black block text-slate-800 dark:text-gray-100">Tasbeeh Counter</span>
                  <span className="text-[9px] text-gray-400">Bead click counter</span>
                </div>
              </div>

              {/* Qibla compass direct link */}
              <div 
                onClick={() => setTab("qibla")}
                className="bg-white dark:bg-zinc-900 border border-gray-150 dark:border-zinc-800 rounded-2xl p-3.5 flex items-center gap-3 cursor-pointer hover:shadow hover:border-emerald-500 transition-all"
              >
                <div className="w-9 h-9 rounded-xl bg-orange-50 dark:bg-orange-950/20 text-orange-600 dark:text-orange-300 flex items-center justify-center">
                  <Compass className="w-5 h-5" />
                </div>
                <div>
                  <span className="text-xs font-black block text-slate-800 dark:text-gray-100">Qibla Compass</span>
                  <span className="text-[9px] text-gray-400">Degrees indicator</span>
                </div>
              </div>

              {/* Step instructions */}
              <div 
                onClick={() => setActiveSubView("wuduGuide")}
                className="bg-white dark:bg-zinc-900 border border-gray-150 dark:border-zinc-800 rounded-2xl p-3.5 flex items-center gap-3 cursor-pointer hover:shadow hover:border-emerald-500 transition-all"
              >
                <div className="w-9 h-9 rounded-xl bg-emerald-50 dark:bg-emerald-950/20 text-emerald-600 dark:text-emerald-300 flex items-center justify-center">
                  <HelpCircle className="w-5 h-5" />
                </div>
                <div>
                  <span className="text-xs font-black block text-slate-800 dark:text-gray-100">Wudu Guide</span>
                  <span className="text-[9px] text-gray-400">Step by purification</span>
                </div>
              </div>

              {/* Location mosques mock */}
              <div 
                onClick={() => {
                  onChangeLocation("Medina, Saudi Arabia");
                  setActiveSubView("dashboard");
                }}
                className="bg-white dark:bg-zinc-900 border border-gray-150 dark:border-zinc-800 rounded-2xl p-3.5 flex items-center gap-3 cursor-pointer hover:shadow hover:border-emerald-500 transition-all"
              >
                <div className="w-9 h-9 rounded-xl bg-blue-50 dark:bg-blue-950/20 text-blue-600 dark:text-blue-300 flex items-center justify-center">
                  <MapPin className="w-5 h-5" />
                </div>
                <div>
                  <span className="text-xs font-black block text-slate-800 dark:text-gray-100">Sync Medina</span>
                  <span className="text-[9px] text-gray-400">Recalibrate mosque coordinates</span>
                </div>
              </div>

            </div>

            {/* Check Updates broad banner card from Image 5 */}
            <div className="rounded-2xl p-4 bg-gradient-to-r from-[#103E44] to-[#1a4f56] text-white flex items-center justify-between shadow-sm">
              <div>
                <span className="text-xs font-bold block">Update to Latest Version</span>
                <span className="text-[10px] text-teal-200">Get pristine mosque calibrated coordinate alarms</span>
              </div>
              <button 
                onClick={() => {
                  alert("Application database is fully synchronized matching the latest June 2026 Al-Aqsa database.");
                }}
                className="px-3.5 py-1.5 bg-yellow-500 hover:bg-yellow-600 text-slate-950 font-black text-[10px] rounded-xl transition-all"
              >
                Check Updates
              </button>
            </div>
          </div>

          {/* 2. Category: WORSHIP PRESETS */}
          <div className="space-y-3">
            <span className="text-[10.5px] text-gray-450 uppercase tracking-widest font-black block">Worship & Timetables</span>
            <div className="space-y-2">
              {[
                { name: "Monthly Prayer Calendar", ar: "التقرير الشهري لمواقيت الصلاة", desc: "View Ramadan & Dhul hijjah schedule logs", val: "calendar" },
                { name: "Daily Adhkar Reciter", ar: "حصن المسلم اليومي", desc: "Fortress of the Muslim protect and shields", val: "habits" },
              ].map((w, idx) => (
                <div 
                  key={idx}
                  onClick={() => setTab(w.val)}
                  className="bg-slate-50 dark:bg-zinc-850 p-3 rounded-2xl border border-slate-100 dark:border-zinc-800/60 flex justify-between items-center cursor-pointer hover:border-emerald-400"
                >
                  <div>
                    <span className="text-xs font-bold block text-slate-800 dark:text-gray-100">{w.name}</span>
                    <span className="text-[9px] text-gray-400">{w.desc}</span>
                  </div>
                  <ChevronRight className="w-4 h-4 text-slate-400" />
                </div>
              ))}
            </div>
          </div>

          {/* 3. Category: QURAN CONTENT */}
          <div className="space-y-3">
            <span className="text-[10.5px] text-gray-450 uppercase tracking-widest font-black block">Quran & Corpus Content</span>
            <div className="bg-white dark:bg-zinc-900 border border-gray-150 dark:border-zinc-800/60 rounded-2xl p-4 space-y-3.5">
              <div className="flex gap-3.5 items-center">
                <BookOpen className="w-5 h-5 text-emerald-600" />
                <div>
                  <span className="text-xs font-black block">Daily Ayat Selection</span>
                  <span className="text-[10px] text-gray-400">"Indeed, those who believe and do righteous deeds will have the Gardens of Paradise..."</span>
                </div>
              </div>
              <div className="flex gap-3.5 items-center pt-2.5 border-t border-slate-50 dark:border-zinc-800/40">
                <Sparkles className="w-5 h-5 text-amber-500" />
                <div>
                  <span className="text-xs font-black block">Prophetic Hadith Companion</span>
                  <span className="text-[10px] text-gray-400">"Spread peaceful greetings, share nutritional food, and establish nightly salah prayers."</span>
                </div>
              </div>
            </div>
          </div>

        </div>
      )}

      {/* ALL MENU: POCKET TASBEEH SIMULATOR */}
      {activeSubView === "tasbeeh" && (
        <div className="space-y-5 text-center">
          <div className="flex items-center justify-between pb-1">
            <button 
              onClick={() => setActiveSubView("allMenu")}
              className="p-1 px-2.5 bg-slate-100 dark:bg-zinc-800 rounded-xl text-xs font-semibold hover:bg-slate-200"
            >
              ← Back
            </button>
            <span className="text-xs font-bold text-gray-450">Pocket Beads Counter</span>
            <button 
              onClick={() => setTasbeehCount(0)}
              className="p-1.5 rounded-xl bg-slate-100 dark:bg-zinc-800 text-gray-600 hover:text-black"
            >
              <RotateCcw className="w-4 h-4" />
            </button>
          </div>

          {/* Digital Screen Display style matching real electronic clicks */}
          <div className="bg-teal-950/10 border border-teal-800/30 rounded-3xl p-6.5 text-[#103E44] dark:text-teal-300">
            <span className="text-[10px] uppercase font-bold tracking-widest opacity-80 block mb-1">Electronic Tasbeeh</span>
            <div className="text-5xl font-black font-mono tracking-tight">
              {tasbeehCount}
            </div>
            <span className="text-[11px] font-semibold tracking-wide block mt-2 text-slate-500">
              Target: {tasbeehTarget} • Selected Phrase: "{tasbeehPhrase}"
            </span>
          </div>

          {/* Phrase select option */}
          <div className="grid grid-cols-2 gap-2">
            {tasbeehPhrases.map((tp, idx) => (
              <button
                key={idx}
                onClick={() => {
                  setTasbeehPhrase(tp.en);
                  setTasbeehCount(0);
                }}
                className={`p-2.5 rounded-xl text-[10.5px] font-bold text-center border transition-all cursor-pointer ${
                  tasbeehPhrase === tp.en
                    ? "bg-emerald-800 border-emerald-900 text-white shadow-sm"
                    : "bg-white border-slate-100 text-slate-800 hover:bg-slate-50 dark:bg-zinc-850 dark:border-zinc-800 dark:text-slate-200"
                }`}
              >
                <div dir="rtl" className="font-semibold block mb-0.5">{tp.ar}</div>
                <div className="opacity-70 text-[9px]">{tp.en}</div>
              </button>
            ))}
          </div>

          {/* Target selects */}
          <div className="flex gap-1.5 justify-center">
            {[33, 99, 100, 1000].map((trg) => (
              <button
                key={trg}
                onClick={() => {
                  setTasbeehTarget(trg);
                  setTasbeehCount(0);
                }}
                className={`px-3 py-1.5 rounded-lg text-xs font-bold ${
                  tasbeehTarget === trg
                    ? "bg-[#103E44] text-white"
                    : "bg-slate-100 text-slate-600 dark:bg-zinc-800"
                }`}
              >
                {trg} Target
              </button>
            ))}
          </div>

          {/* Big Clicking Ring Button */}
          <div className="py-6 flex justify-center">
            <motion.button
              whileTap={{ scale: 0.9 }}
              onClick={() => {
                setTasbeehCount((prev) => {
                  const nextCount = prev + 1;
                  if (nextCount === tasbeehTarget) {
                    alert(`Mashallah! You completed your daily target of ${tasbeehTarget} "${tasbeehPhrase}"!`);
                  }
                  return nextCount;
                });
              }}
              className="w-40 h-40 rounded-full bg-gradient-to-br from-[#103E44] to-[#1a2d48] border-8 border-amber-300 shadow-2xl flex flex-col items-center justify-center text-white cursor-pointer select-none"
            >
              <span className="text-sm font-bold tracking-widest uppercase">Click</span>
              <span className="text-[10px] text-amber-200 animate-pulse block mt-1 font-mono">Tap Bead ring</span>
            </motion.button>
          </div>

        </div>
      )}

      {/* ALL MENU: WUDU & PURIFICATION GUIDE */}
      {activeSubView === "wuduGuide" && (
        <div className="space-y-4">
          <div className="flex items-center justify-between pb-1">
            <button 
              onClick={() => setActiveSubView("allMenu")}
              className="p-1 px-2.5 bg-slate-100 dark:bg-zinc-800 rounded-xl text-xs font-semibold hover:bg-slate-200"
            >
              ← Back
            </button>
            <span className="text-xs font-bold text-gray-450">Ablution & Wudu Guide</span>
            <div className="w-6 h-6" />
          </div>

          <div className="bg-[#e6f4f5] dark:bg-teal-950/20 text-[#103E44] dark:text-teal-300 p-4 rounded-2xl text-[11.5px] leading-relaxed font-sans">
            <span className="font-bold block mb-1">Spiritual Sanctification:</span>
            "Wudu is half of cleanliness, washing cleanses worldly distractions and primes the believer for communication with their Creator."
          </div>

          {/* Step list instruction */}
          <div className="space-y-3">
            {[
              { step: 1, title: "Niyyah (Intention)", desc: "Silent clean declaration of purifying yourself in the heart before commencing wash." },
              { step: 2, title: "Washing Hands", desc: "Thoroughly rinse hands three times up to wrist, ensuring skin between fingers is clean." },
              { step: 3, title: "Rinse Mouth & Nose", desc: "Gargle water three times, then lightly draw water into nose and blow out cleanly." },
              { step: 4, title: "Washing Face", desc: "Rinse face completely three times from forehead to chin and ear to ear." },
              { step: 5, title: "Washing Forearms", desc: "Scrub right arm up past elbow three times, followed similarly with left forearm." },
              { step: 6, title: "Masaah of Head & Ears", desc: "Run wet fingers across hair, then swipe ear canals and back of ears once." },
              { step: 7, title: "Washing Feet", desc: "Scrub feet up to ankle three times, ensuring toes are thoroughly cleansed." }
            ].map((wd) => (
              <div key={wd.step} className="bg-white dark:bg-zinc-900 border border-gray-150 dark:border-zinc-800 p-3.5 rounded-2xl flex gap-3">
                <div className="w-7 h-7 rounded-lg bg-teal-50 dark:bg-teal-950/40 font-mono font-black text-xs text-teal-700 dark:text-teal-300 flex items-center justify-center shrink-0">
                  {wd.step}
                </div>
                <div>
                  <span className="text-xs font-black block text-slate-800 dark:text-gray-100">{wd.title}</span>
                  <p className="text-[10px] text-gray-450 mt-0.5 leading-relaxed">{wd.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* POPUP SUBVIEW: CHANGE IMAM OPTIONS */}
      {activeSubView === "imams" && (
        <div className="space-y-4">
          <div className="flex items-center justify-between pb-1">
            <button 
              onClick={() => setActiveSubView("dashboard")}
              className="p-1 px-2.5 bg-slate-100 dark:bg-zinc-800 rounded-xl text-xs font-semibold hover:bg-slate-200"
            >
              ← Back
            </button>
            <span className="text-xs font-bold text-gray-450">Choose Reciter Imam</span>
            <div className="w-6 h-6" />
          </div>

          <span className="text-xs font-semibold text-slate-500 block">
            Select Qari voice for automated calibrated Azan voice alerts:
          </span>

          <div className="space-y-2">
            {imamsList.map((im, idx) => {
              const isSelected = selectedImam.name === im.name;
              return (
                <div
                  key={idx}
                  onClick={() => {
                    setSelectedImam(im);
                    setActiveSubView("dashboard");
                  }}
                  className={`p-3 rounded-2xl border transition-all cursor-pointer flex items-center justify-between ${
                    isSelected
                      ? "bg-emerald-50 dark:bg-emerald-950/20 border-emerald-500 text-emerald-950 dark:text-emerald-300"
                      : "bg-white border-slate-150 dark:bg-zinc-900 dark:border-zinc-800 text-slate-800 hover:bg-slate-50 dark:text-slate-150"
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <img 
                      src={im.photo} 
                      alt={im.name} 
                      referrerPolicy="no-referrer"
                      className="w-10 h-10 rounded-full object-cover border" 
                    />
                    <div>
                      <span className="text-xs font-bold block">{im.name}</span>
                      <span className="text-[9px] text-slate-400 block">{im.title}</span>
                    </div>
                  </div>
                  {isSelected && (
                    <div className="w-5 h-5 rounded-full bg-emerald-600 text-white flex items-center justify-center">
                      <Check className="w-3 h-3" strokeWidth={3} />
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* SPICE OVERLAY: PRAYER COMPLETION OPTIONAL STATUS SHEET MATCHING IMAGE 9 */}
      <AnimatePresence>
        {activePrayerLog && (
          <>
            {/* Modal cover backdrop */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.4 }}
              exit={{ opacity: 0 }}
              onClick={() => setActivePrayerLog(null)}
              className="absolute inset-0 bg-black/50 z-45"
            />
            
            {/* Modal container sheet */}
            <motion.div
              initial={{ y: "100%" }}
              animate={{ y: 0 }}
              exit={{ y: "100%" }}
              transition={{ type: "spring", damping: 25 }}
              className="absolute bottom-0 left-0 right-0 bg-white dark:bg-zinc-900 border-t border-slate-100 dark:border-zinc-800 rounded-t-[32px] p-6.5 z-50 flex flex-col space-y-5 shadow-2xl"
            >
              {/* Top Drawer helper line */}
              <div className="w-12 h-1 bg-gray-200 dark:bg-zinc-800 rounded-full mx-auto" />
              
              {/* Header with Close X */}
              <div className="flex justify-between items-center">
                <div className="w-6 h-6" /> {/* spacer */}
                {/* Yellow dome logo icon */}
                <div className="w-12 h-12 rounded-full bg-yellow-50 dark:bg-yellow-950/20 flex items-center justify-center text-yellow-500">
                  <Sunset className="w-6.5 h-6.5" />
                </div>
                <button 
                  onClick={() => setActivePrayerLog(null)}
                  className="w-7 h-7 rounded-full bg-slate-50 dark:bg-zinc-800 flex items-center justify-center text-gray-450 cursor-pointer"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>

              {/* Question */}
              <div className="text-center space-y-1">
                <h4 className="text-sm font-bold text-slate-800 dark:text-gray-100">
                  How did you complete {activePrayerLog.name} today?
                </h4>
                <p className="text-[9.5px] uppercase font-mono tracking-widest text-slate-400">Time: {activePrayerLog.time}</p>
              </div>

              {/* Status checklist options from Image 9 */}
              <div className="space-y-2">
                {[
                  { id: "missed", label: "Not prayed", icon: "✕", color: "text-rose-500 bg-rose-50" },
                  { id: "late", label: "Late", icon: "⏱", color: "text-amber-500 bg-amber-50" },
                  { id: "completed", label: "On time", icon: "👤", color: "text-emerald-500 bg-emerald-50" },
                  { id: "jamaah", label: "In jamaah", icon: "👥", color: "text-teal-500 bg-teal-50" }
                ].map((opt) => {
                  const isCurSelected = tempLogStatus === opt.id;
                  return (
                    <button
                      key={opt.id}
                      onClick={() => setTempLogStatus(opt.id)}
                      className={`w-full p-3 rounded-2xl border transition-all cursor-pointer flex items-center justify-between ${
                        isCurSelected
                          ? "bg-slate-50 dark:bg-zinc-850 border-emerald-500 text-slate-900 dark:text-emerald-305"
                          : "bg-white border-slate-105 dark:bg-zinc-900 dark:border-zinc-800 text-slate-700 hover:bg-slate-50 dark:text-slate-150"
                      }`}
                    >
                      <div className="flex items-center gap-3">
                        <div className={`w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm ${opt.color}`}>
                          {opt.icon}
                        </div>
                        <span className="text-xs font-bold">{opt.label}</span>
                      </div>
                      
                      {/* Checkbox radio dot */}
                      <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center transition-all ${
                        isCurSelected ? "border-emerald-550 bg-emerald-500" : "border-slate-200"
                      }`}>
                        {isCurSelected && <div className="w-2 h-2 rounded-full bg-white" />}
                      </div>
                    </button>
                  );
                })}
              </div>

              {/* Glossy green Submit Button done */}
              <button
                onClick={() => {
                  onTogglePrayer(activePrayerLog.id, tempLogStatus);
                  setActivePrayerLog(null);
                }}
                className="w-full bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-3.5 rounded-2xl text-xs tracking-wider transition-all active:scale-95 shadow-md flex items-center justify-center gap-2 cursor-pointer"
              >
                Done
              </button>
            </motion.div>
          </>
        )}
      </AnimatePresence>

      {/* SHARE NOTIFICATION BANNER */}
      <AnimatePresence>
        {showShareNotification && (
          <motion.div
            initial={{ opacity: 0, y: -40 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -40 }}
            className="absolute top-2 left-6 right-6 z-55 bg-slate-900 text-white text-xs font-semibold rounded-xl p-3 text-center shadow-lg border border-white/10"
          >
            🤲 Prophetic daily quote reference copied to clipboard successfully!
          </motion.div>
        )}
      </AnimatePresence>

    </div>
  );
}
