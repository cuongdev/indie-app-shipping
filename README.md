# indie-app-shipping

**English** · [Tiếng Việt](README.vi.md)

[![Stars](https://img.shields.io/github/stars/cuongdev/indie-app-shipping?style=flat&logo=github)](https://github.com/cuongdev/indie-app-shipping/stargazers)
[![Forks](https://img.shields.io/github/forks/cuongdev/indie-app-shipping?style=flat&logo=github)](https://github.com/cuongdev/indie-app-shipping/network/members)
[![Issues](https://img.shields.io/github/issues/cuongdev/indie-app-shipping)](https://github.com/cuongdev/indie-app-shipping/issues)
[![License: MIT](https://img.shields.io/github/license/cuongdev/indie-app-shipping)](LICENSE)
[![Last commit](https://img.shields.io/github/last-commit/cuongdev/indie-app-shipping)](https://github.com/cuongdev/indie-app-shipping/commits/main)

> A solo/indie playbook for shipping small iOS/macOS & Android apps fast, testing real demand, and deepening only the apps that show signal.

This is an **agent skill / rules pack**, not an app. It teaches an AI coding agent the repeatable workflow for shipping small mobile apps: the standard app skeleton, store metadata & ASO, screenshots, Apple/Google compliance checklists, review notes, pricing, and the signal-based decision of which apps to invest in.

## What's inside

```
indie-app-shipping/            ← the skill folder (copy this into your agent)
├── SKILL.md                   ← orchestrator: strategy, workflow, decision rules
├── references/
│   ├── shared/                ← signal-metrics, pricing-monetization
│   ├── ios/                   ← skeleton, metadata, screenshots, review-guidelines, review-notes, macos
│   └── android/               ← skeleton, metadata-aso, screenshots, play-policies, submission
└── assets/                    ← fill-in legal templates (privacy policy, EULA, deletion page)
AGENTS.md                      ← cross-tool entry (Cursor / Gemini / Antigravity / Claude Code)
install.sh                     ← one-command installer for any agent above
```

The reference files are plain Markdown, so the **content is portable to any agent**. What differs per tool is only the *entry file* and *how it's loaded*.

## Multi-agent compatibility

| Tool | Format used | Where to put it | How it loads |
|---|---|---|---|
| **Claude Code** | Native skill | `~/.claude/skills/indie-app-shipping/` (global) or `<project>/.claude/skills/indie-app-shipping/` | Auto, matched by the `description` field |
| **Claude.ai / Cowork** | `.skill` upload | Settings → Capabilities → Skills | Auto, by description |
| **Google Antigravity** | Native skill (same `SKILL.md` format) | `.agents/skills/indie-app-shipping/` (workspace) or `~/.gemini/antigravity/skills/` (global) | Auto, by description |
| **Cursor** | `AGENTS.md` (or `.cursor/rules/*.mdc`) | repo root `AGENTS.md` | Read at session start |
| **Gemini CLI** | `AGENTS.md` (or `GEMINI.md`) | repo root `AGENTS.md`, or append to `~/.gemini/GEMINI.md` | Always in context |

> **Good news:** Claude and Antigravity use the *identical* skill format (`SKILL.md` + `references/` + `assets/`, loaded on demand by the description), so the skill folder is essentially drop-in for both. Cursor and Gemini use an always-on rules file — for them, `AGENTS.md` is the common standard and points to the same reference files.

## Install

**Quick install (recommended)** — the bundled `install.sh` copies the skill to the right place for your agent:

```bash
git clone https://github.com/cuongdev/indie-app-shipping.git
cd indie-app-shipping
chmod +x install.sh
./install.sh                  # interactive menu — pick your agent
# or non-interactive:
./install.sh claude           # Claude Code, global (~/.claude/skills)
./install.sh claude-project   # Claude Code, into a project you choose
./install.sh antigravity      # Antigravity, global
./install.sh antigravity-ws   # Antigravity, into a workspace (.agents/skills)
./install.sh cursor           # writes AGENTS.md (+ references) into a project
./install.sh gemini           # writes AGENTS.md (+ references) into a project
```

It asks before overwriting an existing install, and runs on macOS's default bash.

**Manual install** — if you'd rather copy by hand:

**Claude Code**
```bash
# global (available in every project)
git clone https://github.com/cuongdev/indie-app-shipping.git
cp -r indie-app-shipping/indie-app-shipping ~/.claude/skills/
# or per-project:
cp -r indie-app-shipping/indie-app-shipping <project>/.claude/skills/
```

**Claude.ai / Cowork** — package the skill folder and upload the `.skill` file under Settings → Capabilities → Skills. (You can repackage with Anthropic's `package_skill.py`, or zip the `indie-app-shipping/` folder and rename to `.skill`.)

**Antigravity**
```bash
# workspace
cp -r indie-app-shipping/indie-app-shipping <workspace>/.agents/skills/
# or global
cp -r indie-app-shipping/indie-app-shipping ~/.gemini/antigravity/skills/
```

**Cursor** — copy `AGENTS.md` to your project root. Cursor reads it automatically. (Optional: convert to a `.cursor/rules/indie-app-shipping.mdc` rule if you prefer Cursor's native rules.)

**Gemini CLI** — copy `AGENTS.md` to your project root, or append its contents to `~/.gemini/GEMINI.md` for a global rule. Keep `indie-app-shipping/references/**` alongside so the agent can open the detailed files.

## How to use it

Just work normally. When you say things like "scaffold a new reminder app", "write the App Store metadata for this", "check this against Play policy before I submit", or "should I keep investing in app X?", the agent pulls in the relevant part of the skill. You don't have to invoke it explicitly.

## Notes & disclaimer

- The templates in `assets/` are starting points, **not legal advice** — adapt to the data your app collects and to the laws that apply (e.g. Vietnam Decree 13/2023, GDPR). Keep store privacy declarations consistent with the app's real behavior.
- Store policies change. Verify time-sensitive gates (Play tester counts, Data safety questions, screenshot sizes, notarization tooling) in the consoles at submission time.

## License

MIT — see [LICENSE](LICENSE).

## Star History

If this playbook saves you time, a ⭐ helps others find it. The chart below tracks stars over time.

[![Star History Chart](https://api.star-history.com/svg?repos=cuongdev/indie-app-shipping&type=Date)](https://star-history.com/#cuongdev/indie-app-shipping&Date)
