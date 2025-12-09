# Resume Data Files

This directory contains structured data files extracted from Ayush Kumar's resumes and profiles. These files serve as the single source of truth for the Resume Builder AI Agent.

## Files

| File | Description |
|------|-------------|
| `profile.json` | Personal contact information, social links, and GitHub stats |
| `experience.json` | Complete work experience with highlights, metrics, and tech stacks |
| `education.json` | Educational background with relevant coursework |
| `skills.json` | Categorized technical skills with language distribution from GitHub |
| `certifications.json` | Professional certifications with issuer and keywords |
| `projects.json` | Personal and professional projects with descriptions and tech stacks |

## GitHub Stats (Auto-synced)

| Metric | Value |
|--------|-------|
| Public Repositories | 104 |
| Followers | 18 |
| Stars Received | 10 |
| Commits (2025) | 80+ |
| Pull Requests (2025) | 12 |

### Language Distribution
- **Dart**: 35% (Flutter apps)
- **JavaScript**: 26% (Web scripts, automation)
- **TypeScript**: 13% (NestJS, Next.js)
- **Java**: 13% (Android, Spring Boot)
- **HTML/CSS**: 9% (Static sites)
- **Shell**: 4% (DevOps scripts)

## Usage

The Resume Builder Agent (`/.github/agents/Resume-Builder.agent.md`) uses these files to:

1. **Gather context** about the candidate's background
2. **Match keywords** from job descriptions to relevant experience
3. **Generate tailored resumes** with accurate, verified information

## Data Priority

When generating resumes:
1. Use data from these files as the primary source
2. Supplement with GitHub activity data from `/data/github/`
3. Only embellish metrics when consistent with documented skills

## Updating

Update these files when:
- Starting a new role
- Completing significant projects
- Earning new certifications
- Acquiring new skills

Last Updated: 2025-12-09
