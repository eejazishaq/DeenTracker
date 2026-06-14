# Architecture Guide

## Project Type

Flutter Local-First Application

## Principles

- Offline First
- Feature Driven
- Clean Architecture
- SOLID
- Testable

## Source of Truth

UI Source:
Google Stitch Export Folder

Business Logic:
Flutter Project

Cursor must NEVER redesign screens.

Cursor should implement the Stitch UI exactly.

## Folder Structure

lib/

core/
shared/

features/

dashboard/
prayers/
habits/
analytics/
calendar/
qibla/
settings/

## State Management

Riverpod only.

No Bloc.
No GetX.

## Navigation

GoRouter

## Data Flow

UI
→ Provider
→ UseCase
→ Repository
→ Isar

## Services

PrayerCalculationService

NotificationService

QiblaService

AnalyticsService

HijriCalendarService