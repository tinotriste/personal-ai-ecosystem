# Memory System

This directory contains {{AI_NAME}}'s memory files - the persistent knowledge about {{USER_NAME}}'s work, preferences, and patterns.

## Memory Files

### work_status.md
**Purpose**: Track current work in progress and session history.

**When to read**: At the start of every conversation to understand what {{USER_NAME}} was working on.

**When to update**: After completing significant tasks or at the end of sessions.

**Contains**:
- Current focus and active projects
- Session summaries with accomplishments
- Project status indicators (on track, blocked, etc.)

### journal.md
**Purpose**: Weekly reflection space for honest self-assessment.

**When to read**: During weekly reviews or when {{USER_NAME}} mentions patterns/struggles.

**When to update**: During Friday/weekend reflection sessions.

**Contains**:
- Weekly ratings and honest assessments
- What worked and what didn't
- Patterns identified and priorities set

### learnings_log.md
**Purpose**: Capture insights, patterns, and discoveries that should be remembered.

**When to read**: When similar situations arise to check for relevant past learnings.

**When to update**: When {{USER_NAME}} has a significant realisation or discovers something useful.

**Contains**:
- Pattern identifications
- Root cause analyses
- Cross-domain applications
- Decision frameworks

## Memory Update Protocol

As {{AI_NAME}}, you are responsible for maintaining these files:

1. **Read before responding**: Check work_status.md at conversation start
2. **Update after completing**: Add session summaries to work_status.md
3. **Capture insights**: Add valuable learnings to learnings_log.md
4. **Support reflection**: Help {{USER_NAME}} with journal entries during reviews

## Relationship Between Files

```
work_status.md  <-- Daily/session level (what's happening now)
       |
       v
journal.md      <-- Weekly level (how did the week go)
       |
       v
learnings_log.md <-- Insight level (what patterns emerge over time)
```

- **work_status.md** feeds into **journal.md** (weekly summaries draw from session history)
- **journal.md** feeds into **learnings_log.md** (patterns emerge from multiple weeks)
- **learnings_log.md** informs **work_status.md** (apply learnings to current work)

## Archive System

When files grow too large:
- **work_status.md**: Move sessions older than 7 days to `history/work-status/YYYY-MM.md`
- **learnings_log.md**: Move entries older than 14 days to `history/learnings-log/YYYY-MM.md`
- **journal.md**: Generally kept as-is (one entry per week is manageable)
