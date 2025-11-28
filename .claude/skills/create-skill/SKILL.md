---
name: create-skill
description: Guide for creating new skills in your personal AI ecosystem. Use when user wants to create, update, or structure a new skill that extends capabilities with specialised knowledge, workflows, or tool integrations. Follows progressive disclosure pattern and workflows/ structure. USE WHEN user says 'create skill', 'build skill', 'add skill', 'update skill', 'structure skill', or requests to extend AI capabilities. (project)
---

# Create Skill - Skill Creation Framework

## When to Activate This Skill
- "Create a new skill for X"
- "Build a skill that does Y"
- "Add a skill for Z"
- "Update/improve existing skill"
- "Structure a skill properly"
- User wants to extend AI capabilities
- Creating workflows for repetitive tasks

## Workflows

Available workflows in `workflows/` subdirectory:
- `create-new.md` - Create a new skill from scratch
- `update-existing.md` - Update an existing skill with new capabilities

## Templates

Available templates in `templates/` subdirectory:
- `simple-skill-template.md` - For straightforward, single-file skills
- `complex-skill-template.md` - For multi-workflow skills with workflows/ directory
- `README.md` - Comprehensive templates guide with examples

## Core Skill Creation Workflow

### Step 1: Understand the Purpose
Ask these questions:
- **What does this skill do?** (Clear, specific purpose)
- **When should it activate?** (Trigger conditions)
- **What tools/commands does it use?** (Dependencies)
- **Does it need workflows/?** (Multiple discrete operations)

### Step 2: Choose Skill Structure

**Simple Skill** (SKILL.md only):
- Single focused capability
- Minimal context needed
- No discrete sub-workflows
- Examples: weekly-review, brain-dump, meeting-notes

**Complex Skill with Workflows** (SKILL.md + workflows/):
- Multiple discrete operations
- Different execution paths based on context
- Reusable sub-workflows
- Examples: research (4 workflows), file-organizer (6 workflows)

### Step 3: Create Directory Structure

```bash
# Simple skill (no workflows)
.claude/skills/[skill-name]/
└── SKILL.md

# Complex skill with workflows
.claude/skills/[skill-name]/
├── SKILL.md                           # Routing logic + core instructions
└── workflows/                         # Discrete operations
    ├── workflow-1.md
    ├── workflow-2.md
    └── workflow-3.md
```

**Workflows/ Pattern**:
- SKILL.md = routing logic (when to use which workflow)
- workflows/ = discrete, self-contained operations
- Clean separation prevents skill bloat
- Example: `research/workflows/quick-research.md`

### Step 4: Write SKILL.md (Required)

Use this structure:
```markdown
---
name: skill-name
description: Clear description of what skill does and when to use it. Include explicit trigger phrases. USE WHEN user says 'trigger 1', 'trigger 2', or requests this capability.
---

# Skill Name

## When to Activate This Skill
- Trigger condition 1
- Trigger condition 2
- User phrase examples

## Workflows (if complex skill)

Available workflows in `workflows/` subdirectory:
- `workflow-1.md` - Brief description
- `workflow-2.md` - Brief description

## Core Workflow (if simple skill)

[Main instructions in imperative form]

## Key Principles

1. Principle 1
2. Principle 2
3. Principle 3
```

### Step 5: Write Workflows (If Complex)

Each workflow in `workflows/` should be:
- **Self-contained**: Complete instructions for one discrete operation
- **Imperative form**: "Do X", "Execute Y", "Validate Z"
- **Step-by-step**: Clear numbered or bulleted progression
- **Examples included**: Show concrete usage

**Workflow Template**:
```markdown
# Workflow Name

## Purpose
[What this workflow does]

## When to Use
[Specific trigger conditions for this workflow vs others]

## Steps

### 1. [Step Name]
[Detailed instructions]

### 2. [Step Name]
[Detailed instructions]

### 3. [Step Name]
[Detailed instructions]

## Output Format

[Expected output structure]

## Validation

[How to verify workflow completed successfully]
```

### Step 6: Test the Skill

1. Trigger it with natural language (use exact trigger phrases)
2. Verify it loads correctly
3. Check all workflows exist and are accessible
4. Validate against examples
5. Test with realistic user requests

## Skill Naming Conventions

- **Lowercase with hyphens**: `create-skill`, `file-organizer`
- **Descriptive, not generic**: `file-organizer` not `organizer`
- **Action or domain focused**: `weekly-review`, `brain-dump`
- **No prefix**: Use generic names (not domain-specific prefixes)

## Description Best Practices

Your description should:
- Clearly state what the skill does
- Include explicit trigger phrases ("USE WHEN user says...")
- Mention key tools/methods used
- Be concise but complete (2-4 sentences)

**Good example:**
- "Guide for creating new skills in your personal AI ecosystem. USE WHEN user says 'create skill', 'build skill', 'add skill', 'update skill', or requests to extend AI capabilities."

**Bad example:**
- "A skill for development tasks" (too vague, no triggers, unclear when to use)

## Established Patterns

### Workflows/ Subdirectory Pattern

**All complex skills follow this pattern:**

```
skills/research/
├── SKILL.md
└── workflows/
    ├── quick-research.md           # 2-5 minutes
    ├── comprehensive-investigation.md  # 5-15 minutes
    ├── strategic-analysis.md        # 10-30 minutes
    └── domain-research.md           # Variable
```

