# Skills

**Purpose**: Token-efficient capabilities using progressive disclosure pattern (60x efficiency vs. upfront context loading). Skills are the core automation layer for your personal AI ecosystem.

## Quick Reference

**Total Skills**: 6

| Skill | Type | Structure | Status |
|-------|------|-----------|--------|
| `create-skill` | Meta-tool | SKILL.md + workflows/ + templates/ | ACTIVE |
| `research` | Complex | SKILL.md + workflows/ | ACTIVE |
| `file-organizer` | Complex | SKILL.md + workflows/ | ACTIVE |
| `weekly-review` | Simple | SKILL.md only | ACTIVE |
| `brain-dump` | Simple | SKILL.md only | ACTIVE |
| `meeting-notes` | Simple | SKILL.md only | ACTIVE |

## When to Load This Context

Reference skills when:
- Building new progressive disclosure capabilities
- Understanding skill structure and patterns
- Creating token-efficient workflows
- Automating recurring analysis tasks

**Trigger**: Skills activate automatically from natural language or explicit invocation.

## Usage Patterns

Skill workflow:
1. User request triggers skill (detected by Claude)
2. Skill loads only required context (progressive disclosure)
3. Skill executes workflow with loaded context
4. Result returned, context discarded
5. **60x token efficiency** vs. loading all context upfront

## Directory Structure

### Simple Skill Pattern (SKILL.md Only)

**Use when:**
- Single focused capability
- Minimal context needed
- No discrete sub-workflows
- Less than 200 lines of instruction

```
.claude/skills/skill-name/
└── SKILL.md
```

**Examples**: `weekly-review`, `brain-dump`, `meeting-notes`

### Complex Skill Pattern (SKILL.md + workflows/)

**Use when:**
- Multiple discrete operations
- Different execution paths based on context
- Reusable sub-workflows
- More than 200 lines of total content

```
.claude/skills/skill-name/
├── SKILL.md                    # Routing logic + core instructions
└── workflows/                  # Discrete operations
    ├── workflow-1.md
    ├── workflow-2.md
    └── workflow-3.md
```

**Examples**: `research` (4 workflows), `file-organizer` (6 workflows)

## YAML Frontmatter Format

Every skill requires YAML frontmatter with explicit trigger phrases:

```yaml
---
name: skill-name
description: Clear description of what skill does and when to use.
  Include "USE WHEN" trigger phrases for natural language activation.
  USE WHEN user says 'trigger phrase 1', 'trigger phrase 2',
  or requests this capability.
---
```

**Key Elements:**
- `name`: Lowercase with hyphens (e.g., `weekly-review`, `file-organizer`)
- `description`: Include "USE WHEN user says..." for natural language routing

## Progressive Disclosure Pattern

**Tier 1 (YAML frontmatter)**: Always loaded (~50 tokens)
- Skill name
- Description with triggers

**Tier 2 (SKILL.md body)**: Loaded when skill activates (~500-1000 tokens)
- Quick reference instructions
- Workflow list (if complex skill)
- Core principles

**Tier 3 (workflows/)**: Loaded as needed per workflow (~300-800 tokens each)
- Detailed step-by-step instructions
- Examples and validation

**Result**: 60x token efficiency compared to loading all content upfront

## Naming Conventions

- **Lowercase with hyphens**: `create-skill`, `file-organizer`, `weekly-review`
- **Descriptive, not generic**: `file-organizer` not `organizer`
- **Action or domain focused**: `brain-dump`, `meeting-notes`
- **No prefix**: Skills use generic names (not domain-specific prefixes)

## Skill Descriptions

### create-skill (Meta-Skill)
**Status**: ACTIVE
**Purpose**: Framework for creating new skills efficiently
**Triggers**: "create skill", "build skill", "add skill", "structure skill", "update skill"
**Location**: `.claude/skills/create-skill/`
**Structure**: SKILL.md + workflows/ + templates/

**Key Features**:
- Skill creation workflow (planning, structure, content, testing)
- Progressive disclosure best practices
- Natural language routing (USE WHEN triggers)
- Quality checklists
- Simple and complex skill templates

