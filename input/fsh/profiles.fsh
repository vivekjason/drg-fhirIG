// ------------------------------------------------------
// Minimal, operational profiles to get v1 compiling
// Scope: Patient, Organization, Encounter, Condition(ICD-11), Procedure(ICD-9-CM), and the Bundle
// ------------------------------------------------------

// ===== 1) SUBMISSION CONTAINER =====

Profile: GroupingSubmissionBundle
Parent: Bundle
Id: grouping-submission-bundle
Title: "Grouping Submission Bundle"
Description: "One encounter’s data for MOH to run DRG grouping (no DRG in payload)."
* type = #collection (exactly)
* entry 3..* MS
* entry.resource 1..1
// We keep the allowlist of resource types as documentation (not enforced) to stay simple for v1.


// ===== 2) ORGANIZATION (Hospital) =====

Profile: OrganizationHospital
Parent: Organization
Id: organization-hospital
Title: "Organization (Hospital)"
* name 1..1 MS
* identifier 1..* MS
* type 0..* MS


// ===== 3) PATIENT (Demographics) =====

Profile: PatientSubmission
Parent: Patient
Id: patient-submission
Title: "Patient (Submission)"
* identifier 1..* MS
* name 1..1 MS
* name.family 1..1 MS
* name.given 1..* MS
* birthDate 1..1 MS
* gender 1..1 MS
// Optional demographic extensions; definitions are in terminology.fsh
* extension contains
    Nationality named nationality 0..1 and
    RaceEthnicity named raceEthnicity 0..1 and
    BirthWeight named birthWeight 0..1


// ===== 4) ENCOUNTER (Core visit data) =====

Profile: EncounterSubmission
Parent: Encounter
Id: encounter-submission
Title: "Encounter (Submission)"
* identifier 1..* MS
* status 1..1 MS
* class 1..1 MS
* class from http://terminology.hl7.org/CodeSystem/v3-ActCode (required)
* subject 1..1 MS
* serviceProvider 1..1 MS
* period.start 1..1 MS
* period.end 1..1 MS
* hospitalization.admitSource 0..1 MS
* hospitalization.dischargeDisposition 0..1 MS
* diagnosis 1..* MS
* diagnosis.use 1..1 MS
* diagnosis.use from http://hl7.org/fhir/ValueSet/diagnosis-role (required)
* diagnosis.condition 1..1 MS


// ===== 5) CONDITION (ICD-11) =====

Profile: ConditionEncounterDxICD11
Parent: Condition
Id: condition-encounter-dx-icd11
Title: "Encounter Diagnosis (ICD-11)"
* subject 1..1 MS
* code 1..1 MS
* code from https://moh.gov.my/fhir/ValueSet/icd11-all (required)
* category 1..* MS
* category = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis
* recordedDate 0..1 MS
* extension contains PresentOnAdmission named poa 0..1


// ===== 6) PROCEDURE (ICD-9-CM) =====

Profile: ProcedureICD9CM
Parent: Procedure
Id: procedure-icd9cm
Title: "Procedure (ICD-9-CM)"
* status 1..1 MS
* subject 1..1 MS
* code 1..1 MS
* code from https://moh.gov.my/fhir/ValueSet/icd9cm-all (required)
* performed[x] 0..1 MS
* bodySite 0..* MS
