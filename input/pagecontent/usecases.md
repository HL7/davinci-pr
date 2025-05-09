### Introduction

There are three types of searches that are supported by this Implementation Guide.

### Search for Remittance by Claim

!["Silent" Claim](silent_claim.png "Silent Claim"){:style="float: none;}

Provider has a long outstanding claim submission without a corresponding remittance.  Assuming that the claim is adjudicated, parameters to identify the claim are submitted and a list of remittances associated with that claim are returned.


### Search for Remittance by Patient

!["Silent" Claim by Patient](silent_claim_patient.png "Silent Claim by Patient"){:style="float: none;}

Provider has claim submissions for a patient without a corresponding remittance.  Rather than providing information on a single claim, patient information is submitted and a list of remittances associated with that patient are returned.


### Search for Remittance by Payment

!["Lonely" Payment](lonely_payment.png "Lonely Payment"){:style="float: none;}

Provider has received the notification of a payment (either by check or EFT deposit) but there is no remittance accompanying the payment.  Information about the payment is submitted and a list of remittances associated with that payment are returned.


### Download Remittance

Once a list of remittances has been returned via one of the previous search mechanisms, a specific remittance identifier is specified and a copy of the remittance, either in 835 format or PDF format, is returned as an encoded attachment in a FHIR DocumentReference instance.  Payers/Clearinghouses should do their best to return the remit as an 835 if at all possible.  This is not a FHIR representation of the 835 document but a copy of the actual 835 document that was originally sent.  As well, requesters are responsible for indicating to their downstream systems that this copy of the original 835 remittance may have some posting concerns due to duplicates.  It is the requester's responsibility to indicate that this re-transmission step has occurred.  As this will be a copy of the original remittane, it may include multiple claims and multiple patients in one remittance.  Requesters will need to ensure that any privacy concerns are taken into account when displaying this remittance.  For more details about the 835 transaction, please consult the [X12 documentation](https://x12.org/products/technical-reports).