# Chezmoi Template Organization Guidelines

This repository uses a clean template organization pattern to avoid clutter and maintain scalability.

## Directory Structure

```
.
├── .chezmoitemplates/          # All actual template content
│   ├── zshrc                   # Shell configuration
│   ├── zprofile               # Shell profile
│   ├── install-packages.sh    # Package installation script
│   └── ols.json              # Language server config
├── dot_zshrc.tmpl             # Minimal file that includes template
├── dot_zprofile.tmpl          # Minimal file that includes template
└── ...
```

## Adding a New Template

### 1. Create the Template Content

Add your template content to `.chezmoitemplates/`:

```bash
# Example: Adding a new gitconfig template
echo 'your template content here' > .chezmoitemplates/gitconfig
```

### 2. Create the Minimal Dotfile

Create the corresponding dotfile that includes your template:

```bash
# For a file like ~/.gitconfig
echo '{{- template "gitconfig" . -}}' > dot_gitconfig.tmpl
```

### 3. Template Best Practices

#### Use Build-time Conditionals
```go-template
{{- if eq .chezmoi.os "darwin" }}
# macOS-specific configuration
export HOMEBREW_PREFIX="/opt/homebrew"
{{- else if eq .chezmoi.os "linux" }}
# Linux-specific configuration
export PATH="$PATH:/usr/local/bin"
{{- end }}
```

#### Avoid Runtime Conditionals
❌ Don't do this:
```bash
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS stuff
fi
```

✅ Do this instead:
```go-template
{{- if eq .chezmoi.os "darwin" }}
# macOS stuff
{{- end }}
```

#### Template Variables
Use chezmoi's built-in variables:
- `.chezmoi.os` - Operating system (darwin, linux, windows)
- `.chezmoi.arch` - Architecture (amd64, arm64, etc.)
- `.chezmoi.hostname` - Machine hostname
- `.chezmoi.username` - Current username

### 4. Common Template Patterns

#### Simple File Template
```bash
# Template file: .chezmoitemplates/example-config
{{- if eq .chezmoi.os "darwin" }}
# macOS configuration
setting = "mac_value"
{{- else }}
# Other OS configuration  
setting = "default_value"
{{- end }}

# Dotfile: dot_example-config.tmpl
{{- template "example-config" . -}}
```

#### Script Template with Execution
```bash
# Template file: .chezmoitemplates/setup-script
#!/bin/bash
{{- if eq .chezmoi.os "darwin" }}
brew install package
{{- else if eq .chezmoi.os "linux" }}
sudo apt-get install package
{{- end }}

# Executable script: run_once_setup-script.tmpl
{{- template "setup-script" . -}}
```

### 5. Testing Your Templates

```bash
# Dry run to see what would be generated
chezmoi diff

# Apply and check the results
chezmoi apply --dry-run

# Apply for real
chezmoi apply
```

### 6. Template Naming Conventions

- Use descriptive names without file extensions in `.chezmoitemplates/`
- Match the target filename for the corresponding dotfile
- Use hyphens for multi-word names

Examples:
- `zshrc` → `dot_zshrc.tmpl` → `~/.zshrc`
- `ssh-config` → `dot_ssh/config.tmpl` → `~/.ssh/config`
- `vscode-settings` → `dot_config/Code/User/settings.json.tmpl` → `~/.config/Code/User/settings.json`

## Benefits of This Approach

1. **Clean Repository**: Template logic is separated from dotfile structure
2. **Scalable**: Easy to add new templates without cluttering the root
3. **Maintainable**: Template content is centralized and easy to find
4. **Cross-platform**: Build-time templating provides clean, platform-specific configs
5. **Version Control Friendly**: Clear separation of concerns

## Quick Reference

```bash
# Add new template
vim .chezmoitemplates/new-config

# Create corresponding dotfile
echo '{{- template "new-config" . -}}' > dot_new-config.tmpl

# Test and apply
chezmoi diff
chezmoi apply
```
