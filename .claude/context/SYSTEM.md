<!--
================================================================================
SYSTEM.md - Kai Context System Overview
================================================================================

This file is loaded automatically via the load_context hook on every prompt.
It explains the structure and purpose of Kai's context system.

PLACEHOLDERS (replaced by install.sh during setup):
- {{USER_NAME}} - Your name (e.g., "Alex")
- {{AI_NAME}} - Your AI's name (e.g., "Kai")
- {{DOMAIN_LIST}} - Your selected domains (e.g., "Work, Personal Projects, Health")

USAGE:
- This file provides the AI with understanding of the context system structure
- Operational sections (Progressive Disclosure, Memory Management, etc.) guide AI behaviour
- Edit this file to add new domains or change context organisation

================================================================================
-->

# {{AI_NAME}} Context System Overview

This file explains the structure and purpose of {{AI_NAME}}'s context system for {{USER_NAME}}.

## Directory Purpose

- **`.claude/context/memory/`**: Learnings about {{USER_NAME}}, preferences, current work status
- **`.claude/context/projects/`**: Domain-specific knowledge for {{DOMAIN_LIST}}
- **`.claude/context/methodologies/`**: How to approach different types of problems
- **`.claude/context/philosophy/`**: Core principles that guide all decisions
- **`.claude/context/tools/`**: Documentation for CLI tools and MCPs
- **`.claude/context/working/`**: Temporary collaboration space

## Progressive Disclosure Pattern

DO NOT load all context upfront. Instead:
1. Read SYSTEM.md (this file) - always loaded by hook
2. Use skills to load specific context on-demand
3. Use Glob/Grep to search context when needed
4. Load only what's relevant to the current task

## Memory Management

YOU are responsible for:
- Reading context as needed
- Updating `.claude/context/memory/` files with learnings
- Maintaining `.claude/context/memory/work_status.md` with progress
- Creating new context files for new domains
- Documenting antipatterns

## Context Discovery

- To find relevant context: `glob "context/**/*.md"`
- To search content: `grep "pattern" context/`
- Skills will tell you which files to load

## Project Structure

<!--
This section will be populated with your domain-specific projects.
Each domain has its own CLAUDE.md briefing file explaining its purpose and priorities.
-->

### {{DOMAIN_LIST}}

Your selected domains are organised in `.claude/context/projects/`:

- Each domain has a `CLAUDE.md` briefing file
- Load the relevant briefing when working on domain-specific tasks
- Key file pattern: `.claude/context/projects/[domain]/CLAUDE.md`

## Cross-Domain Insights

Always look for connections:
- Patterns from one domain that apply to another
- Skills that work across multiple areas
- Learnings that could benefit other contexts

## File Loading Priority

When starting a task:
1. Check `.claude/context/memory/work_status.md` for current context
2. Load relevant project `.claude/context/projects/[domain]/CLAUDE.md` file
3. Load methodologies from `.claude/context/methodologies/` if needed
4. Use skills for specialised workflows

## Important Notes

- This file is loaded automatically via `load_context` hook on every prompt
- Memory updates happen autonomously via `memory_reminder` hook
- Skills enable progressive disclosure (load context on-demand)
- All paths are relative to the repository root
