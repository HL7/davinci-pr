Instance: SearchByClaim
InstanceOf: OperationDefinition
Description: "This operation is used to search for a postable remittance by providing claim and patient information."
Usage: #definition
* url = "http://hl7.org/fhir/us/davinci-pr/OperationDefinition/SearchByClaim"
* name = "SearchByClaim"
* title = "Search for Postable Remittance By Claim and Patient"
* status = #active
* kind = #operation
* code = #searchByClaim
* system = true
* type = false
* instance = false
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
  * name = #Claim
  * use = #in
  * min = 0
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
    * min = 1
    * max = "1"
    * documentation = "Payer Generated Claim ID (DCN or ICN)"
    * type = #string
* parameter[+]
  * name = #Patient
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Information about the patient being searched for."
  * part[+]
    * name = #DateOfBirth
    * use = #in
    * min = 1
    * max = "1"
    * documentation = "Patient date of birth"
    * type = #date
  * part[+]
    * name = #PatientID
    * use = #in
    * min = 0
    * max = "1"
    * documentation = "Patient Member (or Subscriber) Insurance ID"
    * type = #string
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
