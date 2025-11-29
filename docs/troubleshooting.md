# Troubleshooting

This guide covers common issues and their solutions. If you don't find your issue here, see [Getting Help](#getting-help) at the bottom of this page.

## Installation Issues

### Permission denied when running install.sh

**Problem:** You see "Permission denied" or "bash: ./install.sh: Permission denied"

**Solution:**
```bash
chmod +x install.sh
./install.sh
```

This grants execute permission to the script.

---

### Command not found: git

**Problem:** Terminal says "git: command not found"

**Solution:**

**macOS:**
```bash
xcode-select --install
```
Follow the prompts to install command line tools.

**Linux (Debian/Ubuntu):**
```bash
sudo apt update
sudo apt install git
```

**Linux (Fedora):**
```bash
sudo dnf install git
```

---

### Cannot find .claude directory

**Problem:** You see "Cannot find .claude directory" when running install.sh

**Solution:**

Ensure you're running the script from the repository root:
```bash
cd personal-ai-ecosystem
./install.sh
```

If the directory is truly missing, re-clone the repository:
```bash
cd ..
rm -rf personal-ai-ecosystem
git clone https://github.com/tinotriste/personal-ai-ecosystem.git
cd personal-ai-ecosystem
./install.sh
```

---

### Placeholders not replaced

**Problem:** You see `{{AI_NAME}}` or similar text instead of your actual values

**Solution:**

1. Check that install.sh completed successfully (should show "Setup Complete!")
2. If it failed partway through, re-run:
   ```bash
   git checkout .  # Reset files to original state
   ./install.sh    # Run setup again
   ```

---

### Spaces in directory path

**Problem:** Installation fails with errors about paths, especially if your username or folder names contain spaces

**Solution:**

Move the repository to a path without spaces:
```bash
# Instead of /Users/John Smith/Code/personal-ai-ecosystem
# Use /Users/johnsmith/Code/personal-ai-ecosystem
```

Or ensure you're using the repository from a path without spaces in parent directories.

---

## Context Loading Issues

### SYSTEM.md not found

**Problem:** Your AI doesn't seem to know about your context system

**Solution:**

1. Verify the file exists:
   ```bash
   ls -la .claude/context/SYSTEM.md
   ```

2. Check the hooks are registered in `.claude/settings.json`:
   ```bash
   cat .claude/settings.json | grep -A5 "hooks"
   ```

3. Restart Claude Code to reload hooks

---

### AI doesn't know my domains

**Problem:** Your AI doesn't recognise your projects or domains

**Solution:**

1. Check domain briefings exist:
   ```bash
   ls .claude/context/projects/
   ```

2. Verify CLAUDE.md files in each domain:
   ```bash
   cat .claude/context/projects/work/CLAUDE.md
   ```

3. Mention the domain explicitly:
   ```
   "Let's talk about my work projects"
   ```

---

### Hooks not firing

**Problem:** Session start messages don't appear, or context doesn't load

**Solution:**

1. Check hook files are executable:
   ```bash
   ls -la .claude/hooks/
   # Files should show 'x' in permissions: -rwxr-xr-x
   ```

2. Make hooks executable if needed:
   ```bash
   chmod +x .claude/hooks/*.sh
   ```

3. Verify hooks are registered in settings.json:
   ```bash
   cat .claude/settings.json
   ```

4. Check for syntax errors in hook scripts:
   ```bash
   bash -n .claude/hooks/session_start_init.sh
   ```

---

### Context appears but is outdated

**Problem:** Your AI references old information from context files

**Solution:**

1. Update the relevant context files with current information
2. Start a new conversation (old conversations cache context)
3. Verify changes saved correctly by viewing the files

---

## Memory Issues

### work_status.md growing too large

**Problem:** You receive warnings about work_status.md exceeding 700 lines

**Solution:**

1. Archive old sessions to history:
   ```bash
   mkdir -p .claude/context/memory/history/work-status
   ```

2. Move old content (sessions older than 7 days) to archive files:
   ```bash
   # Create monthly archive
   touch .claude/context/memory/history/work-status/2024-11.md
   ```

3. Cut and paste old sessions from work_status.md to the archive file

4. Keep only recent sessions (last 7 days) in the main file

---

### Memory not updating automatically

**Problem:** Your AI doesn't update work_status.md after completing tasks

**Solution:**

1. Check the memory reminder hook is registered:
   ```bash
   cat .claude/settings.json | grep -A3 "memory_reminder"
   ```

2. Verify the hook file exists and is executable:
   ```bash
   ls -la .claude/hooks/user_prompt_submit_memory_reminder.sh
   ```

3. Explicitly ask for updates:
   ```
   "Update my work status with what we accomplished"
   ```

---

### Journal entries not appearing

**Problem:** Weekly reviews don't create journal entries

**Solution:**

1. Check journal.md exists and is writable:
   ```bash
   ls -la .claude/context/memory/journal.md
   ```

2. Use the weekly-review skill explicitly:
   ```
   "Let's do my weekly review"
   ```

3. Verify your AI has write permissions (should be default)

---

## Platform-Specific Issues

### macOS: Gatekeeper warnings

