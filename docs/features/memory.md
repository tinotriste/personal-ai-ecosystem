# Memory

## Overview

The memory system allows your AI assistant to remember information about you, your work, and your preferences across conversations. Rather than starting fresh each time, your AI maintains persistent knowledge in dedicated files.

This creates continuity - your AI picks up where you left off, understands your ongoing projects, and recognises patterns in how you work.

## Quick Reference

| File | Purpose | Update Frequency | Location |
|------|---------|------------------|----------|
| `work_status.md` | Current tasks and session history | After each session | `.claude/context/memory/` |
| `journal.md` | Weekly reflections and assessments | Weekly (usually Friday) | `.claude/context/memory/` |
| `learnings_log.md` | Long-term insights and patterns | When discoveries occur | `.claude/context/memory/` |

## Memory Files Explained

### work_status.md - Your Current State

This file tracks what's happening right now:

**What it contains:**
- Current focus and active projects
- Recent session summaries showing what was accomplished
- Project status indicators (on track, blocked, waiting, complete)
- Immediate next steps and priorities

**When your AI reads it:**
At the start of every conversation. This is how your AI knows where you left off and what you were working on.

**When it updates:**
After completing significant tasks or at the end of sessions. Your AI adds a brief summary of what was accomplished.

**Example entry:**
```markdown
## Session: Tuesday 28 November 2024

**Focus:** Documentation phase completion

**Completed:**
- Created all concept documentation (4 files)
- Created feature documentation (5 files)
- Updated README with documentation links

**Status:** On track

**Next:** Begin user guides tomorrow
```

### journal.md - Your Weekly Reflection

This file captures honest assessment of how your weeks go:

**What it contains:**
- Weekly ratings (productivity, energy, satisfaction)
- What worked well and what didn't
- Patterns noticed across the week
- Priorities set for the coming week

**When your AI reads it:**
During weekly reviews, or when you mention patterns, struggles, or want to reflect on how things are going.

**When it updates:**
During weekly review sessions, typically Friday or weekend. Your AI helps you reflect and captures the key points.

**Example entry:**
```markdown
## Week of 25 November 2024

**Rating:** 7/10

**What worked:**
- Morning focus blocks before meetings
- Breaking large tasks into smaller pieces

**What didn't:**
- Email checking became reactive mid-week
- Lost momentum on Thursday after context switching

**Pattern noticed:**
Best work happens in 90-minute focused blocks. Protecting these is essential.

**Next week priority:**
Block two 90-minute focus periods daily before accepting meetings.
```

### learnings_log.md - Your Growing Wisdom

This file records insights that should inform future decisions:

**What it contains:**
- Pattern identifications that emerge over time
- Root cause analyses from problems solved
- Cross-domain applications of insights
- Decision frameworks that work for you

**When your AI reads it:**
When similar situations arise, to check for relevant past learnings before suggesting an approach.

**When it updates:**
When significant realisations occur or useful discoveries are made. Not every session adds to this file - only genuine insights worth preserving.

**Example entry:**
```markdown
## 2024-11-20: Context Switching Cost

**Observation:**
Tracked productivity across two weeks. Days with 3+ context switches showed 40% less deep work completion than days with protected blocks.

**Root cause:**
Each switch requires ~23 minutes to fully re-engage. Three switches loses over an hour to transitions.

**Application:**
Batch similar tasks together. Theme days work better than variety days for deep work.

**Applies to:**
Work domain, personal projects, learning blocks
```

## How Memory Updates Work

Your AI manages memory autonomously through the memory reminder hook. After each significant interaction, your AI considers:

1. What was accomplished in this session?
2. What preferences or patterns were revealed?
3. Are there insights worth preserving long-term?

You don't need to ask your AI to remember things - it does so as part of its normal operation. However, you can also explicitly request updates:

```
"Update my work status with today's progress"
"Add this to my learnings log"
"Let's do a journal entry for this week"
```

## The Memory Hierarchy

The three files form a natural flow:

```
work_status.md  ─── Daily/session level
       │
       ▼
journal.md      ─── Weekly level
       │
       ▼
learnings_log.md ── Insight level (timeless)
```

**work_status.md** provides raw material for **journal.md** - your weekly reflection draws from what actually happened in sessions.

**journal.md** reveals patterns that become **learnings_log.md** entries - repeated observations across weeks become lasting insights.

**learnings_log.md** informs **work_status.md** - apply past learnings to current situations.

## Managing Memory Size

Over time, work_status.md can grow lengthy. When it exceeds 700 lines, your AI receives a prompt suggesting cleanup:

- Sessions older than 7 days can move to `history/work-status/YYYY-MM.md`
- Completed projects can be summarised and archived
- Active projects stay in the main file

This keeps your active memory focused while preserving history.

## Reading Your Memory Files

You can read your memory files directly - they're plain text markdown in `.claude/context/memory/`. This transparency means:

- You always know what your AI knows about you
- You can correct inaccuracies directly
- You can add context your AI might have missed

## Related Features

- [Skills](./skills.md) - Skills like weekly-review integrate with memory
- [Hooks](./hooks.md) - The memory reminder hook prompts updates
- [Memory Management concept](../concepts/memory-management.md) - Deeper explanation of the system
