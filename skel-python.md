---
name: skel-python
description: Generates the structure of a new Python project based on a standard template.
prompt: "Enter the project name (for variable substitution, e.g., `my-new-app`) and the Python package name (e.g., `my_new_app`), separated by a space:"
---

**You are an expert Python developer specializing in creating robust, modern project structures.** Your task is to generate a complete directory and file structure for a new Python project **within the current directory**.

Follow this multi-stage process precisely.

### 1. Understand the Goal

The user will provide two arguments:

- `PROJECT_NAME`: A name used for variable substitution inside files (e.g., in the `README.md`).
- `PACKAGE_NAME`: The name of the Python package to be created under `src/` (e.g., `my_new_app`).

Your goal is to create the entire project skeleton **in the current working directory**. Do NOT create a new root folder.

### 2. Plan the Structure

First, review the complete file and directory structure you are about to create in the current directory. This is your blueprint.

```
.
├─ pyproject.toml
├─ README.md
├─ LICENSE
├─ .gitignore
├─ .editorconfig
├─ .pre-commit-config.yaml
├─ config/
│  ├─ config.yaml
│  ├─ envs/
│  │  ├─ dev.yaml
│  │  ├─ staging.yaml
│  │  └─ prod.yaml
│  ├─ secrets.example.yaml
│  ├─ local.overrides.yaml
│  └─ schema/
│     ├─ config.schema.json
│     └─ README.md
├─ src/
│  └─ {{{PACKAGE_NAME}}}/
│     ├─ __init__.py
│     ├─ core/
│     ├─ services/
│     ├─ adapters/
│     ├─ cli/
│     ├─ utils/
│     └─ py.typed
├─ tests/
│  ├─ unit/
│  ├─ integration/
│  └─ conftest.py
└─ .github/workflows/
   └─ ci.yml
```

### 3. Execute the Scaffolding

Now, execute the following steps to create the project.

**A. Create all directories:**

```bash
mkdir -p .github/workflows
mkdir -p config/envs
mkdir -p config/schema
mkdir -p src/{{{PACKAGE_NAME}}}/{core,services,adapters,cli,utils}
mkdir -p tests/{unit,integration}
```

**B. Create empty placeholder files:**

```bash
touch LICENSE
touch config/envs/dev.yaml
touch config/envs/staging.yaml
touch config/secrets.example.yaml
touch config/local.overrides.yaml
touch config/schema/README.md
touch src/{{{PACKAGE_NAME}}}/__init__.py
touch src/{{{PACKAGE_NAME}}}/py.typed
touch tests/conftest.py
```

**C. Create files with content using the `write_file` tool.** Replace `{{{PROJECT_NAME}}}` and `{{{PACKAGE_NAME}}}` with the user's provided values.

**File: `pyproject.toml`**

```toml
[project]
name = "{{{PACKAGE_NAME}}}"
version = "0.1.0"
description = "A new project generated from template."
requires-python = ">=3.11"

[tool.pytest.ini_options]
addopts = "-ra --strict-markers --strict-config --import-mode=importlib"
testpaths = ["tests"]

[tool.setuptools.packages.find]
where = ["src"]
```

**File: `README.md`**

```markdown
# {{{PROJECT_NAME}}}

Project description.
```

**File: `.gitignore`**

```gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# IDEs
.idea/
.vscode/
*.swp

# Config
config/local.overrides.yaml
config/**/*.secrets.yaml
*.sops.yaml
/tmp/config.effective.yaml
```

**File: `.editorconfig`**

```ini
root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
```

**File: `.pre-commit-config.yaml`**

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.6.0
    hooks:
      - id: check-yaml
      - id: end-of-file-fixer
      - id: trailing-whitespace
  - repo: https://github.com/adrienverge/yamllint
    rev: v1.35.1
    hooks:
      - id: yamllint
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.5.0
    hooks:
      - id: detect-secrets
```

**File: `config/config.yaml`**

```yaml
app:
  name: { { { PROJECT_NAME } } }
  version: 0.1.0
logging:
  level: INFO
  format: "%(asctime)s %(levelname)s %(name)s: %(message)s"
http:
  host: 0.0.0.0
  port: 8080
  timeouts: &timeouts
    connect_s: 3.0
    read_s: 5.0
database: &db_tpl
  driver: postgresql
  host: localhost
  port: 5432
  name: appdb
  pool:
    min: 1
    max: 10
features:
  cool_mode: false
```

**File: `config/envs/prod.yaml`**

```yaml
logging:
  level: WARNING
http:
  port: 80
database:
  <<: *db_tpl
  host: prod-db.internal
features:
  cool_mode: true
timeouts:
  <<: *timeouts
  read_s: 8.0
```

**File: `config/schema/config.schema.json`**

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "your-app config",
  "type": "object",
  "required": ["app", "logging", "http"],
  "properties": {
    "app": {
      "type": "object",
      "required": ["name", "version"],
      "properties": {
        "name": { "type": "string" },
        "version": { "type": "string" }
      }
    },
    "logging": {
      "type": "object",
      "properties": {
        "level": { "enum": ["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"] },
        "format": { "type": "string" }
      }
    },
    "http": {
      "type": "object",
      "required": ["host", "port"],
      "properties": {
        "host": { "type": "string" },
        "port": { "type": "integer", "minimum": 1, "maximum": 65535 },
        "timeouts": {
          "type": "object",
          "properties": {
            "connect_s": { "type": "number", "minimum": 0 },
            "read_s": { "type": "number", "minimum": 0 }
          }
        }
      }
    }
  },
  "additionalProperties": true
}
```

**File: `.github/workflows/ci.yml`**

```yaml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install yq yamllint check-jsonschema

      - name: Compose config for validation
        run: |
          # Set a default APP_ENV if not present
          APP_ENV=${{ vars.APP_ENV || 'dev' }}
          echo "Using APP_ENV=$APP_ENV"
          # Create dummy override file if it doesn't exist to prevent yq error
          touch config/local.overrides.yaml
          # Merge configs
          yq eval-all 'select(fileIndex==0) * select(fileIndex==1) * select(fileIndex==2)' \
            config/config.yaml config/envs/$APP_ENV.yaml config/local.overrides.yaml \
            > /tmp/config.effective.yaml

      - name: Lint and Validate Config
        run: |
          yamllint config/
          check-jsonschema --schemafile config/schema/config.schema.json /tmp/config.effective.yaml

      - name: Install project
        run: pip install .

      - name: Run tests
        run: pytest
```

### 4. Final Confirmation

Once all steps are completed, confirm to the user that the project structure for `{{{PROJECT_NAME}}}` has been successfully created in the current directory.
