CodeSystem: RemittanceAdviceType
Id: RemittanceAdviceType
Description: "Codes that indicate the type of remittance advice"
Title: "Remittance Advice Code System"
* ^experimental = false
* ^caseSensitive = true
* #835 "X12 835"
* #PDF "PDF"

ValueSet: RemittanceAdviceType
Id: RemittanceAdviceType
Description: "Codes that indicate the type of remittance advice"
Title: "Remittance Advice Value Set"
* ^experimental = false
* include codes from system RemittanceAdviceType

ValueSet: RemittanceContentType
Id: RemittanceContentType
Description: "Codes that indicate the content of the remittance"
Title: "Remittance Advice Content Type Value Set"
* ^experimental = false
* urn:ietf:bcp:13#application/pdf+gzip
* urn:ietf:bcp:13#application/txt+gzip