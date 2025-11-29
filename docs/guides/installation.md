# Installation Guide

**Estimated time: 15-20 minutes**

This guide walks you through installing and configuring your personal AI ecosystem.

## Prerequisites

Before you begin, ensure you have:

### Operating System
- **macOS** (10.15 or later)
- **Linux** (any modern distribution)
- **Windows** users: Install [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install) first

### Required Software

**Git** - For cloning the repository

Check if installed:
```bash
git --version
```

Expected output:
```
git version 2.39.0
```

If not installed:
- macOS: `xcode-select --install`
- Linux: `sudo apt install git` or equivalent for your distribution

**Terminal access** - You'll need to run commands in a terminal

- macOS: Use Terminal.app or iTerm2
- Linux: Use your preferred terminal
- Windows/WSL: Use the WSL terminal

**Claude Code CLI** - The AI assistant that powers your ecosystem

Install Claude Code from [claude.ai/claude-code](https://claude.ai/claude-code) and follow their authentication instructions.

Verify installation:
```bash
claude --version
```

## Step 1: Clone the Repository

Open your terminal and navigate to where you want to install:

```bash
cd ~/Code  # or your preferred directory
```

Clone the repository:

```bash
git clone https://github.com/tinotriste/personal-ai-ecosystem.git
```

Expected output:
```
Cloning into 'personal-ai-ecosystem'...
remote: Enumerating objects: 150, done.
remote: Counting objects: 100% (150/150), done.
remote: Compressing objects: 100% (100/100), done.
Receiving objects: 100% (150/150), 50.00 KiB | 1.00 MiB/s, done.
Resolving deltas: 100% (50/50), done.
```

Enter the directory:

```bash
cd personal-ai-ecosystem
```

## Step 2: Run the Installation Script

Start the setup wizard:

```bash
./install.sh
```

The wizard guides you through 6 steps:

### Step 1/6: About You

```
Step 1: About You
────────────────────────────────────────

First, let's get to know you.

What's your name? Alex
Great to meet you, Alex!
```

Enter your name. This is how your AI will address you.

### Step 2/6: Name Your AI

```
Step 2: Name Your AI
────────────────────────────────────────

Your AI assistant needs a name. Here are some suggestions:
Kai, Aria, Atlas, Echo, Nova, Sage, Orion

Or feel free to choose your own name.

What would you like to name your AI assistant? [Kai]:
```

Press Enter to accept the default (Kai) or type a different name.

### Step 3/6: Personality Style

```
Step 3: Personality Style
────────────────────────────────────────

How would you like Kai to communicate with you?

  1 - Direct & efficient
      Concise, action-oriented, challenges weak thinking

  2 - Warm & supportive
      Encouraging, empathetic, collaborative partnership

  3 - Balanced (recommended)
      Clear and professional, adapts tone to context

Choose a style (1-3) [3]:
```

Choose how you'd like your AI to communicate. Option 3 (Balanced) works well for most people.

### Step 4/6: Your Domains

```
Step 4: Your Domains
────────────────────────────────────────

Which areas of your life would you like Kai to help with?

  1 - Work
      Client work, professional projects, deadlines

  2 - Personal Projects
      Side projects, hobbies, creative work

  3 - Health & Fitness
      Exercise, nutrition, sleep, wellness

  4 - Learning
      Courses, books, skill development

Enter your selections separated by spaces or commas.
Example: 1 2 4  or  1,3

Your domains: 1 2 4
You've selected: Work, Personal Projects, Learning
```

Select the areas you want your AI to help with. You can add more domains later.

### Step 5/6: Work Context

```
Step 5: Work Context
────────────────────────────────────────

Tell Kai about your work so it can better assist you.

What's your primary role? Product Designer

What tools and apps do you use daily?
Example: VS Code, Notion, Slack, Figma, GitHub

Your tools (comma-separated): Figma, Notion, Slack, Linear

Got it! Kai knows you're a Product Designer.
```

This helps your AI understand your professional context.

### Step 6/6: Deeper Alignment (Optional)

```
Step 6: Deeper Alignment (Optional)
────────────────────────────────────────

Understanding your personality type can help Kai communicate
more effectively with you.

If you know your MBTI type, you can enter it below.

This is optional - press Enter to skip.

Your personality type (e.g., INTJ):
```

Optional step. Press Enter to skip if you don't know or prefer not to share your MBTI type.

## Step 3: Review Configuration

After completing the wizard, you'll see a summary:

```
============================================
           Setup Complete!
============================================

Your AI Configuration:
  Name: Kai
  Personality: Balanced
  Domains: Work, Personal Projects, Learning
  Tools: Figma, Notion, Slack, Linear

What's next:

  1. Start Claude Code in this directory:
     cd /Users/alex/Code/personal-ai-ecosystem && claude

  2. Kai will automatically load your context and preferences.

  3. Customise your domain briefings in:
     .claude/context/projects/[domain]/CLAUDE.md

  4. Add new domains later using:
     .claude/context/projects/DOMAIN_TEMPLATE.md

Files configured:
  - .claude/context/SYSTEM.md
  - .claude/output-styles/Kai.md
  - .claude/context/projects/work/CLAUDE.md
  - .claude/context/projects/personal-projects/CLAUDE.md
  - .claude/context/projects/learning/CLAUDE.md
  - .claude/context/memory/work_status.md
  - .claude/context/memory/journal.md
  - .claude/context/memory/learnings_log.md

Enjoy working with Kai!
```

## Step 4: Verify Installation

Start Claude Code to verify everything works:

```bash
claude
```

Your AI should greet you and demonstrate awareness of:
- Your name
- Today's date
- Your selected domains
- The context system structure

Try a simple request:
```
What do you know about my setup?
```

Your AI should reference the configuration from your installation.

## Step 5: Customise Domain Briefings

Each domain has a CLAUDE.md briefing file you can customise:

```
.claude/context/projects/
├── work/
│   └── CLAUDE.md          # Your work context
├── personal-projects/
│   └── CLAUDE.md          # Your personal projects
├── learning/
│   └── CLAUDE.md          # Your learning goals
└── DOMAIN_TEMPLATE.md     # Template for adding domains
```

Open these files and add:
- Current projects and priorities
- Key contacts or stakeholders
- Important deadlines
- Preferences specific to that domain

See the [Adding Domains guide](./adding-domains.md) for detailed instructions.

## Troubleshooting

### Permission Denied

If you see "Permission denied" when running install.sh:

```bash
chmod +x install.sh
./install.sh
```

### Command Not Found: git

Install git first:
- macOS: `xcode-select --install`
- Linux: `sudo apt install git`

### Hooks Not Working

Verify hooks are registered in `.claude/settings.json`. The file should contain a "hooks" section.

For more issues, see the [Troubleshooting guide](../troubleshooting.md).

## Next Steps

- [Adding Domains](./adding-domains.md) - Add more areas for your AI to help with
- [Creating Skills](./creating-skills.md) - Build custom workflows
- [Customising Personality](./customising-personality.md) - Fine-tune how your AI communicates
