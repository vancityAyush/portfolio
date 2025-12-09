# Ayush-Kumar

portfolio
# me

## 📄 Resume/CV Compilation

This repository includes LaTeX-based resumes that compile to PDF using **XeLaTeX 2025**.

### Prerequisites

#### macOS (using Homebrew)
```bash
make install-deps-macos
```
Or manually:
```bash
brew install --cask mactex
```

#### Linux (Ubuntu/Debian)
```bash
make install-deps-linux
```

### Quick Start

```bash
# Check if XeLaTeX is installed
make check

# Build all resumes
make all

# Build specific resume
make main
make resume

# Clean auxiliary files
make clean
```

### VS Code Integration

This project includes VS Code tasks for easy compilation:

1. **Build Current File**: `Cmd+Shift+B` (default build task)
2. **Build All Resumes**: Run task "LaTeX: Build All Resumes"
3. **Watch & Auto-Compile**: Run task "LaTeX: Watch & Auto-Compile"
4. **Clean**: Run task "LaTeX: Clean Auxiliary Files"

Access tasks via: `Cmd+Shift+P` → "Tasks: Run Task"

### Continuous Integration

PDF files are automatically generated via GitHub Actions when:
- `.tex` files in `src/resume/` are modified
- A new tag/release is created (PDFs are attached to release)

Download artifacts from the Actions tab after each build.

### File Structure

```
src/resume/
├── main.tex                          # Main resume template
├── resume.tex                        # Alternative resume
├── clipboard-health-resume.tex       # Tailored resume
└── *.pdf                             # Generated PDFs
```
