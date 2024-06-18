## Background

The intent of this FHIR Implementation Guide is to create a Postable Remittance (Remit) FHIR API to retrieve a copy of a previously issued remittance. Rather than going to a number of different payer/clearinghouse portals or making phone calls to payers, this API is intended to make it simpler for providers/vendors to retrieve a copy of the already issued remittance.

In scenarios where remits are missing due to any reasons, providers/vendors can request a copy of an already issued 835 or paper remit via the API, and payers/clearinghouses will respond with an attachment which is the copy of the HIPAA compliant 835 or pdf of a paper remit that the payer/clearinghouse already issued.

![Basic EDI Workflow](basic_workflow.png "Basic EDI Workflow"){:style="float: none;}

There is excessive time and effort spent by payer and provider organizations to obtain missing remits.

* Gaps in EDI: EDI transactions do not cover this use case since an 835 can’t be delivered to multiple destinations
* Portal access is complex: Provider-facing portals are the main modality used to manually retrieve missing remit. It is very difficult to use portals at scale for this work and managing access across many portals is challenging
* Phone calls are expensive, time consuming, and some payers do not accept phone calls
* Cybersecurity regulations: Cybersecurity regulations are difficult for billing service/vendors to manage as the landscape changes quickly. APIs present an alternative to traditional portals

### Benefits to Payers

* Fewer missing remittance related phone calls 
* Reduced portal access related phone calls 
* Minimize exception handling 
* More timely reconciliation of financial settlement

### Benefits to Providers

* Reduced days in Accounts Receivable
* Lower manual cost
* Fewer phone calls to retrieve missing remittance
* Reduced need to log onto various portals to retrieve remits
* Reduced need to maintain user login credentials for various portals
* Locate remittance matched up to payments in real time
* Simplify missing remittance retrieval process

