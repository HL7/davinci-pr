Instance: SearchByPayment
InstanceOf: OperationDefinition
Description: "This operation is used to search for a postable remittance by providing payment information."
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-pr/OperationDefinition/SearchByPayment"
* name = "SearchByPayment"
* title = "Search for Postable Remittance By Payment"
* status = #active
* kind = #operation
* code = #searchByPayment
* system = true
* type = false
* instance = false
* inputProfile = Canonical(SearchByPaymentParameters)
* outputProfile = Canonical(SearchByPaymentResultParameters)
* insert IncomingSearchParameters
* parameter[+]
  * name = #DateOfServicePeriod
  * use = #in
  * min = 0
  * max= "1"
  * documentation = "Date of Service Period"
  * type = #Period
* parameter[+]
  * name = #PaymentInfo
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Information about the payment being searched for."
  * part[+]
    * name = #PaymentIssueDate
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Payment Issue Date"
    * type = #Period
  * part[+]
    * name = #PaymentAmountRange
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "Payment Amount Range"
    * part[+]
      * name = #PaymentAmountLow
      * use = #in
      * min = 1
      * max = "1"
      * documentation = "Payment Number Low"
      * type = #Money
    * part[+]
      * name = #PaymentAmountHigh
      * use = #in
      * min = 1
      * max = "1"
      * documentation = "Payment Number High"
      * type = #Money
  * part[+]
    * name = #PaymentNumber
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Payment Number - EFT/Cheque/Unique Remit Number"
    * type = #string
* insert OutgoingSearchParameters
* parameter[+]
  * insert OutgoingPaymentParameters

Profile: SearchByPaymentParameters
Parent: Parameters
Id: searchByPaymentParameters
Title: "Search By Payment Incoming Parameters"
Description: "A profile of Parameters that indicate the incoming parameters for searching by a payment."
* parameter 2..5
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and DateOfService 0..1 and PayerID 0..1 and PayerName 0..1 and PaymentInfo 1..1
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[DateOfService]
  * name = "DateOfService"
  * value[x] 1..1
  * value[x] only Period
* parameter[PayerID]
  * name = "PayerID"
  * value[x] 0..1
  * value[x] only string
* parameter[PayerName]
  * name = "PayerName"
  * value[x] 0..1
  * value[x] only string
* parameter[PaymentInfo]
  * name = "PaymentInfo"
  * part 2..5
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains PaymentIssueDate 1..1 and PaymentAmount 0..1 and PaymentNumber 1..1
  * part[PaymentIssueDate]
    * name = "PaymentIssueDate"
    * value[x] 1..1
    * value[x] only Period
  * part[PaymentAmount]
    * name = "PaymentAmount"
    * part 2..2
    * part ^slicing.discriminator.type = #value
    * part ^slicing.discriminator.path = "name"
    * part ^slicing.rules = #open
    * part ^slicing.description = "Slice Claim parameter parts based on the name"
    * part contains PaymentAmountLow 1..1 and PaymentAmountHigh 1..1
    * part[PaymentAmountLow]
      * name = "PaymentAmountLow"
      * value[x] 1..1
      * value[x] only Money
    * part[PaymentAmountHigh]
      * name = "PaymentAmountHigh"
      * value[x] 1..1
      * value[x] only Money
  * part[PaymentNumber]
    * name = "PaymentNumber"
    * value[x] 1..1
    * value[x] only string

Profile: SearchByPaymentResultParameters
Parent: Parameters
Id: searchByPaymentResultParameters
Title: "Search By Payment Result Outgoing Parameters"
Description: "A profile of Parameters that indicate the result paramaters of searching for a remittance by a payment."
* parameter 3..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and Payer 1..1 and PaymentInfo 1..*
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
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
* parameter[PaymentInfo]
  * name = "PaymentInfo"
  * part 4..*
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Payment parameter parts based on the name"
  * part contains PaymentIssueDate 1..1 and PaymentNumber 1..1 and PaymentAmount 1..1 and Remittance 1..*
  * part[PaymentIssueDate]
    * name = "PaymentIssueDate"
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


Instance: ExampleSearchByPayment
InstanceOf: SearchByPaymentParameters
Description: "An example of searching for remittances by payment."
* parameter[TIN].valueString = "123456"
* parameter[PaymentInfo]
  * part[PaymentIssueDate].valuePeriod.start = 2024-06-07
  * part[PaymentIssueDate].valuePeriod.end = 2024-06-10
  * part[PaymentNumber].valueString = "11111"
  * part[PaymentAmount].part[PaymentAmountLow].valueMoney
    * value = 123.45
    * currency = urn:iso:std:iso:4217#USD
  * part[PaymentAmount].part[PaymentAmountHigh].valueMoney
    * value = 223.45
    * currency = urn:iso:std:iso:4217#USD
* parameter[PayerID].valueString = "54321"

Instance: ExampleSearchPaymentResult
InstanceOf: SearchByPaymentResultParameters
Description: "An example of a result for searching for a remittance."
* parameter[TIN].valueString = "123456"
* parameter[Payer]
  * part[PayerID].valueString = "54321"
  * part[PayerName].valueString = "Acme Payment Inc"
* parameter[PaymentInfo]
  * part[PaymentIssueDate].valueDate = 2024-06-07
  * part[PaymentNumber].valueString = "11111"
  * part[PaymentAmount].valueMoney
    * value = 123.45
    * currency = urn:iso:std:iso:4217#USD
  * part[Remittance]
    * part[RemittanceAdviceIdentifier].valueString = "99999"
    * part[RemittanceAdviceType].valueCode = RemittanceAdviceType#835
    * part[RemittanceAdviceDate].valueDate = 2024-06-07
    * part[RemittanceAdviceFileSize].valueInteger = 123456
* parameter[PaymentInfo]
  * part[PaymentIssueDate].valueDate = 2024-06-07
  * part[PaymentNumber].valueString = "88888"
  * part[PaymentAmount].valueMoney
    * value = 50.92
    * currency = urn:iso:std:iso:4217#USD
  * part[Remittance]
    * part[RemittanceAdviceIdentifier].valueString = "8888"
    * part[RemittanceAdviceType].valueCode = RemittanceAdviceType#PDF
    * part[RemittanceAdviceDate].valueDate = 2024-06-09
    * part[RemittanceAdviceFileSize].valueInteger = 123456
