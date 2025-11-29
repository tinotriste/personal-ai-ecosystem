# Creating Skills

**Estimated time: 15-30 minutes depending on complexity**

This guide shows you how to create custom skills for your personal AI ecosystem. Skills are reusable workflows your AI follows to accomplish specific tasks.

## When to Create a Skill

Create a skill when you:

- Repeat the same type of task regularly
- Want consistent output format every time
- Need a multi-step process followed reliably
- Want natural language to trigger a specific workflow

**Good skill candidates:**
- Morning planning routine
- Client update reports
- Recipe organisation
- Exercise logging
- Content creation workflow

**Not ideal for skills:**
- One-off tasks
- Simple questions
- Highly variable processes

## Understanding Skill Types

### Simple Skills

A single SKILL.md file with all instructions in one place.

**Use when:**
- Single focused capability
- Fewer than 200 lines of instruction
- No distinct sub-workflows

**Structure:**
```
.claude/skills/your-skill/
└── SKILL.md
```

**Examples:** weekly-review, brain-dump, meeting-notes

### Complex Skills

A SKILL.md file plus separate workflow files for different operations.

**Use when:**
- Multiple distinct operations
- Different paths based on situation
- More than 200 lines total
- Reusable sub-workflows

**Structure:**
```
.claude/skills/your-skill/
├── SKILL.md              # Main file with routing logic
└── workflows/
    ├── workflow-1.md     # First operation
    ├── workflow-2.md     # Second operation
    └── workflow-3.md     # Third operation
```

**Examples:** research, file-organizer

## Step 1: Plan Your Skill

Before writing, answer these questions:

1. **What does this skill accomplish?**
   Write a clear one-sentence description.

2. **What triggers this skill?**
   List 3-5 phrases someone might say to invoke it.

3. **What are the steps?**
   Outline the process from start to finish.

4. **What's the output?**
   Describe what the user receives when complete.

5. **Simple or complex?**
   Does it need separate workflow files?

## Step 2: Create the Skill Directory

```bash
mkdir .claude/skills/your-skill-name
```

Use lowercase with hyphens. Choose a descriptive name:
- `morning-planning` (clear purpose)
- `client-update` (specific domain)
- `exercise-log` (action focused)

## Step 3: Write SKILL.md

Create the main skill file:

```bash
touch .claude/skills/your-skill-name/SKILL.md
```

### SKILL.md Template

```yaml
---
name: your-skill-name
description: Clear description of what this skill does.
  USE WHEN user says 'trigger phrase 1', 'trigger phrase 2',
  'trigger phrase 3', or requests this type of help.
---

# Your Skill Name

## Purpose

One paragraph explaining what this skill accomplishes and who it helps.

## Quick Reference

| Input | Output | Time |
|-------|--------|------|
| What user provides | What they receive | Estimate |

## Process

### Step 1: [Name]
What to do in this step.

### Step 2: [Name]
What to do in this step.

### Step 3: [Name]
What to do in this step.

## Output Format

Describe or show the format of the final output.

## Example

Show a real example of the skill in action.

## Tips

- Helpful tip 1
- Helpful tip 2

## Related

- Links to related skills or features
```

### Example: Morning Planning Skill

```yaml
---
name: morning-planning
description: Guide through a focused morning planning routine.
  USE WHEN user says 'morning planning', 'plan my day',
  'what should I focus on today', or 'start my day'.
---

# Morning Planning

## Purpose

A 5-10 minute routine to set intentions and priorities for the day. Helps you start focused rather than reactive.

## Quick Reference

| Input | Output | Time |
|-------|--------|------|
| Yesterday's status, today's calendar | Prioritised task list with top 3 focus items | 5-10 min |

## Process

### Step 1: Review Yesterday
- Check work_status.md for what was accomplished
- Note any incomplete items that need attention
- Identify anything that surprised you

### Step 2: Check Today's Commitments
- Ask about meetings or appointments
- Note time blocks available for deep work
- Identify any deadlines

### Step 3: Set Today's Priorities
- Ask: "If you could only accomplish 3 things today, what would they be?"
- Challenge if priorities seem reactive rather than important
- Confirm the top 3 focus items

### Step 4: Plan the Day
- Suggest time blocks for top priorities
- Recommend when to handle lower-priority items
- Identify potential distractions to avoid

### Step 5: Capture in Work Status
- Update work_status.md with today's plan
- Note the date and top priorities

## Output Format

```markdown
## Today's Plan: [Date]

