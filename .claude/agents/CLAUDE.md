# Agents

**Purpose**: Specialised AI personalities with domain expertise, specific tool access, and tailored communication styles. Agents are user-selected AI personalities with pre-loaded context that use skills to perform their specialised work.

## Quick Reference

**Total Agents**: 3

| Agent | Purpose | API Dependency | Time Estimate |
|-------|---------|----------------|---------------|
| `perplexity-researcher` | Quick web research and fact verification | Optional: `$PERPLEXITY_API_KEY` | 2-5 min |
| `claude-researcher` | Comprehensive multi-query investigation | None (uses WebSearch) | 5-15 min |
| `gemini-researcher` | Strategic multi-perspective analysis | Optional: `$GOOGLE_AI_API_KEY` | 10-30 min |

## When to Load This Context

Reference agents context when:
- Selecting the appropriate research agent for a task
- Understanding agent capabilities and limitations
- Configuring optional API keys for enhanced functionality
- Creating custom agents for specific use cases

**Trigger**: Agents activate via `@agent-name` invocation or natural language detection.

## Agents vs Skills

Understanding the distinction between agents and skills is essential:

| Aspect | Agents | Skills |
|--------|--------|--------|
| **Definition** | Specialised AI personalities | Structured workflows |
| **Purpose** | Domain expertise with tailored communication | Token-efficient task automation |
| **Invocation** | `@agent-name` or natural language | Natural language triggers |
| **State** | Maintains personality throughout session | Stateless execution |
| **Context** | Pre-loaded domain knowledge | Progressive disclosure |
| **Output** | Consistent structured format | Task-specific output |

**When to use agents**: Complex research requiring specific methodology and consistent output format.

**When to use skills**: Recurring tasks, file operations, quick automated workflows.

## Agent Selection Guide

Choose the appropriate research agent based on your needs:

| Research Type | Agent | Best For |
|---------------|-------|----------|
| **Quick facts** | `perplexity-researcher` | Simple questions, current events, fact verification |
| **Comprehensive analysis** | `claude-researcher` | Complex topics, multi-angle investigation, detailed synthesis |
| **Strategic decisions** | `gemini-researcher` | Multi-stakeholder analysis, contradiction resolution, nuanced insights |

### Decision Flowchart

1. **Simple factual question?** → `perplexity-researcher` (2-5 min)
2. **Complex topic needing multiple angles?** → `claude-researcher` (5-15 min)
3. **Strategic decision needing stakeholder perspectives?** → `gemini-researcher` (10-30 min)

## Directory Structure

```
.claude/agents/
├── CLAUDE.md                   # This file - agent framework documentation
├── perplexity-researcher.md    # Quick web research agent
├── claude-researcher.md        # Comprehensive investigation agent
└── gemini-researcher.md        # Strategic analysis agent
```

## YAML Frontmatter Format

Every agent requires YAML frontmatter with the following structure:

```yaml
---
name: agent-name
description: Use this agent when [trigger conditions].
  Describe primary capabilities and use cases.
model: sonnet
color: yellow
permissions:
  allow:
    - "Bash"
    - "Read(*)"
    - "Edit(*)"
    - "WebSearch"
    - "WebFetch"
---
```

**Key Elements:**

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Lowercase with hyphens (e.g., `perplexity-researcher`) |
| `description` | Yes | Trigger conditions and capabilities |
| `model` | Yes | Claude model variant (typically `sonnet`) |
| `color` | Yes | Terminal color for agent output |
| `permissions.allow` | Yes | List of permitted tools |

**Permissions Explained:**
- `Bash` - Execute shell commands (for API calls)
- `Read(*)` - Read any file
- `Edit(*)` - Edit any file
- `WebSearch` - Native web search capability
- `WebFetch` - Fetch and process web pages

## API Key Configuration (Optional)

Research agents work without API keys using Claude's native WebSearch. Optional API keys enable enhanced functionality:

### Perplexity API (perplexity-researcher)

```bash
# Add to ~/.bashrc, ~/.zshrc, or environment
export PERPLEXITY_API_KEY="your-api-key-here"
```

**Benefits**: Real-time search with citations, specialised search models.
**Fallback**: WebSearch provides similar capability with fewer citation details.

### Google AI API (gemini-researcher)

```bash
# Add to ~/.bashrc, ~/.zshrc, or environment
export GOOGLE_AI_API_KEY="your-api-key-here"
```

**Benefits**: Access to Gemini models for alternative perspective generation.
**Fallback**: WebSearch provides comprehensive research without Gemini-specific features.

### Claude Researcher

No additional API key required. Uses Claude's native WebSearch capabilities directly.

## Agent Invocation Methods

### Direct Invocation
```
@perplexity-researcher Find the latest AI developments this week
@claude-researcher Investigate remote work productivity research
@gemini-researcher Analyse electric vehicle market from multiple stakeholder perspectives
```

### Natural Language Detection
Claude Code automatically routes research requests to appropriate agents based on complexity and requirements detected in the request.

## Agent Output Format

All research agents use a consistent structured output format:

```
**SUMMARY:** Brief overview of research task and scope
**ANALYSIS:** Research methodology, query strategy, sources evaluated
**ACTIONS:** Research steps taken, sources consulted, data gathered
**RESULTS:** Findings, insights, evidence discovered
**STATUS:** Research completeness, confidence level
**NEXT:** Follow-up research areas or recommendations
**COMPLETED:** [AGENT:agent-name] Task description
```

This format ensures:
- Consistent, scannable output across all agents
- Clear attribution of which agent completed the task
- Structured information for easy reference

## Cross-References

Related context in:
- `.claude/skills/research/` - Research skill with workflow variants
- `.claude/context/SYSTEM.md` - Context system loaded by agents
- `.claude/settings.json` - Agent registration (if applicable)

## Placeholder Patterns

Agents use the following environment variable for portable paths:

| Variable | Description | Usage |
|----------|-------------|-------|
| `$CLAUDE_PROJECT_DIR` | Project root directory | `"$CLAUDE_PROJECT_DIR"/.claude/context/SYSTEM.md` |

This ensures agents work across macOS, Linux, and WSL environments without hardcoded paths.

## Creating Custom Agents

To create a new agent:

1. **Create agent file**: `.claude/agents/your-agent.md`
2. **Add YAML frontmatter** with name, description, model, color, permissions
3. **Define identity section** with expertise and methodology
4. **Specify output format** for consistent responses
5. **Include context loading** instructions referencing `$CLAUDE_PROJECT_DIR`

**Template structure:**
```markdown
---
name: your-agent
description: Use this agent when [conditions]. [Capabilities].
model: sonnet
color: yellow
permissions:
  allow:
    - "Bash"
    - "Read(*)"
    - "Edit(*)"
    - "WebSearch"
    - "WebFetch"
---

# SESSION STARTUP REQUIREMENT

[Context loading instructions]

# OUTPUT FORMAT

[Structured output sections]

# IDENTITY

[Agent expertise and methodology]

# PROCESS FRAMEWORK

[Step-by-step methodology]
```

## Additional Notes

- Agents maintain personality and methodology throughout the session
- All agents use UK English spelling conventions
- Output format is mandatory for consistent, scannable results
- API keys are optional enhancements, not requirements
- Agents integrate with the research skill for workflow coordination
