# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static HTML portfolio website for Ayush Kumar, a software developer based in Bengaluru. The site is built using pure HTML with external CSS/JS dependencies and is deployed on Vercel.

## Tech Stack

- **Core**: Pure HTML (no build process, no frameworks like React/Vue)
- **CSS**: External stylesheets from dennissnellenberg.com template
  - normalize.css
  - locomotive-scroll.css
  - styleguide.css
  - components.css
  - style-new.css
- **JavaScript Libraries** (loaded via CDN):
  - jQuery 3.5.1
  - GSAP 3.9.1 with ScrollTrigger
  - Barba.js 2.10.3 (page transitions)
  - Locomotive Scroll (smooth scrolling)
  - Vanilla LazyLoad 17.6.1 (image/video lazy loading)
  - js-cookie 2.2.0
- **Analytics**: Google Analytics (tracking ID: G-SGWQQRQ15Y)
- **Deployment**: Vercel

## Architecture

### File Structure

```
/
├── index.html          # Home page
├── work.html           # Portfolio/work listing page
├── about.html          # About page
├── contact.html        # Contact page
├── components/         # Reusable HTML components
│   ├── image-gallery.html
│   ├── list-section.html
│   └── text.html
├── works/              # Individual project detail pages
│   ├── carer-connect.html
│   ├── crop-secure.html
│   ├── healthflex.html
│   ├── ipanelklean.html
│   ├── mingwood.html
│   ├── pysphere.html
│   └── tomorrow-weather.html
└── assets/             # Images, videos, and media files
    ├── [project-name]/ # Project-specific assets
    ├── icon.png
    ├── me.png
    ├── og.png
    └── cover.jpeg
```

### Key Architectural Patterns

1. **Template-Based Design**: All pages share consistent structure with loading screens, navigation, and footers. Changes to shared elements require updating all HTML files.

2. **Component System**: Reusable HTML snippets in `/components` directory can be included in project pages. These are standalone HTML sections (not true components - must be manually copied into pages).

3. **Asset Organization**: Media files are organized by project name in `/assets` directory, making it easy to manage project-specific resources.

4. **Page Transitions**: Barba.js handles smooth page transitions. Each page has:
   - `data-barba="wrapper"` on `<body>`
   - `data-barba="container"` on main content
   - `data-barba-namespace` to identify page type (e.g., "home", "work")

5. **Scroll Animations**: Locomotive Scroll with data attributes:
   - `data-scroll-section` on sections
   - `data-scroll` on animated elements
   - `data-scroll-speed` for parallax effects
   - `data-scroll-direction` for horizontal/vertical animations

6. **Lazy Loading**: Images and videos use class `lazy` and `data-bg` or `src` attributes for lazy loading via Vanilla LazyLoad.

## Development Commands

### Running Locally

Since this is a static site with no build process, use any static file server:

```bash
# Using Python 3
python3 -m http.server 8000

# Using Python 2
python -m SimpleHTTPServer 8000

# Using Node.js (if npx is available)
npx serve

# Using PHP
php -S localhost:8000
```

Then open `http://localhost:8000` in your browser.

### Testing

No automated tests are configured. Manual testing checklist:
- Test all page transitions (home, work, about, contact)
- Verify smooth scrolling behavior
- Check lazy loading of images/videos
- Test on mobile viewport (responsive design)
- Verify all project detail pages load correctly

### Deployment

The site is deployed on Vercel. No special build command is needed:
- Build Command: (none)
- Output Directory: `.` (root)
- Install Command: (none)

Push to the repository and Vercel will automatically deploy.

## Common Development Patterns

### Adding a New Project

1. Create project detail page in `/works/[project-name].html`
2. Copy structure from existing project page (e.g., `carer-connect.html`)
3. Create project assets folder: `/assets/[project-name]/`
4. Add project images/videos to the assets folder
5. Update `work.html` to include link to new project page
6. Update meta tags (title, description, og:image) in new project page

### Using Components

Components in `/components` are HTML snippets that can be copied into pages:
- `image-gallery.html`: Horizontal scrolling image gallery with Locomotive Scroll
- `list-section.html`: Text list layout
- `text.html`: Basic text section

To use: Copy the component HTML and paste into the desired page, then update data attributes and content.

### Adding Animations

Use Locomotive Scroll data attributes:
```html
<div data-scroll data-scroll-speed="-1" data-scroll-direction="horizontal">
  <!-- Content -->
</div>
```

Use GSAP/ScrollTrigger for more complex animations (defined in external JS file).

### Video/Image Assets

- Videos: Use `<video class="overlay lazy">` with `loop muted playsinline` attributes
- Images: Use `class="overlay lazy"` with `data-bg="path/to/image.jpg"` for backgrounds
- Keep file sizes reasonable (videos can be large; optimize when possible)

## Important Notes

- **No Local CSS/JS**: All styles and main JavaScript logic come from external sources (dennissnellenberg.com). Custom CSS/JS would need to be added as inline or new local files.
- **External Dependencies**: Site relies on external CDNs and template resources. Changes to template source may affect styling/functionality.
- **Barba.js Namespace**: Each page needs proper `data-barba-namespace` for transitions to work correctly.
- **Meta Tags**: Update meta tags (title, description, og:image) for each new page for proper SEO and social sharing.
- **Analytics**: Google Analytics is configured with tracking ID `G-SGWQQRQ15Y`.
