# AGENTS.md — Indie App Shipping

Cross-tool version of the **indie-app-shipping** playbook. This file is read by Cursor, Gemini CLI, and Antigravity (and Claude Code) at session start. Claude Code and Antigravity can alternatively load the richer native skill in `indie-app-shipping/SKILL.md` (same content, on-demand). The detailed checklists live as plain markdown under `indie-app-shipping/references/**` and templates under `indie-app-shipping/assets/**` — read the relevant file when you reach its step.

Use this whenever the user is shipping a small mobile app on iOS/macOS (App Store) or Android (Google Play): scaffolding app structure; wiring onboarding/settings/paywall/restore/legal screens; writing or reviewing store metadata; planning screenshots; running a pre-submission compliance check; writing review notes; setting up Play closed testing; handling a rejection; or deciding which shipped apps to invest in further. Trigger even when the user doesn't say "checklist."

## Strategic frame

Two ways to ship: (1) one or two deep apps, or (2) many small apps to test fast. This playbook is for path 2 — ship a clean minimal app, measure real users, deepen only what shows signal. The point of a v1 is **information, not perfection**. If the user is clearly resourced for path 1 on a specific app (real budget, real signal), say so and adjust.

The user works in Vietnamese — respond in Vietnamese unless they switch. Store Console fields and platform terms stay in English where that's the on-platform value.

## Platform selection (decide first)

- iOS / macOS → `indie-app-shipping/references/ios/`
- Android (Google Play) → `indie-app-shipping/references/android/`
- Both → read both; build one skeleton with a store-abstracting billing layer (RevenueCat wraps StoreKit 2 + Play Billing).

Key differences that change how you ship: iOS has a dedicated **keyword field**, Play has **none** (weave keywords into title/short/full description); StoreKit 2 vs Play Billing; privacy nutrition labels vs **Data safety form**; iOS in-app account deletion vs Play in-app **plus** a public web deletion URL; "Sign in with Apple" required on iOS if you offer social login (no Play equivalent); human App Review vs faster but stricter Play automation; new **personal** Play accounts must pass a **closed test (12 testers, 14 continuous days)** before production. **Which first?** Lead with the platform where your users and monetization live — Play for VN-market reach/volume, App Store for US-market revenue — then port winners.

## Workflow for a new app

1. Validate the need in one sentence: "This app helps [who] do [one thing]."
2. Pick platform(s); read the matching track.
3. Scaffold the standard skeleton — only the core feature is new. `<platform>/app-skeleton.md`.
4. Build the minimum that earns a verdict (ships, no serious bugs, clean-enough UI, basic monetization if it fits, passes review). Don't optimize early.
5. Choose monetization and price per market (VN vs US differ a lot). `references/shared/pricing-monetization.md`.
6. Prepare metadata. `ios/metadata.md` or `android/metadata-aso.md`. Legal templates in `indie-app-shipping/assets/`.
7. Produce store assets. `<platform>/screenshots.md`. macOS packaging differs — `ios/macos.md`.
8. Pre-submit compliance pass. `ios/review-guidelines.md` or `android/play-policies.md`.
9. Submission materials. `ios/review-notes.md` or `android/submission.md`.
10. Submit, then instrument for signal. `references/shared/signal-metrics.md`.

(Reference paths above are relative to `indie-app-shipping/references/`.)

## Decision framework: deepen or park

After data accrues, sort each app (full rules in `indie-app-shipping/references/shared/signal-metrics.md`):

- **Signal → deepen**: organic installs trending up without spend; D7 retention above your portfolio median; healthy IAP/trial conversion; concentrated market or qualitative pull. Then invest in UI/UX, Pro features, ASO, localization, ads, landing page, port to the other store.
- **No signal → park**: near-zero organic installs and retention after a fixed observation window. Light maintenance; log what it taught you. A parked app is a completed experiment, not a failure.

The solo dev's edge is speed of turning. "Short-term to fund long-term."

## On rejection

Identify the exact guideline/policy cited, fix the app, then add a line to the relevant `review-guidelines.md` / `play-policies.md` so it never recurs.

## Not legal advice

The templates in `indie-app-shipping/assets/` are starting points — adapt to the data your app collects and the laws that apply (Vietnam Decree 13/2023, GDPR for EU users), and keep store privacy declarations consistent with the app's real behavior. Store policies change; verify time-sensitive gates at submission time.
