#!/bin/bash
# Hook: UserPromptSubmit - validate_dates
# Purpose: Validate weekday/date consistency in work_status.md
# Priority: LOW - Utility validation

# Platform detection: Exit silently on non-macOS platforms
# BSD date -j is macOS-specific, not available on Linux/WSL
if ! date -j -f "%Y" "2024" +"%Y" >/dev/null 2>&1; then
    # Not macOS (date -j not available), exit silently
    exit 0
fi

WORK_STATUS=".claude/context/memory/work_status.md"

# Get current date info
CURRENT_DATE=$(date +"%d %b %Y")
CURRENT_WEEKDAY=$(date +"%A")
CURRENT_TIME=$(date +"%H:%M")

# Check if work_status.md exists
if [ ! -f "$WORK_STATUS" ]; then
    # File not found, exit silently (not an error condition)
    exit 0
fi

# Extract lines with weekday + date patterns (e.g., "Monday 18 Nov", "Tuesday 19 Nov")
MISMATCHES=$(grep -n -E "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday) [0-9]{1,2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)" "$WORK_STATUS" | while IFS=: read -r line_num line_content; do
    # Extract weekday from line
    STATED_WEEKDAY=$(echo "$line_content" | grep -oE "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)" | head -1)

    # Extract date (day + month) from line
    STATED_DATE=$(echo "$line_content" | grep -oE "[0-9]{1,2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)" | head -1)

    if [ -z "$STATED_DATE" ]; then
        continue
    fi

    # Get current year for date conversion
    CURRENT_YEAR=$(date +"%Y")

    # Convert stated date to actual weekday (BSD date format for macOS)
    ACTUAL_WEEKDAY=$(date -j -f "%d %b %Y" "$STATED_DATE $CURRENT_YEAR" +"%A" 2>/dev/null)

    # If date conversion failed, skip this line
    if [ -z "$ACTUAL_WEEKDAY" ]; then
        continue
    fi

    # Compare stated vs actual weekday
    if [ "$STATED_WEEKDAY" != "$ACTUAL_WEEKDAY" ]; then
        echo "DATE MISMATCH on line $line_num:"
        echo "   Says: $STATED_WEEKDAY $STATED_DATE"
        echo "   Should be: $ACTUAL_WEEKDAY $STATED_DATE"
    fi
done)

# Output results wrapped in system-reminder tags
if [ -n "$MISMATCHES" ]; then
    cat <<EOF
<system-reminder>
DATE VALIDATION WARNING:

$MISMATCHES

Today is: $CURRENT_WEEKDAY, $CURRENT_DATE at $CURRENT_TIME

FIX work_status.md date mismatches BEFORE RESPONDING.
</system-reminder>
EOF
fi
