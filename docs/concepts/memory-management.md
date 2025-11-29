# Memory Management

## What Is Memory Management?

Memory management is how your AI assistant maintains knowledge about you, your work, and your preferences across conversations. Unlike traditional AI chats that start fresh each time, your personal AI ecosystem includes dedicated memory files that persist between sessions.

Think of it as your AI keeping a thoughtful journal about your collaboration - noting what you're working on, what you've accomplished, and what patterns emerge over time.

## The Three Memory Files

Your AI manages three interconnected memory files, each serving a different purpose:

### work_status.md - What's Happening Now

This is your AI's short-term memory. It tracks:

- Current focus and active projects
- Recent session summaries
- Project status indicators (on track, blocked, waiting)
- Immediate next steps

**When it updates:** After completing significant tasks or at session end.

**When your AI reads it:** At the start of every conversation to pick up where you left off.

### journal.md - Weekly Reflection

This is your AI's medium-term memory. It captures:

- Weekly ratings and honest assessments
- What worked and what didn't
- Patterns emerging in your work
- Priorities for the coming week

**When it updates:** During weekly review sessions, typically Friday or weekend.

**When your AI reads it:** During weekly reviews or when you mention patterns or struggles.

### learnings_log.md - Lasting Insights

This is your AI's long-term memory. It records:

- Pattern identifications that emerge over time
- Root cause analyses from problems solved
- Cross-domain applications of insights
- Decision frameworks that work for you

**When it updates:** When significant realisations occur or useful discoveries are made.

**When your AI reads it:** When similar situations arise to check for relevant past learnings.

## How the Files Connect

The three memory files form a natural hierarchy:

```
work_status.md  (Daily/session level)
       |
       v
journal.md      (Weekly level)
       |
       v
learnings_log.md (Insight level)
```

Information flows upward over time:

- **work_status.md** feeds into **journal.md** - weekly summaries draw from session history
- **journal.md** feeds into **learnings_log.md** - patterns emerge from multiple weeks
- **learnings_log.md** informs **work_status.md** - apply learnings to current work

## Automatic Memory Updates

Your AI handles memory management autonomously. After each significant interaction, it considers:

1. What was accomplished?
2. What preferences or patterns were revealed?
3. What should be remembered for next time?

The memory reminder hook prompts these updates naturally, so you don't need to ask your AI to remember things - it does so as part of its normal operation.

## When Memory Files Grow Large

Over time, memory files can become lengthy. When work_status.md exceeds 700 lines, your AI receives a prompt suggesting cleanup. Older sessions can be archived to history files, keeping the active memory focused and efficient.

## Related Concepts

- [Progressive Disclosure](./progressive-disclosure.md) - How context loads on-demand
- [Context-First Design](./context-first-design.md) - Why context engineering matters
