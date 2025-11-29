# Adding Domains

**Estimated time: 10-15 minutes per domain**

This guide shows you how to add new domains to your personal AI ecosystem. Domains are areas of your life where your AI can provide specialised assistance.

## Understanding Domains

Domains separate different contexts in your life. The default domains are:

- **Work** - Professional projects, client work, deadlines
- **Personal Projects** - Side projects, hobbies, creative work
- **Health & Fitness** - Exercise, nutrition, wellness
- **Learning** - Courses, books, skill development

You might want to add domains for:

- A specific major project
- A new hobby or interest
- Family or relationship planning
- Financial management
- A volunteer role or community involvement

Each domain gets its own briefing file that tells your AI what's important in that area.

## Step 1: Create the Domain Directory

Navigate to the projects directory:

```bash
cd .claude/context/projects/
```

Create a new directory for your domain:

```bash
mkdir your-domain-name
```

Use lowercase with hyphens for the folder name. For example:
- `side-business`
- `garden-project`
- `book-writing`
- `home-renovation`

## Step 2: Create the CLAUDE.md File

Copy the domain template:

```bash
cp DOMAIN_TEMPLATE.md your-domain-name/CLAUDE.md
```

Or create a new file directly:

```bash
touch your-domain-name/CLAUDE.md
```

## Step 3: Write Your Domain Briefing

Open the CLAUDE.md file in your preferred text editor and add your domain context.

### Template Structure

```markdown
# [Domain Name]

## Overview

Brief description of what this domain covers and why it matters to you.

## Current Status

What's happening in this area right now:
- Active projects or initiatives
- Current phase or stage
- Key priorities

## Key Information

Important context your AI should know:
- People involved (if relevant)
- Tools or resources you use
- Important constraints or deadlines
- Preferences specific to this domain

## What Help Looks Like

How your AI can best assist in this domain:
- Types of tasks you need help with
- Questions you often ask
- Decisions you need to make

## Related Files

Links to other relevant context:
- Memory files if applicable
- Related skills to use
- Connected domains
```

### Example: Garden Project Domain

```markdown
# Garden Project

## Overview

Transforming our backyard into a productive vegetable garden and relaxation space. This is a multi-season project combining food growing with outdoor living improvement.

## Current Status

- **Phase:** Planning and soil preparation
- **Timeline:** Started October 2024, first harvest expected Spring 2025
- **Budget:** Remaining $800 of $2,000 allocated

## Key Information

**Growing conditions:**
- Zone 8b climate
- South-facing garden
- Clay soil (adding compost to improve)

**What we're growing:**
- Tomatoes, courgettes, beans (summer)
- Kale, spinach, lettuce (cool season)
- Herbs: basil, rosemary, thyme

**Resources:**
- Main reference: "Vegetable Gardening" by Smith
- Local nursery: Green Valley Garden Centre
- Tracking in: Notion garden database

## What Help Looks Like

- Research plant varieties and timing
- Remind me of seasonal tasks
- Help plan garden layout
- Track what's planted where
- Troubleshoot problems (pests, diseases)

## Related Files

- Monthly garden tasks in work_status.md
- Seasonal learnings in learnings_log.md
```

### Example: Side Business Domain

```markdown
# Side Business - Handmade Pottery

## Overview

Running a small pottery business alongside my main job. I make and sell ceramic bowls and vases through an online shop and local markets.

## Current Status

- **Active:** Yes, about 10 hours per week
- **Focus:** Building inventory for holiday markets
- **Next milestone:** Winter craft fair (December 15)

## Key Information

**Products:**
- Ceramic bowls (best seller)
- Decorative vases
- Custom commissions (limited)

**Pricing:**
- Bowls: $35-60 depending on size
- Vases: $45-120 depending on complexity
- Commissions: $75/hour minimum

**Sales channels:**
- Etsy shop: CeramicsByAlex
- Monthly local market (first Saturday)
- Instagram: @alex.ceramics

**Tools:**
- Order tracking: Spreadsheet
- Finances: QuickBooks Self-Employed
- Design ideas: Pinterest board

## What Help Looks Like

- Calculate pricing for new products
- Draft product descriptions
- Plan market inventory
- Research trends and ideas
- Manage order tracking

## Related Files

- Sales targets in work_status.md
- Marketing ideas in learnings_log.md
```

## Step 4: Update SYSTEM.md (Optional)

If you want your AI to automatically know about the new domain, you can add it to the domain list in `.claude/context/SYSTEM.md`.

Find this line:
```markdown
### {{DOMAIN_LIST}}
```

And add your new domain to the list below it. However, your AI will also discover new domains automatically when you mention them or work within those directories.

## Step 5: Test the Domain

Start a conversation with your AI and mention the domain:

```
"Let's talk about my garden project"
```

Your AI should:
1. Recognise this as a domain reference
2. Load the relevant CLAUDE.md file
3. Respond with awareness of your domain context

## Tips for Effective Domain Briefings

### Keep It Current

Update your domain briefings when things change:
- Projects complete or shift focus
- Priorities change
- New tools or resources are added

### Be Specific

Vague briefings give vague help. Include:
- Concrete names, dates, numbers
- Specific tools and resources
- Clear priorities and preferences

### Use Natural Language

Write as if you're briefing a new team member. Avoid jargon unless your AI needs to understand it for that domain.

### Connect Domains

If domains relate to each other, mention the connection:
- "Work overlaps with learning when studying for certifications"
- "Garden project influences health through fresh vegetables"

## Removing Domains

If you no longer need a domain:

1. Delete the domain directory:
   ```bash
   rm -rf .claude/context/projects/domain-name/
   ```

2. Your AI will no longer load that context.

Consider archiving instead of deleting if you might return to the domain later.

## Related Guides

- [Creating Skills](./creating-skills.md) - Create domain-specific skills
- [Customising Personality](./customising-personality.md) - Adjust how your AI communicates
