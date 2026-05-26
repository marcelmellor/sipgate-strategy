# AGENTS.md

Shared instructions for coding assistants in this repository.

## Setup

After cloning: `bash scripts/setup.sh`

This initializes git submodules and verifies the render skill and sipgate design are in place.

## Skills

### render (magic-md)

Renders Markdown files to styled HTML with the sipgate design.

```bash
bash .skills/render/scripts/render.sh <input.md> [--design sipgate] [--output path.html] [--open]
```

The sipgate design is the default (configured in `.magic-md.conf`). The `--design` flag is only needed to override it.

## Repository Structure

- `miroboards/` — Synced Miro board exports (Markdown)
- `config/designs/` — CSS designs for magic-md (sipgate)
- `.skills/render/` — magic-md submodule
