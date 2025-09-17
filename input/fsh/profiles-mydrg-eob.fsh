// ── Alias must be top-level (before the Profile) ───────────────────────────────
Alias: EOBDRG = http://hl7.org/fhir/5.0/StructureDefinition/extension-ExplanationOfBenefit.diagnosisRelatedGroup

// ── MY-DRG ExplanationOfBenefit (R4) ───────────────────────────────────────────
Profile: MYDRGExplanationOfBenefit
Parent: ExplanationOfBenefit
Id: mydrg-eob
Title: "MY-DRG ExplanationOfBenefit (R4)"
Description: "EOB with mandatory DRG assignment for Malaysian casemix."

* status 1..1
* use 1..1
* type 1..1
* patient 1..1 MS
* provider 1..1 MS
* insurer 1..1 MS
* billablePeriod 1..1 MS

// R4: DRG via cross-version extension so payload shape matches R5 later
* extension contains EOBDRG named drg 1..1
* extension[drg].value[x] only CodeableConcept
* extension[drg].valueCodeableConcept from http://moh.gov.my/fhir/ValueSet/mydrg (required)

// Traceability around grouping
* diagnosis MS
* procedure MS
