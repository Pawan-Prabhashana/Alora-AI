# Alora AI

Alora AI is a dementia companion app built with Flutter. It helps patients and
their carers with memories, routines, schedules, and reminders.

## Getting started

1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Fetch dependencies:

   ```bash
   flutter pub get
   ```

3. Create a local `.env` file from the template and fill in your keys:

   ```bash
   cp .env.example .env
   ```

   | Key | Description |
   | --- | --- |
   | `GEMINI_API_KEY` | API key for Google Gemini. |
   | `OPEN_WEATHER_MAP_API_KEY` | API key for OpenWeatherMap. |

4. Run the app on a connected device or emulator:

   ```bash
   flutter run
   ```

## Project structure

- `lib/` — Dart application code.
- `android/`, `ios/`, `web/`, `macos/`, `linux/`, `windows/` — platform projects.

## Notes

- The real `.env` file is ignored by git and must never be committed.
