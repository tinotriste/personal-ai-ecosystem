# Domain-Specific Research Workflow

**Purpose**: Context-aware research routing that leverages user's domain expertise and existing knowledge base for efficient, targeted investigation within their specific domains.

**When to use**:
- Research questions clearly within user's specialised domains
- Need to integrate findings with existing domain knowledge
- Require domain-specific quality standards and context
- Want to leverage established domain frameworks and methodologies

**Time estimate**: Variable (3-20 minutes based on domain complexity)
**Output**: Domain-optimised research integrated with existing knowledge base

## Workflow Steps

### 1. Domain Identification and Context Loading
**Identify Primary Domain**:

Check if research topic relates to user's installed domains. Reference:
- Project context files in `.claude/context/projects/`
- Domain configuration from installation

**Load Domain Context**:
```
Read relevant domain context:
- `.claude/context/projects/[domain]/CLAUDE.md`
- Related methodology files if applicable
```

### 2. Domain-Aware Research Strategy

**For Each User Domain**:
- Leverage existing domain knowledge and benchmarks
- Apply domain-specific quality standards
- Focus on domain-relevant sources and perspectives
- Consider domain constraints and requirements

**Generic Domain Strategy** (if no specific domain applies):
- Use general research best practices
- Apply standard source credibility hierarchy
- Focus on user's expressed needs and context

### 3. Research Routing by Complexity

**Domain-Complexity Matrix Routing**:

| Complexity | Quick Facts | Comprehensive Analysis | Strategic Planning |
|------------|------------|----------------------|-------------------|
| Simple | quick-research.md | - | - |
| Medium | - | comprehensive-investigation.md | - |
| Complex | - | - | strategic-analysis.md |

**Selection Logic**:
- **Quick Domain Facts**: Current updates, basic competitive info, recent developments
- **Comprehensive Domain Analysis**: Benchmarking, feature comparison, evaluation studies
- **Strategic Domain Planning**: Market positioning, long-term strategy, technology adoption

### 4. Domain-Specific Research Execution

**Execute with Domain Context**:

```
Research Topic: [specific question]

Domain Context:
- Domain: [identified domain or generic]
- Existing knowledge: [relevant context from domain files]
- Quality standards: [domain-specific requirements]

Research Requirements:
- Focus on [domain-relevant aspects]
- Apply [domain-specific lens] to all findings
- Consider [domain constraints and requirements]
- Integrate with [existing domain knowledge]
```

### 5. Domain Knowledge Integration

**Integrate Research with Existing Knowledge**:
- Compare findings to existing domain understanding
- Validate research against domain expertise
- Identify new insights that extend domain knowledge
- Recommend updates to domain context if significant

## Example Domain Research Patterns

### Professional Domain Research
**Question**: "What are the latest developments in [professional area]?"

**Domain Context Integration**:
- Leverage existing professional knowledge
- Apply professional standards and best practices
- Focus on practical implementation within domain
- Consider professional constraints and requirements

**Expected Domain-Optimised Output**: Research findings specifically tailored to professional context with practical implementation recommendations.

### Project Domain Research
**Question**: "Research options for [project-related decision]"

**Domain Context Integration**:
- Apply existing project requirements and constraints
- Consider project strategic priorities
- Focus on solutions that fit project architecture
- Integrate with existing project decisions

**Expected Domain-Optimised Output**: Research findings aligned with project context and existing decisions.

### General Domain Research
**Question**: "Find information about [topic unrelated to specific domains]"

**Approach**:
- Use standard research methodologies
- Apply general source credibility standards
- Focus on user's expressed needs
- Route to appropriate workflow based on complexity

**Expected Output**: General research findings following quality standards.

## Domain Knowledge Integration Patterns

### Existing Knowledge to Leverage
- Project context and constraints
- Previously captured learnings
- Established preferences and standards
- Related previous research

### Integration Approach
- Compare research findings to existing knowledge
- Apply domain expertise to validate or challenge insights
- Integrate recommendations with existing frameworks
- Consider domain-specific constraints and opportunities

## Placeholder Pattern

**{{USER_DOMAINS}}**: This workflow references user's installed domains from configuration.

After installation, replace with actual domain list from:
- `.claude/context/projects/` directory structure
- Installation configuration

Example replacement:
```
User's Domains:
- Project A: [description and context location]
- Project B: [description and context location]
- Personal: [areas of personal focus]
```

## Success Criteria

**Domain Research Effectiveness**:
- Appropriate workflow selection based on domain complexity
- Effective integration of domain context and existing knowledge
- Domain-specific quality standards applied appropriately
- Recommendations aligned with domain strategic priorities
- Practical applicability within domain constraints

**Knowledge Integration Quality**:
- Existing domain knowledge properly leveraged
- Research findings validated against domain expertise
- Recommendations consistent with domain principles
- Implementation considers domain-specific factors
- Follow-up research needs identified within domain context

## Domain Handoff and Follow-up

**After Domain Research Complete**:
- Update relevant context files with significant findings
- Integrate insights into domain knowledge base
- Plan implementation within domain workflow
- Schedule follow-up research if needed
- Note any changes to domain understanding
