# Create New Skill Workflow

## Trigger
User says: "create a new skill", "build a skill for", "add a skill"

## Purpose
Create a new skill from scratch following progressive disclosure and workflows/ pattern standards.

## Workflow

### 1. Define Skill Purpose
Ask user:
- What does this skill do?
- When should it activate?
- What tools/commands will it use?
- Simple or complex (needs workflows/)?

### 2. Choose Structure

**Simple Skill** (single SKILL.md):
```
.claude/skills/skill-name/
└── SKILL.md
```

**Complex Skill** (with workflows/):
```
.claude/skills/skill-name/
├── SKILL.md
└── workflows/
    ├── workflow-1.md
    ├── workflow-2.md
    └── workflow-3.md
```

### 3. Create SKILL.md

Use template from `create-skill/templates/`:
- `simple-skill-template.md` for straightforward skills
- `complex-skill-template.md` for multi-workflow skills

**Key elements:**
```markdown
---
name: skill-name
description: Clear description with USE WHEN triggers
---

# Skill Name

## When to Activate This Skill
- Trigger 1
- Trigger 2
- User phrase examples

## Workflows (if complex)
Available workflows in `workflows/` subdirectory:
- `workflow-1.md` - Brief description
- `workflow-2.md` - Brief description

## Core Workflow (if simple)
[Main instructions in imperative form]

## Key Principles
1. Principle 1
2. Principle 2
```

### 4. Add Workflows (if needed)
Create workflows/ subdirectory with specific task workflows.

Each workflow should:
- Be self-contained
- Use imperative form
- Include step-by-step instructions
- Provide output format
- Include validation criteria

### 5. Reference Context (Don't Duplicate)
Reference relevant context files:
```markdown
## Required Reading
- `context/projects/[domain]/[file].md`
- `context/methodologies/[framework].md`
```

### 6. Test Activation
- Test with natural language trigger phrases
- Verify skill loads correctly
- Check workflow routing (if complex)
- Validate all context references work
- Test examples execute correctly

### 7. Update Documentation
Add skill to `.claude/skills/CLAUDE.md` with:
- Status (ACTIVE / PARTIAL)
- Brief description
- Location

## Templates
See `create-skill/templates/` for:
- `simple-skill-template.md` - Basic skill structure
- `complex-skill-template.md` - Multi-workflow skill structure

## Quality Checklist
- [ ] YAML frontmatter complete (name, description with USE WHEN)
- [ ] "When to Activate This Skill" section present
- [ ] Instructions in imperative form
- [ ] Examples included
- [ ] Context references (not duplication)
- [ ] Tested with natural language triggers
