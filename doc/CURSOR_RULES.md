# Cursor Rules

Follow these rules strictly.

## Architecture

Use Clean Architecture.

Never place business logic inside UI widgets.

## State Management

Use Riverpod only.

## Navigation

Use GoRouter only.

## Database

Use Isar only.

## UI

Google Stitch export is the UI source of truth.

Do not redesign.

Do not replace components.

Do not introduce custom design systems.

## Code Quality

SOLID principles.

Small reusable widgets.

Feature-based structure.

## Naming

PascalCase

camelCase

snake_case files

## Testing

Write tests for:

UseCases

Repositories

Services

## Error Handling

Use Result pattern.

No silent failures.

## Async

Use AsyncValue from Riverpod.

## Documentation

Document all public classes.

## Performance

Avoid unnecessary rebuilds.

Prefer ConsumerWidget.

Use const constructors whenever possible.

## Localization

Prepare for:

English
Arabic

RTL support required.