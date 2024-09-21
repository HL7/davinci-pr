### Introduction

There are three types of searches that are supported by this Implementation Guide.

* Search for Remittance By Claim

Provider has a long outstanding claim submission without a corresponding remittance.  Assuming that the claim is adjudicated, parameters to identify the claim are submitted and a list of remittances associated with that claim are returned.

* Search for Remittance By Patient

Provider has claim submissions for a patient without a corresponding remittance.  Rather than providing information on a single claim, patient information is submitted and a list of remittances associated with that patient are returned.

* Search for Remittance by Payment

Provider has received the notification of a payment (either by cheque or EFT deposit) but there is no remittance accompanying the payment.  Information about the payment is submitted and a list of remittances assocaited with that payment are returned.

* Download Remittance

Once a list of remittances has been returned via one of the previous search mechanisms, a specific remittance identifier is specified and a copy of the remittance, either in 835 format or PDF format, is returned as an encoded attachment in a FHIR DocumentReference instance.

#### Search Parameter Formats
For all of the use cases, the incoming parameters are specified as a FHIR Parameters resource.  The outgoing information for the three Search operations are also specified as a FHIR Parameters resource.  The Download Remittance outgoing information is a FHIR DocumentReference instance with the remittance specified in the DocumentReference.content.attachment element as encoded binary data.

#### Search Timeframes
The time from when a remittance was returned to when you can retrieve it via a search using this API is payer-specific.  Payers **SHALL** provide the timeframe of searches.

{% raw %}
<blockquote class="stu-note">
<p>
The list of input and output search parameters has been reviewed by multiple providers and payers.  It will undergo validation at Connectathons and via balloting.
</p>
</blockquote>
{% endraw %}

#### No Match Results
If the set of input parameters results in no results found, then the output Parameters will be empty.


### Search for Remittance by Claim

