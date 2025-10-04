# How to Submit

**Endpoint (staging):** `POST /Bundle`  
**Content-Type:** `application/fhir+json`

## Profiles to use
- Bundle: **GroupingSubmissionBundle**
- Patient: **PatientSubmission**
- Encounter: **EncounterSubmission**
- Condition: **ConditionEncounterDxICD11** (ICD-11 MMS)
- Procedure: **ProcedureICD9CM** (ICD-9-CM)

## Minimum required fields
**Patient**
- `name.given`, `name.family`, `birthDate`, `gender`, ≥1 `identifier` (e.g., NRIC, MRN)

**Encounter**
- `status`, `class` (= IMP/EMER/AMB), `period.start`, `period.end`
- `subject` (Patient reference), `serviceProvider` (Organization)
- `diagnosis[*].use` (principal/secondary), `diagnosis[*].condition` (refs Condition)

**Condition (ICD-11)**
- `code` (ICD-11), `category=encounter-diagnosis`
- *(Optional)* `recordedDate`, `extension: PresentOnAdmission` (Y/N/U/W)

**Procedure (ICD-9-CM)**
- `status`, `code` (ICD-9-CM), `subject`, *(Optional)* `performed[x]`, `bodySite`

## Codes
- Diagnoses: **ICD-11** (`http://id.who.int/icd/release/11/mms`)
- Procedures: **ICD-9-CM** (`http://hl7.org/fhir/sid/icd-9-cm`)
- POA (optional): **Y/N/U/W** (`/ValueSet/poa-values`)

## Example
See **ExampleSubmissionBundle** on the Artifacts page. Copy, adjust identifiers/codes, then POST.

## Errors
Server returns FHIR `OperationOutcome` with details (missing fields, invalid code, unknown provider, etc.).