**Problem:** macOS warns about unidentified developer or blocks script execution

**Solution:**

1. For the installation script, you may need to:
   - Right-click the file and select "Open" instead of double-clicking
   - Or run from terminal directly: `./install.sh`

2. If files are quarantined:
   ```bash
   xattr -d com.apple.quarantine install.sh
   ```

---

### macOS: Permissions issues in newer versions

**Problem:** Scripts fail due to system integrity protection

**Solution:**

Ensure you're working in a user-accessible directory (not system locations):
```bash
# Good locations
~/Code/personal-ai-ecosystem
~/Projects/personal-ai-ecosystem

# Avoid
/usr/local/personal-ai-ecosystem
/Applications/personal-ai-ecosystem
```

---

### Linux: Shell compatibility

**Problem:** Scripts fail with syntax errors on Linux

**Solution:**

Ensure bash is available and used:
```bash
which bash
# Should show: /bin/bash or /usr/bin/bash
```

Run scripts explicitly with bash:
```bash
bash install.sh
```

---

### Linux: Date validation hook not working

**Problem:** The validate_dates hook doesn't run or produces errors

**Solution:**

This hook uses macOS-specific date commands. On Linux, it's designed to exit silently. This is expected behaviour - date validation simply won't run, but everything else works normally.

---

### WSL: Path issues

**Problem:** Scripts fail to find files or paths are incorrect

**Solution:**

1. Work within the Linux filesystem, not Windows paths:
   ```bash
   # Good
   cd ~/projects/personal-ai-ecosystem

   # Avoid
   cd /mnt/c/Users/name/personal-ai-ecosystem
   ```

2. Clone the repository fresh within WSL:
   ```bash
   cd ~
   git clone https://github.com/tinotriste/personal-ai-ecosystem.git
   ```

---

### WSL: Line ending issues

**Problem:** Scripts fail with errors about `\r` or unexpected characters

**Solution:**

Convert line endings from Windows (CRLF) to Unix (LF):
```bash
# Install dos2unix if needed
sudo apt install dos2unix

# Convert all scripts
find .claude/hooks -name "*.sh" -exec dos2unix {} \;
dos2unix install.sh
```

---

### WSL: Hooks timeout

**Problem:** Hooks take too long and timeout in WSL

**Solution:**

WSL can be slower than native systems. If hooks timeout:

1. Check for Windows Defender scanning interference
2. Ensure WSL 2 is used (faster than WSL 1):
   ```bash
   wsl --list --verbose
   # Should show VERSION 2
   ```

3. Consider increasing timeout values in settings.json if needed

---

## Skills Issues

### Skills not activating from natural language

**Problem:** Saying "weekly review" doesn't activate the skill

**Solution:**

1. Check the skill's trigger phrases match what you're saying:
   ```bash
   head -20 .claude/skills/weekly-review/SKILL.md
   # Look for "USE WHEN user says..."
   ```

2. Try the exact trigger phrase from the skill file

3. Invoke explicitly:
   ```
   "Activate the weekly-review skill"
   ```

---

### Custom skill not working

**Problem:** A skill you created doesn't activate or work correctly

**Solution:**

1. Verify YAML frontmatter is valid:
   - Name is lowercase with hyphens
   - Description includes "USE WHEN user says..."
   - YAML starts with `---` and ends with `---`

2. Check file location is correct:
   ```bash
   ls .claude/skills/your-skill-name/SKILL.md
   ```

3. Test with explicit invocation first:
   ```
   "Activate the your-skill-name skill"
   ```

---

## Getting Help

If you can't find a solution here:

### Gather Information

Before seeking help, collect:

1. **Your operating system** (macOS version, Linux distribution, or WSL version)
2. **Error messages** (exact text or screenshot)
3. **Steps to reproduce** (what you did before the error)
4. **Relevant file contents** (sanitise any personal information)

### GitHub Issues

Report issues at the project's GitHub repository. Include the information gathered above.

### Community Support

Check for community discussions in the project's GitHub Discussions or Issues sections. Others may have encountered similar problems.

### Self-Debugging Tips

1. **Check file permissions:** Most issues relate to permissions
2. **Restart Claude Code:** Many issues resolve with a fresh session
3. **Read error messages carefully:** They often point directly to the problem
4. **Simplify:** Test with minimal configuration to isolate the issue
5. **Reset and retry:** Sometimes a fresh clone and reinstall is fastest

---

## Common Misunderstandings

### "My AI forgot everything"

Each conversation starts fresh in terms of what's loaded into active memory. Your context files persist, but your AI loads them as needed rather than keeping everything active constantly. This is intentional (see [Progressive Disclosure](./concepts/progressive-disclosure.md)).

### "The installation changed my files"

Yes, this is expected. The installation script replaces placeholder values (like `{{AI_NAME}}`) with your actual choices. Your customisations are preserved in the configured files.

### "Skills seem slow to activate"

Skills load on-demand when triggered. The first time you use a skill in a session, it loads the relevant context. This is faster than loading everything at startup.

### "My AI's personality seems different sometimes"

Your AI adapts its communication style to the situation (if using the Balanced personality). This is intentional - more supportive when you're stuck, more direct when action is needed.
