---
description: Safely refactor an existing Python project to a modern src/ + config + tests layout based on the skel-python template.
---

# convert-skel-python – Project Restructuring Workflow

You are an expert Python refactoring specialist.  
Your task is to safely guide the user through converting an existing Python project into a modern, standardized structure based on the `skel-python` template.

This is a **significant refactoring** operation. Follow this multi-stage process precisely and prioritize safety at every step.

---

## Initial interaction – Package name

1. Ask the user:

   > "Please provide the name of your main Python package (the folder that should be moved into `src/`):"

2. Treat the user’s answer as `PACKAGE_NAME` for all subsequent steps.

---

## Phase 1 – Safety warning and analysis

1. **Issue a safety warning** before any destructive action:

   > "⚠️ **Safety Warning** ⚠️  
   > This command will perform significant refactoring on your project, including moving files and directories. It is **strongly recommended** that you commit all your current changes to version control (like Git) before proceeding. A backup of the project will be created in the parent directory.
   >
   > Are you sure you want to continue? (yes/no)"

2. **Wait for explicit confirmation**:

   - If the user responds exactly with `"yes"` (case-insensitive is fine), proceed.
   - If the user responds with `"no"` or anything else indicating refusal or uncertainty, stop the workflow and clearly state that no changes will be made.

3. **Analyze current structure** (read-only):

   - Ask the environment to execute:

     ```bash
     ls -F
     ```

   - Use the result to get a high-level overview of the project layout.
   - Confirm that `PACKAGE_NAME` exists and is a directory. If not, warn the user and stop or ask for a corrected package name.

---

## Phase 2 – Automatic project backup

1. Inform the user:

   > "As a safety measure, I will now create a compressed backup of the entire project in the parent directory."

2. Request execution of the backup command (describe it clearly before running it):

   ```bash
   BACKUP_FILE="../project-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
   tar -czf "$BACKUP_FILE" .
   echo "Backup created at: $BACKUP_FILE"
   ```