**Benefits**:
- Clean separation of routing (SKILL.md) vs execution (workflows/)
- Discrete workflows are reusable and composable
- Prevents skill file bloat (SKILL.md stays concise)
- Natural language routing: Intent -> Skill -> Workflow

### Progressive Disclosure

**Tier 1 (YAML frontmatter)**: Always loaded (50 tokens)
- Skill name
- Description with triggers

**Tier 2 (SKILL.md body)**: Loaded when skill activates (500-1000 tokens)
- Quick reference instructions
- Workflow list
- Core principles

**Tier 3 (workflows/)**: Loaded as needed per workflow (300-800 tokens each)
- Detailed step-by-step instructions
- Examples and validation

**Result**: 60x token efficiency vs loading all content upfront

### Natural Language Routing

Include explicit trigger phrases in description:
- "USE WHEN user says 'X', 'Y', 'Z'..."
- List natural language variations
- Think about how users express this need

**Example:**
```yaml
description: USE WHEN user says: 'research', 'investigate',
  'find information', 'analyse [topic]', 'competitive analysis'...
```

## Context Integration

Skills can reference:
- `.claude/context/memory/` (work status, journal, learnings)
- `.claude/context/projects/` (project-specific context)
- `.claude/context/methodologies/` (problem-solving frameworks)
- `.claude/hooks/` (event-driven automation)

**Don't duplicate - reference!**

Example:
```markdown
## Required Reading
- `context/projects/[domain]/CLAUDE.md`
- `context/methodologies/[framework].md`
```

## Key Principles

1. **Progressive disclosure**: Tier 1 (metadata) -> Tier 2 (SKILL.md) -> Tier 3 (workflows/)
2. **Clear activation triggers**: Description enables intent matching
3. **Executable instructions**: Imperative form, actionable steps
4. **Workflows/ pattern**: Separate routing from execution
5. **No duplication**: Reference context, don't copy it
6. **Self-contained**: Work independently with clear dependencies
7. **Test thoroughly**: Validate with real user requests

## Quality Checklist

### Before Creating Skill
- [ ] Clearly defined purpose
- [ ] Identified activation triggers (natural language phrases)
- [ ] Checked for existing similar skills
- [ ] Determined simple vs workflows/ structure
- [ ] Listed required tools/commands
- [ ] Identified context files to reference

### SKILL.md Quality
- [ ] Complete YAML frontmatter (name, description with "USE WHEN")
- [ ] "When to Activate This Skill" section present
- [ ] Workflows listed (if complex skill)
- [ ] Instructions in imperative form
- [ ] No duplication of context (references only)
- [ ] Tested with realistic user requests

### Workflows/ Quality (if complex)
- [ ] Each workflow is self-contained
- [ ] Clear purpose statement per workflow
- [ ] Step-by-step instructions
- [ ] Expected output format documented
- [ ] Validation criteria included

### Testing Validation
- [ ] Skill activates with natural language trigger phrases
- [ ] All workflows exist and are accessible
- [ ] All context references work correctly
- [ ] Examples work as documented
- [ ] Workflow completes successfully

## Examples

### Example 1: Simple Skill (weekly-review)
**No workflows needed** - single focused capability

```
skills/weekly-review/
└── SKILL.md  # Everything in one file
```

### Example 2: Complex Skill (research)
**4 workflows** - different research depths

```
skills/research/
├── SKILL.md
└── workflows/
    ├── quick-research.md
    ├── comprehensive-investigation.md
    ├── strategic-analysis.md
    └── domain-research.md
```

### Example 3: Complex Skill (file-organizer)
**6 workflows** - sequential pipeline

```
skills/file-organizer/
├── SKILL.md
└── workflows/
    ├── analyze.md
    ├── detect-domain.md
    ├── find-duplicates.md
    ├── plan-organization.md
    ├── execute-organization.md
    └── summarize.md
```

## Common Mistakes to Avoid

### Mistake 1: Vague Descriptions
- Wrong: "A skill for analysis"
- Correct: "Use when user requests research or investigation. USE WHEN user says: 'research', 'investigate', 'find information'..."

### Mistake 2: Missing Trigger Phrases
- Wrong: No "USE WHEN" in description
- Correct: "USE WHEN user says 'X', 'Y', 'Z'..."

### Mistake 3: Duplicating Context
- Wrong: Copying contact list into skill
- Correct: "Use contacts from context/memory/contacts.md"

### Mistake 4: Imperative Form Violations
- Wrong: "You should create a directory"
- Correct: "Create directory structure"

### Mistake 5: No Workflows for Complex Skills
- Wrong: 500-line SKILL.md with 4 different operations mixed together
- Correct: Split into SKILL.md (routing) + workflows/ (discrete operations)

### Mistake 6: Broken References
- Wrong: Referencing context files that don't exist
- Correct: Verify all paths before committing

## Troubleshooting

### Skill Won't Activate
**Check:**
1. Does description include "USE WHEN" trigger phrases?
2. Are trigger phrases matching user's natural language?
3. Test with exact trigger phrases from description

### Workflows Don't Load
**Check:**
1. Are workflow files in `workflows/` subdirectory?
2. Are filenames referenced correctly in SKILL.md?
3. Test reading workflow files directly

### Skill Too Complex
**Solution:**
1. Split into SKILL.md + workflows/
2. Each workflow handles one discrete operation
3. Use progressive disclosure (reference, don't include)

## Related Resources

- Skills framework: `.claude/skills/CLAUDE.md`
- Existing skills: `.claude/skills/*/SKILL.md` (study for patterns)
- Context system: `.claude/context/CLAUDE.md`
