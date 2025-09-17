// ── Example EOB with MY-DRG (R4) ──────────────────────────────────────────────
Instance: eob-example-mydrg
InstanceOf: MYDRGExplanationOfBenefit
Title: "Example EOB with MY-DRG"
Usage: #example

* status = #active
* use = #claim
* type = http://terminology.hl7.org/CodeSystem/claim-type#institutional

* patient = Reference(Patient/p-1)
* provider = Reference(Organization/org-Hospital)
* insurer = Reference(Organization/org-Insurer)

* created = "2025-08-11T10:00:00+08:00"
* outcome = http://hl7.org/fhir/remittance-outcome#complete "Complete"
* insurance[0].focal = true
* insurance[0].coverage = Reference(Coverage/cov-1)

* billablePeriod.start = "2025-08-01"
* billablePeriod.end   = "2025-08-10"

* extension[drg].valueCodeableConcept = http://moh.gov.my/fhir/CodeSystem/mydrg#CBG-1234-2 "Appendectomy w/o CC/MCC"
