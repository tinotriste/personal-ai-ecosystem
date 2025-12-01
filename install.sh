#!/usr/bin/env bash
#
# Personal AI Ecosystem - Installation Script
#
# This script guides you through a 6-step onboarding flow to personalise
# your AI assistant. It processes template files and configures your
# selected domains.
#
# Usage: ./install.sh
#
# Requirements:
# - bash 3.2+ (macOS default) or bash 4+
# - sed (handles macOS and Linux differences automatically)
#

set -e

# =============================================================================
# CONFIGURATION
# =============================================================================

# Script location (where the repository is cloned)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="${SCRIPT_DIR}"

# Paths relative to BASE_DIR
CLAUDE_DIR="${BASE_DIR}/.claude"
CONTEXT_DIR="${CLAUDE_DIR}/context"
PROJECTS_DIR="${CONTEXT_DIR}/projects"
MEMORY_DIR="${CONTEXT_DIR}/memory"
OUTPUT_STYLES_DIR="${CLAUDE_DIR}/output-styles"
PERSONALITIES_DIR="${OUTPUT_STYLES_DIR}/personalities"

# Default values
DEFAULT_AI_NAME="Kai"
DEFAULT_PERSONALITY="3"

# AI name suggestions
AI_NAME_SUGGESTIONS="Kai, Aria, Atlas, Echo, Nova, Sage, Orion"

# Domain configuration
DOMAIN_NAMES=("Work" "Personal Projects" "Health & Fitness" "Learning")
DOMAIN_FOLDERS=("work" "personal-projects" "health" "learning")

# Personality configuration
PERSONALITY_FILES=("direct.md" "warm.md" "balanced.md")
PERSONALITY_NAMES=("Direct & efficient" "Warm & supportive" "Balanced")

# MBTI valid letters
MBTI_VALID_FIRST="EINS"
MBTI_VALID_SECOND="SFNT"
MBTI_VALID_THIRD="FTFP"
MBTI_VALID_FOURTH="JP"

# =============================================================================
# COLOUR DEFINITIONS
# =============================================================================

