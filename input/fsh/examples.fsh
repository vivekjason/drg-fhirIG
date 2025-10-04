// ------------------------------------------------------
// Example resources FIRST, then the Bundle that contains them
// ------------------------------------------------------

Alias: POA = https://moh.gov.my/fhir/CodeSystem/poa

// Hospital
Instance: Hosp1
InstanceOf: OrganizationHospital
Usage: #example
* name = "Private Hospital 01"
* identifier[0].system = "https://moh.gov.my/id/provider"
* identifier[0].value = "PRIV-HOSP-01"
* type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/organization-type"
* type[0].coding[0].code = #prov

// Patient
Instance: Pat1
InstanceOf: PatientSubmission
Usage: #example
* name[0].family = "Doe"
* name[0].given[0] = "Jane"
* gender = #female
* birthDate = "1978-03-15"
* identifier[0].system = "https://moh.gov.my/id/nric"
* identifier[0].value = "780315-14-1234"
* identifier[+].system = "https://moh.gov.my/id/mrn"
* identifier[=].value = "MRN-001"
* extension[nationality].valueCodeableConcept = SCT#224826009 "Malaysian"
* extension[raceEthnicity].valueCodeableConcept = SCT#413773004 "Ethnic group"
* extension[birthWeight].valueQuantity.value = 3200
* extension[birthWeight].valueQuantity.unit = "g"
* extension[birthWeight].valueQuantity.system = "http://unitsofmeasure.org"
* extension[birthWeight].valueQuantity.code = #g

// Diagnoses (ICD-11)
Instance: DxPrincipal
InstanceOf: ConditionEncounterDxICD11
Usage: #example
* subject = Reference(Pat1)
* code = ICD11MMS#DA63 "Acute appendicitis"
* recordedDate = "2025-09-01"
* extension[poa].valueCodeableConcept = POA#Y "Yes"

Instance: DxSecondary
InstanceOf: ConditionEncounterDxICD11
Usage: #example
* subject = Reference(Pat1)
* code = ICD11MMS#5A11 "Type 2 diabetes mellitus"
* recordedDate = "2025-09-01"
* extension[poa].valueCodeableConcept = POA#Y "Yes"

// Procedure (ICD-9-CM)
Instance: Proc1
InstanceOf: ProcedureICD9CM
Usage: #example
* status = #completed
* subject = Reference(Pat1)
* code = ICD9CM#47.09 "Appendectomy, other and unspecified"
* performedDateTime = "2025-09-02T09:20:00+08:00"
* bodySite[0] = SCT#66754008 "Appendix structure"

// Encounter (with diagnosis links)
Instance: Enc1
InstanceOf: EncounterSubmission
Usage: #example
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP
* identifier[0].system = "https://moh.gov.my/id/encounter"
* identifier[0].value = "ENC-0001"
* subject = Reference(Pat1)
* serviceProvider = Reference(Hosp1)
* period.start = "2025-09-01T08:10:00+08:00"
* period.end   = "2025-09-05T14:35:00+08:00"
* diagnosis[0].use = http://terminology.hl7.org/CodeSystem/diagnosis-role#principal
* diagnosis[0].condition = Reference(DxPrincipal)
* diagnosis[+].use = http://terminology.hl7.org/CodeSystem/diagnosis-role#secondary
* diagnosis[=].condition = Reference(DxSecondary)


// ------------------------------------------------------
// Now the Bundle that contains them
// ------------------------------------------------------

Instance: ExampleSubmissionBundle
InstanceOf: GroupingSubmissionBundle
Usage: #example
* type = #collection
* identifier.system = "https://moh.gov.my/fhir/id/submission"
* identifier.value = "SUB-2025-00001"

* entry[+].fullUrl = "urn:uuid:org1"
* entry[=].resource = Hosp1

* entry[+].fullUrl = "urn:uuid:pat1"
* entry[=].resource = Pat1

* entry[+].fullUrl = "urn:uuid:enc1"
* entry[=].resource = Enc1

* entry[+].fullUrl = "urn:uuid:dx1"
* entry[=].resource = DxPrincipal

* entry[+].fullUrl = "urn:uuid:dx2"
* entry[=].resource = DxSecondary

* entry[+].fullUrl = "urn:uuid:proc1"
* entry[=].resource = Proc1
