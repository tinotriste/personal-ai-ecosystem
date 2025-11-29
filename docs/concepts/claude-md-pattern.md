# The CLAUDE.md Pattern

## What Is the CLAUDE.md Pattern?

CLAUDE.md files are context briefings placed throughout your directory structure. When your AI assistant enters a directory, it can read the CLAUDE.md file there to understand the purpose and context of that area.

Think of CLAUDE.md files as welcome signs at the entrance to different rooms in a building. Each sign tells visitors what happens in that room, what's important to know, and where to find what they need.

## Why Use This Pattern?

Traditional AI assistants start each conversation fresh, with no memory of your projects, preferences, or working style. You end up explaining the same things repeatedly.

CLAUDE.md files solve this by providing structured context that the AI can discover naturally:

1. **Self-documenting structure** - Your AI understands your project layout by exploring it
2. **Domain expertise** - Each area can have specialised knowledge relevant to its purpose
3. **Reduced repetition** - You explain things once in writing, and your AI reads it when needed
4. **Progressive discovery** - Context loads only when your AI navigates to that area

## Where CLAUDE.md Files Appear

Your personal AI ecosystem uses CLAUDE.md files in several locations:

- **`.claude/context/projects/[domain]/CLAUDE.md`** - Briefings for each life domain (work, health, learning)
- **`.claude/skills/CLAUDE.md`** - Overview of available skills and how they work
- **`.claude/hooks/CLAUDE.md`** - Documentation for automation hooks
- **`.claude/agents/CLAUDE.md`** - Information about specialised agent personalities

Each file explains what that directory contains, when to reference it, and how its contents connect to other parts of the system.

## What Goes in a CLAUDE.md File

A typical CLAUDE.md file includes:

- **Purpose** - What this area is for and when to use it
- **Quick Reference** - A summary table of contents or key items
- **When to Load** - Clear triggers for when this context becomes relevant
- **Structure** - How files in this area are organised
- **Cross-References** - Links to related context elsewhere

The format stays consistent, making it easy for both you and your AI to navigate.

## How Your AI Uses These Files

When you ask about a particular domain or task, your AI:

1. Recognises the topic from your request
2. Navigates to the relevant directory
3. Reads the CLAUDE.md file to understand the context
4. Uses that knowledge to provide informed assistance

This happens automatically through the progressive disclosure pattern - context arrives exactly when it's needed.

## Creating Your Own CLAUDE.md Files

When you add new domains or project areas, you can create CLAUDE.md files to brief your AI:

1. Create a new directory for your domain
2. Add a CLAUDE.md file with the standard sections
3. Your AI will discover and use it automatically

See the [Adding Domains guide](../guides/adding-domains.md) for step-by-step instructions.

## Related Concepts

- [Progressive Disclosure](./progressive-disclosure.md) - How context loads on-demand
- [Context-First Design](./context-first-design.md) - Why context engineering matters
