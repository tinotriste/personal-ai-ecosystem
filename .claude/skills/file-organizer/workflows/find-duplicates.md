# Find Duplicates - Duplicate Detection

## Purpose

Find exact duplicate files using MD5 hashing and present duplicate sets to user for retention decisions.

## When to Use

**Phase 4** of file organisation workflow - after domain detection (Phase 3) is complete.

## Steps

### 1. Calculate MD5 Hashes for All Files

```bash
# Generate MD5 hashes for all files
find [target_path] -type f -exec md5 {} \; > /tmp/file-org-hashes.txt

# Alternative for systems without md5 (use shasum)
find [target_path] -type f -exec shasum {} \; > /tmp/file-org-hashes.txt
```

**Note**: This step may take time for large directories. Display progress indicator:
```
Calculating file hashes... (this may take a minute for large folders)
```

### 2. Identify Duplicate Hash Values

```bash
# Find duplicate hashes
sort /tmp/file-org-hashes.txt | uniq -D -w 32 > /tmp/file-org-duplicates.txt

# Count unique duplicate sets
sort /tmp/file-org-duplicates.txt | awk '{print $1}' | uniq | wc -l
```

**If no duplicates found**:
```
No duplicate files detected. Skipping to organisation planning (Phase 5).
```

**If duplicates found**:
```
Found X duplicate file sets (Y total duplicate files)
```

### 3. Group Duplicates into Sets

For each unique hash, group all files with that hash:

```bash
# Process duplicates by hash
while read -r line; do
    hash=$(echo "$line" | awk '{print $1}')
    file=$(echo "$line" | awk '{$1=""; print $0}' | sed 's/^ //')
    # Group files by hash...
done < /tmp/file-org-duplicates.txt
```

### 4. Present Duplicate Sets to User

For each duplicate set, display:
1. **All file paths**
2. **Modification dates** (newest to oldest)
3. **File sizes**
4. **Recommended retention** (newest or best-named)

**Format**:
```
DUPLICATE SET 1 (3 files, 2.4MB each)

Hash: a1b2c3d4e5f6...

Files:
1. /Users/name/Downloads/report-final-v3.pdf
   Modified: 2025-11-08 10:30:22
   RECOMMEND KEEP (newest, descriptive name)

2. /Users/name/Downloads/report-final.pdf
   Modified: 2025-11-05 14:15:10
   RECOMMEND DELETE (older)

3. /Users/name/Desktop/report.pdf
   Modified: 2025-11-01 09:22:45
   RECOMMEND DELETE (oldest, generic name)

---

DUPLICATE SET 2 (2 files, 512KB each)
...
```

### 5. Get User Decisions on Each Set

**For each duplicate set**, ask user:

```
Question: "Which file should we keep from Duplicate Set 1?"
Options:
  - "/Users/name/Downloads/report-final-v3.pdf" (Newest, modified 2025-11-08, recommended)
  - "/Users/name/Downloads/report-final.pdf" (Older, modified 2025-11-05)
  - "/Users/name/Desktop/report.pdf" (Oldest, modified 2025-11-01)
  - "Keep all (skip this set)" (No deletion for this set)
```

**Record decisions** for execution in Phase 6.

### 6. Summarise Duplicate Removal Plan

After collecting all decisions:

```
DUPLICATE REMOVAL PLAN

Files to keep: X
Files to delete: Y
Space to recover: Z MB/GB

Deletion list:
1. /Users/name/Downloads/report-final.pdf (2.4MB)
2. /Users/name/Desktop/report.pdf (2.4MB)
3. /Users/name/Documents/old-photo.jpg (1.2MB)
...

Total space recovery: Z MB/GB

These files will be deleted in Phase 6 (after final approval).
```

## Output Format

Present duplicate findings with:
- **Duplicate set count** (how many unique files have duplicates)
- **Total duplicate files** (including all copies)
- **Space recovery potential** (how much space will be freed)
- **Detailed duplicate sets** (one per unique file)
- **User decisions** (which to keep, which to delete)

## Validation

Before proceeding to Phase 5:
- [ ] MD5 hashes calculated for all files
- [ ] Duplicate sets identified
- [ ] Each duplicate set presented to user
- [ ] User decisions recorded
- [ ] Removal plan summarised

**If duplicates found**:
"Found X duplicate sets. User decisions recorded for Phase 6 execution."

**If no duplicates**:
"No duplicates detected. Proceeding to organisation planning."

## Special Cases

### Identical Filenames, Different Locations

If files have same name but in different logical locations (e.g., `/work/report.pdf` vs `/personal/report.pdf`):
- **Flag as potential false positive**
- **Ask user**: "These files have identical names and content but are in different folders. Keep both or treat as duplicate?"

### Very Large Duplicate Sets (>10 files)

If a duplicate set has >10 identical copies:
```
LARGE DUPLICATE SET (15 identical copies!)

This file appears 15 times:
- Filename: photo.jpg
- Size: 3.2MB each
- Total wasted space: 44.8MB

Locations:
1. /Users/name/Downloads/photo.jpg (newest)
2. /Users/name/Desktop/photo.jpg
3. /Users/name/Documents/photo.jpg
... (12 more)

Recommendation: Keep newest (#1), delete all others?
```

### Permission Denied Errors

If MD5 calculation fails for files due to permissions:
```
Could not access these files (permission denied):
- /path/to/file1.pdf
- /path/to/file2.doc

Skipping these files for duplicate detection.
```

## Cleanup

After Phase 4 complete:
```bash
# Clean up temporary hash files
rm /tmp/file-org-hashes.txt
rm /tmp/file-org-duplicates.txt
```

**Note**: Only clean up if proceeding to Phase 5. If user aborts, keep files for reference.
