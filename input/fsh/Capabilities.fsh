Instance: PostableRemittanceClientCapabilities
InstanceOf: CapabilityStatement
Title: "Postable Remittance Client Capabilities"
Description: "Capabilities required for a client system making Postable Remittance queries."
Usage: #definition
* url = Canonical(PostableRemittanceClientCapabilities)
* name = "PRClient"
* status = #active
* experimental = false
* date = "2025-01-01"
* description = "Capabilities required for a client system making Postable Remittance queries."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* rest[0]
  * mode = #client
  * resource[0]
    * type = #Parameters
    * operation[0]
      * name = "PR Search By Patients Query"
      * definition = Canonical(SearchByPatient)
    * operation[1]
      * name = "PR Search By Claim Query"
      * definition = Canonical(SearchByClaim)
    * operation[2]
      * name = "PR Search By Payment Query"
      * definition = Canonical(SearchByPayment)
    * operation[3]
      * name = "PR Download Remittance"
      * definition = Canonical(DownloadRemittance)

Instance: PostableRemittanceServerCapabilities
InstanceOf: CapabilityStatement
Title: "Postable Remittance Server Capabilities"
Description: "Capabilities required for a server system receiving Postable Remittance queries."
Usage: #definition
* url = Canonical(PostableRemittanceServerCapabilities)
* name = "PRServer"
* status = #active
* experimental = false
* date = "2025-01-01"
* description = "Capabilities required for a server system receiving Postable Remittance queries."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* rest
  * mode = #server
  * resource[0]
    * type = #Parameters
    * operation[0]
      * name = "PR Search By Patients Query"
      * definition = Canonical(SearchByPatient)
    * operation[1]
      * name = "PR Search By Claim Query"
      * definition = Canonical(SearchByClaim)
    * operation[2]
      * name = "PR Search By Payment Query"
      * definition = Canonical(SearchByPayment)
    * operation[3]
      * name = "PR Download Remittance"
      * definition = Canonical(DownloadRemittance)
