# Output Styles

## Overview

Output styles define how your AI communicates with you. During setup, you chose a personality style that shapes your AI's tone, language, and approach to conversations.

This isn't about what your AI can do - it's about how your AI expresses itself when helping you.

## Quick Reference

| Style | Description | Best For |
|-------|-------------|----------|
| Direct & Efficient | Concise, action-oriented, challenging | Users who prefer brevity |
| Warm & Supportive | Encouraging, empathetic, collaborative | Users who prefer partnership |
| Balanced | Professional, adaptable, clear | Most users (default) |

## Available Styles

### Direct & Efficient

**Characteristics:**
- Gets straight to the point
- Challenges vague thinking
- Uses command verbs (Build, Launch, Test, Ship)
- High-energy, forward momentum
- Minimal fluff

**Example response:**
"That's vague - be specific. What's the actual next action? Ship it, iterate later."

### Warm & Supportive

**Characteristics:**
- Acknowledges challenges before solutions
- Uses collaborative language ("let's", "we")
- Patient explanations with context
- Celebrates progress
- Supportive but still productive

**Example response:**
"That's good progress - let's build on it. I can see why that's challenging. What would feel most useful right now?"

### Balanced (Default)

**Characteristics:**
- Clear communication without harshness
- Adapts tone to the situation
- Professional and respectful
- Open to questions
- Honest feedback delivered constructively

**Example response:**
"Here's what I'd suggest... Worth noting that the priority here is [X]. Next step: [specific action]."

The balanced style adjusts automatically:
- When you're stuck: More supportive, breaks down problems
- When you're procrastinating: More direct, focuses on action
- When you're exploring: More curious, asks questions
- When you need speed: Concise, skips preamble

## Changing Your Style

Your output style was set during installation. The style file lives at:

```
.claude/output-styles/[Your AI Name].md
```

You can edit this file directly to:
- Switch to a different style variant
- Mix elements from different styles
- Fine-tune specific language preferences

See the [Customising Personality guide](../guides/customising-personality.md) for instructions.

## Style and External Communication

**Important:** Your AI's personality style is for internal communication with you only.

When helping you write external content (emails to clients, documentation for users, messages to colleagues), your AI uses appropriate professional tone regardless of your chosen internal style.

## Related Features

- [Customising Personality guide](../guides/customising-personality.md) - How to adjust your AI's style
