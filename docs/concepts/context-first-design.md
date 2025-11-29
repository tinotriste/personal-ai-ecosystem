# Context-First Design

## What Is Context-First Design?

Context-first design is the principle that an AI assistant's effectiveness depends primarily on the quality and relevance of the context it receives. Rather than relying solely on the AI's general knowledge, you provide structured information about your specific situation, projects, and preferences.

Think of context as the briefing you'd give a new team member on their first day. The better the briefing, the more useful they can be from the start.

## Why Context Matters More Than Prompting

Many people focus on crafting the perfect prompt - finding the right words to get the AI to do what they want. While prompt quality matters, context quality matters more.

Consider the difference:

**Prompt-focused approach:**
"Write me a project status update"

**Context-first approach:**
The AI already knows:
- What projects you're working on
- Your current status on each
- Your communication style preferences
- Who the update is for

With rich context, even a simple request produces relevant, personalised results.

## The Context Engineering Mindset

Context engineering is the practice of thoughtfully designing what information your AI has access to, when it loads, and how it connects.

Key principles:

1. **Structured over scattered** - Organised context files beat random notes
2. **Relevant over comprehensive** - Load what's needed, not everything
3. **Updated over static** - Context should reflect your current reality
4. **Connected over isolated** - Context pieces should link to each other

## How Your AI Uses Context

Your personal AI ecosystem provides context through several mechanisms:

### 1. SYSTEM.md - The Foundation
A high-level overview of your context system, loaded automatically at the start of every prompt. This tells your AI where to find everything else.

### 2. Domain Briefings
Detailed context for specific areas of your life (work, health, learning). Loaded when you mention those domains.

### 3. Memory Files
Your work status, journal, and learnings - loaded to understand your history and current state.

### 4. Skills
Specialised context for particular tasks like research, meeting notes, or weekly reviews.

### 5. Output Style
Your preferences for how the AI communicates with you.

## Building Better Context

Good context answers these questions for your AI:

- **Who are you?** Your name, role, what you care about
- **What are you working on?** Current projects and priorities
- **How do you work?** Tools you use, communication preferences
- **What matters now?** Current focus, blockers, upcoming deadlines
- **What have you learned?** Patterns, preferences, past insights

The better your context answers these questions, the more useful your AI becomes.

## Context vs. Training

An important distinction: providing context is not the same as training an AI. Training changes the AI's underlying capabilities. Context informs a specific conversation.

Your personal AI ecosystem works entirely through context - your information stays in your files, available when needed, fully under your control.

## Related Concepts

- [The CLAUDE.md Pattern](./claude-md-pattern.md) - How context files are structured
- [Progressive Disclosure](./progressive-disclosure.md) - How context loads on-demand
- [Memory Management](./memory-management.md) - How your AI remembers across sessions