!["Silent" Claim](silent_claim.png "Silent Claim"){:style="float: none;}

This search is used to find remittances associated with a previous claim submission.  This API does not provide any means to return a claim status.  As well, only remittances for adjudicated claims will be returned.  The payer will search for the claim given the passed-in search parameters and find remittances associated with that claim.  The remittance information is returned along with claim information that can be used by the provider to verify the proper claim was retrieved.  Any of the returned remittance identifiers can then be used in the Download Remittance operation.

#### Input
* Provider TIN (mandatory)
* Date Of Service Period (optional)
* Patient ID (optional)
* Payer ID (optional)
* Payer Name (optional)
* Claim Information (mandatory)
  * Provider Claim ID (mandatory) - also known as Patient Account Number
  * Provider ID (optional)
  * Payer Claim ID (optional)
  * Claim Charge Amount (optional)

#### Output
* Provider TIN (optional, mandatory if Remittance information found)
* Payer Information (optional, mandatory if Remittance information found)
  * Payer ID (mandatory)
  * Payer Name (mandatory)
* Patient Information (optional, mandatory if Remittance information found)
  * Patient ID (mandatory)
  * Patient Date of Birth (mandatory)
  * Patient First Name (mandatory)
  * Patient Last Name (mandatory)
* Claim Information (optional, mandatory if Remittance information found, repeats)
  * Payer Claim ID (mandatory) - the primary key of the claim information
  * Provider Claim ID (mandatory)
  * Claim Received Date (mandatory)
  * Provider ID (mandatory)
  * Payment Information (optional, repeats)
    * Payment Issue Date (mandatory)
    * Payment Number (mandatory)
    * Payment Amount (mandatory)
* Remittance Information (optional, mandatory if Remittance information found, repeats)
  * Remittance Advice Identifier (mandatory)
  * Remittance Advice Type (mandatory)
  * Remittance Advice Date (mandatory)
  * Remittance Advice File Size (mandatory)


### Search for Remittance by Patient
This search is used to find remittances associated with a patient.  The payer will search for the patient given the passed-in search parameters and find remittances associated with that patient.  The remittance information is returned along with patient and claim information that can be used by the provider to verify the proper patient was retrieved.  Any of the returned remittance identifiers can then be used in the Download Remittance operation.

#### Input
* Provider TIN (mandatory)
* Date of Service Period (optional)
* Payer ID (optional)
* Payer Name (optional)
* Patient Information (mandatory)
  * Patient ID (mandatory)
  * Patient Date of Birth (mandatory)
  * Patient First Name (optional)
  * Patient Last Name (optional)

#### Output
* Provider TIN (optional, mandatory if Remittance information found)
* Payer Information (optional, mandatory if Remittance information found)
  * Payer ID (mandatory)
  * Payer Name (mandatory)
* Patient Information (optional, mandatory if Remittance information found)
  * Patient ID (mandatory)
  * Patient Date of Birth (mandatory)
  * Patient First Name (mandatory)
  * Patient Last Name (mandatory)
* Claim Information (optional, mandatory if Remittance information found, repeats)
  * Payer Claim ID (mandatory) - the primary key of the claim information
  * Provider Claim ID (mandatory)
  * Claim Received Date (mandatory)
  * Provider ID (mandatory)
  * Payment Information (optional, repeats)
    * Payment Issue Date (mandatory)
    * Payment Number (mandatory)
    * Payment Amount (mandatory)
* Remittance Information (optional, mandatory if Remittance information found, repeats)
  * Remittance Advice Identifier (mandatory)
  * Remittance Advice Type (mandatory)
  * Remittance Advice Date (mandatory)
  * Remittance Advice File Size (mandatory)

### Search for Remittance by Payment

!["Lonely" Payment](lonely_payment.png "Lonely Payment"){:style="float: none;}

This search is used to find remittances associated with a received payment.  The payer will search for the payment given the passed-in search parameters and find remittances associated with that payment.  The remittance information is returned along the payment information that can be used by the provider to verify the proper payment was retrieved.  Any of the returned remittance identifiers can then be used in the Download Remittance operation.

#### Input
* Provider TIN (mandatory)
* Date of Service Period (optional)
* Payer ID (optional)
* Payer Name (optional)
* Payment Information (mandatory)
  * Payment Issue Date Period (mandatory)
  * Payment Amount (optional)
    * Payment Amount Low
    * Payment Amount High
  * Payment Number (mandatory)

NOTE: Due to the format of payment numbers, specifically cheques where they may be many leading zeroes, only the significant numbers need to be specified and payers **SHALL** search for these using a wild card search.  eg. 0000000123 can be specified as 123.

#### Output
* Provider TIN (optional, mandatory if Remittance information found)
* Payer Information (optional, mandatory if Remittance information found)
  * Payer ID (mandatory)
  * Payer Name (mandatory)
* Payment Information (optional, mandatory if Remittance information found)
  * Payment Issue Date (mandatory)
  * Payment Number (mandatory)
  * Payment Amount (mandatory)
* Remittance Information (optional, mandatory if Remittance information found, repeats)
  * Remittance Advice Identifier (mandatory)
  * Remittance Advice Type (mandatory)
  * Remittance Advice Date (mandatory)
  * Remittance Advice File Size (mandatory)

### Download Remittance
After one of the Search operations has occurred, the Download Remittance operation can be used to retrieve a specific remittance.  The remittance identifier is provided along with an optional hint as to the type of document to return - either 835 or PDF.  This is only a hint as a payer may only have one format and thus will return what they have.

#### Input
* Remittance Advice Identifier (mandatory)
* Remittance Advice Type Hint (optional)

#### Output
The copy of the remittance advice is returned in a FHIR Binary resource with the Binary.data element containing the data.  Whether the remittance is returned as a 835 document or a PDF file, it is gzipped and base64 encoded and returned in the data element.  The Binary.contentType element is used to indicate whether the returned remittance is a PDF file ('application/pdf+gzip') or an 835 document ('application/txt+gzip').

