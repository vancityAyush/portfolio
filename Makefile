# LaTeX Compilation Makefile
# Uses XeLaTeX 2025 compiler for PDF generation

# Directories
SRC_DIR := src/resume
OUT_DIR := dist/resume

# Find all .tex files in the source directory
TEX_FILES := $(wildcard $(SRC_DIR)/*.tex)
PDF_FILES := $(patsubst $(SRC_DIR)/%.tex,$(OUT_DIR)/%.pdf,$(TEX_FILES))

# XeLaTeX compiler and flags
XELATEX := xelatex
XELATEX_FLAGS := -interaction=nonstopmode -halt-on-error

# Create output directory
$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

# Build a specific .tex file: make pdf FILE=path/to/file.tex
.PHONY: pdf
pdf: $(OUT_DIR)
ifdef FILE
	@if [ ! -f "$(FILE)" ]; then echo "Error: File '$(FILE)' not found"; exit 1; fi
	@echo "Compiling $(FILE) with XeLaTeX..."
	cd $(dir $(FILE)) && $(XELATEX) $(XELATEX_FLAGS) -output-directory=$(CURDIR)/$(OUT_DIR) $(notdir $(FILE))
	@echo "Generated $(OUT_DIR)/$(notdir $(FILE:.tex=.pdf))"
else
	@echo "Usage: make pdf FILE=path/to/file.tex"
	@echo "Example: make pdf FILE=src/resume/main.tex"
	@echo "Output will be in: $(OUT_DIR)/"
endif

# Default target: build all PDFs
.PHONY: all
all: $(OUT_DIR) $(PDF_FILES)

# Pattern rule for compiling .tex to .pdf
$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.tex | $(OUT_DIR)
	@echo "Compiling $< with XeLaTeX..."
	cd $(SRC_DIR) && $(XELATEX) $(XELATEX_FLAGS) -output-directory=$(CURDIR)/$(OUT_DIR) $(notdir $<)
	@echo "Generated $@"

# Build specific resume files
.PHONY: main
main: $(OUT_DIR)/main.pdf

.PHONY: resume
resume: $(OUT_DIR)/resume.pdf

.PHONY: clipboard-health
clipboard-health: $(OUT_DIR)/clipboard-health-resume.pdf $(OUT_DIR)/tailored-clipboard-health-resume.pdf $(OUT_DIR)/tailored-clipboard-resume.pdf

# Clean auxiliary files (keep PDFs)
.PHONY: clean
clean:
	@echo "Cleaning auxiliary files..."
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.log $(OUT_DIR)/*.out $(OUT_DIR)/*.toc
	rm -f $(OUT_DIR)/*.bbl $(OUT_DIR)/*.blg $(OUT_DIR)/*.bcf $(OUT_DIR)/*.run.xml
	rm -f $(OUT_DIR)/*.fdb_latexmk $(OUT_DIR)/*.fls $(OUT_DIR)/*.synctex.gz
	@echo "Done cleaning."

# Clean everything including PDFs
.PHONY: distclean
distclean: clean
	@echo "Removing output directory..."
	rm -rf $(OUT_DIR)
	@echo "Done."

# Watch for changes and recompile (requires fswatch on macOS)
.PHONY: watch
watch:
	@echo "Watching for changes in $(SRC_DIR)/*.tex..."
	@echo "Press Ctrl+C to stop."
	fswatch -o $(SRC_DIR)/*.tex | xargs -n1 -I{} make all

# Install dependencies (macOS with Homebrew)
.PHONY: install-deps-macos
install-deps-macos:
	@echo "Installing TeX Live via Homebrew..."
	brew install --cask mactex
	@echo "TeX Live installed. Please restart your terminal or run: eval \"$$(/usr/libexec/path_helper)\""

# Install dependencies (Ubuntu/Debian)
.PHONY: install-deps-linux
install-deps-linux:
	@echo "Installing TeX Live..."
	sudo apt-get update
	sudo apt-get install -y texlive-xetex texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra latexmk

# Check if XeLaTeX is installed
.PHONY: check
check:
	@command -v $(XELATEX) >/dev/null 2>&1 || { echo "XeLaTeX not found. Run 'make install-deps-macos' or 'make install-deps-linux'"; exit 1; }
	@echo "XeLaTeX found: $$(which $(XELATEX))"
	@$(XELATEX) --version | head -1

# Help
.PHONY: help
help:
	@echo "LaTeX Resume Build System"
	@echo "========================="
	@echo ""
	@echo "Usage: make [target] [FILE=path/to/file.tex]"
	@echo ""
	@echo "Output directory: $(OUT_DIR)/"
	@echo ""
	@echo "Targets:"
	@echo "  pdf FILE=<path>  Build a specific .tex file to PDF"
	@echo "  all              Build all PDF files from .tex sources (default)"
	@echo "  main             Build main.pdf"
	@echo "  resume           Build resume.pdf"
	@echo "  clipboard-health Build clipboard-health related resumes"
	@echo "  clean            Remove auxiliary files (keep PDFs)"
	@echo "  distclean        Remove output directory entirely"
	@echo "  watch            Watch for changes and auto-recompile"
	@echo "  check            Verify XeLaTeX installation"
	@echo "  install-deps-macos  Install TeX Live on macOS (Homebrew)"
	@echo "  install-deps-linux  Install TeX Live on Ubuntu/Debian"
	@echo "  help             Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make pdf FILE=src/resume/tailored-microsoft-resume.tex"
	@echo "  make all"
	@echo "  make clean"
