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
* insert IncomingSearchParameters
* parameter[+]
  * name = #ServiceStartDate
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Start Date of Service"
  * type = #date
* parameter[+]
  * name = #ServiceEndDate
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "End Date of Service"
  * type = #date
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
    * documentation = "Provider generated Claim ID (also known as Patient Account Number)"
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
  * part[+]
    * name = #ClaimChargeAmount
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "Claim Charge Amount"
    * type = #Money
* insert OutgoingSearchParameters
* insert OutgoingClaimParameters

Profile: SearchByClaimParameters
Parent: Parameters
Id: searchByClaimParameters
Title: "Search By Claim Incoming Parameters"
Description: "A profile of Parameters that indicate the incoming parameters for searching by claim."
* parameter 2..7
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and ServiceStartDate 0..1 and ServiceEndDate 0..1 and PatientID 0..1 and PayerID 0..1 and PayerName 0..1 and Claim 1..1
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[ServiceStartDate]
  * name = "ServiceStartDate"
  * value[x] 1..1
  * value[x] only date
* parameter[ServiceEndDate]
  * name = "ServiceEndDate"
  * value[x] 1..1
  * value[x] only date
* parameter[PatientID]
  * name = "PatientID"
  * value[x] 1..1
  * value[x] only string
* parameter[PayerID]
  * name = "PayerID"
  * value[x] 0..1
  * value[x] only string
* parameter[PayerName]
  * name = "PayerName"
  * value[x] 0..1
  * value[x] only string
* parameter[Claim]
  * name = "Claim"
  * part 1..4
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains ProviderClaimID 1..1 and ProviderID 0..1 and PayerClaimID 0..1 and ClaimChargeAmount 0..1
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
  * part[ClaimChargeAmount]
    * name = "ClaimChargeAmount"
    * value[x] 1..1
    * value[x] only Money

Profile: SearchResultParameters
Parent: Parameters
Id: searchResultParameters
Title: "Search Result Outgoing Parameters"
Description: "A profile of Parameters that indicate the result paramaters of searching for a remittance by claim or patient."
* parameter 0..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 0..1 and Claim 0..* and Payer 0..1 and Patient 0..1
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[Claim]
  * name = #Claim
  * part 4..*
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains ProviderClaimID 1..1 and ClaimReceivedDate 1..1 and ProviderID 1..1 and PayerClaimID 1..1 and PaymentInfo 0..*
  * part[PayerClaimID]
    * name = "PayerClaimID"
    * value[x] 1..1
    * value[x] only string
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
  * part[PaymentInfo]
    * name = "PaymentInfo"
    * part 4..4
    * part ^slicing.discriminator.type = #value
    * part ^slicing.discriminator.path = "name"
    * part ^slicing.rules = #open
    * part ^slicing.description = "Slice Payment parameter parts based on the name"
    * part contains PaymentDate 1..1 and PaymentNumber 1..1 and PaymentAmount 1..1 and Remittance 1..1
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
    * part[Remittance]
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
* parameter[Payer]
  * name = "Payer"
  * part 2..2
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Payer parameter parts based on the name"
  * part contains PayerID 1..1 and PayerName 1..1
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


RuleSet: IncomingSearchParameters
* parameter[+]
  * name = #TIN
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Medical Group / Billing Provider / Payee TIN"
  * type = #string
* parameter[+]
  * name = #PayerID
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Payer Identifer"
  * type = #string
* parameter[+]
  * name = #PayerName
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Payer Name"
  * type = #string


RuleSet: OutgoingSearchParameters
* parameter[+]
  * name = #TIN
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Medical Group / Billing Provider / Payee TIN"
  * type = #string
* parameter[+]
  * name = #Payer
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Details of payer information."
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

RuleSet: OutgoingRemittanceParameters
* part[+]
  * name = #Remittance
  * use = #out
  * min = 1
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


RuleSet: OutgoingClaimParameters
* parameter[+]
  * name = #Claim
  * use = #out
  * min = 1
  * max = "*"
  * documentation = "Details to verify correct claim found."
  * part[+]
    * name = #PayerClaimID
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Payer Generated Claim ID (DCN or ICN)"
    * type = #string
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
    * insert OutgoingPaymentParameters
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

RuleSet: OutgoingPaymentParameters
* name = #PaymentInfo
* use = #out
* min = 1
* max = "*"
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
* insert OutgoingRemittanceParameters

Instance: ExampleSearchByClaim
InstanceOf: SearchByClaimParameters
Description: "An example of searching for remittances by claim."
* parameter[TIN].valueString = "123485858"
* parameter[ServiceStartDate].valueDate = 2023-08-01
* parameter[ServiceEndDate].valueDate = 2023-08-31
* parameter[PatientID].valueString = "M12345513215"
* parameter[Claim]
  * part[ProviderClaimID].valueString = "12345V54321"
  * part[ProviderID].valueString = "52415"

Instance: ExampleSearchResult
InstanceOf: SearchResultParameters
Description: "An example of a result for searching for a remittance."
* parameter[TIN].valueString = "123485858"
* parameter[Payer]
  * part[PayerID].valueString = "52415"
  * part[PayerName].valueString = "Acme Payment Inc"
* parameter[Claim]
  * part[ProviderClaimID].valueString = "12345V54321"
  * part[ClaimReceivedDate].valueDate = 2023-10-05
  * part[ProviderID].valueString = "52415"
  * part[PayerClaimID].valueString = "TYU7894562"
  * part[PaymentInfo]
    * part[PaymentDate].valueDate = 2023-11-02
    * part[PaymentNumber].valueString = "A12385858"
    * part[PaymentAmount].valueMoney
      * value = 30.00
      * currency = urn:iso:std:iso:4217#USD
    * part[Remittance]
      * part[RemittanceAdviceIdentifier].valueString = "A123456BCDEF"
      * part[RemittanceAdviceType].valueCode = urn:ietf:bcp:13#application/EDI-X12
      * part[RemittanceAdviceDate].valueDate = 2023-11-02
      * part[RemittanceAdviceFileSize].valueInteger = 1536
* parameter[Claim]
  * part[ProviderClaimID].valueString = "12345V54321"
  * part[ClaimReceivedDate].valueDate = 2023-10-04
  * part[ProviderID].valueString = "52415"
  * part[PayerClaimID].valueString = "TYU7894566"
  * part[PaymentInfo]
    * part[PaymentDate].valueDate = 2023-11-03
    * part[PaymentNumber].valueString = "A12385859"
    * part[PaymentAmount].valueMoney
      * value = 30.00
      * currency = urn:iso:std:iso:4217#USD
    * part[Remittance]
      * part[RemittanceAdviceIdentifier].valueString = "A123456BCDXY"
      * part[RemittanceAdviceType].valueCode = urn:ietf:bcp:13#application/EDI-X12
      * part[RemittanceAdviceDate].valueDate = 2023-11-04
      * part[RemittanceAdviceFileSize].valueInteger = 2048
* parameter[Patient]
  * part[DateOfBirth].valueDate = 1970-11-27
  * part[PatientID].valueString = "M12345513215"
  * part[PatientFirstName].valueString = "Adam"
  * part[PatientLastName].valueString = "Patient"
