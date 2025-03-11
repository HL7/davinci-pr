### General Technical Information

#### Search Parameter Formats
For all of the use cases, the incoming parameters are specified as a FHIR Parameters resource.  The outgoing information for the three Search operations are also specified as a FHIR Parameters resource.  The Download Remittance outgoing information is a FHIR Binary instance with the remittance specified in the Binary.content element as encoded binary data.

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
If the set of input parameters results in no results found, then an OperationOutcome SHALL be returned to indicate that no results were found.


### Search for Remittance by Claim

This search is used to find remittances associated with a previous claim submission.  This API does not provide any means to return a claim status.  As well, only remittances for adjudicated claims will be returned.  The payer will search for the claim given the passed-in search parameters and find remittances associated with that claim.  The remittance information is returned along with claim and payment information that can be used by the provider to verify the proper claim was retrieved.  Any of the returned remittance identifiers can then be used in the Download Remittance operation.

#### Input
* Provider TIN (mandatory)
* Payer ID (optional)
* Payer Name (optional)
* Date Of Service Period (optional)
* Patient ID (optional)
* Claim Information (mandatory)
  * Provider Claim ID (mandatory) - also known as Patient Account Number
  * Provider ID (optional)
  * Payer Claim ID (optional)
  * Claim Charge Amount (optional)

#### Output
* Provider TIN (mandatory)
* Payer Information (mandatory)
  * Payer ID (mandatory)
  * Payer Name (mandatory)
* Patient Information (mandatory)
  * Patient ID (mandatory)
  * Patient Date of Birth (mandatory)
  * Patient First Name (mandatory)
  * Patient Last Name (mandatory)
* Claim Information (mandatory, repeats)
  * Payer Claim ID (mandatory) - the primary key of the claim information
  * Provider Claim ID (mandatory)
  * Claim Received Date (mandatory)
  * Provider ID (mandatory)
  * Payment Information (mandatory, repeats)
    * Payment Issue Date (mandatory)
    * Payment Number (mandatory)
    * Payment Amount (mandatory)
    * Remittance Information (mandatory, repeats)
      * Remittance Advice Identifier (mandatory)
      * Remittance Advice Type (mandatory)
      * Remittance Advice Date (mandatory)
      * Remittance Advice File Size (mandatory)


### Search for Remittance by Patient

This search is used to find remittances associated with a patient.  The payer will search for the patient given the passed-in search parameters and find remittances associated with that patient.  The remittance information is returned along with patient and claim information that can be used by the provider to verify the proper patient was retrieved.  Any of the returned remittance identifiers can then be used in the Download Remittance operation.

<div class="warning">
	The intent of this search is to find a missing remittance where only the patient information is known.  It is possible with this search and the parameters to retrieve a large set of remittances.  Receivers of this search SHOULD return an error if the number of remittances exceeds more than 10 remittances.
</div>


#### Input
* Provider TIN (mandatory)
* Payer ID (optional)
* Payer Name (optional)
* Date of Service Period (mandatory)
* Patient Information (mandatory)
  * Patient ID (mandatory)
  * Patient Date of Birth (mandatory)
  * Patient First Name (optional)
  * Patient Last Name (optional)

#### Output
* Provider TIN (mandatory)
* Payer Information (mandatory)
  * Payer ID (mandatory)
  * Payer Name (mandatory)
* Patient Information (mandatory)
  * Patient ID (mandatory)
  * Patient Date of Birth (mandatory)
  * Patient First Name (mandatory)
  * Patient Last Name (mandatory)
* Claim Information (mandatory, repeats)
  * Payer Claim ID (mandatory) - the primary key of the claim information
  * Provider Claim ID (mandatory)
  * Claim Received Date (mandatory)
  * Provider ID (mandatory)
  * Payment Information (mandatory, repeats)
    * Payment Issue Date (mandatory)
    * Payment Number (mandatory)
    * Payment Amount (mandatory)
    * Remittance Information (mandatory, repeats)
      * Remittance Advice Identifier (mandatory)
      * Remittance Advice Type (mandatory)
      * Remittance Advice Date (mandatory)
      * Remittance Advice File Size (mandatory)

### Search for Remittance by Payment

This search is used to find remittances associated with a received payment.  The payer will search for the payment given the passed-in search parameters and find remittances associated with that payment.  The remittance information is returned along the payment information that can be used by the provider to verify the proper payment was retrieved.  Any of the returned remittance identifiers can then be used in the Download Remittance operation.

#### Input
* Provider TIN (mandatory)
* Payer ID (optional)
* Payer Name (optional)
* Date of Service Period (optional)
* Payment Information (mandatory)
  * Payment Issue Date Period (mandatory)
  * Payment Amount (optional)
    * Payment Amount Low
    * Payment Amount High
  * Payment Number (mandatory)

NOTE: Due to the format of payment numbers, specifically checks where they may be many leading zeroes, only the significant numbers need to be specified and payers **SHALL** search for these using a wild card search.  eg. 0000000123 can be specified as 123.

#### Output
* Provider TIN (mandatory)
* Payer Information (mandatory)
  * Payer ID (mandatory)
  * Payer Name (mandatory)
* Payment Information (mandatory, repeats)
  * Payment Issue Date (mandatory)
  * Payment Number (mandatory)
  * Payment Amount (mandatory)
  * Remittance Information (mandatory, repeats)
    * Remittance Advice Identifier (mandatory)
    * Remittance Advice Type (mandatory)
    * Remittance Advice Date (mandatory)
    * Remittance Advice File Size (mandatory)

### Download Remittance
The remittance identifier is provided along with an optional hint as to the type of document to return - either 835 or PDF.  This is only a hint as a payer may only have one format and thus will return what they have.

#### Input
* Remittance Advice Identifier (mandatory)
* Remittance Advice Type Hint (optional)

#### Output
The copy of the remittance advice is returned in a FHIR Binary resource with the Binary.data element containing the data.  Whether the remittance is returned as a 835 document or a PDF file, it is gzipped and base64 encoded and returned in the data element.  The Binary.contentType element is used to indicate whether the returned remittance is a PDF file ('application/pdf+gzip') or an 835 document ('application/txt+gzip').  The remittance identifier is also returned as an extension on the Binary.data element.

