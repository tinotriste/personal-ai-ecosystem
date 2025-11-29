# Skills

## Overview

Skills are reusable workflows that your AI assistant can activate to help with common tasks. Think of them as recipes your AI follows to accomplish specific goals efficiently and consistently.

When you ask your AI to do something that matches a skill, it automatically loads the relevant instructions and follows a proven process. This ensures consistent, high-quality results without you needing to explain the same things repeatedly.

Skills use the [progressive disclosure pattern](../concepts/progressive-disclosure.md) - they load only when needed, keeping your AI fast and focused.

## Quick Reference

| Skill | Purpose | How to Invoke |
|-------|---------|---------------|
| `weekly-review` | Guide through weekly reflection and planning | "Let's do a weekly review" |
| `brain-dump` | Capture scattered thoughts into organised actions | "I need to brain dump" |
| `meeting-notes` | Structured meeting capture with decisions and actions | "Take meeting notes" |
| `research` | Comprehensive research from quick facts to strategic analysis | "Research [topic]" |
| `file-organizer` | Domain-aware file organisation and cleanup | "Organise my downloads" |
| `create-skill` | Create new custom skills | "Create a skill for..." |

## Usage Examples

### Weekly Review
```
"Let's do my weekly review"
"Time for week reflection"
"Plan my week"
```

Your AI guides you through a structured reflection covering what you accomplished, what blocked you, and what to focus on next. Results integrate with your journal and work status files. Estimated time: 15-20 minutes.

### Brain Dump
```
"I need to brain dump"
"Let me get my thoughts out"
"Clear my head"
```

Your AI helps you capture scattered thoughts and organise them into next actions, reference material, and parking lot items. Categories can be sorted by domain, urgency, or type.

### Meeting Notes
```
"Take meeting notes for [meeting name]"
"Document this meeting"
"Capture meeting summary"
```

Your AI creates structured notes with attendees, agenda, key decisions, and action items with owners and due dates. Offers follow-up suggestions like email summaries.

### Research
```
"Research remote work productivity"
"Find information about [topic]"
"Do a competitive analysis on [market]"
```

Research has four modes based on your needs:

- **Quick Research** (2-5 min): Fast fact-finding for simple questions
- **Comprehensive Investigation** (5-15 min): Multi-query analysis for complex topics
- **Strategic Analysis** (10-30 min): Multi-perspective synthesis for decisions
- **Domain Research**: Context-aware research using your domain knowledge

### File Organiser
```
"Organise my Downloads folder"
"Clean up my desktop"
"Sort these files"
```

Your AI analyses the folder, identifies domain-relevant categories, finds duplicates, and proposes an organisation plan. The plan shows a dry-run first - no files move until you approve.

**Safety features:**
- Protected system folders never get modified
- Duplicate detection uses file hashing for accuracy
- Full operation logging enables rollback if needed

## How Skills Work

When you make a request, your AI:

1. **Detects the skill** - Recognises trigger phrases in your message
2. **Loads skill context** - Retrieves the skill's specific instructions
3. **Follows the workflow** - Executes steps according to the skill's design
4. **Updates memory** - Records relevant outcomes to your work status

This happens automatically - you don't need to explicitly invoke skills. Natural language works perfectly.

## Creating Custom Skills

You can create your own skills for workflows you repeat often. There are two patterns:

### Simple Skills (SKILL.md Only)

Use for single, focused capabilities that need fewer than 200 lines of instruction.

```
.claude/skills/your-skill/
└── SKILL.md
```

### Complex Skills (SKILL.md + workflows/)

Use when you have multiple discrete operations or different execution paths.

```
.claude/skills/your-skill/
├── SKILL.md           # Routing logic and core instructions
└── workflows/         # Discrete operations
    ├── workflow-1.md
    ├── workflow-2.md
    └── workflow-3.md
```

### SKILL.md Format

Every skill needs YAML frontmatter with trigger phrases:

```yaml
---
name: your-skill-name
description: Clear description of what this skill does.
  USE WHEN user says 'trigger phrase 1', 'trigger phrase 2',
  or requests this capability.
---

# Your Skill Name

## Purpose
What this skill accomplishes.

## Process
Step-by-step instructions your AI follows.

## Output
What the user receives when complete.
```

**Key elements:**

- **name**: Lowercase with hyphens (e.g., `weekly-review`, `file-organizer`)
- **description**: Must include "USE WHEN user says..." for automatic activation

### Creating a New Skill

The easiest way to create a skill is to ask your AI:

```
"Create a skill for [your workflow description]"
```

This activates the `create-skill` meta-skill, which guides you through:

1. Planning the skill structure
2. Defining trigger phrases
3. Writing the process steps
4. Testing the skill works

See the [Creating Skills guide](../guides/creating-skills.md) for detailed instructions.

## Token Efficiency

Skills achieve approximately 60x token efficiency compared to loading all context upfront:

| Loading Method | Tokens Used |
|----------------|-------------|
| Skill frontmatter only | ~50 tokens |
| Skill body when activated | ~300-500 tokens |
| Individual workflow when needed | ~300-800 tokens |

This efficiency means your AI stays fast and responsive, even during complex tasks.

## Related Features

- [Memory](./memory.md) - Skills integrate with your memory files
- [Hooks](./hooks.md) - Some hooks trigger skills automatically
- [Agents](./agents.md) - Agents use skills to perform specialised work