# Check if terminal supports colours
if [[ -t 1 ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    BOLD='\033[1m'
    NC='\033[0m' # No Colour
else
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    CYAN=''
    BOLD=''
    NC=''
fi

# =============================================================================
# PLATFORM DETECTION
# =============================================================================

# Detect OS and set sed in-place flag
# macOS sed requires an empty string argument after -i
# Linux sed does not
if [[ "$OSTYPE" == "darwin"* ]]; then
    SED_INPLACE=(-i '')
else
    SED_INPLACE=(-i)
fi

# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

# Print a step header with formatting
print_header() {
    local step_num="$1"
    local step_title="$2"
    echo ""
    echo -e "${BOLD}${BLUE}Step ${step_num}: ${step_title}${NC}"
    echo "────────────────────────────────────────"
}

# Print a success message in green
print_success() {
    echo -e "${GREEN}$1${NC}"
}

# Print an error message in red
print_error() {
    echo -e "${RED}Error: $1${NC}"
}

# Print an info message
print_info() {
    echo -e "${CYAN}$1${NC}"
}

# Print a warning message in yellow
print_warning() {
    echo -e "${YELLOW}$1${NC}"
}

# Cleanup function for graceful exit
cleanup() {
    echo ""
    echo -e "${YELLOW}Installation cancelled.${NC}"
    echo "No changes have been made to your files."
    echo "Run ./install.sh again when you're ready."
    exit 1
}

# Set trap for Ctrl+C
trap cleanup INT

# =============================================================================
# INPUT VALIDATION FUNCTIONS
# =============================================================================

# Prompt for required input with retry loop
# Usage: result=$(prompt_required "prompt text")
prompt_required() {
    local prompt_text="$1"
    local input=""

    while true; do
        read -r -p "${prompt_text} " input
        # Trim leading and trailing whitespace
        input=$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        if [[ -n "$input" ]]; then
            echo "$input"
            return 0
        else
            print_error "This field is required. Please enter a value."
        fi
    done
}

# Prompt with a default value
# Usage: result=$(prompt_with_default "prompt text" "default value")
prompt_with_default() {
    local prompt_text="$1"
    local default_value="$2"
    local input=""

    read -r -p "${prompt_text} [${default_value}]: " input
    # Trim leading and trailing whitespace
    input=$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    if [[ -n "$input" ]]; then
        echo "$input"
    else
        echo "$default_value"
    fi
}

# Prompt for a numbered selection
# Usage: result=$(prompt_selection "prompt text" "1" "3" "default")
# Arguments: prompt, min, max, default
prompt_selection() {
    local prompt_text="$1"
    local min_val="$2"
    local max_val="$3"
    local default_val="$4"
    local input=""

    while true; do
        read -r -p "${prompt_text} [${default_val}]: " input
        # Trim whitespace
        input=$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        # Use default if empty
        if [[ -z "$input" ]]; then
            echo "$default_val"
            return 0
        fi

        # Validate it's a number in range
        if [[ "$input" =~ ^[0-9]+$ ]] && [[ "$input" -ge "$min_val" ]] && [[ "$input" -le "$max_val" ]]; then
            echo "$input"
            return 0
        else
            print_error "Please enter a number between ${min_val} and ${max_val}."
        fi
    done
}

# Prompt for multiple selections (space or comma separated)
# Usage: prompt_multi_select selections_array
# Sets SELECTED_INDICES array with 0-based indices
prompt_multi_select() {
    local prompt_text="$1"
    local max_val="$2"
    local input=""

    while true; do
        read -r -p "${prompt_text} " input
        # Trim whitespace
        input=$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        if [[ -z "$input" ]]; then
            print_error "Please select at least one option."
            continue
        fi

        # Replace commas with spaces and normalise
        input=$(echo "$input" | tr ',' ' ' | tr -s ' ')

        # Validate each selection
        SELECTED_INDICES=()
        local valid=true

        for selection in $input; do
            if [[ "$selection" =~ ^[0-9]+$ ]] && [[ "$selection" -ge 1 ]] && [[ "$selection" -le "$max_val" ]]; then
                # Convert to 0-based index and add if not already present
                local idx=$((selection - 1))
                local already_added=false
                for existing in "${SELECTED_INDICES[@]}"; do
                    if [[ "$existing" -eq "$idx" ]]; then
                        already_added=true
                        break
                    fi
                done
                if [[ "$already_added" == false ]]; then
                    SELECTED_INDICES+=("$idx")
                fi
            else
                print_error "'${selection}' is not a valid option. Please enter numbers between 1 and ${max_val}."
                valid=false
                break
            fi
        done

        if [[ "$valid" == true ]] && [[ ${#SELECTED_INDICES[@]} -gt 0 ]]; then
            return 0
        fi
    done
}

# Validate MBTI type format
# Usage: if validate_mbti "INTJ"; then ... fi
validate_mbti() {
    local mbti="$1"

    # Empty is valid (optional field)
    if [[ -z "$mbti" ]]; then
        return 0
    fi

    # Must be exactly 4 characters, all uppercase letters
    if [[ ! "$mbti" =~ ^[A-Z]{4}$ ]]; then
        return 1
    fi

    # Validate each position
    local first="${mbti:0:1}"
    local second="${mbti:1:1}"
    local third="${mbti:2:1}"
    local fourth="${mbti:3:1}"

    # Position 1: E or I
    if [[ "$first" != "E" && "$first" != "I" ]]; then
        return 1
    fi

    # Position 2: S or N
    if [[ "$second" != "S" && "$second" != "N" ]]; then
        return 1
    fi

    # Position 3: T or F
    if [[ "$third" != "T" && "$third" != "F" ]]; then
        return 1
    fi

    # Position 4: J or P
    if [[ "$fourth" != "J" && "$fourth" != "P" ]]; then
        return 1
    fi

    return 0
}

# Validate AI name (alphanumeric with spaces allowed)
validate_ai_name() {
    local name="$1"

    # Empty will use default
    if [[ -z "$name" ]]; then
        return 0
    fi

    # Allow letters, numbers, and spaces
    if [[ "$name" =~ ^[a-zA-Z0-9\ ]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# =============================================================================
# FILE VALIDATION
# =============================================================================

# Check that all required template files exist
validate_files_exist() {
    local missing_files=()

    # Check main template files
    local required_files=(
        "${CONTEXT_DIR}/SYSTEM.md"
        "${OUTPUT_STYLES_DIR}/AI_NAME_TEMPLATE.md"
        "${PERSONALITIES_DIR}/direct.md"
        "${PERSONALITIES_DIR}/warm.md"
        "${PERSONALITIES_DIR}/balanced.md"
        "${MEMORY_DIR}/work_status.md"
        "${MEMORY_DIR}/journal.md"
        "${MEMORY_DIR}/learnings_log.md"
    )

    for file in "${required_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            missing_files+=("$file")
        fi
    done

    # Check domain CLAUDE.md files
    for folder in "${DOMAIN_FOLDERS[@]}"; do
        local domain_file="${PROJECTS_DIR}/${folder}/CLAUDE.md"
        if [[ ! -f "$domain_file" ]]; then
            missing_files+=("$domain_file")
        fi
    done

    if [[ ${#missing_files[@]} -gt 0 ]]; then
        print_error "Required template files are missing:"
        for file in "${missing_files[@]}"; do
            echo "  - ${file}"
        done
        echo ""
        echo "Please ensure you have cloned the complete repository."
        echo "If files are missing, try: git checkout ."
        return 1
    fi

    return 0
}

# =============================================================================
# PLACEHOLDER REPLACEMENT FUNCTIONS
# =============================================================================

# Replace a placeholder in a file
# Usage: replace_placeholder "file_path" "{{PLACEHOLDER}}" "value"
replace_placeholder() {
    local file_path="$1"
    local placeholder="$2"
    local value="$3"

    if [[ ! -f "$file_path" ]]; then
        print_error "File not found: ${file_path}"
        return 1
    fi

    # Escape special characters in the value for sed
    # Escape: / & \ and newlines
    local escaped_value
    escaped_value=$(printf '%s\n' "$value" | sed -e 's/[\/&]/\\&/g')

    # Escape the placeholder for sed (escape curly braces)
    local escaped_placeholder
    escaped_placeholder=$(printf '%s\n' "$placeholder" | sed -e 's/[{}]/\\&/g')

    # Perform the replacement
    sed "${SED_INPLACE[@]}" "s/${escaped_placeholder}/${escaped_value}/g" "$file_path"
}

# Replace a placeholder with content from another file
# Usage: replace_placeholder_with_file "target_file" "{{PLACEHOLDER}}" "source_file"
replace_placeholder_with_file() {
    local target_file="$1"
    local placeholder="$2"
    local source_file="$3"

    if [[ ! -f "$target_file" ]]; then
        print_error "Target file not found: ${target_file}"
        return 1
    fi

    if [[ ! -f "$source_file" ]]; then
        print_error "Source file not found: ${source_file}"
        return 1
    fi

    # Read the source file content
    local content
    content=$(cat "$source_file")

    # Create a temporary file with the replacement
    local temp_file
    temp_file=$(mktemp)

    # Use awk for multiline replacement (more reliable than sed for this)
    awk -v placeholder="$placeholder" -v content="$content" '
    {
        if (index($0, placeholder) > 0) {
            # Replace the placeholder with the content
            gsub(placeholder, content)
        }
        print
    }
    ' "$target_file" > "$temp_file"

    # Move the temp file to the target
    mv "$temp_file" "$target_file"
}

# Get current date in UK format (DD Month YYYY)
get_uk_date() {
    date "+%d %B %Y"
}

# =============================================================================
# WELCOME MESSAGE
# =============================================================================

print_welcome() {
    clear
    echo ""
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo -e "${BOLD}${BLUE}   Personal AI Ecosystem - Setup Wizard    ${NC}"
    echo -e "${BOLD}${BLUE}============================================${NC}"
    echo ""
    echo "Welcome! This wizard will help you personalise your AI assistant."
    echo "It takes about 2-3 minutes to complete."
    echo ""
    echo "You can press Ctrl+C at any time to cancel."
    echo ""
    echo -e "${CYAN}Let's get started...${NC}"
}

# =============================================================================
# STEP 1: ABOUT YOU
# =============================================================================

step_about_you() {
    print_header "1/6" "About You"
    echo ""
    echo "First, let's get to know you."
    echo ""

    USER_NAME=$(prompt_required "What's your name?")

    echo ""
    print_success "Great to meet you, ${USER_NAME}!"
}

# =============================================================================
# STEP 2: NAME YOUR AI
# =============================================================================

step_name_ai() {
    print_header "2/6" "Name Your AI"
    echo ""
    echo "Your AI assistant needs a name. Here are some suggestions:"
    echo -e "${CYAN}${AI_NAME_SUGGESTIONS}${NC}"
    echo ""
    echo "Or feel free to choose your own name."
    echo ""

    while true; do
        local input
        input=$(prompt_with_default "What would you like to name your AI assistant?" "${DEFAULT_AI_NAME}")

        if validate_ai_name "$input"; then
            AI_NAME="$input"
            break
        else
            print_error "Please use only letters, numbers, and spaces."
        fi
    done

    echo ""
    print_success "Your AI will be called ${AI_NAME}."
}

# =============================================================================
# STEP 3: PERSONALITY STYLE
# =============================================================================

step_personality_style() {
    print_header "3/6" "Personality Style"
    echo ""
    echo "How would you like ${AI_NAME} to communicate with you?"
    echo ""
    echo -e "  ${BOLD}1${NC} - Direct & efficient"
    echo "      Concise, action-oriented, challenges weak thinking"
    echo ""
    echo -e "  ${BOLD}2${NC} - Warm & supportive"
    echo "      Encouraging, empathetic, collaborative partnership"
    echo ""
    echo -e "  ${BOLD}3${NC} - Balanced (recommended)"
    echo "      Clear and professional, adapts tone to context"
    echo ""

    PERSONALITY_SELECTION=$(prompt_selection "Choose a style (1-3)" "1" "3" "${DEFAULT_PERSONALITY}")

    # Map selection to file (array is 0-indexed)
    local idx=$((PERSONALITY_SELECTION - 1))
    PERSONALITY_FILE="${PERSONALITY_FILES[$idx]}"
    PERSONALITY_NAME="${PERSONALITY_NAMES[$idx]}"

    echo ""
    print_success "${AI_NAME} will use the '${PERSONALITY_NAME}' communication style."
}

# =============================================================================
# STEP 4: YOUR DOMAINS
# =============================================================================

step_your_domains() {
    print_header "4/6" "Your Domains"
    echo ""
    echo "Which areas of your life would you like ${AI_NAME} to help with?"
    echo "Select the domains that matter to you."
    echo ""
    echo "  ${BOLD}1${NC} - Work"
    echo "      Client work, professional projects, deadlines"
    echo ""
    echo "  ${BOLD}2${NC} - Personal Projects"
    echo "      Side projects, hobbies, creative work"
    echo ""
    echo "  ${BOLD}3${NC} - Health & Fitness"
    echo "      Exercise, nutrition, sleep, wellness"
    echo ""
    echo "  ${BOLD}4${NC} - Learning"
    echo "      Courses, books, skill development"
    echo ""
    echo "Enter your selections separated by spaces or commas."
    echo -e "${CYAN}Example: 1 2 4  or  1,3${NC}"
    echo ""

    prompt_multi_select "Your domains:" "4"

    # Build the domain list and selected folders
    SELECTED_DOMAINS=()
    SELECTED_DOMAIN_FOLDERS=()
    DOMAIN_LIST=""

    for idx in "${SELECTED_INDICES[@]}"; do
        SELECTED_DOMAINS+=("${DOMAIN_NAMES[$idx]}")
        SELECTED_DOMAIN_FOLDERS+=("${DOMAIN_FOLDERS[$idx]}")

        if [[ -n "$DOMAIN_LIST" ]]; then
            DOMAIN_LIST="${DOMAIN_LIST}, ${DOMAIN_NAMES[$idx]}"
        else
            DOMAIN_LIST="${DOMAIN_NAMES[$idx]}"
        fi
    done

    echo ""
    print_success "You've selected: ${DOMAIN_LIST}"
}

# =============================================================================
# STEP 5: WORK CONTEXT
# =============================================================================

step_work_context() {
    print_header "5/6" "Work Context"
    echo ""
    echo "Tell ${AI_NAME} about your work so it can better assist you."
    echo ""

    USER_ROLE=$(prompt_required "What's your primary role?")
    echo ""

    echo "What tools and apps do you use daily?"
    echo -e "${CYAN}Example: VS Code, Notion, Slack, Figma, GitHub${NC}"
    echo ""
    USER_TOOLS=$(prompt_required "Your tools (comma-separated):")

    echo ""
    print_info "Note: Your tools will be referenced across all your selected domains."
    echo ""
    print_success "Got it! ${AI_NAME} knows you're a ${USER_ROLE}."
}

# =============================================================================
# STEP 6: DEEPER ALIGNMENT
# =============================================================================

step_deeper_alignment() {
    print_header "6/6" "Deeper Alignment (Optional)"
    echo ""
    echo "Understanding your personality type can help ${AI_NAME} communicate"
    echo "more effectively with you."
    echo ""
    echo "If you know your MBTI type, you can enter it below."
    echo "Don't know yours? Take a free test at:"
    echo -e "${CYAN}https://www.16personalities.com${NC}"
    echo ""
    echo "This is optional - press Enter to skip."
    echo ""

    while true; do
        read -r -p "Your personality type (e.g., INTJ): " input
        # Trim and uppercase
        input=$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr '[:lower:]' '[:upper:]')

        if [[ -z "$input" ]]; then
            PERSONALITY_TYPE=""
            echo ""
            print_info "Skipped - you can add this later if you like."
            break
        elif validate_mbti "$input"; then
            PERSONALITY_TYPE="$input"
            echo ""
            print_success "Noted! You're an ${PERSONALITY_TYPE}."
            break
        else
            print_error "That doesn't look like a valid MBTI type."
            echo "Valid format: 4 letters like INTJ, ENFP, ISTP, etc."
            echo "Each position: E/I, S/N, T/F, J/P"
            echo ""
        fi
    done
}

# =============================================================================
# PROCESS TEMPLATE FILES
# =============================================================================

process_templates() {
    echo ""
    echo -e "${BOLD}${BLUE}Processing your configuration...${NC}"
    echo "────────────────────────────────────────"
    echo ""

    local current_date
    current_date=$(get_uk_date)

    # Process SYSTEM.md
    echo "Configuring SYSTEM.md..."
    replace_placeholder "${CONTEXT_DIR}/SYSTEM.md" "{{USER_NAME}}" "$USER_NAME"
    replace_placeholder "${CONTEXT_DIR}/SYSTEM.md" "{{AI_NAME}}" "$AI_NAME"
    replace_placeholder "${CONTEXT_DIR}/SYSTEM.md" "{{DOMAIN_LIST}}" "$DOMAIN_LIST"
    print_success "  SYSTEM.md configured"

    # Process AI_NAME_TEMPLATE.md
    echo "Configuring ${AI_NAME}.md output style..."
    local template_file="${OUTPUT_STYLES_DIR}/AI_NAME_TEMPLATE.md"
    local personality_source="${PERSONALITIES_DIR}/${PERSONALITY_FILE}"

    # First, replace the personality block with file content
    replace_placeholder_with_file "$template_file" "{{PERSONALITY_BLOCK}}" "$personality_source"

    # Then replace other placeholders
    replace_placeholder "$template_file" "{{USER_NAME}}" "$USER_NAME"
    replace_placeholder "$template_file" "{{AI_NAME}}" "$AI_NAME"
    replace_placeholder "$template_file" "{{DOMAIN_LIST}}" "$DOMAIN_LIST"
    replace_placeholder "$template_file" "{{USER_TOOLS}}" "$USER_TOOLS"

    # Rename the file to AI_NAME.md
    local new_output_file="${OUTPUT_STYLES_DIR}/${AI_NAME}.md"
    mv "$template_file" "$new_output_file"
    print_success "  ${AI_NAME}.md created"

    # Process domain CLAUDE.md files for selected domains
    echo "Configuring domain briefings..."
    for folder in "${SELECTED_DOMAIN_FOLDERS[@]}"; do
        local domain_file="${PROJECTS_DIR}/${folder}/CLAUDE.md"
        if [[ -f "$domain_file" ]]; then
            replace_placeholder "$domain_file" "{{USER_TOOLS}}" "$USER_TOOLS"
            print_success "  ${folder}/CLAUDE.md configured"
        fi
    done

    # Process memory files with date
    echo "Setting up memory files..."
    replace_placeholder "${MEMORY_DIR}/work_status.md" "{{DATE}}" "$current_date"
    replace_placeholder "${MEMORY_DIR}/journal.md" "{{DATE}}" "$current_date"
    replace_placeholder "${MEMORY_DIR}/learnings_log.md" "{{DATE}}" "$current_date"
    print_success "  Memory files initialised with date: ${current_date}"

    echo ""
}

# =============================================================================
# DOMAIN CLEANUP
# =============================================================================

cleanup_domains() {
    echo "Cleaning up unused domains..."

    local removed_count=0

    for i in "${!DOMAIN_FOLDERS[@]}"; do
        local folder="${DOMAIN_FOLDERS[$i]}"
        local domain_name="${DOMAIN_NAMES[$i]}"
        local folder_path="${PROJECTS_DIR}/${folder}"

        # Check if this domain was selected
        local is_selected=false
        for selected_folder in "${SELECTED_DOMAIN_FOLDERS[@]}"; do
            if [[ "$folder" == "$selected_folder" ]]; then
                is_selected=true
                break
            fi
        done

        # Remove unselected domain folders
        if [[ "$is_selected" == false ]] && [[ -d "$folder_path" ]]; then
            rm -rf "$folder_path"
            print_info "  Removed: ${domain_name} (${folder}/)"
            ((removed_count++))
        fi
    done

    if [[ $removed_count -eq 0 ]]; then
        print_info "  All domains selected - nothing to remove."
    fi

    # Verify DOMAIN_TEMPLATE.md is preserved
    if [[ -f "${PROJECTS_DIR}/DOMAIN_TEMPLATE.md" ]]; then
        print_success "  DOMAIN_TEMPLATE.md preserved (for adding domains later)"
    fi

    echo ""
}

# =============================================================================
# COMPLETION SUMMARY
# =============================================================================

print_completion() {
    echo ""
    echo -e "${BOLD}${GREEN}============================================${NC}"
    echo -e "${BOLD}${GREEN}           Setup Complete!                  ${NC}"
    echo -e "${BOLD}${GREEN}============================================${NC}"
    echo ""
    echo -e "${BOLD}Your AI Configuration:${NC}"
    echo "  Name: ${AI_NAME}"
    echo "  Personality: ${PERSONALITY_NAME}"
    echo "  Domains: ${DOMAIN_LIST}"
    echo "  Tools: ${USER_TOOLS}"
    if [[ -n "$PERSONALITY_TYPE" ]]; then
        echo "  Your type: ${PERSONALITY_TYPE}"
    fi
    echo ""
    echo -e "${BOLD}What's next:${NC}"
    echo ""
    echo "  1. Start Claude Code in this directory:"
    echo -e "     ${CYAN}cd ${BASE_DIR} && claude${NC}"
    echo ""
    echo "  2. ${AI_NAME} will automatically load your context and preferences."
    echo ""
    echo "  3. Customise your domain briefings in:"
    echo -e "     ${CYAN}.claude/context/projects/[domain]/CLAUDE.md${NC}"
    echo ""
    echo "  4. Add new domains later using:"
    echo -e "     ${CYAN}.claude/context/projects/DOMAIN_TEMPLATE.md${NC}"
    echo ""
    echo -e "${BOLD}Files configured:${NC}"
    echo "  - .claude/context/SYSTEM.md"
    echo "  - .claude/output-styles/${AI_NAME}.md"
    for folder in "${SELECTED_DOMAIN_FOLDERS[@]}"; do
        echo "  - .claude/context/projects/${folder}/CLAUDE.md"
    done
    echo "  - .claude/context/memory/work_status.md"
    echo "  - .claude/context/memory/journal.md"
    echo "  - .claude/context/memory/learnings_log.md"
    echo ""
    echo -e "${GREEN}Enjoy working with ${AI_NAME}!${NC}"
    echo ""
}

# =============================================================================
# MAIN EXECUTION
# =============================================================================

main() {
    # Validate we're in the right directory
    if [[ ! -d "${CLAUDE_DIR}" ]]; then
        print_error "Cannot find .claude directory."
        echo "Please run this script from the personal-ai-ecosystem repository root."
        echo "Current directory: ${BASE_DIR}"
        exit 1
    fi

    # Validate all required files exist
    if ! validate_files_exist; then
        exit 1
    fi

    # Run the setup wizard
    print_welcome
    step_about_you
    step_name_ai
    step_personality_style
    step_your_domains
    step_work_context
    step_deeper_alignment

    # Process all template files
    process_templates

    # Clean up unused domain folders
    cleanup_domains

    # Show completion summary
    print_completion
}

# Run main function
main "$@"
