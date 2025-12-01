# 🤖 Agent Toolkit

A comprehensive collection of universal AI agent commands designed to enhance developer productivity and streamline development workflows across all IDEs with AI agent support. 🚀✨

## 🎯 Overview

This toolkit provides a curated set of powerful, reusable AI agent commands that automate common development tasks, enforce best practices, and guide you through complex workflows. Each command is designed as a structured prompt template that helps AI assistants deliver consistent, high-quality results across all major IDEs with AI agent support. 🧠💡

### 🔄 Universal Compatibility

While originally designed for Cursor, these commands use standard Markdown format and can be easily adapted for:

- **Cursor** 🎯
- **VS Code with GitHub Copilot** 💻
- **JetBrains IDEs with AI plugins** 🛠️
- **Any IDE with AI agent capabilities** 🤖

The commands follow universal prompting best practices, making them portable across different AI assistant platforms. 🌍

## 🚀 Installation

These universal AI agent commands can be adapted for any IDE with AI agent support. Below are setup instructions for popular IDEs:

### Cursor (Recommended) 🎯

#### Option 1: Global Commands 🌍

Place these commands in your global Cursor commands directory:

```bash
# macOS/Linux 🖥️
mkdir -p ~/.cursor/commands
cp *.md ~/.cursor/commands/

# Windows 🪟
mkdir %APPDATA%\Cursor\commands
copy *.md %APPDATA%\Cursor\commands\
```

#### Option 2: Project-Specific Commands 📂

Copy the desired `.md` files to your project's `.cursor/commands/` directory:

```bash
mkdir -p .cursor/commands
cp path/to/desired/command.md .cursor/commands/
```

### Other IDEs with AI Agent Support 🔄

These commands use standard Markdown format and can be adapted for other IDEs by:

1. **Copying the `.md` files** to your IDE's custom commands directory
2. **Adjusting the frontmatter** (the `---` section) to match your IDE's command format
3. **Maintaining the core prompt structure** while adapting syntax as needed

**Compatible IDEs:** VS Code with GitHub Copilot, JetBrains IDEs with AI plugins, and other AI-enhanced development environments. 🤖

After installation, access commands using your IDE's AI agent command trigger (typically `/` or similar). Available commands will appear in the dropdown menu. 🎯

### Command Examples 💫

#### Generate a Python Project Skeleton 🏗️

```
/skel-python
```

When prompted, enter: `my-awesome-app my_awesome_app` ✨

This creates a complete Python project structure with:

- Modern packaging (`pyproject.toml`) 📦
- Configuration management with YAML 📄
- Testing framework setup 🧪
- CI/CD pipeline 🔄
- Development tooling (pre-commit, editorconfig) 🔧

#### Create an Implementation Plan 📋

```
/generate-implementation-plan
```

Describe your feature request, and the command will:

- Analyze your existing codebase 🔍
- Generate a comprehensive technical specification 📊
- Create a phased, checkbox-based implementation plan ✅
- Include all necessary components, APIs, and testing requirements 🧩

#### Generate Commit Messages 🏷️

```
/gitcommitpush
```

The command will:

- Analyze your git changes 🔬
- Generate contextual commit messages following conventional commit standards 📝
- Guide you through safe commit and push operations 🔒

## 🏗️ Universal Command Structure

Each command follows a consistent, cross-platform format that can be adapted for any AI agent-enabled IDE:

```markdown
---
name: command-name
description: Brief description of what the command does
prompt: Optional user input prompt
---

# Command Title

Detailed instructions and workflow for the AI assistant...
```

🎨

This standard format ensures maximum compatibility across different IDE platforms while maintaining the powerful functionality of each command. 🔧

## 🔧 Available Commands

- **`skel-python`** 🐍 - Generate complete Python project structures with modern best practices, CI/CD, and tooling
- **`generate-implementation-plan`** 📋 - Transform requirements into detailed, phased implementation plans with technical specs
- **`gitcommitpush`** 🏷️ - Analyze git changes, generate conventional commit messages, and guide safe commit/push workflow

## 🤝 Contributing

To add new commands to this toolkit:

1. Create a new `.md` file following the established format 📝
2. Include comprehensive instructions with clear, actionable steps ✅
3. Test the command thoroughly in different scenarios 🧪
4. Add documentation and examples 📚

## 🌟 Best Practices

### Command Design Principles 💎

- **Clarity First** 🔍: Be specific about expected outputs and formats
- **Role Assignment** 🎭: Define the AI's role clearly (e.g., "Act as a senior software engineer")
- **Step-by-Step Guidance** 🪜: Break complex tasks into manageable steps
- **Context Awareness** 🧠: Leverage Cursor's context symbols (`@codebase`, `@filename.ext`)
- **Error Handling** 🛡️: Include validation and error scenarios

### Workflow Integration 🔄

- **Chain Commands** ⛓️: Use outputs from one command as context for another
- **Iterative Refinement** 🔄: Commands should support follow-up corrections
- **Convention Respect** 📏: Follow existing project patterns and standards

## 📚 Resources

- [Cursor Commands Documentation](https://cursor.com/docs) 📖 (for Cursor users)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot) 🤖 (for VS Code users)
- [Conventional Commits Specification](https://conventionalcommits.org/) 📋
- [Python Packaging Best Practices](https://packaging.python.org/) 🐍
- [AI Agent Best Practices](https://platform.openai.com/docs/introduction) 🧠 (general AI assistant guidance)

## 📜 License

This toolkit is provided as-is for educational and productivity purposes. Feel free to modify and distribute the commands according to your needs. 🎉✨
