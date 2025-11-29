# Progressive Disclosure

## What Is Progressive Disclosure?

Progressive disclosure is a design pattern where information is revealed only when it's needed. Instead of loading everything at once, your AI assistant loads context on-demand as it becomes relevant to your current task.

Think of it like a well-organised library. Rather than bringing every book to your desk before you start reading, you fetch only the books you need for your current research. When you move to a different topic, you return those books and fetch new ones.

## Why Does This Matter?

When you chat with an AI assistant, every piece of context counts towards a "token budget" - essentially, how much information the AI can hold in its working memory at once. Loading unnecessary context wastes this budget and can make responses slower and less focused.

With progressive disclosure, your AI assistant:

1. **Starts lean** - Only essential context loads at the beginning of each conversation
2. **Loads on-demand** - Additional context arrives when you mention specific topics or projects
3. **Stays focused** - The AI maintains sharp awareness of what's relevant right now
4. **Works efficiently** - Token usage drops dramatically (up to 60x more efficient)

## How It Works in Practice

When you start a conversation, your AI loads only the SYSTEM.md file - a brief overview of your context structure. This takes just a moment and uses minimal resources.

As you work, the system recognises what you need:

- **Mention a project?** The relevant domain briefing loads automatically
- **Ask for a weekly review?** The weekly-review skill activates with its specific instructions
- **Need your recent work history?** The memory files load to provide that context

Each piece of context loads only when relevant, then releases when no longer needed.

## Example in Action

**Without progressive disclosure:**
"Load everything about Alex, all their projects, all their preferences, all their skills, all their history..." (thousands of tokens used before you even ask a question)

**With progressive disclosure:**
"Load SYSTEM.md" (50 tokens) -> You ask about work -> "Load work domain briefing" (200 tokens) -> You finish -> Context releases

The result? Faster responses, more focused assistance, and an AI that stays sharp throughout longer sessions.

## Related Concepts

- [The CLAUDE.md Pattern](./claude-md-pattern.md) - How context files provide information
- [Context-First Design](./context-first-design.md) - Why context engineering matters
- [Memory Management](./memory-management.md) - How your AI remembers across sessions
