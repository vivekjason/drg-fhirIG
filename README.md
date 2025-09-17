# MY-DRG IG (R4) — Starter

## Quickstart (Windows PowerShell)

1. Ensure Node.js is installed (v18+).  
2. Install SUSHI:
   ```powershell
   npm install -g fsh-sushi
   sushi --version
   ```
3. From the repo root, compile FSH → FHIR artifacts:
   ```powershell
   sushi .
   ```
4. (First time) Download IG Publisher:
   ```powershell
   .\_updatePublisher.ps1
   ```
5. Build the IG website:
   ```powershell
   .\_genonce.ps1
   ```
6. The site is in `output/`. Commit & push to GitHub, enable Pages on `gh-pages` (via the included GitHub Action).

## Notes
- The DRG binding points at a placeholder ValueSet URL. Replace with your real canonical(s).
- Add more profiles under `input/fsh/` (Claim, Encounter, etc.).