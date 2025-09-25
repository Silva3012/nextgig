# NextGig (Phase 1)

NextGig is a Flutter prototype following clean architecture principles. It delivers a bottom navigation app with four core areas: Discover, Post, Insights, and Reputation Wallet, plus a top-right Profile entry. Styling uses a dark theme with green and orange accents.

## Features

- Discover: Swipe-style cards showing saved opportunity posts
- Post: Create a job/apprenticeship/mentorship post
  - Generate structured content via Gemini (AI) and preview before saving
  - Save locally with timestamps and author linkage
- Insights: Simple analytics (KPIs, weekly bars, skill demand, recent activity)
- Reputation Wallet: Placeholder (ID/CV upload CTA)
- Profile: Renders structured mock user data (business details, skills, education, reviews)

## Tech & Architecture

- Flutter (Material 3)
- Clean structure (layers):
  - `domain/` models and enums
  - `data/` repositories (e.g., SharedPreferences for posts, mock profile)
  - `services/` external services (Gemini)
  - `presentation/` UI pages and shell
- Local storage: SharedPreferences (JSON list `posts_v1`)
- AI: `google_generative_ai` (Gemini 1.5 Flash)

## Project Structure (key paths)

- `lib/core/theme/app_theme.dart` – dark theme, colors, rounded UI
- `lib/presentation/shell/main_shell.dart` – bottom navigation shell
- `lib/presentation/features/discover/discover_page.dart` – reads posts from local storage
- `lib/presentation/features/posting/posting_page.dart` – form → AI preview → save
- `lib/presentation/features/insights/insights_page.dart` – KPIs and mock analytics
- `lib/presentation/features/wallet/rep_wallet_page.dart` – reputation wallet placeholder
- `lib/presentation/features/profile/profile_page.dart` – mock profile rendering
- `lib/domain/posts/post_models.dart` – `Post`, `PostSuggestion`, `PostType`
- `lib/data/posts/post_repository.dart` – `SharedPrefsPostRepository`
- `lib/data/profile/profile_repository.dart` – `MockProfileRepository`
- `lib/services/gemini/gemini_service.dart` – Gemini integration and prompt

## Setup

1) Flutter version
- Tested with Flutter 3.24.x

2) Dependencies
```bash
flutter pub get
```

3) Gemini API key (optional but recommended)
- Run with dart-define:
```bash
flutter run --dart-define=GEMINI_API_KEY=YOUR_KEY
```
- Or for build:
```bash
flutter build apk --dart-define=GEMINI_API_KEY=YOUR_KEY
```

Without a key, the AI suggestion step falls back to a simple heuristic.

## Usage

- Post tab
  - Fill Title/Description (optionally Type, Location, Remote)
  - Tap “Generate with AI” to get a preview (edit fields before saving if desired)
  - Tap “Save Post” to store locally

- Discover tab
  - Shows your saved posts; swipe Accept/Reject to simulate matching

- Profile (top-right icon)
  - Displays mock `UserModel` info

## Data & Storage

- Posts are stored as JSON under SharedPreferences key `posts_v1`
- Model fields include authorId (from mock profile), timestamps, and AI metadata

## Roadmap (next)

- Edit-in-preview and delete post actions
- Filter/sort in Discover
- Real profile store; real wallet uploads
- Move to Hive/Isar for richer local DB
- Pagination and remote sync

## License

MIT (for prototype purposes)
