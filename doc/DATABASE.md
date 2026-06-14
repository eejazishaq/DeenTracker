# Database Design

Database:
Isar

## UserSettings

id
themeMode
language
location
calculationMethod

## PrayerTime

id
date

fajr
sunrise
dhuhr
asr
maghrib
isha

## PrayerRecord

id
date

prayerName
status
notes

## Habit

id
title
description

targetFrequency
isDefault

## HabitRecord

id

habitId
date

completed

## NotificationSetting

id

prayerName
enabled
offsetMinutes
azanAudio
volume

## IslamicEvent

id

title
hijriDate
description