#!/bin/bash
# Hook: UserPromptSubmit - load_context
# Purpose: Load SYSTEM.md before every user input
# Priority: CRITICAL - Executes first

CONTEXT_FILE="$CLAUDE_PROJECT_DIR/.claude/context/SYSTEM.md"

# Check if context file exists
if [ -f "$CONTEXT_FILE" ]; then
    # Read entire SYSTEM.md and inject into context
    cat <<EOF
<system-reminder>
CONTEXT SYSTEM LOADED:

$(cat "$CONTEXT_FILE")

This context explains the entire knowledge structure. Use it to navigate the context system efficiently.
</system-reminder>
EOF
else
    # Warning if context missing
    cat <<EOF
<system-reminder>
WARNING: SYSTEM.md not found at $CONTEXT_FILE

Context system may not be initialised. Check that the context structure exists at .claude/context/SYSTEM.md
</system-reminder>
EOF
fi
