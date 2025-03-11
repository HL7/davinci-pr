Instance: DownloadRemittance
InstanceOf: OperationDefinition
Description: "This operation is used to download a previously sent postable remittance."
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-pr/OperationDefinition/DownloadRemittance"
* name = "DownloadRemittance"
* title = "Download Postable Remittance"
* status = #active
* kind = #operation
* code = #downloadRemittance
* system = true
* type = false
* instance = false
* inputProfile = Canonical(DownloadRemittanceParameters)
* outputProfile = Canonical(RemittanceAdviceDocument)
* parameter[+]
  * name = #RemittanceAdviceIdentifier
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Remittance Advice Identifier"
  * type = #string
* parameter[+]
  * name = #RemittanceAdviceType
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Advice on which file format to be returned."
  * type = #code
  * binding
    * strength = #required
    * valueSet = Canonical(RemittanceAdviceType)
* parameter[+]
  * name = #RemittanceAdviceDocument
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Remittance Advice file sent as a binary and compressed in a zip format."
  * type = #Binary
  * targetProfile = Canonical(RemittanceAdviceDocument)

Profile: DownloadRemittanceParameters
Parent: Parameters
Id: downloadRemittanceParameters
Title: "Download Remittance Incoming Parameters"
Description: "A profile of Parameters that indicate the specific remittance advice to download."
* parameter 1..2
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains RemittanceAdviceIdentifier 1..1 and RemittanceAdviceType 0..1
* parameter[RemittanceAdviceIdentifier]
  * name = "RemittanceAdviceIdentifier"
  * value[x] 1..1
  * value[x] only string
* parameter[RemittanceAdviceType]
  * name = "RemittanceAdviceType"
  * value[x] 1..1
  * value[x] only code
  * valueCode from RemittanceAdviceType (required)

Instance: ExampleDownloadRemittance
InstanceOf: DownloadRemittanceParameters
Description: "An example of specifying a remittance to download."
* parameter[RemittanceAdviceIdentifier].valueString = "99999"
* parameter[RemittanceAdviceType].valueCode = urn:ietf:bcp:13#application/EDI-X12

Profile: RemittanceAdviceDocument
Parent: Binary
Id: remittanceAdviceDocument
Title: "Remittance Advice Document"
Description: "A profile of Binary that wraps the remittance advice being returned."
* contentType 1..1 MS
* contentType from RemittanceContentType (required)
* data 1..1 MS
* data.extension contains RemittanceIdentifier named remittanceIdentifier 1..1 MS

Extension: RemittanceIdentifier
Id: remittanceIdentifierExt
Description: "An identifier for the remittance."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "Binary.data"

Instance: ExampleRemittanceAdviceDocument
InstanceOf: RemittanceAdviceDocument
Description: "An example of a returned remittance advice document"
* contentType = urn:ietf:bcp:13#application/txt+gzip
* data = "YmFzZTY0LWVuY29kZWQgemlwIGZpbGUgb2YgdGhlIG9yaWdpbmFsIGRvY3VtZW50"
* data.extension[remittanceIdentifier].valueString = "A123456BCD"