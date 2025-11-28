---
name: meeting-notes
description: Structured meeting capture with attendees, agenda, discussion points, decisions, and action items. USE WHEN user says 'meeting notes', 'capture meeting', 'document meeting', 'meeting summary', 'take notes for meeting', or needs to record meeting outcomes.
---

# Meeting Notes

## When to Activate This Skill
- "Take meeting notes"
- "Capture this meeting"
- "Document meeting"
- "Meeting summary needed"
- "I just had a meeting about..."
- "Let me tell you what we discussed"
- User needs to record meeting outcomes
- Post-meeting documentation required

## Purpose

Create structured meeting documentation that captures:
- Who attended
- What was discussed
- What was decided
- What actions were agreed
- What follow-up is needed

## Core Workflow

### Step 1: Gather Meeting Details

**Prompt for basic information:**

- **Meeting title/topic**: What was this meeting about?
- **Date and time**: When did it take place?
- **Attendees**: Who was there?
- **Meeting type**: Regular sync, decision meeting, brainstorm, etc.

### Step 2: Capture Agenda/Topics

**Ask what was discussed:**

- What topics were covered?
- Was there a formal agenda?
- Any topics that weren't planned but came up?

### Step 3: Document Discussion Points

**For each agenda item, capture:**

- Key points raised
- Different perspectives shared
- Important information presented
- Questions asked and answered

### Step 4: Record Decisions

**Identify decisions made:**

- What was decided?
- Who made or approved the decision?
- Any conditions or caveats?
- What led to this decision?

### Step 5: Capture Action Items

**For each action item, clarify:**

- **What**: Specific action to be taken
- **Who**: Person responsible (owner)
- **When**: Due date or timeframe
- **Notes**: Any context or dependencies

### Step 6: Note Follow-Ups

**Identify what comes next:**

- Next meeting scheduled?
- Follow-up communications needed?
- Reviews or check-ins planned?
- Escalations required?

## Output Format

Present meeting notes as:

```
MEETING NOTES

---

MEETING DETAILS

Title: [Meeting Topic]
Date: [YYYY-MM-DD]
Time: [HH:MM - HH:MM]
Attendees: [Names, comma-separated]
Note Taker: [Name or "AI-assisted"]

---

AGENDA

1. [Topic 1]
2. [Topic 2]
3. [Topic 3]

---

DISCUSSION SUMMARY

Topic 1: [Title]
- [Key point 1]
- [Key point 2]
- [Question raised and answer]

Topic 2: [Title]
- [Key point 1]
- [Different perspective shared]

Topic 3: [Title]
- [Key point 1]

---

DECISIONS MADE

1. [Decision 1]
   - Decided by: [Name/Group]
   - Context: [Brief explanation]

2. [Decision 2]
   - Decided by: [Name/Group]

---

ACTION ITEMS

| # | Action | Owner | Due Date | Status |
|---|--------|-------|----------|--------|
| 1 | [Action description] | [Name] | [Date] | Open |
| 2 | [Action description] | [Name] | [Date] | Open |
| 3 | [Action description] | [Name] | [Date] | Open |

---

FOLLOW-UP

- Next meeting: [Date/Time or TBD]
- Communications: [Any emails/messages to send]
- Reviews: [Any reviews scheduled]

---

NOTES

[Any additional context, parking lot items, or observations]
```

## Meeting Types

### Regular Sync/Check-in
Focus on:
- Progress updates
- Blockers and support needed
- Upcoming priorities

### Decision Meeting
Focus on:
- Options presented
- Criteria used
- Final decision and rationale
- Next steps

### Brainstorm/Workshop
Focus on:
- Ideas generated
- Groupings and themes
- Prioritisation results
- Actions to explore further

### Project Kick-off
Focus on:
- Goals and objectives
- Scope and timeline
- Roles and responsibilities
- Communication plan

### Retrospective/Review
Focus on:
- What went well
- What could improve
- Lessons learned
- Changes to implement

## Key Principles

1. **Capture decisions and actions, not everything said** - Focus on outcomes
2. **Assign clear owners** - Every action needs someone responsible
3. **Include due dates** - Actions without dates rarely happen
4. **Note the "why"** - Context helps future reference
5. **Share promptly** - Notes are most useful when fresh

## Follow-Up Suggestions

After capturing notes:

**Immediate (within 24 hours):**
- Share notes with attendees
- Create calendar entries for follow-up meetings
- Set reminders for action item deadlines

**Communication options:**
- Generate email summary for distribution
- Create shorter executive summary version
- Highlight action items per person

**Integration:**
- Update project documentation
- Add decisions to decision log
- Track action items in task management

## Email Summary Template

For sharing meeting notes via email:

```
Subject: Meeting Notes - [Topic] - [Date]

Hi [Attendees],

Here's a summary of our meeting on [Topic].

KEY DECISIONS:
- [Decision 1]
- [Decision 2]

ACTION ITEMS:
- [Name]: [Action] (Due: [Date])
- [Name]: [Action] (Due: [Date])

NEXT STEPS:
- [Next meeting/follow-up]

Full notes attached/below.

Thanks,
[Your name]
```

## Quality Checklist

Before completing notes:
- [ ] All attendees listed
- [ ] Agenda/topics captured
- [ ] Key discussion points documented
- [ ] All decisions recorded with context
- [ ] Action items have owners and due dates
- [ ] Follow-up steps identified
- [ ] Notes ready to share with attendees

## Customisation Options

**Quick Notes** (5 minutes):
- Attendees
- Key decisions
- Action items only

**Comprehensive Notes** (15 minutes):
- Full discussion summary
- All sections completed
- Detailed context captured

**Formal Minutes**:
- Motion/second format for decisions
- Voting records
- Official approval workflow
