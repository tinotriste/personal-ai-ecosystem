# Execute Organisation - File Operations Execution

## Purpose

Execute the approved organisation plan from Phase 5, performing all file operations (folder creation, moves, renames, deletions) with comprehensive logging and error handling.

## When to Use

**Phase 6** of file organisation workflow - ONLY after user has explicitly approved the plan in Phase 5.

## Prerequisites

**CRITICAL VALIDATION**:
- [ ] User explicitly approved plan in Phase 5
- [ ] Approval recorded (not assumed or inferred)
- [ ] Dry-run plan is final (no pending modifications)

**If approval not confirmed** -> **HALT** and return to Phase 5.

## Steps

### 1. Initialise Operation Log

Create timestamped log file:

```bash
timestamp=$(date +%Y%m%d-%H%M%S)
log_dir="$HOME/.claude/logs"
mkdir -p "$log_dir"
log_file="$log_dir/file-organizer-${timestamp}.log"

echo "=== File Organizer - Execution Log ===" > "$log_file"
echo "Started: $(date)" >> "$log_file"
echo "Target: [target_path]" >> "$log_file"
echo "" >> "$log_file"
```

**Display to user**:
```
Operation log: ~/.claude/logs/file-organizer-${timestamp}.log

All operations will be logged for rollback reference.
```

### 2. Create Folder Structure

Execute folder creation from Phase 5 plan:

```bash
# For each folder in creation plan
mkdir -p [folder_path] 2>&1 | tee -a "$log_file"

# Log operation
echo "$(date +"%Y-%m-%d %H:%M:%S") | MKDIR | [folder_path]" >> "$log_file"
```

**Progress indicator**:
```
Creating folders... (1/10)
Created: /documents/
Creating folders... (2/10)
Created: /images/
...
```

**Error handling**:
```
Failed to create folder: /protected/path/
Error: Permission denied

Halt execution? (yes/no)
```

### 3. Execute File Moves

Perform file moves from Phase 5 plan:

```bash
# For each move operation
source_file="[source]"
dest_file="[destination]"

# Use mv with no-clobber to prevent overwrites
mv -n "$source_file" "$dest_file" 2>&1 | tee -a "$log_file"

# Log operation
echo "$(date +"%Y-%m-%d %H:%M:%S") | MOVE | $source_file -> $dest_file" >> "$log_file"
```

**Progress tracking**:
```
Moving files... (15/120)
Moved: report.pdf -> /documents/2025-11-08 - report.pdf

Moving files... (16/120)
Moved: photo.jpg -> /images/2024-09-15 - photo.jpg
...
```

**Conflict handling** (if mv -n prevents overwrite):
```
CONFLICT: File already exists at destination

Source: /Downloads/report.pdf
Destination: /documents/2025-11-08 - report.pdf (already exists)

Action:
- Skip (keep existing, don't move new)
- Overwrite (use mv -f to replace)
- Rename (move with different name)

User choice: [Ask user]
```

### 4. Execute File Renames

Apply renaming conventions:

```bash
# For each rename operation
old_name="[old_path]"
new_name="[new_path_with_date_prefix]"

mv -n "$old_name" "$new_name" 2>&1 | tee -a "$log_file"

# Log operation
echo "$(date +"%Y-%m-%d %H:%M:%S") | RENAME | $old_name -> $new_name" >> "$log_file"
```

**Progress tracking**:
```
Renaming files... (8/35)
Renamed: document final (1).pdf -> 2025-11-08 - document-final.pdf
```

### 5. Execute File Deletions (Duplicates)

Delete approved duplicate files:

```bash
# For each deletion from Phase 4 decisions
file_to_delete="[file_path]"

# Final confirmation before each deletion
echo "Deleting: $file_to_delete"

rm "$file_to_delete" 2>&1 | tee -a "$log_file"

# Log operation
echo "$(date +"%Y-%m-%d %H:%M:%S") | DELETE | $file_to_delete" >> "$log_file"
```

**Progress tracking**:
```
Removing duplicates... (2/5)
Deleted: /Downloads/report-old.pdf (duplicate, 2.4MB freed)

Removing duplicates... (3/5)
Deleted: /Desktop/photo-copy.jpg (duplicate, 1.2MB freed)
...
```

