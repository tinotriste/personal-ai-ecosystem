# Update Existing Skill Workflow

## Trigger
User says: "update skill", "improve skill", "modify skill", "enhance skill"

## Purpose
Update an existing skill with new capabilities or improved structure.

## Workflow

### 1. Review Current Skill
- Read `.claude/skills/[skill-name]/SKILL.md`
- Check existing workflows/ (if any)
- Review trigger phrases in description
- Identify what needs updating

### 2. Determine Update Type

**Content Update:**
- Add new information
- Update examples
- Refine instructions
- Improve trigger phrases

**Structure Update:**
- Add workflows/ if simple -> complex
- Reorganise sections
- Improve routing logic
- Split large SKILL.md into workflows/

**Capability Update:**
- Add new tools/commands
- Integrate new context references
- Add new workflows
- Expand use cases

**Trigger Update:**
- Add more natural language variations
- Improve "USE WHEN" phrases
- Test with user's actual phrasings

### 3. Make Changes
- Update SKILL.md description/triggers
- Add/modify workflow files in workflows/
- Update routing logic
- Add/update context references

### 4. Test Changes
- Verify existing triggers still work
- Test new workflows
- Check backward compatibility
- Validate context references
- Test with natural language

### 5. Document Updates
- Note what changed in commit message
- Update examples if needed
- Update `.claude/skills/CLAUDE.md` if status changed
- Test activation with various phrasings

## Best Practices
- Maintain existing functionality (don't break what works)
- Test trigger phrases thoroughly
- Keep changes focused (one improvement at a time)
- Document major changes in commit messages
- Update work_status.md with improvements

## Common Update Scenarios

### Scenario 1: Simple -> Complex (Add Workflows)
**When:** SKILL.md exceeds ~200 lines or has multiple discrete operations
**Action:**
1. Create `workflows/` directory
2. Split operations into separate workflow files
3. Update SKILL.md to list workflows
4. Test routing logic

### Scenario 2: Add Natural Language Triggers
**When:** Skill isn't activating for user's phrasing
**Action:**
1. Review actual user phrasings
2. Add "USE WHEN user says..." to description
3. Test with new trigger phrases
4. Iterate until activation reliable

### Scenario 3: Add Context References
**When:** Skill needs access to new project/methodology files
**Action:**
1. Add context references to SKILL.md or workflow
2. Verify files exist
3. Test progressive disclosure (loads only when needed)

## Reference
See main create-skill SKILL.md for detailed guidelines and quality checklists.
