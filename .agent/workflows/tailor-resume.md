---
description: Tailor a LaTeX resume to match a Job Description for ATS compatibility
---

# Resume Tailoring Workflow (FAANG-Optimized)

This workflow generates ATS-optimized LaTeX resumes designed to pass all three stages of the resume review pipeline.

## How to Use

**Provide the Job Description IN THE SAME MESSAGE as the command:**

```
/tailor-resume

JD: [paste the entire job description here]

Company: [company name]
```

Or with a URL:

```
/tailor-resume

JD URL: https://company.com/careers/job-id

Company: Google
```

Or with a file:

```
/tailor-resume

JD File: data/jd/google-sde2.txt

Company: Google
```

---

## The 3-Audience Strategy

Your resume is reviewed by THREE distinct audiences in order:

### 1. ATS (Applicant Tracking System)

- **Time**: Instant filtering
- **Goal**: Pass keyword matching and format parsing
- **Strategy**: Use ATS-friendly format, include exact JD keywords

### 2. Recruiter

- **Time**: ~7 seconds scan
- **Goal**: Verify basic qualifications are visible instantly
- **Strategy**: Skills at top, clear formatting, no clutter

### 3. Hiring Manager

- **Time**: Deep read
- **Goal**: Assess technical depth and culture fit
- **Strategy**: Quantified achievements, specific tech details, impact metrics

---

## Prerequisites

1. **Job Description** - Provided with the command (text, URL, or file path)
2. **Base LaTeX Template** - `src/resume/main.tex` or `src/resume/resume.tex`

---

## Data Sources

### Resume Data (`data/resume/`)

| File                  | Contents                             |
| --------------------- | ------------------------------------ |
| `profile.json`        | Name, contact, GitHub, LinkedIn      |
| `experience.json`     | Work history with metrics & keywords |
| `projects.json`       | Portfolio with tech stacks & impact  |
| `skills.json`         | Categorized technical skills         |
| `education.json`      | Degrees and coursework               |
| `certifications.json` | Certifications & awards              |

### GitHub Data (`data/github/`)

| File                    | Contents                            |
| ----------------------- | ----------------------------------- |
| `index.json`            | Stats, languages, commits, PRs      |
| `repos/*/metadata.json` | Per-repo highlights & contributions |

---

## Workflow Steps

### Step 1: Analyze Job Description

// turbo
Extract from JD:

- **Required Skills** - Languages, frameworks, tools (exact names)
- **ATS Keywords** - Technical terms for keyword matching
- **Experience Level** - Years, seniority tier
- **Domain Focus** - Mobile, web, backend, cloud, etc.
- **Responsibilities** - Core duties to mirror in bullets

### Step 2: Load Resume Data

// turbo

```
view_file data/resume/profile.json
view_file data/resume/experience.json
view_file data/resume/projects.json
view_file data/resume/skills.json
view_file data/resume/education.json
```

### Step 3: Enrich with GitHub Data

// turbo

```
view_file data/github/index.json
view_file data/github/repos/{project-name}/metadata.json
```

### Step 4: Load LaTeX Template

// turbo

```
view_file src/resume/main.tex
```

### Step 5: Generate Tailored Resume

Apply the section rules below, then output a complete `.tex` file.

---

## Section-by-Section Rules

### A. Header (Contact Info)

**Must Include:**

- Full Name (large, bold)
- Phone Number
- Professional Email
- LinkedIn URL _(boosts chances by 70%)_
- GitHub URL
- Portfolio URL (if applicable)

**Do NOT Include:**

- Photo
- Physical address (city optional)

---

### B. Skills Section (PLACE AT TOP)

> **Why Top?** Recruiters look for skills first in their 7-second scan.

**Format:**

```
Languages: TypeScript, Dart, Kotlin, Java, Python, SQL
Frameworks: React Native, Flutter, Next.js, NestJS, Spring Boot
Cloud & Tools: AWS, Docker, Firebase, GitHub Actions, PostgreSQL
```

**Rules:**

- ✅ List JD-matching skills FIRST in each category
- ✅ Use exact technology names from JD
- ✅ Group: Languages → Frameworks → Cloud/Tools → Databases
- ❌ NO rating scales (stars, percentages)
- ❌ NO soft skills here (show them in experience)
- ❌ NO basic skills (MS Word, PowerPoint)

