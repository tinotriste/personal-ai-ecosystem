#!/bin/bash
# Hook: UserPromptSubmit - memory_reminder
# Purpose: Remind AI to update memories after every interaction
# Priority: CRITICAL - Executes second (after load_context)

# Check work_status.md size and warn if exceeds 700 lines
WORK_STATUS_FILE="$CLAUDE_PROJECT_DIR/.claude/context/memory/work_status.md"
LINE_COUNT=$(wc -l < "$WORK_STATUS_FILE" 2>/dev/null || echo "0")

SIZE_WARNING=""
if [ "$LINE_COUNT" -gt 700 ]; then
  SIZE_WARNING="
**work_status.md SIZE WARNING**: $LINE_COUNT lines (target: <500 lines)

Consider manually reviewing and archiving old entries to improve performance.
Target: Reduce to <500 lines for efficient context loading.
"
fi

cat <<EOF
<system-reminder>
MEMORY MANAGEMENT PROTOCOL:
${SIZE_WARNING}
After completing this task, reflect and update:

0. **Task Completion Check** (CRITICAL):
   - Review work_status.md for any tasks marked "IN PROGRESS"
   - If task/phase is complete, update status to "COMPLETE" with completion date
   - Mark subtasks as [x] complete
   - Remove "IN PROGRESS" markers when work is done
   - Update "Last Updated" date to current date

1. **work_status.md**:
   - What was accomplished in this interaction?
   - What's the next step for each active project?
   - Any blockers identified?
   - Use concise 3-5 line session format

2. **learnings_log.md** (HIGH-SIGNIFICANCE ONLY):
   - Only log if: framework discovery, cross-domain insight, user preference change, or antipattern identified
   - Skip: task completion, routine updates, one-off fixes

You are responsible for autonomous memory management. Update context files without being asked.
</system-reminder>
EOF
