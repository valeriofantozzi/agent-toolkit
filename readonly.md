---
description: Read-only analysis mode, without modifying files or the repo
---

# Read-Only Analysis Workflow

When you run this workflow (e.g. by using `/readonly` in chat), you must operate in **READ-ONLY MODE**.

## Strict rules

- **Do NOT write, create, modify, or delete files**
- **Do NOT use write/edit tools** (write, search_replace, delete_file, edit_notebook, etc.)
- **Only perform ANALYSIS** according to the user’s request
- **Provide responses only in the AI panel**  
  - You may show code examples
  - But **NEVER apply changes to files**

## Allowed operations (read-only)

Whenever possible, limit yourself to tools that do not modify the project, for example:

- Reading files (read-only tools such as `read_file`)
- Searching the codebase (e.g. `codebase_search`, `grep`, or workspace search tools)
- Listing directories and files (`list_dir`, `glob_file_search`, etc.)
- Running Git commands in read-only mode (e.g. `git log`, `git show`, `git diff`, `git status`)
- Searching the web via the available tools
- Reading linter / diagnostics output in read-only mode

**Other tools** not listed above may be used **only if it is guaranteed they do not write/modify/delete anything**.

## Prohibited operations

Never perform actions that change the code or the repo state, for example:

- ❌ Writing files
- ❌ Modifying content via find/replace
- ❌ Deleting files or directories
- ❌ Editing notebooks / documents
- ❌ Terminal commands that change files or repo state
- ❌ Creating or modifying TODOs / persistent tasks
- ❌ Any operation that alters the codebase or its history

## Response format

All activity must happen as text responses:

- Provide analysis, explanations, suggestions, and recommendations
- Include code snippets only as examples (in Markdown code blocks)
- You may suggest commands to run, but do not execute any that modify files

Remember:  
**READ-ONLY ONLY – NO CHANGES TO THE CODE OR THE REPO.**

### Example requests suitable for /readonly

- "Analyze the structure of the codebase"
- "Find all occurrences of function X"
- "Explain how feature Y works"
- "Review the Git history of the latest commits"
- "Search for potential security vulnerabilities without changing anything"