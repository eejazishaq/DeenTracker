/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React from "react";
import { Sparkles, Palette, FileText, Smartphone, Code, Heart } from "lucide-react";

export default function DesignSystemView() {
  return (
    <div className="space-y-6 pb-20 text-left">
      {/* Header */}
      <div className="boundary-card">
        <span className="px-2.5 py-0.5 rounded-full bg-amber-50 border border-amber-250 text-[10px] text-amber-705 font-semibold font-mono uppercase tracking-wider">
          Specification sheet
        </span>
        <h2 className="text-2xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100 flex items-center gap-2 mt-1">
          <Palette className="w-6 h-6 text-emerald-700" />
          <span>Flutter Spec Sheet & Design System</span>
        </h2>
        <p className="text-xs text-gray-500 dark:text-gray-400 mt-1">
          A blueprint detailing DeenTrack's design tokens, Material 3 configurations, and mathematical calculations suitable for Flutter implementation.
        </p>
      </div>

      {/* 1. Color Palette Chips */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-805 p-5 rounded-3xl space-y-4">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider font-mono">
          1. Dynamic Material 3 Colors
        </h3>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
          <div className="p-3 border rounded-2xl flex flex-col items-center space-y-2 text-center bg-ivory-50 dark:bg-zinc-850">
            <div className="w-10 h-10 rounded-xl bg-[#0D5C3A] border border-[#0B4C30]" />
            <div>
              <span className="text-xs font-bold block text-gray-900 dark:text-gray-100">Deep Emerald</span>
              <span className="text-[10px] text-gray-450 font-mono">#0D5C3A (Primary)</span>
            </div>
          </div>

          <div className="p-3 border rounded-2xl flex flex-col items-center space-y-2 text-center bg-ivory-50 dark:bg-zinc-850">
            <div className="w-10 h-10 rounded-xl bg-[#D4AF37] border border-[#C5A059]" />
            <div>
              <span className="text-xs font-bold block text-gray-900 dark:text-gray-100">Warm Gold</span>
              <span className="text-[10px] text-gray-450 font-mono">#D4AF37 (Secondary)</span>
            </div>
          </div>

          <div className="p-3 border rounded-2xl flex flex-col items-center space-y-2 text-center bg-ivory-50 dark:bg-zinc-850">
            <div className="w-10 h-10 rounded-xl bg-[#FAF9F6] border border-gray-200" />
            <div>
              <span className="text-xs font-bold block text-gray-900 dark:text-gray-100">Soft Ivory</span>
              <span className="text-[10px] text-gray-450 font-mono">#FAF9F6 (Background)</span>
            </div>
          </div>

          <div className="p-3 border rounded-2xl flex flex-col items-center space-y-2 text-center bg-ivory-50 dark:bg-zinc-850">
            <div className="w-10 h-10 rounded-xl bg-[#121212] border border-zinc-800" />
            <div>
              <span className="text-xs font-bold block text-gray-900 dark:text-gray-100">Charcoal Dark</span>
              <span className="text-[10px] text-gray-450 font-mono">#121212 (Dark BG)</span>
            </div>
          </div>

          <div className="p-3 border rounded-2xl flex flex-col items-center space-y-2 text-center bg-ivory-50 dark:bg-zinc-850">
            <div className="w-10 h-10 rounded-xl bg-[#2E7D32] border border-green-700" />
            <div>
              <span className="text-xs font-bold block text-gray-900 dark:text-gray-100">Muted Green</span>
              <span className="text-[10px] text-gray-450 font-mono">#2E7D32 (Success)</span>
            </div>
          </div>

          <div className="p-3 border rounded-2xl flex flex-col items-center space-y-2 text-center bg-ivory-50 dark:bg-zinc-850">
            <div className="w-10 h-10 rounded-xl bg-[#D84315] border border-orange-850" />
            <div>
              <span className="text-xs font-bold block text-gray-900 dark:text-gray-100">Muted Red</span>
              <span className="text-[10px] text-gray-450 font-mono">#D84315 (Error)</span>
            </div>
          </div>
        </div>
      </div>

      {/* 2. Typographic Scales */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-805 p-5 rounded-3xl space-y-4">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider font-mono">
          2. Typographic Scaling & Weights
        </h3>
        <div className="space-y-3.5 divide-y divide-gray-50 dark:divide-zinc-805">
          <div className="pt-2">
            <span className="text-[10px] text-emerald-805 font-mono uppercase block">Display Large / prayer names (36px, Bold)</span>
            <span className="text-3xl font-bold tracking-tight text-gray-900 dark:text-zinc-100 font-sans">
              Maghrib الظهر
            </span>
          </div>

          <div className="pt-3.5">
            <span className="text-[10px] text-emerald-805 font-mono uppercase block">Countdown Metrics (24px, Black)</span>
            <span className="text-2xl font-black font-mono text-zinc-900 dark:text-zinc-105">
              02:14:55
            </span>
          </div>

          <div className="pt-3.5">
            <span className="text-[10px] text-emerald-805 font-mono uppercase block font-semibold">Streak Count / progress indicators (18px, Medium)</span>
            <span className="text-lg font-medium text-amber-600 font-mono">
              12 days streak
            </span>
          </div>

          <div className="pt-3.5">
            <span className="text-[10px] text-emerald-805 font-mono uppercase block font-semibold">Body Copy / spiritual insights (14px, Regular)</span>
            <p className="text-sm text-gray-600 dark:text-gray-400 leading-relaxed font-sans">
              "Verily, with hardship, there is relief." (Surah Ash-Sharh 94:6) - Take simple, consistent steps to master daily prayer habits.
            </p>
          </div>
        </div>
      </div>

      {/* 3. Flutter Theme Builder Code snippets */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-805 p-5 rounded-3xl space-y-4">
        <div className="flex items-center gap-1.5 pb-2 border-b border-gray-50 dark:border-zinc-800">
          <Code className="w-4 h-4 text-emerald-700" />
          <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider font-mono">
            3. Flutter ThemeData Implementation Block
          </h3>
        </div>
        <pre className="text-[10px] p-4 bg-zinc-950 text-emerald-200 rounded-2xl overflow-x-auto font-mono leading-relaxed border border-zinc-900 text-left">
{`final ThemeData deenTrackLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0D5C3A),    // Deep Emerald Green
    secondary: Color(0xFFD4AF37),  // Warm Gold
    background: Color(0xFFFAF9F6), // Soft Ivory
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    error: Color(0xFFD84315),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w640, fontFamily: 'SpaceGrotesk'),
    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, fontFamily: 'Inter'),
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, fontFamily: 'JetBrainsMono'),
  ),
);`}
        </pre>
      </div>

      {/* 4. Mathematics & Formulas details */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-805 p-5 rounded-3xl space-y-4">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider font-mono pb-2 border-b border-gray-50">
          4. Mathematical Equations Utilized
        </h3>
        <div className="space-y-4 text-xs leading-relaxed text-gray-650">
          <div>
            <strong className="text-zinc-900 dark:text-zinc-200">A. Great Circle Distance (Haversine formula to Kaaba):</strong>
            <p className="font-mono text-[10px] bg-slate-50 dark:bg-zinc-850 p-2.5 rounded-xl border border-slate-100 dark:border-zinc-800 text-zinc-700 dark:text-zinc-300 mt-1">
              {`dLat = lat2 - lat1\ndLon = lon2 - lon1\na = sin²(dLat/2) + cos(lat1)*cos(lat2)*sin²(dLon/2)\nc = 2 * atan2(√a, √(1-a))\nDistance = Earth's Radius (6371) * c`}
            </p>
          </div>

          <div>
            <strong className="text-zinc-900 dark:text-zinc-200">B. Spherical Trigonometry (Bearing Angle to Kaaba from True North):</strong>
            <p className="font-mono text-[10px] bg-slate-50 dark:bg-zinc-850 p-2.5 rounded-xl border border-slate-100 dark:border-zinc-800 text-zinc-700 dark:text-zinc-300 mt-1">
              {`y = sin(dLon) * cos(latKaaba)\nx = cos(lat1)*sin(latKaaba) - sin(lat1)*cos(latKaaba)*cos(dLon)\nbearing = atan2(y, x)\nQibla Angle = (bearing * 180 / π + 360) % 360`}
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
