# Kai

**Your personal operating system.**

---

## Overview

Kai is an open-source framework for building a personal AI ecosystem using Claude Code. It provides a structured approach to creating an AI assistant that truly understands your context, remembers your preferences, and grows with you over time.

### Who is this for?

Kai is designed for tech-adjacent users who are comfortable with basic terminal operations. If you want to harness the power of AI assistance without building everything from scratch, this framework gives you a head start.

### What does it do?

- **Context Engineering**: Maintains awareness of your work, projects, and priorities across sessions
- **Memory Management**: Tracks your learnings, preferences, and ongoing tasks
- **Domain Organisation**: Separates different areas of your life (work, personal projects, health, learning) with tailored context
- **Skill System**: Reusable workflows for common tasks like weekly reviews, research, and meeting notes
- **Progressive Disclosure**: Loads context on-demand rather than overwhelming every conversation

---

## Prerequisites

Before installing Kai, ensure you have:

- **Operating System**: macOS or Linux (Windows users: WSL required)
- **Git**: Installed and configured
- **Claude Code CLI**: Installed and authenticated with your Anthropic account

---

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/tinotriste/personal-ai-ecosystem.git
cd personal-ai-ecosystem
```

### 2. Run the installation script

```bash
./install.sh
```

The setup wizard guides you through personalising your AI assistant in about 2-3 minutes.

### 3. Start using Kai

Once installed, run Claude Code in the repository directory:

```bash
claude
```

Your personalised AI assistant will be ready to help, with full awareness of your context and preferences.

---

## Repository Structure

```
personal-ai-ecosystem/
├── README.md                 # This file
├── install.sh                # Interactive setup script
├── .claude/                  # Claude Code configuration directory
│   ├── agents/               # Subagent definitions for specialised tasks
│   ├── commands/             # Custom slash commands
│   ├── context/              # Context files and templates
│   │   ├── memory/           # User memory files (work status, journal, learnings)
│   │   └── projects/         # Domain-specific knowledge and briefings
│   ├── hooks/                # Event-triggered scripts
│   ├── output-styles/        # AI personality definitions
│   ├── scripts/              # Utility scripts
│   └── skills/               # Reusable workflow definitions
└── docs/                     # Documentation
```

### Directory Purposes

| Directory | Purpose |
|-----------|---------|
| `agents/` | Define specialised subagents for tasks like research |
| `commands/` | Create custom slash commands for frequent actions |
| `context/memory/` | Store ongoing work status, journal entries, and learnings |
| `context/projects/` | Organise context by life domains (work, health, learning) |
| `hooks/` | Automate actions on session start, prompt submit, etc. |
| `output-styles/` | Define your AI's communication style and personality |
| `scripts/` | Utility scripts for maintenance and setup |
| `skills/` | Package complex workflows as reusable skills |

---

## Documentation

Comprehensive documentation is available in the `docs/` folder:

### Concepts

Understand the foundational ideas behind the framework:

- [Progressive Disclosure](docs/concepts/progressive-disclosure.md) - Why context loads on-demand
- [The CLAUDE.md Pattern](docs/concepts/claude-md-pattern.md) - How context files provide information
- [Memory Management](docs/concepts/memory-management.md) - How your AI remembers across sessions
- [Context-First Design](docs/concepts/context-first-design.md) - Why context engineering matters

### Features

Learn about what Kai can do:

- [Skills](docs/features/skills.md) - Reusable workflows for common tasks
- [Memory](docs/features/memory.md) - Persistent knowledge about you and your work
- [Hooks](docs/features/hooks.md) - Automated event-driven actions
- [Agents](docs/features/agents.md) - Specialised AI personalities for specific tasks
- [Output Styles](docs/features/output-styles.md) - How your AI communicates

### Guides

Step-by-step tutorials for common tasks:

- [Installation](docs/guides/installation.md) - Complete setup instructions
- [Adding Domains](docs/guides/adding-domains.md) - Add new areas for AI assistance
- [Creating Skills](docs/guides/creating-skills.md) - Build custom workflows
- [Customising Personality](docs/guides/customising-personality.md) - Adjust AI communication style

### Support

- [Troubleshooting](docs/troubleshooting.md) - Common issues and solutions

---

## Contributing

Contributions are welcome! Please see the contributing guidelines *(coming soon)* for details on how to submit pull requests, report issues, and suggest improvements.

---

## Licence

*Licence to be determined.*

---

## Acknowledgements

Kai is built on top of [Claude Code](https://claude.ai/claude-code) by Anthropic. This framework represents patterns and practices developed through extensive personal use.
