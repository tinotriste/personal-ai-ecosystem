# Plan Organisation - Dry-Run Organisation Planning

## Purpose

Create a comprehensive dry-run plan showing all proposed file operations (moves, renames, deletions) and require explicit user approval before execution.

## When to Use

**Phase 5** of file organisation workflow - after duplicate detection (Phase 4) is complete.

## Steps

### 1. Build Folder Creation Plan

Based on domain detection from Phase 3, list all new folders to create:

```
NEW FOLDERS TO CREATE

The following folder structure will be created:

[target_path]/
├── documents/
├── images/
├── archives/
... (complete proposed structure from Phase 3)

Total new folders: X
```

### 2. Build File Move Plan

For each file in target directory, determine destination based on:
- Domain-specific routing logic (from Phase 3)
- File type/extension
- File age (active vs archive)

**Generate move list**:
```bash
# For each file, determine destination folder
find [target_path] -type f -maxdepth 1 | while read -r file; do
    # Determine destination based on routing logic
    # Record: source -> destination
done
```

**Present as table**:
```
FILE MOVE PLAN (showing first 20 of X files)

Source -> Destination

1. /Downloads/invoice-nov.pdf
   -> /documents/2025-11-08 - invoice-nov.pdf
   (Apply date prefix, move to documents/)

2. /Downloads/project-worksheet.docx
   -> /documents/project-worksheet.docx
   (No rename needed, move to documents/)

3. /Downloads/old-photo.jpg
   -> /images/2024-09-15 - old-photo.jpg
   (Extract date from metadata, move to images/)

... (show more, or "View all X files?")
```

### 3. Build File Rename Plan

For files that need renaming to follow conventions:

```
FILE RENAME PLAN

Files to rename (applying YYYY-MM-DD - Description.ext pattern):

1. report final (1).pdf
   -> 2025-11-08 - report-final.pdf
   (Remove artifacts, add date prefix, normalise)

2. IMG_1234.jpg
   -> 2025-07-22 - IMG_1234.jpg
   (Add date prefix from EXIF data)

3. document copy 2.docx
   -> 2025-11-01 - document.docx
   (Remove copy suffix, add date)

Total renames: X files
```

### 4. Build File Deletion Plan (From Phase 4)

Include duplicate removal decisions from Phase 4:

```
FILE DELETION PLAN

Files to delete (duplicates):

1. /Downloads/report-final.pdf (2.4MB)
   Reason: Duplicate of report-final-v3.pdf (kept newer version)

2. /Desktop/photo.jpg (1.2MB)
   Reason: Duplicate of photo.jpg in /Pictures (kept best location)

Total deletions: X files
Space recovery: Y MB/GB
```

### 5. Conflict Detection

Check for potential conflicts:

**Filename conflicts**:
```bash
# Check if any destination files already exist
for move in move_plan; do
    if test -f [destination]; then
        # Flag as conflict
    fi
done
```

**Present conflicts**:
```
CONFLICTS DETECTED

The following files already exist at destination:

1. /documents/2025-11-08 - invoice-nov.pdf
   Existing file: Modified 2025-11-05, 1.2MB
   New file: Modified 2025-11-08, 1.3MB

   Resolution needed:
   - Overwrite (replace old with new)
   - Skip (keep existing, don't move new)
   - Rename (keep both with different names)
```

**Get resolution** for each conflict from user.

### 6. Calculate Impact Metrics

Summarise overall impact:

```
ORGANISATION IMPACT

Files to process: X
- Move: Y files
- Rename: Z files
- Delete: A files (duplicates)

Folders to create: B

Space changes:
- Freed by duplicate removal: C MB/GB
- No space change from moves/renames

Estimated time: ~D minutes
```

### 7. Present Complete Dry-Run Plan

Consolidate all changes into final approval request:

```
COMPLETE ORGANISATION PLAN

=======================================

NEW FOLDERS (X total)
[List of folders to create]

FILE MOVES (Y total)
[Summary of moves, link to full list]

FILE RENAMES (Z total)
[Summary of renames]

FILE DELETIONS (A total - duplicates only)
[Summary of deletions with space recovery]

CONFLICTS (B total)
[Conflicts and resolutions]

=======================================

THIS IS A DRY-RUN

No files have been moved, renamed, or deleted yet.

This plan shows what WILL happen if you approve.

=======================================
```

### 8. Request Explicit Approval

**CRITICAL**: Request approval from user:

```
Question: "Review the complete organisation plan above. Approve execution?"
Options:
  - "Yes, execute this plan" (Proceed to Phase 6 - execution)
  - "No, modify the plan" (Return to Phase 3 to adjust)
  - "Cancel organisation" (Abort workflow entirely)
```

**Record approval status**:
- **If approved** -> Proceed to Phase 6 (execute-organization.md)
- **If modification requested** -> Return to Phase 3 (detect-domain.md) with notes
- **If cancelled** -> Exit gracefully, no changes made

## Output Format

Present dry-run plan with:
- **Visual hierarchy** (headers, separators, tables)
- **Grouping by operation type** (folders, moves, renames, deletions)
- **Impact metrics** (counts, size changes, time estimate)
- **Conflict resolutions** (if any)
- **Clear approval gate** (explicit yes/no decision)

## Validation

Before proceeding to Phase 6:
- [ ] All folders listed for creation
- [ ] All file moves planned
- [ ] All renames planned
- [ ] All deletions listed (with rationale)
- [ ] Conflicts detected and resolved
- [ ] Impact metrics calculated
- [ ] **USER EXPLICITLY APPROVED PLAN**

**NEVER proceed to Phase 6 without explicit approval.**

## Safety Checks

### Pre-Approval Validation

Before presenting plan:
1. **Verify no protected paths** in move/delete operations
2. **Check disk space** sufficient for operations
3. **Validate all destinations** are writable
4. **Confirm no circular moves** (file -> folder -> original location)

**If safety check fails**:
```
SAFETY CHECK FAILED

Issue: [Description of problem]

Cannot proceed with organisation until resolved.

Recommended action: [How to fix]
```

### Size Threshold Warning

If planning to move/rename >1000 files:
```
LARGE OPERATION WARNING

This organisation will process 2,500 files.

Estimated time: ~15 minutes
Disk I/O may be intensive during execution.

Recommend:
- Close other applications
- Ensure stable power (if laptop)
- Do not interrupt once started

Proceed with caution.
```

## Modification Handling

If user selects "No, modify the plan":

1. **Ask what to modify**:
   - Change folder structure?
   - Adjust file routing rules?
   - Exclude certain files/folders?
   - Change naming conventions?

2. **Return to Phase 3** with modifications noted

3. **Regenerate plan** incorporating changes

4. **Re-present for approval**

**Loop until approved or cancelled.**

## Rollback Preview

Include rollback information in plan:

```
ROLLBACK CAPABILITY

All operations will be logged to:
.claude/logs/file-organizer-[timestamp].log

If you need to undo these changes after execution:
1. Review log file for operation history
2. Manually reverse operations (moves can be reversed)
3. Note: Deletions cannot be undone (duplicates permanently removed)

Recommendation: Create a backup if you're unsure.
```
