Instance: SearchByPatient
InstanceOf: OperationDefinition
Description: "This operation is used to search for a postable remittance by providing patient information."
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-pr/OperationDefinition/SearchByPatient"
* name = "SearchByPatient"
* title = "Search for Postable Remittance By Patient"
* status = #active
* kind = #operation
* code = #searchByPatient
* system = true
* type = false
* instance = false
* inputProfile = Canonical(SearchByPatientParameters)
* outputProfile = Canonical(SearchResultParameters)
* parameter[+]
  * name = #TIN
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Medical Group / Billing Provider / Payee TIN"
  * type = #string
* parameter[+]
  * name = #DateOfService
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Date of Service"
  * type = #Period
* parameter[+]
  * name = #Patient
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Information about the patient being searched for."
  * part[+]
    * name = #DateOfBirth
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "Patient date of birth"
    * type = #date
  * part[+]
    * name = #PatientID
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Patient Member (or Subscriber) Insurance ID"
    * type = #string
* insert OutgoingSearchParameters

Profile: SearchByPatientParameters
Parent: Parameters
Id: searchByPatientParameters
Title: "Search By Patient Incoming Parameters"
Description: "A profiloe of Parameters that indicate the incoming parameters for searching by a patient."
* parameter 2..3
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and DateOfService 0..1 and Patient 1..1

* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[DateOfService]
  * name = "DateOfService"
  * value[x] 1..1
  * value[x] only Period
* parameter[Patient]
  * name = "Patient"
  * part 1..2
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains PatientID 1..1 and DateOfBirth 0..1
  * part[PatientID]
    * name = "PatientID"
    * value[x] 1..1
    * value[x] only string
  * part[DateOfBirth]
    * name = "DateOfBirth"
    * value[x] 1..1
    * value[x] only date

Instance: ExampleSearchByPatient
InstanceOf: SearchByPatientParameters
Description: "An example of searching for remittances by patient."
* parameter[TIN].valueString = "123456"
* parameter[DateOfService].valuePeriod
  * start = 2024-01-01
  * end = 2024-01-31
* parameter[Patient]
  * part[PatientID].valueString = "23456"
  * part[DateOfBirth].valueDate = 1970-11-27

