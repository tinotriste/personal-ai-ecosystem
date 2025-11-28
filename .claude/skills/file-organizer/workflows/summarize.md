# Summarise - Organisation Summary & Maintenance Recommendations

## Purpose

Generate a comprehensive summary report after organisation execution, including metrics, new structure visualisation, and maintenance recommendations.

## When to Use

**Phase 7** (Final phase) of file organisation workflow - after execution (Phase 6) is complete.

## Steps

### 1. Gather Execution Statistics

Collect metrics from Phase 6:

```
Operations Statistics:
- Total operations: X
- Successful: Y
- Failed: Z
- Files moved: A
- Files renamed: B
- Files deleted: C (duplicates)
- Folders created: D
- Space freed: E MB/GB
- Execution time: F minutes
```

### 2. Display Quantified Changes

Present impact in clear, scannable format:

```
ORGANISATION COMPLETE

=======================================

CHANGES SUMMARY

Folders Created: D new folders
Files Organised: (A moved + B renamed) = X total
Duplicates Removed: C files
Space Freed: E MB/GB

Before:
- Total files: [original count]
- Total size: [original size]
- Structure: Flat/disorganised

After:
- Total files: [current count]
- Total size: [current size]
- Structure: Organised by [domain/type]

=======================================
```

### 3. Visualise New Folder Structure

Display organised structure using tree:

```
NEW FOLDER STRUCTURE

[target_path]/
├── documents/ (15 files, 12MB)
├── images/ (8 files, 3MB)
├── archives/ (23 files, 45MB)
│   ├── 2025-11/ (12 files)
│   └── 2025-10/ (11 files)
├── code/ (34 files, 8MB)
└── active/ (18 files, 15MB)

Total: D folders, X files, Y MB
```

**Alternative** (if tree not available):
```bash
ls -R [target_path] | head -50
```

### 4. Highlight Key Improvements

Identify specific wins:

```
KEY IMPROVEMENTS

1. **Document Organisation**
   - Documents now sorted by type (easy retrieval)
   - All docs in one place (/documents/)
   - Duplicates removed (saved XMB)

2. **Image Organisation**
   - Photos consolidated in /images/
   - Date-prefixed for chronological sorting
   - Duplicates cleaned up

3. **Archive Separation**
   - Old files moved to /archive/
   - Active work remains accessible
   - Reduced clutter in main directory

4. **Space Recovery**
   - Removed X duplicate files
   - Freed E MB/GB
   - Reduced clutter by Y%
```

### 5. Provide Rollback Instructions

Include log file reference and rollback guidance:

```
ROLLBACK INFORMATION

Operation log saved to:
~/.claude/logs/file-organizer-[timestamp].log

This log contains every operation performed:
- Folders created
- Files moved (source -> destination)
- Files renamed (old -> new)
- Files deleted (duplicates)

TO UNDO CHANGES:
1. Review log file for operation history
2. Manually reverse operations:
   - MOVE operations: reverse source/destination
   - RENAME operations: rename back to original
   - DELETE operations: CANNOT BE UNDONE

Note: Deletions are permanent. Duplicates cannot be recovered.

If you need to restore: Review log and manually reverse moves/renames.
```

### 6. Maintenance Recommendations

Provide actionable maintenance advice:

```
MAINTENANCE RECOMMENDATIONS

To keep this organisation clean:

**Weekly** (5 minutes):
- Clean up Downloads folder
- Move new files to appropriate folders
- Delete obvious duplicates

**Monthly** (15 minutes):
- Review /active/ folder, archive old files
- Check for new duplicates (run duplicate scan)
- Update folder structure if new categories emerge

**Quarterly** (30 minutes):
- Archive projects older than 6 months
- Compress large old files to save space
- Review folder structure for optimisation

**Automation Ideas**:
- Set weekly reminder: "Clean Downloads folder"
- Use file-organizer monthly on high-traffic folders
- Create smart folder rules for auto-sorting

**Trigger patterns to remember**:
- "organise downloads" -> Runs file-organizer on ~/Downloads
- "clean up desktop" -> Runs file-organizer on ~/Desktop
- "organise files [path]" -> Manual organisation of any folder
```

### 7. Lessons Learned (Optional)

If this was a learning experience, capture insights:

```
LESSONS LEARNED

Based on this organisation session:

1. **File Naming**: Inconsistent naming made organisation harder
   - Recommendation: Use YYYY-MM-DD prefix going forward
   - Tool: Create file naming template/snippet

2. **Duplicate Prevention**: Many duplicates found across folders
   - Recommendation: Use version control for documents
   - Tool: Set up cloud sync for single source of truth

3. **Folder Proliferation**: Too many top-level folders created chaos
   - Recommendation: Stick to 5-10 top-level categories max
   - Strategy: Use subdirectories for granular organisation

Update memory files with these learnings for future reference.
```

### 8. Next Steps Suggestions

Propose follow-up actions:

```
SUGGESTED NEXT STEPS

Now that this folder is organised:

1. **Apply to other messy folders**:
   - ~/Desktop (if not done)
   - ~/Documents (if generic files found)
   - ~/Pictures (if photos disorganised)

2. **Set up maintenance routine**:
   - Calendar reminder: Weekly Downloads cleanup
   - Monthly organisation review

3. **Optimise workflows**:
   - Create quick access folders (aliases/shortcuts)
   - Set up file naming conventions
   - Document folder structure for reference

4. **Expand domain intelligence**:
   - Add new domain patterns to file-organizer skill
   - Update protected paths list if needed

Ready to organise another folder? Say "organise [folder name]" or provide a path.
```

## Output Format

Present summary with:
- **Clear hierarchy** (headers, separators)
- **Quantified results** (before/after metrics)
- **Visual structure** (tree or ls output)
- **Actionable recommendations** (weekly/monthly/quarterly)
- **Rollback reference** (log file location and instructions)

## Validation

Before marking organisation complete:
- [ ] Execution statistics gathered
- [ ] Changes summary presented
- [ ] New structure visualised
- [ ] Key improvements highlighted
- [ ] Rollback instructions provided
- [ ] Maintenance recommendations given
- [ ] Next steps suggested

## Completion Message

End with clear completion confirmation:

```
=======================================

FILE ORGANISATION COMPLETE

Your folder is now organised, optimised, and ready to use.

Operation log: ~/.claude/logs/file-organizer-[timestamp].log
Time taken: F minutes
Space freed: E MB/GB

=======================================

Need to organise another folder?
- Say "organise my downloads/desktop/documents"
- Or provide a specific path

=======================================
```

## Post-Completion Actions

### Update Memory Files

If this organisation revealed insights:

1. **Update work_status.md**:
   - Mark file organisation task complete
   - Note folder organised and date
   - Record any blockers encountered

2. **Update learnings log** (if applicable):
   - Capture file organisation patterns discovered
   - Document successful approaches
   - Note workflows that worked well

### Suggest Skill Improvements

If domain patterns could be enhanced:

```
SKILL IMPROVEMENT OPPORTUNITY

Detected new pattern during organisation:
- [Pattern description]

Recommendation: Update file-organizer skill to include this pattern for future use.

Would you like me to update the skill with this new intelligence?
```

## Related Workflows

This completes the 7-phase workflow:
1. Scope Understanding (SKILL.md - Phase 1)
2. Current State Analysis (analyze.md)
3. Domain Detection (detect-domain.md)
4. Duplicate Detection (find-duplicates.md)
5. Organisation Planning (plan-organization.md)
6. Execution (execute-organization.md)
7. **Summary** (this workflow)

**Session complete** - user can now use organised folder or run skill on another folder.
