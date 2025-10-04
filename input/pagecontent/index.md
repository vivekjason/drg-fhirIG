# Malaysia DRG Shadow Billing — Data Submission IG (R4)

**Goal:** Private hospitals send one FHIR **Bundle** per encounter (Patient + Encounter + Diagnoses + Procedures). MOH computes DRG internally (no DRG in the payload for v1).

## Quick Start
1. Use profile **GroupingSubmissionBundle**.
2. Include:
   - 1 × Patient (**PatientSubmission**)
   - 1 × Encounter (**EncounterSubmission**)
   - ≥1 × Condition (**ConditionEncounterDxICD11**, ICD-11)
   - 0..* × Procedure (**ProcedureICD9CM**, ICD-9-CM)
3. POST JSON to the staging endpoint (contact MOH for auth).
4. Copy and adapt **ExampleSubmissionBundle** from Artifacts.

**Download:** [Full Site PDF](MYDRG-IG.pdf)

> Need help? See **How to Submit** in the left menu.

## What’s *not* required in v1
- No DRG field in submissions (MOH groups later).
- No Claim or EOB required for submission.

## Contact
**MOH Digital Health** — digitalhealth@moh.gov.my
