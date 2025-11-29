# Customising Personality

**Estimated time: 5-10 minutes**

This guide shows you how to adjust how your AI communicates with you. During installation, you chose a personality style (Direct, Warm, or Balanced). You can refine or change this at any time.

## Understanding Output Styles

Your AI's personality is defined in a file called `[AI Name].md` in the output-styles directory:

```
.claude/output-styles/Kai.md
```

Replace "Kai" with whatever name you chose for your AI.

This file controls:
- Tone and communication style
- Response patterns and formulas
- What to say and what to avoid
- How to adapt to different situations

## Changing Personality Style

### Option 1: Edit the Existing File

Open your AI's output style file:

```bash
open .claude/output-styles/Kai.md
# or use your preferred text editor
```

Find the "Personality" section and modify it. The available personality blocks are included as comments at the bottom of the file.

### Option 2: Replace with a Different Style

The three personality variants are stored in:

```
.claude/output-styles/personalities/
├── direct.md      # Direct & efficient style
├── warm.md        # Warm & supportive style
└── balanced.md    # Balanced style (default)
```

To switch styles:

1. Open your AI's output style file
2. Find the personality section
3. Copy the content from your preferred personality file
4. Replace the existing personality section

## Customising Individual Elements

You can mix and match elements from different styles or create your own.

### Adjusting Tone

In the personality section, modify the foundational traits:

**More direct:**
```markdown
**Foundational traits**:
- **Direct**: Get to the point. No fluff.
- **Challenging**: Call out weak logic or vague thinking.
- **Action-oriented**: Focus on next steps.
```

**More supportive:**
```markdown
**Foundational traits**:
- **Encouraging**: Acknowledge progress and effort.
- **Patient**: Take time to explain context.
- **Collaborative**: Use "we" and "let's" language.
```

### Changing Voice Rules

The "Say this / Avoid this" sections define specific language patterns:

```markdown
**Say this:**
- "Here's what I'd suggest..."
- "The priority here is..."
- "Next step: [specific action]"

**Avoid this:**
- Unnecessarily harsh criticism
- Vague non-answers
- Being preachy or lecturing
```

Add phrases you like hearing and phrases you want avoided.

### Adding Situational Adaptation

You can add rules for how your AI adjusts to different contexts:

```markdown
**Tone Adaptation:**
- **User is stuck**: More supportive, break down the problem
- **User is procrastinating**: More direct, focus on action
- **User is tired**: More concise, simpler suggestions
- **User is excited**: Match their energy, explore ideas
```

## Customising the AI Name

Your AI's name was set during installation. To change it:

1. Rename the output style file:
   ```bash
   mv .claude/output-styles/Kai.md .claude/output-styles/Nova.md
   ```

2. Update references within the file:
   - Find and replace the old name with the new name
   - Update the "You are [Name]" line at the top

3. Update `.claude/context/SYSTEM.md`:
   - Find and replace the old name with the new name

4. Update `.claude/context/memory/CLAUDE.md`:
   - Find and replace the old name with the new name

5. Restart your Claude Code session for changes to take effect.

## Communication Preferences

### Language Settings

Your AI uses UK English by default. To change spellings:

Find this section:
```markdown
### Language
**ENFORCE UK ENGLISH**: Use British spellings...
```

Modify to your preference:
```markdown
### Language
**Use American English**: Use American spellings...
- Correct: optimization, behavior, analyze, favorite
```

### Response Length

Add guidance about response length:

```markdown
### Response Length
- Default to concise responses (2-3 paragraphs max)
- Use bullet points for lists over 3 items
- Ask before providing detailed explanations
```

Or for more detail:
```markdown
### Response Length
- Provide thorough explanations by default
- Include context and reasoning
- Use examples to illustrate points
```

### Emoji Usage

Control emoji usage:

```markdown
### Style Notes
- Never use emojis in responses
- Keep communication professional
```

Or:
```markdown
### Style Notes
- Use occasional emojis to add warmth
- Keep emojis minimal and appropriate
```

## Domain-Specific Personality

Your AI can behave differently in different domains. Add to your domain CLAUDE.md files:

```markdown
## Communication Style for This Domain

In this domain, please:
- Be more formal and precise
- Avoid casual language
- Include sources when making claims
```

This overrides general personality settings when working in that domain.

## Testing Changes

After making changes:

1. Start a new conversation with your AI
2. Ask a general question to see the new style in action
3. Try different types of requests to test adaptation

If something doesn't feel right, edit the file and try again. Changes take effect immediately in new conversations.

## Reverting to Defaults

If you want to start fresh:

1. Copy the original template:
   ```bash
   cp .claude/output-styles/personalities/balanced.md .claude/output-styles/Kai.md
   ```

2. Re-run the personalisation parts of setup by editing the file to add your placeholders back.

Or re-run the installation script to start over completely:
```bash
./install.sh
```

## Tips for Effective Customisation

### Start Small

Make one or two changes, test them, then refine. Large changes are harder to evaluate.

### Be Specific

Vague guidance gives vague results. "Be more friendly" is less useful than "Use encouraging phrases like 'great progress' and 'let's build on that'".

### Match Your Preferences

Your AI should feel natural to work with. If something feels off, adjust it.

### Remember Context Matters

Internal communication (your AI talking to you) differs from external content (things your AI helps you write for others). Personality affects internal communication only.

## Related Guides

- [Adding Domains](./adding-domains.md) - Domain-specific personality adjustments
- [Output Styles feature](../features/output-styles.md) - Understanding output styles
