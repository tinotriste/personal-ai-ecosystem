<!--
================================================================================
CONTACTS - Contact Database
================================================================================

HOW THIS FILE WORKS:
- This is your canonical contact database for personal and professional relationships
- Add contacts as they're introduced through conversations with your AI
- Organise contacts into categories that reflect your life domains
- Include relevant context about relationships, not just contact details

IMPORTANT - EXPLICIT UPDATES ONLY:
- This file does NOT update automatically from conversations
- You must explicitly request additions ("add this contact", "save their details")
- This differs from other memory files which update autonomously
- This gives you full control over what contact information is stored

WHEN TO CHECK THIS FILE:
- When someone is mentioned in conversation and contact details would help
- When you need to reference relationship context for professional interactions
- When cross-referencing contacts with project folders

HOW YOUR AI USES THIS:
- References contact details when you mention people by name
- Understands relationship context to provide appropriate responses
- Links contacts to relevant projects and domains
- Never shares contact details externally without your explicit request

================================================================================
-->

# Contacts

**Purpose**: Canonical contact database for personal and professional relationships. Single source of truth for contact information.

**Last Updated**: {{DATE}}

---

## Family

<!--
Family contacts go here - immediate and extended family members.

Entry format:
**Name** - Relationship
- Phone: [number]
- Email: [address]
- Birthday: [date if relevant]
- Context: [any relevant notes about this person]

Example (remove when adding real contacts):
**Parent Name** - Mum/Dad
- Phone: +44 xxxx xxxxxx
- Email: example@email.com
- Birthday: 1st January
- Context: Prefers phone calls over text
-->

---

## Friends

<!--
Personal friendships go here - close friends, family friends, social connections.

Entry format:
**Name** - How you know them
- Phone: [number]
- Email: [address]
- Context: [how you met, shared interests, relevant notes]

Example (remove when adding real contacts):
**Friend Name** - University friend
- Phone: +44 xxxx xxxxxx
- Email: example@email.com
- Context: Known since 2010, shared interest in [hobby]
-->

---

## Professional - Colleagues

<!--
Workplace relationships go here - current and former colleagues, team members, managers.

Entry format:
**Name** - Role / Organisation
- Email: [work email]
- Phone: [if appropriate]
- Context: [working relationship, projects together, expertise area]

Example (remove when adding real contacts):
**Colleague Name** - Senior Developer, Company Ltd
- Email: colleague@company.com
- Context: Collaborates on backend projects, expert in API design
-->

---

## Professional - Clients

<!--
Client relationships go here - current and past clients, key contacts at client organisations.

Entry format:
**Organisation Name** - Brief description
- **Contact Name** - Role
  - Email: [email]
  - Phone: [number]
- Context: [project history, relationship notes, preferences]

Example (remove when adding real contacts):
**Client Company Ltd** - Marketing agency client
- **Contact Name** - Marketing Director
  - Email: contact@clientcompany.com
- Context: Engaged for website redesign project, prefers email communication
-->

---

## Other Professional

<!--
Other professional contacts go here - vendors, partners, industry contacts, service providers, advisors.

Entry format:
**Name** - Role / Organisation
- Email: [email]
- Phone: [number]
- Context: [how you know them, what they help with]

Example (remove when adding real contacts):
**Professional Name** - Accountant, Accounting Firm Ltd
- Email: accountant@firm.com
- Phone: +44 xxxx xxxxxx
- Context: Handles annual tax returns, available for quarterly reviews
-->

---

## Notes

### Update Workflow

This file updates only when you explicitly request it:

1. **Adding contacts**: "Add [name] to my contacts" or "Save their details"
2. **Updating details**: "Update [name]'s phone number to..."
3. **Adding context**: "Note that [name] prefers email communication"
4. **Removing contacts**: "Remove [name] from my contacts"

Your AI will confirm before making changes and show you the updated entry.

### Categories

- **Family**: Immediate and extended family members
- **Friends**: Personal friendships and social connections
- **Professional - Colleagues**: Workplace relationships across current and past roles
- **Professional - Clients**: Client contacts and key stakeholders
- **Other Professional**: Vendors, partners, advisors, industry contacts

Categories can be customised to reflect your life domains. Add new categories as needed.

### Cross-References

Contacts can link to other parts of your AI's context system:

**Project folder references:**
- `.claude/context/projects/[project-name]/` - Link contacts to relevant project folders
- Example: "See `.claude/context/projects/website-redesign/` for project details"

**Domain context references:**
- `.claude/context/domains/[domain-name].md` - Link contacts to domain contexts
- Example: "Primary contact for Work domain matters"

**Memory file references:**
- Contacts mentioned in `work_status.md` sessions can be cross-referenced here
- Relevant learnings about relationships can be noted in `learnings_log.md`
