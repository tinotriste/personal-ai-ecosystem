# Skill Templates

**Purpose**: Ready-to-use templates for creating new skills in your personal AI ecosystem.

## Available Templates

### 1. Simple Skill Template
**File**: `simple-skill-template.md`

**Use when:**
- Single focused capability
- No discrete sub-workflows needed
- Less than 200 lines of instruction
- Quick reference is sufficient

**Examples:**
- weekly-review skill
- brain-dump skill
- meeting-notes skill

**Structure:**
```
.claude/skills/skill-name/
└── SKILL.md (based on this template)
```

---

### 2. Complex Skill Template
**File**: `complex-skill-template.md`

**Use when:**
- Multiple discrete operations
- Different execution paths based on context
- Needs workflows/ subdirectory
- More than 200 lines of total content

**Examples:**
- research skill (4 workflows: quick-research, comprehensive-investigation, strategic-analysis, domain-research)
- file-organizer skill (6 workflows covering full organisation pipeline)

**Structure:**
```
.claude/skills/skill-name/
├── SKILL.md (based on this template)
└── workflows/
    ├── workflow-1.md
    ├── workflow-2.md
    └── workflow-3.md
```

---

## How to Use Templates

### Step 1: Copy Template
```bash
# For simple skill
cp .claude/skills/create-skill/templates/simple-skill-template.md \
   .claude/skills/[your-skill-name]/SKILL.md

# For complex skill
cp .claude/skills/create-skill/templates/complex-skill-template.md \
   .claude/skills/[your-skill-name]/SKILL.md
```

### Step 2: Customise Content
Replace placeholders:
- `skill-name` -> actual skill name (lowercase-with-hyphens)
- `[Action]` -> specific action verbs
- `[Use Case Name]` -> actual use case descriptions
- `trigger phrase` -> natural language triggers
- Context references -> actual context paths

### Step 3: Add Workflows (Complex Skills Only)
Create workflows/ directory and individual workflow files:
```bash
mkdir -p .claude/skills/[your-skill-name]/workflows
```

Each workflow should follow this structure:
```markdown
# Workflow Name

## Purpose
[What this workflow does]

## When to Use
[Specific conditions for this workflow]

## Steps
### 1. [Step Name]
[Instructions]

## Output Format
[Expected output]

## Validation
[Success criteria]
```

### Step 4: Test
- Test with natural language trigger phrases
- Verify context references work
- Check workflow routing (if complex)
- Validate examples execute correctly

---

## Key Principles

### Workflows/ Pattern
- **SKILL.md** = Routing logic (which workflow to use when)
- **workflows/** = Discrete, self-contained operations
- Clean separation prevents skill file bloat
- Natural language routing: Intent -> Skill -> Workflow

### Progressive Disclosure
**Tier 1 (YAML)**: Name + description (50 tokens)
**Tier 2 (SKILL.md body)**: Quick reference (500-1000 tokens)
**Tier 3 (workflows/)**: Detailed instructions (300-800 tokens each)

**Result**: 60x token efficiency

### Natural Language Routing
Always include explicit triggers:
```yaml
description: USE WHEN user says 'trigger 1', 'trigger 2', 'trigger 3'...
```

### Context References (Not Duplication)
Reference context, don't copy:
```markdown
## Required Reading
- `context/projects/[domain]/[file].md`
- `context/methodologies/[framework].md`
```

---

## Examples from This Ecosystem

### Simple Skill Example: weekly-review
```markdown
---
name: weekly-review
description: Guide through weekly reflection and planning. USE WHEN user says 'weekly review', 'week reflection', 'plan my week'.
---

# Weekly Review

[Core identity, reflection sections, memory integration - all in one file]
```

### Complex Skill Example: research
```markdown
---
name: research
description: Comprehensive research from quick fact-finding to strategic analysis. USE WHEN user says 'research', 'investigate', 'find information'...
---

# Research Skill

## Workflows
Available workflows in `workflows/` subdirectory:
- `quick-research.md` - 2-5 minute fast fact-finding
- `comprehensive-investigation.md` - 5-15 minute multi-query analysis
- `strategic-analysis.md` - 10-30 minute multi-perspective synthesis
- `domain-research.md` - Context-aware routing
```

---

## Quality Checklist

Before finalising your skill:
- [ ] YAML frontmatter complete (name, description with USE WHEN)
- [ ] "When to Activate This Skill" section present
- [ ] Instructions in imperative form (verb-first)
- [ ] Examples included
- [ ] Context references (not duplication)
- [ ] Workflows created (if complex)
- [ ] Tested with natural language triggers
- [ ] Added to `.claude/skills/CLAUDE.md`

---

## Reference

See main `create-skill/SKILL.md` for comprehensive guidance on skill creation.