---

### C. Work Experience (THE CORE SECTION)

**Format:** Reverse chronological (most recent first)

**Each Entry:**

```
Company Name, Location                              Dates
Job Title
• Bullet 1 (XYZ formula)
• Bullet 2 (XYZ formula)
• Bullet 3 (XYZ formula)
Tech Stack: TypeScript, React Native, PostgreSQL, Docker
```

#### The XYZ Bullet Formula (Google's Recommended Format)

> "Accomplished **[X]** as measured by **[Y]**, by doing **[Z]**"

| Component | Description           | Example                             |
| --------- | --------------------- | ----------------------------------- |
| **X**     | What you accomplished | Reduced API latency                 |
| **Y**     | How you measured it   | by 40%                              |
| **Z**     | How you did it        | by implementing Redis caching layer |

**Bad Example:**

> "Worked on optimizing reporting service"

**Good Example:**

> "Reduced API latency by 40% and cut infrastructure costs by $15K/year by implementing Redis caching with TTL-based invalidation"

#### Bullet Writing Rules

| Do                                                                                                | Don't                                             |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| Start with action verbs: **Developed, Engineered, Architected, Led, Optimized, Delivered, Built** | Start with "Responsible for..." or "Worked on..." |
| Quantify EVERYTHING: %, $, users, latency, commits                                                | Use vague terms like "improved performance"       |
| Focus on YOUR contribution                                                                        | Describe only team achievements                   |
| Keep to 2-3 lines max per bullet                                                                  | Write long paragraphs                             |
| Include specific tech names                                                                       | Use generic "various technologies"                |

#### Metrics to Include (from experience.json)

- % improvement (latency, build time, costs)
- $ impact (cost savings, revenue)
- User counts (1,000+ users, 100+ engineers)
- Code stats (57 PRs, +45K lines, 80% coverage)
- Time savings (cut release time by 50%)

---

### D. Projects Section

> **Critical for:** Students, recent grads, or career changers with limited work experience.

**Rules:**

- Select **3-4 most JD-relevant** projects
- Include: Title, 1-line description, technologies, YOUR contribution
- Prioritize: Work projects > Hackathons > Open source > Class projects

**Format:**

```
Project Name (Year)
Brief description emphasizing impact. Technologies: X, Y, Z.
• Specific achievement with metrics
```

**Pull from:**

- `data/resume/projects.json` - highlights, tech_stack, metrics
- `data/github/repos/*/metadata.json` - commit counts, PR stats

---

### E. Education

**Format:**

```
Institution Name                                    Graduation Date
Degree, Major                                       GPA: X.XX/10 (if impressive)
Relevant Coursework: DSA, DBMS, OS, Networks, ML
```

**Rules:**

- Higher degree first
- Include GPA only if impressive (>7.5/10 or >3.5/4.0)
- Coursework is optional but helpful for students

---

### F. Awards & Certifications (Optional)

Include:

- Relevant certifications (AWS, Google Cloud, etc.)
- Hackathon wins
- Research papers
- Notable achievements

**Exclude:** Hobbies (unless directly relevant and you need the space)

---

## Formatting Standards

| Rule              | Guideline                                           |
| ----------------- | --------------------------------------------------- |
| **Length**        | 1 page (early career), max 1.5 pages (5+ years)     |
| **Font**          | Arial, Calibri, Times New Roman (10-12pt)           |
| **Margins**       | 0.4-0.5 inches                                      |
| **Bullet Length** | Max 3 lines per bullet                              |
| **Language**      | No fluff ("rockstar", "hard worker", "team player") |
| **Proofreading**  | Zero spelling/grammar errors                        |

---

## LaTeX Template Rules (CRITICAL - DO NOT VIOLATE)

> [!CAUTION] > **PRESERVE THE TEMPLATE FORMATTING EXACTLY.** Any modification to the LaTeX structure, commands, or formatting will break the resume layout.

### ABSOLUTE RULES - NEVER BREAK THESE:

1. **Copy the ENTIRE template file first** - Start by copying the complete `.tex` file from `src/resume/main.tex`
2. **Line-by-line preservation** - Every line that is NOT content text must remain IDENTICAL
3. **Character-perfect commands** - LaTeX commands must be copied exactly, including spaces

