Instance: ServerCapabilities
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Submission Server Capabilities (Minimal)"
Description: "Minimal capabilities for a server that accepts a DRG shadow-billing submission Bundle."
* status = #active
* date = "2025-10-04"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* rest[0].mode = #server
* rest[0].security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
* rest[0].resource[0].type = #Bundle
* rest[0].resource[0].supportedProfile[0] = Canonical(GroupingSubmissionBundle)
* rest[0].resource[0].interaction[0].code = #create
* rest[0].resource[0].interaction[1].code = #read

     