### Top 3 Priorities
1. [Most important task]
2. [Second priority]
3. [Third priority]

### Time Blocks
- 09:00-11:00: [Priority 1]
- 11:00-12:00: [Meetings/admin]
- 14:00-16:00: [Priority 2]

### Parking Lot
- [Items to address later]
```

## Example

**User:** "Plan my day"

**Response:**
"Good morning! Let's set you up for a focused day.

Looking at yesterday, you completed the client proposal and started the design review. The design review is still in progress.

What meetings or commitments do you have today?

[User responds]

Great. That leaves about 4 hours of focus time. If you could only accomplish 3 things today, what would they be?

[Continues through process...]"

## Tips

- Do this before checking email
- Be honest about what's realistically achievable
- Protect at least one 90-minute focus block

## Related

- [Weekly Review skill](../weekly-review/SKILL.md)
- [Brain Dump skill](../brain-dump/SKILL.md)
```

## Step 4: Add Workflow Files (Complex Skills Only)

If your skill needs separate workflows:

```bash
mkdir .claude/skills/your-skill-name/workflows
```

Create workflow files for each distinct operation:

```bash
touch .claude/skills/your-skill-name/workflows/operation-1.md
touch .claude/skills/your-skill-name/workflows/operation-2.md
```

### Workflow File Template

```markdown
# [Operation Name]

## When to Use

Describe when this specific workflow applies.

## Prerequisites

What must be true before running this workflow.

## Steps

### 1. [Step Name]
Detailed instructions.

### 2. [Step Name]
Detailed instructions.

## Output

What this workflow produces.

## Example

Show the workflow in action.
```

Update your main SKILL.md to reference workflows:

```markdown
## Workflows

| Workflow | Purpose | When to Use |
|----------|---------|-------------|
| operation-1.md | Description | Trigger condition |
| operation-2.md | Description | Trigger condition |
```

## Step 5: Test Your Skill

1. Start a new conversation with your AI
2. Use one of your trigger phrases
3. Verify:
   - Does the skill activate?
   - Does it follow the process correctly?
   - Is the output what you expected?

Try multiple trigger phrases to ensure they all work.

## Step 6: Iterate and Improve

After using your skill a few times:

- Add trigger phrases people actually use
- Refine steps that are unclear
- Improve the output format
- Add tips based on experience

## Using the Create-Skill Meta-Skill

For a guided experience, ask your AI:

```
"Create a skill for [description of what you want]"
```

This activates the built-in create-skill meta-skill, which walks you through:

1. Defining the skill's purpose
2. Identifying trigger phrases
3. Planning the process steps
4. Writing the SKILL.md file
5. Testing the skill

## Skill Naming Conventions

- **Lowercase with hyphens:** `morning-planning`, `client-update`
- **Descriptive:** `exercise-log` not `logger`
- **Action or domain focused:** `weekly-review`, `meeting-notes`
- **No prefixes:** Use generic names (not domain-specific prefixes)

## Tips for Effective Skills

### Clear Triggers

Include 3-5 natural phrases people would actually say:
```yaml
USE WHEN user says 'log my exercise', 'record workout',
'track exercise', 'add workout', or 'exercise entry'
```

### Consistent Output

Define exact output format so results are predictable and useful.

### Reasonable Scope

One skill should do one thing well. If it's getting complex, consider splitting into separate skills.

### Test with Real Use

The best improvements come from actually using the skill and noting what doesn't work.

## Related Guides

- [Adding Domains](./adding-domains.md) - Create domain-specific context
- [Customising Personality](./customising-personality.md) - Adjust AI communication
