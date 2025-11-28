---
name: file-organizer
description: Analyse, reorganise, and maintain clean file structures across any folder. Domain-aware organisation for user's installed domains with intelligent fallback for unknown domains. USE WHEN user says 'organise files', 'clean up', 'sort downloads', 'file chaos', 'messy desktop', 'organise folder', 'clean directory', or requests file organisation.
---

# File Organizer Skill

## When to Activate This Skill

**Manual trigger**:
- "organise files [path]"
- "clean up [folder/directory]"

**Automatic triggers** (keywords):
- "organise files"
- "clean up [folder/directory]"
- "sort my downloads/desktop/documents"
- "file chaos"
- "messy desktop/folder"
- "organise downloads"
- "sort documents"

## Workflows

Available workflows in `workflows/` subdirectory:

1. **`analyze.md`** - Analyse current state (file counts, types, sizes, structure)
2. **`detect-domain.md`** - Detect domain and propose organisation patterns
3. **`find-duplicates.md`** - Find exact duplicate files using MD5 hashing
4. **`plan-organization.md`** - Create dry-run plan showing all proposed changes
5. **`execute-organization.md`** - Execute approved file operations with logging
6. **`summarize.md`** - Generate summary report with metrics and recommendations

## Core Workflow

### Phase 1: Scope Understanding (Start Here)

**Determine target directory**:
1. If user provided path: Use that path
2. If no path provided: Ask user for target directory
3. Validate path exists: `test -d [path]`
4. Check path is readable: `test -r [path]`

**Check against protected paths**:

Protected paths that should **never** be organised without explicit override:
```
/System
/Library
/Applications
/usr
/bin
/sbin
/private
/var
~/.ssh
~/.gnupg
**/.git
**/.git/**
**/node_modules
**/.env
**/.env.*
~/.config
~/.claude
```

**Protection logic**:
- If target path matches any protected pattern -> **HALT**
- Display warning: "This path is protected. File organisation could break system functionality."
- Ask: "Are you absolutely sure you want to proceed? Type 'yes, I understand the risks' to continue."
- If user confirms -> Proceed with **EXTRA CAUTION** (dry-run mandatory, no auto-execution)
- If user declines -> Exit gracefully

**Confirm aggressiveness level**:
Ask user:
- **Conservative**: Only organise obvious messes (Downloads, Desktop), minimal changes
- **Comprehensive**: Deep cleanup including subdirectories, aggressive duplicate removal

### Phase 2-7: Sequential Workflow Execution

After Phase 1, execute workflows in order:

1. **Phase 2**: Load `workflows/analyze.md` - Analyse current state
2. **Phase 3**: Load `workflows/detect-domain.md` - Detect domain and propose organisation patterns
3. **Phase 4**: Load `workflows/find-duplicates.md` - Find and present duplicate files
4. **Phase 5**: Load `workflows/plan-organization.md` - Create dry-run plan, **REQUIRE USER APPROVAL**
5. **Phase 6**: Load `workflows/execute-organization.md` - Execute approved changes (only if approved)
6. **Phase 7**: Load `workflows/summarize.md` - Generate summary report

**CRITICAL SAFETY RULE**: Never proceed to Phase 6 (execution) without explicit user approval from Phase 5.

## Domain Intelligence

### User's Installed Domains

{{USER_DOMAINS}}

**Note**: Replace the placeholder above with user's actual domains after installation. Each domain should include:
- Path indicators (how to recognise this domain)
- Content indicators (file types and naming patterns)
- Proposed structure (target folder organisation)

### Generic Fallback

If no domain detected, use generic organisation:
- **By type**: `/documents/`, `/images/`, `/videos/`, `/archives/`, `/code/`
- **By status**: `/active/` (recent), `/archive/` (old, inactive)
- **By date**: `/YYYY-MM/` for time-series data

## Key Principles

1. **Safety first**: Protected paths, dry-run by default, explicit approval required
2. **Domain-aware**: Detect project context and apply intelligent organisation patterns
3. **Non-destructive**: Use `mv -n` (no-clobber), log all operations for rollback
4. **Progressive**: Execute workflows sequentially, validate at each phase
5. **User control**: Never execute without approval, handle conflicts interactively

## Common Organisation Patterns

### Downloads Cleanup
- Sort by type: Documents, Images, Installers, Archives
- Archive files older than 3 months
- Remove obvious duplicates (filename + size match)

### Desktop Cleanup
- Migrate files to appropriate home directories
- Keep Desktop minimal (active work only)

### Project Organisation
- Separate active work from archived projects
- Apply consistent naming: `YYYY-MM-DD - Description.ext`
- Consolidate duplicate folders

### Photo Organisation
- Create `/YYYY/MM/` structure
- Sort by EXIF date (if available) or modification date
- Group by event/location (if metadata available)

## File Naming Conventions

**Apply these conventions during organisation**:
- **Date prefix**: `YYYY-MM-DD - Description.ext`
- **Descriptive names**: `project-proposal-final.pdf` not `document1.pdf`
- **Remove artifacts**: `(1)`, `copy`, `final-final`, download suffixes
- **Lowercase + hyphens**: `project-overview.md` not `Project Overview.md`

## Operation Logging

All file operations logged to: `.claude/logs/file-organizer-[timestamp].log`

**Log format**:
```
2025-11-08 14:32:01 | MKDIR | /path/to/new/folder
2025-11-08 14:32:02 | MOVE  | /source/file.pdf -> /dest/file.pdf
2025-11-08 14:32:03 | RENAME| /path/old-name.txt -> /path/2025-11-08 - new-name.txt
2025-11-08 14:32:04 | DELETE| /path/duplicate.jpg
```

**Rollback instructions**: Include at end of summary (Phase 7)

## Error Handling

If any workflow encounters an error:
1. **HALT immediately** - Do not proceed to next phase
2. **Display error message** with context
3. **Check log file** for operation history
4. **Ask user** how to proceed (retry, skip, abort)
5. **Never auto-recover** from errors - always consult user

## Quality Checklist

Before marking organisation complete:
- [ ] All proposed changes approved by user
- [ ] Operation log created successfully
- [ ] No file overwrites occurred
- [ ] No protected paths violated
- [ ] All conflicts resolved interactively
- [ ] Summary report generated
- [ ] Rollback instructions provided

## Related Resources

- **Protected paths reference**: Embedded in this skill (Phase 1)
- **Domain patterns**: Defined per installation (Domain Intelligence section)
