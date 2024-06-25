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
  * type = #DocumentReference
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
* parameter[RemittanceAdviceType].valueCode = RemittanceAdviceType#835

Profile: RemittanceAdviceDocument
Parent: DocumentReference
Id: remittanceAdviceDocument
Title: "Remittance Advice Document"
Description: "A profile of DocumentReference that provides the details of the remittance advice being returned."
* status = #current
* content 1..1
  * attachment 1..1
    * contentType = #application/zip
    * data 1..1

Instance: ExampleRemittanceAdviceDocument
InstanceOf: RemittanceAdviceDocument
Description: "An example of a returned remittance advice document"
* content.attachment.contentType = #application/zip
* content.attachment.data = "YmFzZTY0LWVuY29kZWQgemlwIGZpbGUgb2YgdGhlIG9yaWdpbmFsIGRvY3VtZW50"
