---
name: brain-dump
description: Capture scattered thoughts and organise them into actionable items, reference material, and parking lot ideas. USE WHEN user says 'brain dump', 'dump my thoughts', 'clear my head', 'thought dump', 'get thoughts out', 'mental download', or needs to process scattered thinking.
---

# Brain Dump

## When to Activate This Skill
- "I need to do a brain dump"
- "Let me dump my thoughts"
- "Clear my head"
- "I have too many thoughts"
- "Get these thoughts out of my head"
- "Mental download"
- User seems overwhelmed with ideas
- User is processing scattered thinking

## Purpose

Help capture and organise scattered thoughts into:
- **Next Actions**: Concrete tasks to do
- **Reference Material**: Information to keep but not act on now
- **Parking Lot**: Ideas to revisit later

## Core Workflow

### Step 1: Capture Everything

**Prompt user to share all thoughts:**

"Let it all out - share every thought, idea, worry, or item bouncing around in your head. Don't filter or organise yet. I'll help sort through it all."

**Capture approach:**
- Write down everything the user shares
- Don't interrupt the flow
- Encourage complete download ("Anything else?")
- Note emotional context if relevant

### Step 2: Initial Categorisation

**Sort items into three buckets:**

**Next Actions** (Actionable items)
- Has a clear next step
- Can be done by the user
- Has some urgency or importance

**Reference Material** (Keep but don't act)
- Information worth remembering
- Background context
- Things to look up later
- Resources to bookmark

**Parking Lot** (Revisit later)
- Ideas not ready for action
- Things needing more thought
- Future possibilities
- Low priority items

### Step 3: Refine Next Actions

**For each actionable item, clarify:**
- What exactly is the next step?
- Is this a single task or a project (multiple steps)?
- What's the context (where/when can this be done)?
- Any deadline or urgency?

**Apply the two-minute rule:**
- If it takes less than 2 minutes, do it now
- Otherwise, add to action list

### Step 4: Further Organisation (Optional)

**Offer additional categorisation options:**

**By Domain** (if user has installed domains):
- Project A tasks
- Project B tasks
- Personal items
- Miscellaneous

**By Urgency**:
- Do today
- Do this week
- Do this month
- Someday/maybe

**By Type**:
- Tasks (things to do)
- Ideas (things to explore)
- Questions (things to answer)
- Concerns (things to address)

### Step 5: Integration

**Suggest updates to memory files:**
- Add tasks to `memory/work_status.md`
- Note insights in journal if significant
- Capture reference material appropriately

## Output Format

Present organised brain dump as:

```
BRAIN DUMP PROCESSED - [Date]

---

NEXT ACTIONS (X items)

High Priority:
- [ ] [Action 1] - [context/deadline if any]
- [ ] [Action 2]

Normal Priority:
- [ ] [Action 3]
- [ ] [Action 4]

Quick Wins (2-min tasks):
- [ ] [Quick action 1]
- [ ] [Quick action 2]

---

REFERENCE MATERIAL (Y items)

- [Information 1]
- [Information 2]
- [Resource to bookmark]

---

PARKING LOT (Z items)

Ideas to revisit:
- [Idea 1]
- [Idea 2]

Questions to explore:
- [Question 1]

Future possibilities:
- [Possibility 1]

---

SUGGESTED MEMORY UPDATES

Work Status:
- Add: [Task to track]

Journal:
- Note: [Insight worth capturing]

---

HEAD CLEAR? [Y/N]
```

## Memory Integration

**Files to reference:**
- `context/memory/work_status.md` - For adding captured tasks
- `context/memory/journal.md` - For significant insights

**Suggested updates:**
- Add actionable items to work status
- Capture important realisations in journal
- Note parking lot items for future review

## Categorisation Options

**Offer user choice of organisation approach:**

1. **GTD Style** (Getting Things Done)
   - Next Actions
   - Projects
   - Waiting For
   - Someday/Maybe
   - Reference

2. **Urgency Matrix**
   - Urgent + Important
   - Important + Not Urgent
   - Urgent + Not Important
   - Neither

3. **Domain-Based**
   - By project or area of life
   - By context (home/work/errands)
   - By energy level required

4. **Simple Three-Bucket**
   - Do
   - Delegate/Defer
   - Delete

## Key Principles

1. **Capture first, organise second** - Don't filter during the dump
2. **Clarify next actions** - Every task needs a concrete next step
3. **Honour the parking lot** - Not everything needs action now
4. **Check for completeness** - Ask "anything else?" before organising
5. **Integration matters** - Connect to existing systems and memory files

## Follow-Up Options

After brain dump complete:

**Immediate actions:**
- Process any 2-minute tasks now
- Schedule time for larger items
- Set reminders for deadlines

**Planning integration:**
- Add items to calendar if time-specific
- Update project lists
- Set up follow-up review

**Energy check:**
- How does user feel now?
- Head clearer?
- Anything still nagging?

## Variations

**Quick Brain Dump** (5 minutes):
- Rapid capture
- Three-bucket sort only
- No refinement

**Deep Brain Dump** (30 minutes):
- Complete capture with prompting
- Full categorisation
- Detailed action planning
- Memory file integration

**Themed Brain Dump**:
- Work-only thoughts
- Personal-only thoughts
- Specific project focus
- Worry/anxiety processing

## Quality Checklist

Before completing:
- [ ] All thoughts captured (user confirms nothing left)
- [ ] Items categorised into buckets
- [ ] Next actions have clear next steps
- [ ] Reference material organised
- [ ] Parking lot items noted
- [ ] Memory file updates suggested
- [ ] User feels mentally clearer
