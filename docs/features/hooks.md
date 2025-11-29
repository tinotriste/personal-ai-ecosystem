# Hooks

## Overview

Hooks are automated scripts that run in response to specific events in your AI sessions. They handle routine tasks automatically, ensuring your AI always has the right context and prompts at the right time.

You don't need to configure or manage hooks directly - they work in the background to enhance your experience.

## Quick Reference

| Hook | When It Runs | What It Does |
|------|--------------|--------------|
| Session Start | Beginning of each session | Injects current date/time, reminds AI of your domains |
| Load Context | Every message you send | Loads SYSTEM.md so your AI knows the context structure |
| Memory Reminder | Every message you send | Prompts your AI to update memory files as needed |
| Validate Dates | Every message you send | Checks date consistency in work_status.md |

## How Hooks Help You

### Session Start Hook

When you begin a new conversation, this hook:

- Tells your AI the current date and time
- Reminds your AI about your selected domains
- Sets the session context for personalised assistance

**Result:** Your AI starts each session knowing the day, date, and your areas of focus.

### Load Context Hook

On every message you send, this hook:

- Loads the SYSTEM.md file
- Ensures your AI understands how your context is organised
- Enables discovery of relevant information

**Result:** Your AI always knows where to find project briefings, memory files, and skills.

### Memory Reminder Hook

On every message you send, this hook:

- Reminds your AI to update work_status.md after completing tasks
- Checks if work_status.md is growing too large (warns at 700+ lines)
- Prompts your AI to capture learnings when appropriate

**Result:** Memory updates happen autonomously without you asking.

### Validate Dates Hook

On every message you send, this hook:

- Scans work_status.md for date entries
- Checks that weekday names match their dates (e.g., "Tuesday, 28 November" really is a Tuesday)
- Reports any mismatches for correction

**Result:** Your work history stays accurate and consistent.

## Platform Notes

- **macOS:** All hooks work fully
- **Linux/WSL:** Most hooks work; date validation uses different commands and may silently skip if incompatible

Hooks are designed to fail gracefully - if something doesn't work on your platform, your AI continues without interruption.

## Related Features

- [Memory](./memory.md) - Hooks help maintain your memory files
- [Skills](./skills.md) - Skills can be triggered by hooks
