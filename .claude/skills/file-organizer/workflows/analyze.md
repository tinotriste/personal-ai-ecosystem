# Analyze - Current State Analysis

## Purpose

Analyse the target directory's current state to understand structure, file distribution, and size metrics before proposing organisation changes.

## When to Use

**Phase 2** of file organisation workflow - immediately after scope understanding (Phase 1) is complete.

## Steps

### 1. Catalog Directory Structure

Display the directory tree (limited depth to avoid overwhelming output):

```bash
# For small directories (<100 files)
tree -L 3 [target_path]

# For large directories (>100 files)
ls -R [target_path] | head -100
```

**Present to user**: "Here's your current folder structure..."

### 2. Count Total Files and Directories

```bash
# Count files
find [target_path] -type f | wc -l

# Count directories
find [target_path] -type d | wc -l
```

**Present as metric**:
- Total files: X
- Total directories: Y

### 3. Calculate Total Size

```bash
du -sh [target_path]
```

**Present as metric**: "Total size: X GB/MB"

### 4. Identify File Type Distribution

```bash
# Count files by extension
find [target_path] -type f | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -20
```

**Present as table**:
```
File Types Found:
- .pdf: 45 files
- .jpg: 23 files
- .docx: 18 files
- .txt: 12 files
...
```

### 5. Find Largest Files

```bash
# Top 20 largest files
find [target_path] -type f -exec ls -lh {} \; | sort -k5 -rh | head -20
```

**Present as list**:
```
Largest Files:
1. video.mp4 (1.2GB)
2. presentation.pptx (450MB)
3. archive.zip (320MB)
...
```

### 6. Analyse File Age Distribution

```bash
# Files modified in last 30 days
find [target_path] -type f -mtime -30 | wc -l

# Files modified 30-180 days ago
find [target_path] -type f -mtime +30 -mtime -180 | wc -l

# Files older than 180 days
find [target_path] -type f -mtime +180 | wc -l
```

**Present as breakdown**:
```
File Age Distribution:
- Recent (last 30 days): X files
- Moderate (30-180 days): Y files
- Old (>180 days): Z files
```

### 7. Summarise Findings

Create a comprehensive summary:

```
CURRENT STATE ANALYSIS

Directory: [target_path]
Total size: X GB
Files: Y
Directories: Z

Top File Types:
- .pdf: 45 files
- .jpg: 23 files
- .docx: 18 files

Size Distribution:
- Largest file: 1.2GB (video.mp4)
- 5 files > 100MB (total: X GB)
- Average file size: Y MB

Age Distribution:
- Recent (last 30 days): 15 files
- Moderate (30-180 days): 32 files
- Old (>180 days): 8 files

Key Observations:
- [Observation 1: e.g., "Many duplicate PDF files detected"]
- [Observation 2: e.g., "Large video files taking up 60% of space"]
- [Observation 3: e.g., "Mix of work and personal files"]
```

## Output Format

Present analysis in a structured, scannable format using:
- **Metrics** in bold
- **Observations** in bullet points
- **Tables** for type/size distributions

## Validation

Before proceeding to Phase 3:
- [ ] Directory structure displayed
- [ ] File counts calculated
- [ ] Size metrics gathered
- [ ] File type distribution analysed
- [ ] Largest files identified
- [ ] Age distribution calculated
- [ ] Summary presented to user

**Ask user**: "Does this analysis look correct? Ready to proceed with domain detection?"

Wait for user confirmation before loading next workflow.
