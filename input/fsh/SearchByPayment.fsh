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
* parameter[+]
  * name = #TIN
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Medical Group / Billing Provider / Payee TIN"
  * type = #string
* parameter[+]
  * name = #Payment
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Information about the payment being searched for."
  * part[+]
    * name = #PaymentDate
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Payment Date"
    * type = #date
  * part[+]
    * name = #PaymentAmount
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Payment Amount"
    * type = #Money
  * part[+]
    * name = #PaymentNumber
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Payment Number - EFT/Cheque/Unique Remit Number"
    * type = #string
  * part[+]
    * name = #PayerID
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "Payer Identifer"
    * type = #string
* insert OutgoingRemittanceParameters

Profile: SearchByPaymentParameters
Parent: Parameters
Id: searchByPaymentParameters
Title: "Search By Payment Incoming Parameters"
Description: "A profile of Parameters that indicate the incoming parameters for searching by a payment."
* parameter 2..2
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and Payment 1..1
* parameter[TIN]
  * name = "TIN"
  * value[x] 1..1
  * value[x] only string
* parameter[Payment]
  * name = "Payment"
  * part 3..4
  * part ^slicing.discriminator.type = #value
  * part ^slicing.discriminator.path = "name"
  * part ^slicing.rules = #open
  * part ^slicing.description = "Slice Claim parameter parts based on the name"
  * part contains PaymentDate 1..1 and PaymentAmount 1..1 and PaymentNumber 1..1 and PayerID 0..1
  * part[PaymentDate]
    * name = "PaymentDate"
    * value[x] 1..1
    * value[x] only date
  * part[PaymentAmount]
    * name = "PaymentAmount"
    * value[x] 1..1
    * value[x] only Money
  * part[PaymentNumber]
    * name = "PaymentNumber"
    * value[x] 1..1
    * value[x] only string
  * part[PayerID]
    * name = "PayerID"
    * value[x] 0..1
    * value[x] only string

Profile: SearchByPaymentResultParameters
Parent: Parameters
Id: searchByPaymentResultParameters
Title: "Search By Payment Result Outgoing Parameters"
Description: "A profile of Parameters that indicate the result paramaters of searching for a remittance by a payment."
* parameter 2..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice parameters based on the name"
* parameter contains TIN 1..1 and Payer 1..1 and Payment 0..1 and Remittance 0..*
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


Instance: ExampleSearchByPayment
InstanceOf: SearchByPaymentParameters
Description: "An example of searching for remittances by payment."
* parameter[TIN].valueString = "123456"
* parameter[Payment]
  * part[PaymentDate].valueDate = 2024-06-07
  * part[PaymentNumber].valueString = "11111"
  * part[PaymentAmount].valueMoney
    * value = 123.45
    * currency = urn:iso:std:iso:4217#CAD
  * part[PayerID].valueString = "54321"

Instance: ExampleSearchPaymentResult
InstanceOf: SearchByPaymentResultParameters
Description: "An example of a result for searching for a remittance."
* parameter[TIN].valueString = "123456"
* parameter[Payer]
  * part[PayerID].valueString = "54321"
  * part[PayerName].valueString = "Acme Payment Inc"
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
