# Resume Data Files

Structured career data for Ayush Kumar. This directory is the single source of truth for the Resume Builder AI Agent.

## Files

| File | Description |
|------|-------------|
| `profile.json` | Contact info, social links, GitHub/npm stats |
| `experience.json` | Work history. The CSG entry nests a `projects[]` timeline (FSM → PS Predict → Kabuni) |
| `education.json` | B.E. plus pre-university education |
| `skills.json` | Categorized technical skills and language distribution |
| `certifications.json` | Split into `certifications` (held) and `planned` (not earned) |
| `projects.json` | All projects, tagged with `resume_value` and `status` |
| `awards.json` | Competitions and workplace recognition |
| `metrics.json` | **Every quantified claim, verified once.** Read this before printing any number |

## metrics.json is authoritative

`experience.json` and `projects.json` carry the prose. When a bullet makes a numeric claim it cites `metrics.json` by `evidence` key rather than restating the number. If prose and `metrics.json` ever disagree, `metrics.json` wins.

Three verification levels:

- **`external`** — confirmed against GitHub, npm, or an app store. Safe to print.
- **`self_asserted`** — from Ayush's own notes. Plausible and usable, but he is the only source. Do not present as measured.
- **`rejected`** — provably wrong or misattributed. Never print. Kept so it does not get reintroduced.

The `rejected` block matters. The previous version of this data credited Ayush with **423, 347, 582, and 483 commits** on HealthFlex repos. Two of those numbers are the contributor-table totals for *other GitHub users*. His verified authored total is **473 commits** across three repos, and the stronger claim is **91 merged PRs (+57.9K lines)**.

## Filtering projects

Filter on `resume_value`, don't delete:

- `high` — lead with these
- `medium` — include when the job description matches
- `low` — never auto-include (bootcamp clones, early coursework)

`projects.json` also has an `excluded` block listing interview take-home repos. Listing those advertises the interviews they came from.

Respect `caution` and `status` fields. Kabuni, Iris, and second.brain are `in_progress` — never write them as delivered outcomes or attach impact metrics to them.

## Data priority

1. This directory.
2. `data/github/` for repo-level evidence — but see the caveats below.
3. `data/linkedin/` is **empty scaffolding** (`pending_manual_entry`). Nothing to merge.

### data/github/ caveats

- `activity.json`'s `recent_commits` is a **capped API window** (ceiling 10), not a total. Never sum it; never read `10` as "10+".
- `summary.md` is stale. It disagrees with `index.json` and `profile.json` on follower count and language split. Those two agree with each other; `summary.md` loses.
- `index.json.generated_files` points at `data/github/generated/*.tex`, which does not exist.
- Only `healthflex.api` carries a real `commits` field, and that number is another contributor's.

## Known unresolved conflicts

- **Phone** — `profile.json` says `…579`; the site and every old PDF say `…578`. Ayush kept `…579`, so **the site is wrong** and needs fixing.
- **Email** — the site and `data/linkedin/profile.json` still show the retired `eliasakeleven@gmail.com`.
- **CGPA** — `7.96` confirmed by Ayush, though both FlowCV resumes say `7.98` and `7.96` is byte-identical to the value in the third-party LaTeX template at `data/.old/main.tex`.
- **String Calculator** — GitHub says Dart, `data/resume (1).tex` says Java.
- **Awards** — no artifact exists for any entry in `awards.json`. All are `verified: false`.

## Security

`data/second.brain (Notion)/` is **gitignored**. It contains plaintext GitHub PATs, an account password, and Vercel recovery codes. Mine it locally; never commit it, and never copy credentials out of it into this directory.

Last Updated: 2026-07-09
