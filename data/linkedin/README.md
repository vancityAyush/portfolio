# LinkedIn Data Directory

This directory contains LinkedIn profile data in a structured format.

## Status
**⚠️ Manual Entry Required**: Due to LinkedIn's robots.txt restrictions that block automated data fetching, this data must be entered manually.

## Files

### Core Data Files
- `profile.json` - Basic profile information (name, headline, summary, etc.)
- `experience.json` - Work experience and employment history
- `education.json` - Educational background
- `skills.json` - Skills and endorsements

### Generated Files
- `generated/summary.md` - Markdown-formatted portfolio summary
- `generated/resume_section.tex` - LaTeX-formatted resume content

## How to Update

1. Visit your LinkedIn profile at: https://www.linkedin.com/in/eliasak11/
2. Manually copy information into the respective JSON files
3. Run the generation script to create formatted outputs (if available)

## Data Format

All JSON files follow a consistent structure:
- `_note`: Description of the file's purpose
- `last_updated`: ISO 8601 timestamp of last update
- `status`: Current status ("pending_manual_entry" or "complete")
- Main data fields specific to each file

## Privacy Note

This data is for portfolio and resume generation purposes. Be mindful of what information you include, especially contact details and private information.

## Integration with GitHub Data

The LinkedIn data is designed to complement the GitHub repository data found in `../github/`. Together, they provide a comprehensive view of your professional profile and technical work.

## Last Updated
2025-10-29
