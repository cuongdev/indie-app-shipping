#!/usr/bin/env bash
# install.sh — install the indie-app-shipping skill into your AI coding agent.
# Works on macOS default bash 3.2 (no associative arrays, no ${x,,}).
#
# Usage:
#   ./install.sh                 # interactive menu
#   ./install.sh claude          # Claude Code, global  (~/.claude/skills)
#   ./install.sh claude-project  # Claude Code, a project (.claude/skills)
#   ./install.sh antigravity     # Antigravity, global  (~/.gemini/antigravity/skills)
#   ./install.sh antigravity-ws  # Antigravity, workspace (.agents/skills)
#   ./install.sh cursor          # Cursor   (AGENTS.md + refs into a project)
#   ./install.sh gemini          # Gemini CLI (AGENTS.md + refs into a project)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/indie-app-shipping"
AGENTS_SRC="$SCRIPT_DIR/AGENTS.md"
SKILL_NAME="indie-app-shipping"

say()  { printf "%s\n" "$1"; }
err()  { printf "Error: %s\n" "$1" >&2; }

# --- preflight ---------------------------------------------------------------
if [ ! -d "$SKILL_SRC" ]; then
  err "skill folder not found at $SKILL_SRC. Run this script from the repo root."
  exit 1
fi

# Ask for a project/workspace path; echoes the canonical path on stdout.
ask_path() {
  local prompt="$1" default="$2" reply
  printf "%s [%s]: " "$prompt" "$default" >&2
  read -r reply
  [ -z "$reply" ] && reply="$default"
  # expand a leading ~
  case "$reply" in "~"|"~/"*) reply="$HOME${reply#\~}";; esac
  mkdir -p "$reply" 2>/dev/null || { err "cannot create $reply"; return 1; }
  ( cd "$reply" && pwd )
}

# Copy the whole skill folder into <dest>/indie-app-shipping
install_skill() {
  local dest="$1" target
  mkdir -p "$dest" || { err "cannot create $dest"; return 1; }
  target="$dest/$SKILL_NAME"
  if [ -e "$target" ]; then
    printf "Existing install at %s — overwrite? [y/N]: " "$target"
    read -r ans
    case "$ans" in [yY]*) rm -rf "$target";; *) say "Skipped."; return 0;; esac
  fi
  cp -R "$SKILL_SRC" "$dest/" && say "✅ Installed skill to $target"
}

# Copy AGENTS.md (+ the skill folder so its reference paths resolve) into <proj>
install_agents() {
  local proj="$1"
  cp "$AGENTS_SRC" "$proj/AGENTS.md" && say "✅ Wrote $proj/AGENTS.md"
  if [ "$proj" != "$SCRIPT_DIR" ]; then
    if [ -e "$proj/$SKILL_NAME" ]; then
      printf "Existing %s/%s — overwrite? [y/N]: " "$proj" "$SKILL_NAME"
      read -r ans
      case "$ans" in [yY]*) rm -rf "$proj/$SKILL_NAME"; cp -R "$SKILL_SRC" "$proj/";; *) : ;; esac
    else
      cp -R "$SKILL_SRC" "$proj/"
    fi
    say "✅ Copied reference files to $proj/$SKILL_NAME (AGENTS.md points to them)"
  fi
}

do_install() {
  case "$1" in
    claude)
      install_skill "$HOME/.claude/skills" ;;
    claude-project)
      p="$(ask_path 'Project root' "$PWD")" || return 1
      install_skill "$p/.claude/skills" ;;
    antigravity)
      install_skill "$HOME/.gemini/antigravity/skills" ;;
    antigravity-ws)
      p="$(ask_path 'Workspace root' "$PWD")" || return 1
      install_skill "$p/.agents/skills" ;;
    cursor|gemini)
      p="$(ask_path 'Project root' "$PWD")" || return 1
      install_agents "$p"
      if [ "$1" = "gemini" ]; then
        say "Tip: for a GLOBAL Gemini rule instead, append AGENTS.md to ~/.gemini/GEMINI.md manually."
      fi ;;
    *)
      err "unknown target: $1"; return 1 ;;
  esac
}

# --- non-interactive ---------------------------------------------------------
if [ "$#" -ge 1 ]; then
  case "$1" in
    -h|--help)
      say "Usage: ./install.sh [target]"
      say "Targets: claude | claude-project | antigravity | antigravity-ws | cursor | gemini"
      say "No target = interactive menu."
      exit 0 ;;
  esac
  do_install "$1"; exit $?
fi

# --- interactive menu --------------------------------------------------------
say "Install indie-app-shipping into which agent?"
say "  1) Claude Code        — global   (~/.claude/skills)"
say "  2) Claude Code        — project  (.claude/skills)"
say "  3) Antigravity        — global   (~/.gemini/antigravity/skills)"
say "  4) Antigravity        — workspace(.agents/skills)"
say "  5) Cursor             — AGENTS.md in a project"
say "  6) Gemini CLI         — AGENTS.md in a project"
printf "Choice [1-6]: "
read -r choice
case "$choice" in
  1) do_install claude ;;
  2) do_install claude-project ;;
  3) do_install antigravity ;;
  4) do_install antigravity-ws ;;
  5) do_install cursor ;;
  6) do_install gemini ;;
  *) err "invalid choice"; exit 1 ;;
esac
