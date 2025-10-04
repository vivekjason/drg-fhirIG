// ------------------------------------------------------
// Canonicals and code system references
// ------------------------------------------------------

Alias: SCT = http://snomed.info/sct
Alias: LOINC = http://loinc.org
Alias: RXNORM = http://www.nlm.nih.gov/research/umls/rxnorm
Alias: UCUM = http://unitsofmeasure.org
Alias: ICD9CM = http://hl7.org/fhir/sid/icd-9-cm
Alias: ICD11MMS = http://id.who.int/icd/release/11/mms

// ===== ValueSets (broad includes; refine later) =====

ValueSet: ICD11All
Id: icd11-all
Title: "ICD-11 MMS (all)"
* ^url = "https://moh.gov.my/fhir/ValueSet/icd11-all"
* include codes from system ICD11MMS

ValueSet: ICD9CMAll
Id: icd9cm-all
Title: "ICD-9-CM (all)"
* ^url = "https://moh.gov.my/fhir/ValueSet/icd9cm-all"
* include codes from system ICD9CM

// ===== POA CodeSystem & ValueSet =====

CodeSystem: POACodeSystem
Id: poa
Title: "Present On Admission (POA)"
* ^url = "https://moh.gov.my/fhir/CodeSystem/poa"
* ^caseSensitive = false
* #Y "Yes"
* #N "No"
* #U "Unknown"
* #W "Clinically undetermined"

ValueSet: POAValues
Id: poa-values
Title: "POA Values"
* ^url = "https://moh.gov.my/fhir/ValueSet/poa-values"
* include codes from system https://moh.gov.my/fhir/CodeSystem/poa

// ===== Extensions (flat, simple) =====

Extension: Nationality
Id: nationality
Title: "Nationality"
* ^url = "https://moh.gov.my/fhir/StructureDefinition/nationality"
* valueCodeableConcept 1..1
* valueCodeableConcept from SCT (preferred)

Extension: RaceEthnicity
Id: race-ethnicity
Title: "Race/Ethnicity"
* ^url = "https://moh.gov.my/fhir/StructureDefinition/race-ethnicity"
* valueCodeableConcept 1..1
* valueCodeableConcept from SCT (preferred)

Extension: BirthWeight
Id: birth-weight
Title: "Birth Weight (grams)"
* ^url = "https://moh.gov.my/fhir/StructureDefinition/birth-weight"
* valueQuantity 1..1
* valueQuantity.system = UCUM
* valueQuantity.code = #g

Extension: PresentOnAdmission
Id: present-on-admission
Title: "Present On Admission (POA)"
* ^url = "https://moh.gov.my/fhir/StructureDefinition/present-on-admission"
* valueCodeableConcept 1..1
* valueCodeableConcept from https://moh.gov.my/fhir/ValueSet/poa-values (required)
