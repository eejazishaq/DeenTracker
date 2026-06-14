/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState, useEffect } from "react";
import { AppSettings } from "../types";
import { Compass, Navigation, MapPin, Sparkle, RotateCw, Sparkles } from "lucide-react";
import { motion, AnimatePresence } from "motion/react";
import { calculateQiblaBearing, calculateDistanceToKaaba } from "../utils/islamicUtils";

interface QiblaViewProps {
  settings: AppSettings;
}

export default function QiblaView({ settings }: QiblaViewProps) {
  const isAr = settings.language === "ar";
  
  // Calculate relative angles
  const bearingAngle = calculateQiblaBearing(settings.latitude, settings.longitude);
  const distanceToKaaba = calculateDistanceToKaaba(settings.latitude, settings.longitude);

  // Manual compass alignment simulation
  const [usersHeading, setUsersHeading] = useState<number>(0);
  const [isAligned, setIsAligned] = useState<boolean>(false);

  // Check alignment
  useEffect(() => {
    // Diff between users rotating heading and true Qibla bearing
    const diff = Math.abs((usersHeading % 360) - bearingAngle);
    if (diff <= 5 || diff >= 355) {
      setIsAligned(true);
    } else {
      setIsAligned(false);
    }
  }, [usersHeading, bearingAngle]);

  const handleCompassRotateSlider = (e: React.ChangeEvent<HTMLInputElement>) => {
    setUsersHeading(parseInt(e.target.value));
  };

  const handlePickRandomAngle = () => {
    // Spin animation simulation
    let tickCount = 0;
    const interval = setInterval(() => {
      setUsersHeading((prev) => (prev + 35) % 360);
      tickCount++;
      if (tickCount > 10) {
        clearInterval(interval);
        setUsersHeading(Math.round(bearingAngle));
      }
    }, 60);
  };

  return (
    <div className="space-y-6 pb-20 text-center flex flex-col items-center">
      {/* View Header */}
      <div className="w-full text-left boundary-card">
        <h2 className="text-2xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100 flex items-center gap-2">
          <span>{isAr ? "محدد اتجاه القبلة" : "Qibla Finder"}</span>
        </h2>
        <p className="text-xs text-gray-500 dark:text-gray-400 mt-1">
          {isAr 
            ? "قم بمحاذاة هاتفك بذكاء نحو مصلى الكعبة المشرفة في مكة المكرمة."
            : "Rotate your simulated device to align perfectly with the Holy Kaaba in Makkah."}
        </p>
      </div>

      {/* Stats Board */}
      <div className="w-full grid grid-cols-2 gap-3">
        <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-4 rounded-2xl">
          <span className="text-[10px] text-gray-405 font-medium uppercase tracking-widest block">
            {isAr ? "الزاوية المحسوبة" : "Qibla Angle"}
          </span>
          <span className="text-2xl font-black font-mono text-zinc-900 dark:text-emerald-300">
            {Math.round(bearingAngle)}° N
          </span>
          <span className="text-[10px] text-gray-400 dark:text-gray-500 block mt-1 font-mono">
            {settings.locationName.split(",")[0]}
          </span>
        </div>

        <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 p-4 rounded-2xl">
          <span className="text-[10px] text-gray-405 font-medium uppercase tracking-widest block">
            {isAr ? "المسافة إلى مكة" : "Distance to Kaaba"}
          </span>
          <span className="text-2xl font-black font-mono text-zinc-900 dark:text-emerald-300">
            {distanceToKaaba.toLocaleString()} <span className="text-xs font-normal">km</span>
          </span>
          <span className="text-[10px] text-gray-400 dark:text-gray-500 block mt-1">
            Great Circle Route
          </span>
        </div>
      </div>

      {/* Main Beautiful Compass Stage */}
      <div className="relative w-68 h-68 my-4 flex items-center justify-center">
        {/* Glowing aura if aligned */}
        <AnimatePresence>
          {isAligned && (
            <motion.div
              initial={{ scale: 0.8, opacity: 0 }}
              animate={{ scale: 1.15, opacity: 1 }}
              exit={{ opacity: 0 }}
              className="absolute inset-0 rounded-full bg-emerald-500/10 dark:bg-emerald-400/15 blur-2xl pointer-events-none"
            />
          )}
        </AnimatePresence>

        {/* Outer Bearing ring */}
        <div className="absolute inset-2 rounded-full border-2 border-slate-100 dark:border-zinc-800 pointer-events-none" />
        
        {/* N-E-S-W indicators */}
        <div className="absolute inset-0 p-4 flex flex-col justify-between items-center pointer-events-none text-[10px] font-bold text-gray-450">
          <span>N</span>
          <div className="w-full flex justify-between absolute top-[52%] left-0 px-4 mt-[-6px]">
            <span>W</span>
            <span>E</span>
          </div>
          <span>S</span>
        </div>

        {/* Rotating Dial Frame */}
        <motion.div
          className="w-56 h-56 rounded-full border border-slate-100 dark:border-zinc-850 bg-white dark:bg-zinc-900 shadow-xl flex items-center justify-center relative cursor-pointer"
          style={{ transform: `rotate(${-usersHeading}deg)` }}
          animate={{ rotate: -usersHeading }}
          transition={{ type: "spring", stiffness: 100, damping: 20 }}
        >
          {/* Compass central dial tick */}
          <div className="absolute inset-0 rounded-full bg-[radial-gradient(ellipse_at_center,rgba(250,249,246,0.2)_0%,transparent_70%)] pointer-events-none" />

          {/* Golden Pointer heading to true North */}
          <div className="absolute top-1 w-1.5 h-6 bg-slate-300 rounded-full" />
          
          {/* TRUE QIBLA POINTER EMBEDDED IN DIAL */}
          <div 
            className="absolute inset-0 flex flex-col items-center justify-start pointer-events-none"
            style={{ transform: `rotate(${bearingAngle}deg)` }}
          >
            {/* Kaaba Mosque Vector Indicator */}
            <div className="absolute top-2 flex flex-col items-center">
              <div className="relative">
                <Navigation className="w-9 h-9 fill-emerald-600 stroke-emerald-700 dark:fill-emerald-400 dark:stroke-emerald-300" style={{ transform: "rotate(180deg)" }} />
                <span className="absolute top-3.5 left-2.5 text-white text-[8px] font-black">🕋</span>
              </div>
              <span className="text-[8.5px] font-extrabold uppercase text-emerald-800 dark:text-emerald-400 tracking-wider">
                QIBLA
              </span>
            </div>
          </div>

          {/* Compass Hub center */}
          <div className="w-10 h-10 rounded-full border border-slate-100 dark:border-zinc-800 bg-white dark:bg-zinc-900 shadow-md z-20 flex items-center justify-center">
            <div className={`w-3.5 h-3.5 rounded-full transition-all ${isAligned ? "bg-emerald-500 animate-ping" : "bg-gray-300"}`} />
            <div className={`absolute w-3 h-3 rounded-full transition-all ${isAligned ? "bg-emerald-500" : "bg-gray-300"}`} />
          </div>
        </motion.div>

        {/* Calibrated Angle label readout */}
        <div className="absolute bottom-[-16px] text-center z-30">
          <span className={`text-[11px] font-bold tracking-wider px-3 py-1 rounded-full border ${
            isAligned
              ? "bg-emerald-50 border-emerald-500 text-emerald-850 dark:bg-emerald-950/40 dark:border-emerald-700 dark:text-emerald-300 font-bold uppercase flex items-center gap-1.5 animate-bounce"
              : "bg-white border-slate-100 text-gray-500 dark:bg-zinc-800 dark:border-zinc-700"
          }`}>
            {isAligned && <Sparkles className="w-3.5 h-3.5 text-amber-500" />}
            {isAligned 
              ? (isAr ? "القبلة صحيحة" : "Aligned to Kaaba") 
              : `${usersHeading}° N`}
          </span>
        </div>
      </div>

      {/* Draggable Simulated Alignment Slider */}
      <div className="w-full pt-6 space-y-4">
        <div className="space-y-1">
          <label className="text-[11px] font-bold text-gray-500 uppercase tracking-widest flex items-center justify-center gap-1">
            <RotateCw className="w-3.5 h-3.5 text-amber-500" />
            <span>{isAr ? " تدوير الهاتف يدوياً" : "Simulate Phone Rotation"}</span>
          </label>
          <input
            type="range"
            min="0"
            max="360"
            value={usersHeading}
            onChange={handleCompassRotateSlider}
            className="w-full h-1 bg-gray-200 dark:bg-zinc-800 accent-emerald-600 rounded-lg cursor-pointer"
          />
          <span className="text-[10px] text-gray-400">
            Rotate slider to align compass needle with Kaaba pointer (at {Math.round(bearingAngle)}°)
          </span>
        </div>

        <button
          onClick={handlePickRandomAngle}
          className="text-xs font-semibold py-2 px-4 rounded-xl border border-gray-150 dark:border-zinc-800 text-zinc-700 dark:text-zinc-300 bg-white dark:bg-zinc-900 active:scale-95 transition-all cursor-pointer inline-flex items-center gap-1.5"
        >
          <Compass className="w-3.5 h-3.5" />
          <span>{isAr ? "معايرة وإصلاح الاتجاه بضغطة" : "Calibrate Compass"}</span>
        </button>
      </div>
    </div>
  );
}