### DO NOT MODIFY (COPY EXACTLY AS-IS):

| Element                 | Example                                | Rule                                                             |
| ----------------------- | -------------------------------------- | ---------------------------------------------------------------- |
| `\documentclass`        | `\documentclass[a4paper,8pt]{article}` | Copy exactly                                                     |
| All `\usepackage` lines | `\usepackage{fontawesome5}`            | Copy every package                                               |
| `\newcolumntype`        | `\newcolumntype{C}{...}`               | Copy exactly                                                     |
| `\titleformat`          | `\titleformat{\section}...`            | Copy exactly                                                     |
| `\setmainfont`          | `\setmainfont{Arial}`                  | Copy exactly                                                     |
| `\begin{document}`      |                                        | Copy exactly                                                     |
| `\pagestyle{empty}`     |                                        | Copy exactly                                                     |
| `\begin{tabularx}`      | All tabularx environments              | Copy structure exactly                                           |
| `\begin{minipage}`      | All minipage environments              | Copy structure exactly                                           |
| `\begin{itemize}`       | With all options                       | Copy `[nosep,after=\strut, leftmargin=2em, itemsep=2pt]` exactly |
| `\color[HTML]{...}`     | All color codes                        | Copy exactly                                                     |
| `\textcolor[HTML]{...}` | All color codes                        | Copy exactly                                                     |
| `\hfill`                | All alignment commands                 | Copy exactly                                                     |
| `\section{...}`         | Section headers                        | Copy command, may change title text                              |
| `\\[3pt]`, `\\[4pt]`    | All spacing                            | Copy exactly                                                     |
| `\end{...}`             | All end tags                           | Copy exactly                                                     |

### ONLY CHANGE (Text Content Inside These Elements):

| Element        | What You Can Change                                  |
| -------------- | ---------------------------------------------------- |
| Name           | `\Huge{Ayush Kumar}` - change the name text only     |
| Email          | `\faEnvelope} email@example.com` - change email only |
| Phone          | `\faMobile} XXX-XXX-XXX` - change number only        |
| Links          | GitHub/LinkedIn URLs - change URLs only              |
| Skills text    | After `\textbf{Languages:}` - change skill list only |
| Company names  | `\textbf{{Company, Location}}` - change text only    |
| Job titles     | `\textbf{\textit{Job Title}}` - change text only     |
| Dates          | `Mar 2024 - Present` - change dates only             |
| Bullet text    | `\item Text here` - change text after `\item` only   |
| Education text | Institution, degree, dates, GPA - text only          |
| Project text   | Project descriptions - text only                     |

### VERIFICATION BEFORE OUTPUT:

Before generating the final `.tex` file, verify:

- [ ] Line 1-56 (preamble) is IDENTICAL to template
- [ ] All `\begin{tabularx}` structures match template
- [ ] All `\begin{minipage}` structures match template
- [ ] All `\begin{itemize}[...]` options match template
- [ ] All `\section{...}` commands use same format
- [ ] All `\color[HTML]{...}` codes are preserved
- [ ] All `\\[Xpt]` line spacing is preserved
- [ ] `\end{document}` is present at the end

### EXAMPLE - CORRECT vs INCORRECT:

**WRONG** (changed formatting):

```latex
\item Led migration of apps  % Missing itemize options
```

**CORRECT** (preserved formatting):

```latex
\begin{itemize}[nosep,after=\strut, leftmargin=2em, itemsep=2pt]
    \item Led migration of apps to React Native, reducing codebase by 40\%
\end{itemize}
```

---

## Output

Generate a **single complete `.tex` file** with NO explanations.

Save to: `src/resume/tailored-{company-name}-resume.tex`

---

## Quick Reference Checklist

Before generating, verify:

- [ ] Skills section is at the TOP (after header)
- [ ] All JD keywords appear 2-3 times across resume
- [ ] Every bullet uses XYZ formula with metrics
- [ ] Action verbs start each bullet
- [ ] Tech stack listed for each experience
- [ ] Most relevant projects selected (3-4 max)
- [ ] Resume fits 1 page
- [ ] No rating scales, no soft skills section
- [ ] Links: LinkedIn, GitHub, Portfolio included
