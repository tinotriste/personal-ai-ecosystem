---
name: research
description: Comprehensive research capability from quick fact-finding to strategic multi-perspective analysis. USE WHEN user says 'research', 'investigate', 'find information', 'analyse [topic]', 'competitive analysis', 'market research', or requests investigation capabilities.
---

# Research Skill

## When to Activate This Skill
- "Research the latest information on X"
- "Investigate [topic] comprehensively"
- "Find information about [subject]"
- "Analyse competitors in [market]"
- "What's the current state of [industry/technology]"
- "Conduct market research for [domain]"
- User requests investigation or analysis capabilities
- Need multi-perspective analysis for strategic planning

## Workflows

Available workflows in `workflows/` subdirectory:
- `quick-research.md` - Fast fact-finding (2-5 min)
- `comprehensive-investigation.md` - Multi-query systematic analysis (5-15 min)
- `strategic-analysis.md` - Multi-perspective strategic planning (10-30 min)
- `domain-research.md` - Context-aware routing for user's installed domains

## Phase 6 Enhancement Note

**Current Version**: Claude-only research patterns (simplified)

**After Phase 6 (Agents)**: Enhanced multi-agent research workflows will be available, including specialised research agents for different investigation types:
- Fast web research agents
- Deep analysis agents
- Multi-perspective synthesis agents

The workflow structure remains the same; agent orchestration will be added.

## Core Workflow Overview

### Phase 1: Research Scope Assessment
**Workflow:** Decision tree routing to appropriate workflow

**Key actions:**
- Identify research complexity and required depth
- Determine if domain-specific context applies
- Select optimal workflow based on investigation requirements

### Phase 2: Research Execution
**Workflow:** Route to selected research workflow

**Quick Research**: Fast fact-finding for simple questions
**Comprehensive Investigation**: Multi-query approach for complex topics
**Strategic Analysis**: Multi-perspective synthesis for strategic decisions

### Phase 3: Results Integration
**Workflow:** Quality validation and synthesis

**Key actions:**
- Validate findings against quality standards
- Cross-reference key claims across sources
- Integrate insights with existing knowledge
- Provide actionable recommendations

## Workflows Decision Tree

1. **Simple factual question** -> `quick-research.md`
2. **Multi-faceted investigation** -> `comprehensive-investigation.md`
3. **Strategic/multi-perspective analysis** -> `strategic-analysis.md`
4. **Domain-specific research** -> `domain-research.md`

## Research Quality Standards

**Source Credibility Hierarchy**:
1. **Primary Sources**: Official websites, direct statements, original research
2. **Academic Sources**: Peer-reviewed journals, university publications
3. **Industry Sources**: Trade publications, professional reports
4. **News Sources**: Reputable journalism, verified reporting
5. **Secondary Sources**: Aggregators, wikis (use with caution)

**Validation Requirements**:
- Minimum 2-3 independent sources for factual claims
- Check publication date and currency
- Note any conflicts of interest or bias
- Distinguish correlation from causation
- Identify limitations in available data

**Output Standards**:
- Evidence-based conclusions with source attribution
- Clear confidence levels and limitations noted
- Actionable recommendations where appropriate
- Structured presentation for easy consumption
- UK English spellings and conventions

## Key Principles

1. **Progressive complexity**: Match research depth to question complexity
2. **Quality standards**: Multi-source validation with credible attribution
3. **Domain integration**: Leverage existing knowledge where applicable
4. **Structured output**: Consistent formatting for easy consumption
5. **Efficiency focus**: Avoid over-researching simple questions

## Context References

For domain context: `context/projects/[domain]/CLAUDE.md`
For memory integration: `context/memory/work_status.md`

## Success Criteria

**Research Effectiveness**:
- Appropriate workflow selection based on research scope
- Comprehensive coverage of investigation requirements
- High-quality source diversity and validation
- Clear, actionable insights and recommendations
- Efficient time-to-insight ratio

## Example Usage Patterns

**Triggered by Natural Language**:
- "Research the latest updates on X" -> `quick-research.md`
- "Analyse the competitive landscape for Y" -> `comprehensive-investigation.md`
- "Investigate the strategic implications of Z" -> `strategic-analysis.md`

**Skill Activation Phrases**:
- "I need research on..."
- "What's the latest information about..."
- "Can you investigate..."
- "Analyse the market for..."
- "Find comprehensive information on..."
- "What are the implications of..."

## Token Efficiency

**Progressive Research Strategy**:
- Start with appropriate scope (avoid over-researching simple questions)
- Leverage existing context to focus on research gaps
- Apply structured workflows to prevent scope creep

**Estimated Token Savings**:
- **vs. Manual Research**: 80-95% reduction in research and synthesis time
- **vs. Unstructured Investigation**: 85-90% improvement in systematic coverage