### research
**Status**: ACTIVE
**Purpose**: Comprehensive research from quick fact-finding to strategic analysis
**Triggers**: "research", "investigate", "find information", "analyse [topic]", "competitive analysis", "market research"
**Location**: `.claude/skills/research/`
**Structure**: SKILL.md + 4 workflows

**Available Research Modes**:
- **Quick Research** (2-5 min): Fast fact-finding for simple questions
- **Comprehensive Investigation** (5-15 min): Multi-query analysis for complex topics
- **Strategic Analysis** (10-30 min): Multi-perspective synthesis for strategic decisions
- **Domain Research**: Context-aware routing for user's specific domains

**Note**: Enhanced multi-agent workflows available after Phase 6 (Agents).

### file-organizer
**Status**: ACTIVE
**Purpose**: Domain-aware file organisation and cleanup across any folder
**Triggers**: "organise files", "clean up [folder]", "sort downloads", "file chaos", "messy desktop"
**Location**: `.claude/skills/file-organizer/`
**Structure**: SKILL.md + 6 workflows

**Workflow Pipeline**:
1. Analyse: Current state analysis
2. Detect Domain: Identify domain or use generic fallback
3. Find Duplicates: MD5 hashing for exact duplicates
4. Plan Organisation: Dry-run plan with approval gate
5. Execute: File operations with logging
6. Summarise: Completion report with rollback instructions

**Safety Features**:
- Protected paths list (system folders, .git, node_modules, etc.)
- Dry-run by default (no execution without explicit approval)
- Operation logging for rollback capability

### weekly-review
**Status**: ACTIVE
**Purpose**: Guide through weekly reflection and planning
**Triggers**: "weekly review", "week reflection", "plan my week", "review my week"
**Location**: `.claude/skills/weekly-review/`
**Structure**: SKILL.md only (simple skill)

**Key Features**:
- Structured reflection sections
- Integration with memory files (journal.md, work_status.md)
- Friday scheduling suggestion
- 15-20 minute time estimate

### brain-dump
**Status**: ACTIVE
**Purpose**: Capture scattered thoughts and organise into actionable items
**Triggers**: "brain dump", "dump my thoughts", "clear my head", "thought dump", "get thoughts out"
**Location**: `.claude/skills/brain-dump/`
**Structure**: SKILL.md only (simple skill)

**Key Features**:
- Categorised output (next actions, reference material, parking lot)
- Multiple categorisation options (by domain, urgency, type)
- Integration with work_status.md for captured tasks

### meeting-notes
**Status**: ACTIVE
**Purpose**: Structured meeting capture with attendees, agenda, decisions, and actions
**Triggers**: "meeting notes", "capture meeting", "document meeting", "meeting summary"
**Location**: `.claude/skills/meeting-notes/`
**Structure**: SKILL.md only (simple skill)

**Key Features**:
- Structured template (date, attendees, agenda, decisions, actions)
- Action items with owners and due dates
- Follow-up suggestions (email summary, calendar integration)

## Token Efficiency Metrics

| Skill | Tier 1 | Tier 2 | Tier 3 (per workflow) | vs. Upfront |
|-------|--------|--------|----------------------|-------------|
| create-skill | ~50 | ~500 | ~400 | 60x |
| research | ~50 | ~400 | ~500 | 60x |
| file-organizer | ~50 | ~350 | ~400 | 60x |
| weekly-review | ~50 | ~300 | N/A | 60x |
| brain-dump | ~50 | ~250 | N/A | 60x |
| meeting-notes | ~50 | ~250 | N/A | 60x |

## Cross-References

Related context in:
- `.claude/context/` - Context that skills progressively load
- `.claude/context/memory/` - Memory files skills integrate with
- `.claude/commands/` - Commands that invoke skills
- `.claude/hooks/` - Hooks that trigger skills automatically

## Placeholder Patterns

Some skills use placeholders for user customisation:

- `{{USER_DOMAINS}}` - User's installed domains (for file-organizer domain intelligence)

These placeholders are replaced during installation or post-installation configuration.

## Additional Notes

- Skills are the **core efficiency mechanism** (60x improvement)
- Skills trigger from natural language (no explicit invocation required)
- Each skill should load less than 300 tokens context initially
- Default to skills over manual processes for recurring tasks
- Skills enable autonomous behaviour when combined with hooks
