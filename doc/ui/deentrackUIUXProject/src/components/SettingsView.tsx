/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React from "react";
import { AppSettings } from "../types";
import { 
  Globe, 
  MapPin, 
  BookOpen, 
  Volume2, 
  Moon, 
  Sun, 
  Download, 
  Languages, 
  Type, 
  Info, 
  ShieldAlert,
  Sliders,
  Check,
  Smartphone
} from "lucide-react";
import { LOCATIONS_PRESET, CALCULATION_METHODS, calculateQiblaBearing } from "../utils/islamicUtils";

interface SettingsViewProps {
  settings: AppSettings;
  onChangeSettings: (updates: Partial<AppSettings>) => void;
}

export default function SettingsView({
  settings,
  onChangeSettings,
}: SettingsViewProps) {
  const isAr = settings.language === "en" ? false : true;

  const handleLocationPresetChange = (name: string) => {
    const preset = LOCATIONS_PRESET.find((p) => p.name === name);
    if (preset) {
      onChangeSettings({
         locationName: preset.name,
         latitude: preset.lat,
         longitude: preset.lon
      });
    }
  };

  const textSizes = [
    { id: "normal", label: "Normal", desc: "Standard text size" },
    { id: "large", label: "Large", desc: "For improved legibility" },
    { id: "extra-large", label: "Extra Large", desc: "High accessibility scale" },
  ];

  return (
    <div className="space-y-6 pb-20 text-left">
      {/* Header */}
      <div className="boundary-card">
        <h2 className="text-2xl font-bold tracking-tight text-emerald-950 dark:text-emerald-100 flex items-center gap-2">
          <span>{isAr ? "الإعدادات والتفضيلات" : "Preferences"}</span>
        </h2>
        <p className="text-xs text-gray-500 dark:text-gray-400 mt-1">
          {isAr 
            ? "اضبط طريقة الحساب، والموقع الجغرافي، وحجم الخط، واللغات، ومظهر التطبيق."
            : "Adjust calculation methods, simulated geolocation, text accessibility, Azan notification volumes, and language formats."}
        </p>
      </div>

      {/* Settings Group 1: Theme & Appearance */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 rounded-3xl p-5 space-y-4 shadow-sm">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider flex items-center gap-1.5 pb-2 border-b border-slate-50 dark:border-zinc-805/45">
          <Moon className="w-4.5 h-4.5 text-indigo-500" />
          <span>Appearance & Palette</span>
        </h3>

        {/* Theme select */}
        <div className="flex items-center justify-between">
          <div>
            <span className="font-semibold text-sm text-gray-900 dark:text-gray-100">
              {isAr ? "مظهر التطبيق الداكن" : "Dark Theme"}
            </span>
            <span className="text-[10px] text-gray-450 block">Charcoal grids & elevated card structures</span>
          </div>
          <div className="flex gap-1.5 p-1 bg-slate-50 dark:bg-zinc-850 rounded-xl border border-slate-100 dark:border-zinc-800">
            <button
              onClick={() => onChangeSettings({ theme: "light" })}
              className={`py-1.5 px-3 rounded-lg text-xs font-semibold cursor-pointer transition-all flex items-center gap-1 ${
                settings.theme === "light"
                  ? "bg-white dark:bg-zinc-800 text-emerald-800 dark:text-white shadow-sm"
                  : "text-gray-450"
              }`}
            >
              <Sun className="w-3.5 h-3.5 text-amber-500" />
              <span>Light</span>
            </button>
            <button
              onClick={() => onChangeSettings({ theme: "dark" })}
              className={`py-1.5 px-3 rounded-lg text-xs font-semibold cursor-pointer transition-all flex items-center gap-1 ${
                settings.theme === "dark"
                  ? "bg-white dark:bg-zinc-800 text-emerald-300 dark:text-white shadow-sm"
                  : "text-gray-450"
              }`}
            >
              <Moon className="w-3.5 h-3.5 text-indigo-400" />
              <span>Dark</span>
            </button>
          </div>
        </div>

        {/* Text Accessibility size toggle */}
        <div className="space-y-2 pt-2">
          <span className="font-semibold text-sm text-gray-900 dark:text-gray-100 block">
            {isAr ? "حجم الخط وإمكانية الوصول" : "Accessible Text Scaling"}
          </span>
          <div className="grid grid-cols-3 gap-1.5">
            {textSizes.map((ts) => (
              <button
                key={ts.id}
                onClick={() => onChangeSettings({ textSize: ts.id as any })}
                className={`py-2 px-1 text-center rounded-xl text-xs font-semibold border transition-all cursor-pointer ${
                  settings.textSize === ts.id
                    ? "bg-slate-900 border-black text-white dark:bg-white dark:border-white dark:text-zinc-950"
                    : "bg-white border-slate-100 text-gray-500 dark:bg-zinc-850 dark:border-zinc-800"
                }`}
              >
                {ts.label}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Settings Group 2: Geography & Calculation Methods */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 rounded-3xl p-5 space-y-4 shadow-sm">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider flex items-center gap-1.5 pb-2 border-b border-slate-50 dark:border-zinc-805/45">
          <MapPin className="w-4.5 h-4.5 text-emerald-500" />
          <span>Geography & Calculation</span>
        </h3>

        {/* Geolocation Select presets */}
        <div className="space-y-1.5">
          <label className="font-semibold text-sm text-gray-900 dark:text-gray-100 block">
            {isAr ? "الموقع الجغرافي المعاير" : "Simulated Location"}
          </label>
          <select
            value={settings.locationName}
            onChange={(e) => handleLocationPresetChange(e.target.value)}
            className="w-full text-xs p-3.5 border border-slate-150 rounded-2xl bg-slate-50 dark:bg-zinc-850 dark:border-zinc-800 focus:outline-none focus:ring-1 focus:ring-emerald-500 text-zinc-800 dark:text-zinc-150 cursor-pointer"
          >
            {LOCATIONS_PRESET.map((p) => (
              <option key={p.name} value={p.name}>
                {p.name} (Qibla: {Math.round(calculateQiblaBearing(p.lat, p.lon))}°)
              </option>
            ))}
          </select>
        </div>

        {/* Calculation Convention Select */}
        <div className="space-y-1.5">
          <label className="font-semibold text-sm text-gray-900 dark:text-gray-100 block">
            {isAr ? "طريقة حساب مواقيت الصلاة" : "Calculation Method"}
          </label>
          <select
            value={settings.calculationMethod}
            onChange={(e) => onChangeSettings({ calculationMethod: e.target.value })}
            className="w-full text-xs p-3.5 border border-slate-150 rounded-2xl bg-slate-50 dark:bg-zinc-850 dark:border-zinc-805 focus:outline-none focus:ring-1 focus:ring-emerald-500 text-zinc-800 dark:text-zinc-150 cursor-pointer"
          >
            {CALCULATION_METHODS.map((method) => (
              <option key={method} value={method}>
                {method}
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Settings Group 3: Language & Localization */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 rounded-3xl p-5 space-y-4 shadow-sm">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider flex items-center gap-1.5 pb-2 border-b border-slate-50 dark:border-zinc-805/45">
          <Globe className="w-4.5 h-4.5 text-blue-500" />
          <span>Language & Localisation</span>
        </h3>

        {/* Language select buttons */}
        <div className="flex items-center justify-between">
          <div>
            <span className="font-semibold text-sm text-gray-900 dark:text-gray-100 block">
              {isAr ? "لغة التطبيق الافتراضية" : "Application Language"}
            </span>
            <span className="text-[10px] text-gray-400">Toggle English / Arabic layouts directly</span>
          </div>
          <div className="flex gap-1 bg-slate-50 dark:bg-zinc-850 p-1 rounded-xl border border-slate-100 dark:border-zinc-800">
            <button
              onClick={() => onChangeSettings({ language: "en", rtlEnabled: false })}
              className={`py-1.5 px-3 rounded-lg text-xs font-semibold cursor-pointer ${
                settings.language === "en" ? "bg-white dark:bg-zinc-800 text-emerald-800 dark:text-white shadow-sm" : "text-gray-450"
              }`}
            >
              English
            </button>
            <button
              onClick={() => onChangeSettings({ language: "ar", rtlEnabled: true })}
              className={`py-1.5 px-3 rounded-lg text-xs font-semibold cursor-pointer ${
                settings.language === "ar" ? "bg-white dark:bg-zinc-800 text-emerald-800 dark:text-white shadow-sm" : "text-gray-450"
              }`}
            >
              العربية
            </button>
          </div>
        </div>

        {/* RTL Force toggle */}
        <div className="flex items-center justify-between">
          <div>
            <span className="font-semibold text-sm text-gray-900 dark:text-gray-100 block">
              {isAr ? "محاذاة من اليمين لليسار (RTL)" : "Force RTL Alignment"}
            </span>
            <span className="text-[10px] text-gray-400">Auto aligned with language selection</span>
          </div>
          <button
            onClick={() => onChangeSettings({ rtlEnabled: !settings.rtlEnabled })}
            className={`w-11 h-6 rounded-full p-0.5 transition-all cursor-pointer ${
              settings.rtlEnabled ? "bg-emerald-600" : "bg-gray-300"
            }`}
          >
            <div className={`w-5 h-5 bg-white rounded-full shadow-sm transform transition-all ${
              settings.rtlEnabled ? "translate-x-5" : "translate-x-0"
            }`} />
          </button>
        </div>
      </div>

      {/* Backup and restore */}
      <div className="bg-white dark:bg-zinc-900 border border-gray-100 dark:border-zinc-800 rounded-3xl p-5 space-y-4 shadow-sm">
        <h3 className="text-xs font-bold text-gray-400 uppercase tracking-wider flex items-center gap-1.5 pb-2 border-b border-slate-50 dark:border-zinc-805/45">
          <Download className="w-4.5 h-4.5 text-amber-500" />
          <span>Data Management</span>
        </h3>

        <div className="flex items-center justify-between">
          <div>
            <span className="font-semibold text-sm text-gray-900 dark:text-gray-100 block">
              Backup Tracking Records
            </span>
            <span className="text-[10px] text-gray-450 block">Export logs to JSON backups</span>
          </div>
          <button
            onClick={() => alert("Simulation: Your progress data has been compiled and saved locally!")}
            className="text-xs font-semibold py-2 px-3.5 border border-slate-100 rounded-xl dark:border-zinc-800 text-emerald-800 dark:text-emerald-400 font-sans cursor-pointer hover:bg-slate-50 dark:hover:bg-zinc-800"
          >
            Simulate Export
          </button>
        </div>
      </div>

      {/* About Box Metadata */}
      <div className="bg-slate-50/50 dark:bg-zinc-950/40 p-5 rounded-3xl space-y-3.5 border border-slate-100 dark:border-zinc-805/45">
        <div className="flex gap-2 items-center">
          <Info className="w-4 h-4 text-emerald-800 dark:text-emerald-400" />
          <h4 className="text-xs font-bold text-emerald-950 dark:text-emerald-100 uppercase tracking-wider">
            DeenTrack Core SDK
          </h4>
        </div>
        <p className="text-[10.5px] leading-relaxed text-gray-400 text-left">
          DeenTrack Islamic Habit Tracker is created as an elite, high-fidelity responsive companion that simulates prayer countdown equations, Qibla compass projections (Makkah Great-Circle trigonometry), Hijri schedules, and custom habit structures.
        </p>
        <div className="flex justify-between text-[10px] text-gray-400 pt-2 border-t border-slate-100/50 dark:border-zinc-800">
          <span>Engine Version 2.4.0</span>
          <span>Build: Flutter Blueprint Ready</span>
        </div>
      </div>
    </div>
  );
}
