# Agents

## Overview

Agents are specialised AI personalities designed for specific types of tasks. While your main AI assistant handles general requests, agents bring focused expertise and methodology to particular challenges.

Think of agents as specialist colleagues you can call upon when you need deep expertise in a particular area.

## Quick Reference

| Agent | Purpose | Best For | Time Estimate |
|-------|---------|----------|---------------|
| `perplexity-researcher` | Quick web research and fact verification | Simple questions, current events | 2-5 minutes |
| `claude-researcher` | Comprehensive multi-query investigation | Complex topics, detailed analysis | 5-15 minutes |
| `gemini-researcher` | Strategic multi-perspective analysis | Big decisions, stakeholder views | 10-30 minutes |

## How to Invoke Agents

### Direct Invocation

Use the `@` symbol followed by the agent name:

```
@perplexity-researcher What are the latest AI developments this week?
@claude-researcher Investigate remote work productivity research
@gemini-researcher Analyse electric vehicle market from multiple perspectives
```

### Natural Language

Your AI automatically routes research requests to appropriate agents based on complexity:

```
"Quick question - what's the current price of gold?"
→ Routes to perplexity-researcher

"I need to understand remote work productivity comprehensively"
→ Routes to claude-researcher

"Help me think through this strategic decision from multiple angles"
→ Routes to gemini-researcher
```

## Choosing the Right Agent

### For Quick Facts
**Use: perplexity-researcher**

Best for:
- Simple factual questions
- Current events and news
- Price checks and statistics
- Quick verification

### For Deep Research
**Use: claude-researcher**

Best for:
- Complex topics requiring multiple angles
- Literature reviews
- Competitive analysis
- Detailed investigation

### For Strategic Decisions
**Use: gemini-researcher**

Best for:
- Multi-stakeholder analysis
- Weighing contradictory evidence
- Strategic planning
- Nuanced decision support

## Agent Output Format

All research agents provide structured output:

- **Summary:** Brief overview of what was researched
- **Analysis:** Methodology and sources evaluated
- **Results:** Findings and insights discovered
- **Status:** Confidence level and completeness
- **Next:** Follow-up recommendations if relevant

This consistent format makes results easy to scan and reference.

## API Keys (Optional)

Research agents work without additional API keys using built-in web search. Optional API keys can enhance functionality:

- **Perplexity API:** Provides real-time search with detailed citations
- **Google AI API:** Enables Gemini model for alternative perspectives

Your AI will use built-in capabilities if API keys aren't configured.

## Related Features

- [Skills](./skills.md) - The research skill coordinates with agents
- [Memory](./memory.md) - Agent findings can update your memory files
