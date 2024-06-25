Instance: SearchByClaim
InstanceOf: OperationDefinition
Description: "This operation is used to search for a postable remittance by providing claim information."
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-pr/OperationDefinition/SearchByClaim"
* name = "SearchByClaim"
* title = "Search for Postable Remittance By Claim"
* status = #active
* kind = #operation
* code = #searchByClaim
* system = true
* type = false
* instance = false
* inputProfile = Canonical(SearchByClaimParameters)
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
  * name = #PatientID
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Patient Member (or Subscriber) Insurance ID"
  * type = #string
* parameter[+]
  * name = #Claim
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Information about the claim being searched for."
  * part[+]
    * name = #ProviderClaimID
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Provider generated Claim ID"
    * type = #string
  * part[+]
    * name = #ProviderID
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "NPI or Payer Assigned Provider Identifier"
    * type = #string
  * part[+]
    * name = #PayerClaimID
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "Payer Generated Claim ID (DCN or ICN)"
    * type = #string
* insert OutgoingSearchParameters

Profile: SearchByClaimParameters
Parent: Parameters
Id: searchByClaimParameters
Title: "Search By Claim Incoming Parameters"
Description: "A profiloe of Parameters that indicate the incoming parameters for searching by claim."
* parameter 2..4
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and DateOfService 0..1 and PatientID 0..1 and Claim 1..1
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[DateOfService]
  * name = "DateOfService"
  * value[x] 1..1
  * value[x] only Period
* parameter[PatientID]
  * name = "PatientID"
  * value[x] 1..1
  * value[x] only string
* parameter[Claim]
  * name = "Claim"
  * part 3..3
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains ProviderClaimID 1..1 and ProviderID 1..1 and PayerClaimID 1..1
  * part[ProviderClaimID]
    * name = "ProviderClaimID"
    * value[x] 1..1
    * value[x] only string
  * part[ProviderID]
    * name = "ProviderID"
    * value[x] 1..1
    * value[x] only string
  * part[PayerClaimID]
    * name = "PayerClaimID"
    * value[x] 1..1
    * value[x] only string

Profile: SearchResultParameters
Parent: Parameters
Id: searchResultParameters
Title: "Search Result Outgoing Parameters"
Description: "A profiloe of Parameters that indicate the result paramaters of searching for a remittance."
* parameter 4..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and DateOfService 1..1 and Claim 1..1 and Patient 1..1 and Payment 0..1 and Remittance 0..*
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[DateOfService]
  * name = "DateOfService"
  * value[x] 1..1
  * value[x] only Period
* parameter[Claim]
  * name = #Claim
  * part 6..6
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains ProviderClaimID 1..1 and ClaimReceivedDate 1..1 and ProviderID 1..1 and PayerClaimID 1..1 and PayerID 1..1 and PayerName 1..1
  * part[ProviderClaimID]
    * name = "ProviderClaimID"
    * value[x] 1..1
    * value[x] only string
  * part[ClaimReceivedDate]
    * name = "ClaimReceivedDate"
    * value[x] 1..1
    * value[x] only date
  * part[ProviderID]
    * name = "ProviderID"
    * value[x] 1..1
    * value[x] only string
  * part[PayerClaimID]
    * name = "PayerClaimID"
    * value[x] 1..1
    * value[x] only string
  * part[PayerID]
    * name = "PayerID"
    * value[x] 1..1
    * value[x] only string
  * part[PayerName]
    * name = "PayerName"
    * value[x] 1..1
    * value[x] only string
* parameter[Patient]
  * name = "Patient"
  * part 4..4
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Patient parameter parts based on the name"
  * part contains DateOfBirth 1..1 and PatientID 1..1 and PatientFirstName 1..1 and PatientLastName 1..1
  * part[DateOfBirth]
    * name = "DateOfBirth"
    * value[x] 1..1
    * value[x] only date
  * part[PatientID]
    * name = "PatientID"
    * value[x] 1..1
    * value[x] only string
  * part[PatientFirstName]
    * name = "PatientFirstName"
    * value[x] 1..1
    * value[x] only string
  * part[PatientLastName]
    * name = "PatientLastName"
    * value[x] 1..1
    * value[x] only string
* parameter[Payment]
  * name = "Payment"
  * part 3..3
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Payment parameter parts based on the name"
  * part contains PaymentDate 1..1 and PaymentNumber 1..1 and PaymentAmount 1..1
  * part[PaymentDate]
    * name = "PaymentDate"
    * value[x] 1..1
    * value[x] only date
  * part[PaymentNumber]
    * name = "PaymentNumber"
    * value[x] 1..1
    * value[x] only string
  * part[PaymentAmount]
    * name = "PaymentAmount"
    * value[x] 1..1
    * value[x] only Money