**Safety confirmation** (before first deletion):
```
FINAL DELETION CONFIRMATION

About to permanently delete 5 duplicate files (total: 8.3MB).

These files CANNOT be recovered after deletion.

Proceed with deletions? (yes/no)
```

### 6. Preserve File Metadata

Ensure modification dates preserved where appropriate:

```bash
# For important files, preserve original modification time
touch -r "$source_file" "$dest_file"
```

**Note**: Only preserve timestamps for document-type files, not for organisation artifacts.

### 7. Verify Operations

After all operations complete, verify:

```bash
# Count files in new locations
find [target_path] -type f | wc -l

# Check for any files left in original location (should be minimal)
ls [original_location]

# Verify no files lost
# Compare: (original file count) = (current file count) + (deleted duplicates count)
```

**Verification report**:
```
VERIFICATION COMPLETE

Original file count: 120
Current file count: 115
Deleted duplicates: 5

Maths checks out: 120 = 115 + 5

No files lost during organisation.
```

### 8. Finalise Log

Complete log file:

```bash
echo "" >> "$log_file"
echo "Completed: $(date)" >> "$log_file"
echo "=== End of Execution Log ===" >> "$log_file"
```

**Close log** and prepare for Phase 7 summary.

## Output Format

During execution, display:
- **Progress indicators** for each phase (folders, moves, renames, deletions)
- **Success confirmations** for each operation
- **Warnings** for conflicts or errors
- **Operation count** (X/Y complete)

## Error Handling

### Permission Denied

If operation fails due to permissions:

```
ERROR: Permission denied

Operation: MOVE /path/to/file.pdf -> /dest/file.pdf
Error: Permission denied

Possible causes:
- File is locked by another application
- Insufficient permissions for source/destination
- File is in use

Actions:
1. Retry operation
2. Skip this file
3. Halt execution

User choice: [Ask user]
```

### Disk Space Insufficient

If operation fails due to disk space:

```
ERROR: Insufficient disk space

Operation: MOVE /large-file.mp4 (1.5GB)
Available space: 500MB

Cannot proceed with this operation.

Actions:
- Free up space and retry
- Skip this file
- Abort organisation

User choice: [Ask user]
```

### Unexpected Errors

For any other error:

```
UNEXPECTED ERROR

Operation: [operation type]
File: [file path]
Error: [error message]

Execution halted at operation #45 of 120.

All completed operations logged to: [log file]

Review log and decide:
- Retry failed operation
- Skip and continue with remaining operations
- Abort (leave remaining files unorganised)

User choice: [Ask user]
```

## Safety Rules

### Never Auto-Recover

**NEVER** attempt to automatically recover from errors:
- Do not retry without user confirmation
- Do not skip failures silently
- Do not make assumptions about error resolution

**ALWAYS** halt and consult user.

### Operation Atomicity

Operations are **NOT atomic** - if halted mid-execution:
- Some files will be moved
- Some files will remain in original location
- Log file contains history of completed operations

**User can**:
- Resume from where halted (manual process)
- Review log to understand state
- Manually complete remaining operations

### No Rollback During Execution

**Rollback is manual only** - there is no automatic undo.

If user wants to undo:
1. Review log file
2. Manually reverse operations (moves can be reversed)
3. Deletions cannot be undone (duplicates permanently removed)

## Validation

After execution complete:
- [ ] All folders created successfully
- [ ] All file moves completed
- [ ] All renames applied
- [ ] All approved deletions executed
- [ ] File count verified (no losses except approved deletions)
- [ ] Log file created and finalised
- [ ] No errors unresolved

**Ready for Phase 7** (summarize.md) to generate completion report.

## Operation Statistics

Track and report:
- **Operations attempted**: X
- **Operations successful**: Y
- **Operations failed**: Z
- **Files moved**: A
- **Files renamed**: B
- **Files deleted**: C
- **Space freed**: D MB/GB
- **Execution time**: E minutes

Pass statistics to Phase 7 for summary report.
