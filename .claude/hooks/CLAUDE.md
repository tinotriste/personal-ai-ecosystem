# Hooks

**Purpose**: Event-driven shell scripts that execute automatically in response to Claude Code lifecycle events. Hooks enable reliable context loading, memory management, and session awareness for your personal AI ecosystem.

## Quick Reference

**Total Hooks**: 4

| Hook | Event | Purpose | Triggers |
|------|-------|---------|----------|
| `session_start_init.sh` | SessionStart | Date/time injection, domain awareness | Session begins |
| `user_prompt_submit_load_context.sh` | UserPromptSubmit | Load SYSTEM.md context | Every user prompt |
| `user_prompt_submit_memory_reminder.sh` | UserPromptSubmit | Prompt memory updates | Every user prompt |
| `validate_dates.sh` | UserPromptSubmit | Validate weekday/date consistency | Every user prompt |

## When to Load This Context

Reference hooks context when:
- Developing new hooks for workflow automation
- Debugging hook execution issues
- Understanding event-driven automation patterns
- Troubleshooting memory management or context loading

**Trigger**: Hooks activate automatically based on registered events.

## Usage Patterns

Hook lifecycle:
1. Register hook in `.claude/settings.json` with JSON format
2. Hook fires automatically on event (SessionStart, UserPromptSubmit, etc.)
3. Hook executes shell script with environment variables
4. Output injected as `<system-reminder>` in conversation

**Progressive disclosure**: Only load hook documentation when developing or debugging.

## Directory Structure

```
.claude/hooks/
├── CLAUDE.md                                   # This file - development guidelines
├── session_start_init.sh                       # Session initialisation (SessionStart)
├── user_prompt_submit_load_context.sh          # Context loading (UserPromptSubmit)
├── user_prompt_submit_memory_reminder.sh       # Memory prompts (UserPromptSubmit)
└── validate_dates.sh                           # Date validation (UserPromptSubmit)
```

## Event Types

- **SessionStart**: Fires once at beginning of session
- **UserPromptSubmit**: Fires before every user message is processed
- **PreToolUse**: Fires before tool execution (can modify or block)
- **PostToolUse**: Fires after tool execution
- **Stop**: Fires when user requests stopping current task
- **SessionEnd**: Fires when session ends gracefully

**Note**: Phase 5 implements SessionStart and UserPromptSubmit events only. Other event types available for future extension.

## Hook Descriptions

### session_start_init.sh (SessionStart)

**Purpose**: Initialise session with current date/time and domain awareness

**Behaviour**:
- Injects current date (format: `%A, %d %B %Y`) and time (format: `%H:%M`)
- Reminds AI of user's domains and responsibilities
- Provides context system overview
- Sets session goals

**Placeholders**: Contains `{{AI_NAME}}`, `{{USER_NAME}}`, `{{DOMAIN_LIST}}` for customisation

### user_prompt_submit_load_context.sh (UserPromptSubmit)

**Purpose**: Load SYSTEM.md on every user prompt

**Behaviour**:
- Checks if SYSTEM.md exists at `$CLAUDE_PROJECT_DIR/.claude/context/SYSTEM.md`
- Loads full SYSTEM.md content into conversation context
- Outputs warning if file not found

**Priority**: Executes first (ensures context system awareness)

### user_prompt_submit_memory_reminder.sh (UserPromptSubmit)

**Purpose**: Prompt autonomous memory updates after tasks

**Behaviour**:
- Checks work_status.md line count
- Warns if file exceeds 700 lines (suggests manual cleanup)
- Reminds AI to update work_status.md and learnings_log.md
- Prompts task completion checks

**Priority**: Executes second (after load_context)

### validate_dates.sh (UserPromptSubmit)

**Purpose**: Validate weekday/date consistency in work_status.md

**Behaviour**:
- Extracts weekday + date patterns from work_status.md
- Compares stated weekday vs actual weekday
- Outputs mismatches with correction suggestions
- **macOS only**: Uses BSD date format (`date -j -f`)
- **Silent failure**: Exits cleanly on non-macOS platforms (Linux, WSL)

## Naming Convention

Hook naming pattern: `{event}_{description}.sh`

Examples:
- `session_start_init.sh` - SessionStart event, init function
- `user_prompt_submit_load_context.sh` - UserPromptSubmit event, load context function
- `validate_dates.sh` - Short form acceptable for utility hooks

## Output Format Requirements

All hooks must:
1. Wrap output in `<system-reminder>` tags
2. Include clear labelling (e.g., "SESSION INITIALISATION:", "CONTEXT SYSTEM LOADED:")
3. Have executable permissions (`chmod +x`)

Example output structure:
```bash
cat <<EOF
<system-reminder>
HOOK LABEL:

Hook content here...
</system-reminder>
EOF
```

## Placeholder Patterns

Hooks use placeholders for user customisation (replaced during installation):

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{{AI_NAME}}` | AI personality name | "Kai", "Atlas" |
| `{{USER_NAME}}` | User's name | "Alex", "Jordan" |
| `{{DOMAIN_LIST}}` | Bulleted list of user's domains | "- Work\n- Personal Projects" |

**Note**: Placeholders are replaced during installation by install.sh script.

## Hook Registration (settings.json)

Hooks are registered in `.claude/settings.json`:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/session_start_init.sh",
            "timeout": 60
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/validate_dates.sh",
            "timeout": 60
          }
        ]
      }
    ]
  }
}
```

**Key Points**:
- Use `"$CLAUDE_PROJECT_DIR"` for portable paths (not hardcoded absolute paths)
- Timeout in milliseconds (60ms default)
- Type is always "command" for shell scripts
- Hooks execute in array order within each event type

## Development Standards

### Creating New Hooks

1. Use appropriate naming convention: `{event}_{description}.sh`
2. Add shebang and header comment (purpose, priority)
3. Wrap output in `<system-reminder>` tags
4. Use `"$CLAUDE_PROJECT_DIR"` for portable paths
5. Set executable permissions: `chmod +x hook_script.sh`
6. Register in `.claude/settings.json`
7. Test manually before deployment

### Performance Guidelines

- Design for <100ms execution time
- Avoid network calls in critical path
- Use early exit for non-applicable conditions
- Test on target platforms

### Platform Compatibility

- macOS: Full BSD command support
- Linux: GNU command variants (may need adaptation)
- WSL: Windows Subsystem for Linux (GNU variants)

**Recommendation**: Test platform-specific code, fail silently on unsupported platforms.

## Cross-References

Related context in:
- `.claude/context/SYSTEM.md` - Loaded by `load_context` hook
- `.claude/context/memory/work_status.md` - Validated by `validate_dates` hook, updated via `memory_reminder`
- `.claude/context/memory/learnings_log.md` - Updated via `memory_reminder` hook
- `.claude/settings.json` - Hook registration configuration
- `.claude/skills/` - Skills that hooks may trigger

## Additional Notes

- Hooks fire synchronously (keep execution fast)
- All output appears as system reminders in conversation
- Hooks are the automation backbone (enable autonomous behaviour)
- Combine with skills for powerful automated workflows
