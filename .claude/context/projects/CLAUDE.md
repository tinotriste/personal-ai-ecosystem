# Projects Context

<!--
This directory contains domain-specific briefing documents.
Each subdirectory represents a life domain with its own CLAUDE.md.
-->

## Purpose

This folder organises your life into distinct domains, each with its own context file. Your AI loads the relevant domain context when you mention topics related to that area.

## Active Domains

<!-- Updated by install.sh based on user selection -->

{{DOMAIN_LIST}}

## Domain Structure

Each domain folder contains:
- `CLAUDE.md` - Briefing document with priorities, tools, contacts, and projects

## Loading Strategy

- **On mention**: When you reference a domain topic, load that domain's CLAUDE.md
- **Cross-domain**: Some tasks span multiple domains - load relevant contexts as needed
- **Progressive**: Start with domain overview, dive deeper only when needed

## Adding New Domains

Use `DOMAIN_TEMPLATE.md` as a starting point:

1. Copy `DOMAIN_TEMPLATE.md` to a new folder (e.g., `finances/CLAUDE.md`)
2. Replace `{{DOMAIN}}` with your domain name
3. Fill in the sections with your context
4. Update this file's "Active Domains" section

## Domain Files

| Domain | Path | Focus |
|--------|------|-------|
| Work | `work/CLAUDE.md` | Professional projects, clients, deadlines |
| Personal Projects | `personal-projects/CLAUDE.md` | Side projects, creative work, portfolio |
| Health | `health/CLAUDE.md` | Fitness, nutrition, sleep, wellness |
| Learning | `learning/CLAUDE.md` | Courses, books, skill development |

## Notes

- Keep domain contexts focused and scannable
- Update priorities regularly (weekly review is ideal)
- Your AI references these to provide domain-aware assistance
