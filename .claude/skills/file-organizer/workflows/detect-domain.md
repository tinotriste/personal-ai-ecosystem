# Detect Domain - Domain Detection & Pattern Identification

## Purpose

Detect which user domain the target folder belongs to, and propose domain-specific organisation patterns. Fall back to generic patterns if no domain matches.

## When to Use

**Phase 3** of file organisation workflow - after current state analysis (Phase 2) is complete.

## Steps

### 1. Path-Based Domain Detection

Analyse the target path for domain indicators.

**Check against user's installed domains**:

{{USER_DOMAINS}}

For each installed domain, check:
- Path contains domain keywords
- Path matches domain patterns

### 2. Content-Based Domain Detection (If Path Detection Fails)

Sample filenames and content for domain indicators:

```bash
# Search for domain-specific file patterns
find [target_path] -type f -name "*[domain-keyword]*" | head -5
```

**Match threshold**: If 3+ files match a domain's keywords -> **Domain detected**

### 3. Domain-Specific Organisation Patterns

Based on detected domain, propose organisation structure from domain configuration.

**If domain detected**: Use domain-specific structure from user's domain configuration.

**If no domain detected**: Use Generic Pattern (see below).

### Generic Pattern (Fallback)

```
/
├── documents/        # .pdf, .docx, .txt, .md
├── images/           # .jpg, .png, .gif, .svg
├── videos/           # .mp4, .mov, .avi
├── archives/         # .zip, .tar, .gz
├── code/             # .js, .py, .java, .go
├── spreadsheets/     # .xlsx, .csv
├── presentations/    # .pptx, .key
├── active/           # Files modified in last 30 days
└── archive/          # Files older than 180 days
```

**File routing logic**:
- By file extension -> appropriate type folder
- By modification date -> `/active/` or `/archive/`

### 4. Present Proposed Organisation

Display detected domain and proposed structure:

```
DOMAIN DETECTION

Detected Domain: [Domain name or Generic]

Confidence: [High/Medium/Low]
- Path matches: [Yes/No]
- Content matches: [X files matched domain keywords]

PROPOSED ORGANISATION STRUCTURE

[Display appropriate folder hierarchy]

This structure will:
- [Benefit 1: e.g., "Separate project files for easy access"]
- [Benefit 2: e.g., "Group files by date for time-series analysis"]
- [Benefit 3: e.g., "Isolate important docs for quick retrieval"]
```

### 5. Determine File Routing

For each file type found in Phase 2 analysis, explain where it will be moved:

```
FILE ROUTING PLAN

.pdf files (45 found):
-> /documents/ (generic) or /[domain-specific-folder]/ (if detected)

.jpg files (23 found):
-> /images/ or /[domain-specific-folder]/ (if project-related)

.docx files (18 found):
-> /documents/ or /[domain-specific-folder]/

...
```

## Output Format

Present domain detection results with:
- **Detection confidence** (High/Medium/Low)
- **Evidence** (path matches, content matches)
- **Proposed structure** (visual folder hierarchy)
- **File routing logic** (where each type will go)

## Validation

Before proceeding to Phase 4:
- [ ] Domain detected (or fallback to generic)
- [ ] Proposed folder structure presented
- [ ] File routing logic explained
- [ ] User understands organisation plan

**Ask user**: "Does this organisation structure make sense for your needs? Any folders you'd like to add/remove?"

Wait for user confirmation before loading next workflow.

## Customisation

If user requests modifications:
- Add custom folders to proposed structure
- Adjust file routing logic
- Re-present updated plan for approval

**Update structure** based on feedback, then re-confirm before proceeding.

## Placeholder Pattern

**{{USER_DOMAINS}}**: This workflow uses user's installed domains from configuration.

After installation, this placeholder should be replaced with actual domain definitions, each including:
- Domain name
- Path indicators
- Content indicators
- Proposed folder structure
- File routing logic

Example domain definition:
```
**Project X**:
- **Path indicators**: Contains "project-x"
- **Content indicators**: Files with "px-" prefix, .proj files
- **Proposed structure**: /specs/, /designs/, /docs/, /assets/
- **File routing**: Specs -> /specs/, Images -> /assets/
```