* parameter[Remittance]
  * name = "Remittance"
  * part 4..4
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Remittance parameter parts based on the name"
  * part contains RemittanceAdviceIdentifier 1..1 and RemittanceAdviceType 1..1 and RemittanceAdviceDate 1..1 and RemittanceAdviceFileSize 1..1
  * part[RemittanceAdviceIdentifier]
    * name = "RemittanceAdviceIdentifier"
    * value[x] 1..1
    * value[x] only string
  * part[RemittanceAdviceType]
    * name = "RemittanceAdviceType"
    * value[x] 1..1
    * value[x] only code
    * valueCode from RemittanceAdviceType (required)
  * part[RemittanceAdviceDate]
    * name = "RemittanceAdviceDate"
    * value[x] 1..1
    * value[x] only date
  * part[RemittanceAdviceFileSize]
    * name = "RemittanceAdviceFileSize"
    * value[x] 1..1
    * value[x] only integer


RuleSet: OutgoingSearchParameters
* parameter[+]
  * name = #TIN
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Medical Group / Billing Provider / Payee TIN"
  * type = #string
* parameter[+]
  * name = #DateOfService
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Date of Service"
  * type = #Period
* parameter[+]
  * name = #Claim
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Details to verify correct claim found."
  * part[+]
    * name = #ProviderClaimID
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Provider generated Claim ID"
    * type = #string
  * part[+]
    * name = #ClaimReceivedDate
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Claim Received Date"
    * type = #date
  * part[+]
    * name = #ProviderID
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "NPI or Payer Assigned Provider Identifier"
    * type = #string
  * part[+]
    * name = #PayerClaimID
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payer Generated Claim ID (DCN or ICN)"
    * type = #string
  * part[+]
    * name = #PayerID
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payer Identifier"
    * type = #string
  * part[+]
    * name = #PayerName
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payer Name"
    * type = #string
* parameter[+]
  * name = #Patient
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Details to verify correct patient found."
  * part[+]
    * name = #DateOfBirth
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Patient date of birth"
    * type = #date
  * part[+]
    * name = #PatientID
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Patient Member (or Subscriber) Insurance ID"
    * type = #string
  * part[+]
    * name = #PatientFirstName
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Patient First Name"
    * type = #string
  * part[+]
    * name = #PatientLastName
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Patient Last Name"
    * type = #string
* parameter[+]
  * name = #Payment
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Details of adjudicated payment."
  * part[+]
    * name = #PaymentDate
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payment Date"
    * type = #date
  * part[+]
    * name = #PaymentNumber
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payment Number"
    * type = #string
  * part[+]
    * name = #PaymentAmount
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payment Amount"
    * type = #Money
* parameter[+]
  * name = #Remittance
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "Details of remittance advice."
  * part[+]
    * name = #RemittanceAdviceIdentifier
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Remittance Advice Identifier"
    * type = #string
  * part[+]
    * name = #RemittanceAdviceType
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Remittance Advice Type"
    * type = #code
    * binding
      * strength = #required
      * valueSet = Canonical(RemittanceAdviceType)
  * part[+]
    * name = #RemittanceAdviceDate
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Remittance Advice Date"
    * type = #date
  * part[+]
    * name = #RemittanceAdviceFileSize
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Remittance Advice File Size"
    * type = #integer

Instance: ExampleSearchByClaim
InstanceOf: SearchByClaimParameters
Description: "An example of searching for remittances by claim."
* parameter[TIN].valueString = "123456"
* parameter[DateOfService].valuePeriod
  * start = 2024-01-01
  * end = 2024-01-31
* parameter[PatientID].valueString = "34567"
* parameter[Claim]
  * part[ProviderClaimID].valueString = "12345"
  * part[ProviderID].valueString = "23456"
  * part[PayerClaimID].valueString = "34567"

Instance: ExampleSearchResult
InstanceOf: SearchResultParameters
Description: "An example of a result for searching for a remittance."
* parameter[TIN].valueString = "123456"
* parameter[DateOfService].valuePeriod
  * start = 2024-01-01
  * end = 2024-01-31
* parameter[Claim]
  * part[ProviderClaimID].valueString = "12345"
  * part[ClaimReceivedDate].valueDate = 2024-06-01
  * part[ProviderID].valueString = "23456"
  * part[PayerClaimID].valueString = "34567"
  * part[PayerID].valueString = "54321"
  * part[PayerName].valueString = "Acme Payment Inc"
* parameter[Patient]
  * part[DateOfBirth].valueDate = 1970-11-27
  * part[PatientID].valueString = "23456"
  * part[PatientFirstName].valueString = "Adam"
  * part[PatientLastName].valueString = "Patient"
* parameter[Payment]
  * part[PaymentDate].valueDate = 2024-06-07
  * part[PaymentNumber].valueString = "11111"
  * part[PaymentAmount].valueMoney
    * value = 123.45
    * currency = urn:iso:std:iso:4217#CAD
* parameter[Remittance]
  * part[RemittanceAdviceIdentifier].valueString = "99999"
  * part[RemittanceAdviceType].valueCode = RemittanceAdviceType#835
  * part[RemittanceAdviceDate].valueDate = 2024-06-07
  * part[RemittanceAdviceFileSize].valueInteger = 123456
