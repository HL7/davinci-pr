## Background

The intent of this FHIR Implementation Guide is to create a Postable Remittance (Remit) FHIR API to retrieve a copy of a previously issued remittance. Rather than going to a number of different payer/clearinghouse portals or making phone calls to payers, this API is intended to make it simpler for providers/vendors to retrieve a copy of the already issued remittance.

The current processes to retrieve missing remits are largely manual – portal retrieval, phone calls, and faxes. The FHIR standard and FHIR API can help automate the workflow and increase adoption of using APIs to alleviate the reliance on manual workflows. Automation opportunities would remove most of the need for human interaction, and, in doing so, reduce the risk of human error and reduce cost.

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

### Why does Remit Advice go missing?
Missing remits is a prevalent and widespread issue, and the result is that providers don’t get their remits and need to track down a copy. There are many reason remits can go missing:

* Shared Tax Identification Number (TIN) – i.e. when a portion of a medical group’s business is using a certain RCM vendor, and another portion of the business is using a different RCM vendor, both using the same TIN to file claims. In this scenario, remits need to be sent to two different places depending on which RCM is submitting the claim, but ERA enrollment restrictions typically only allow one remittance destination per TIN, resulting in remits getting lost. We understand there are permissioning questions tied to missing remit advice caused by shared TIN – this topic is to be expanded in question below. 
* Provider transitioning EHR/RCMs, where the remit destination on file with payers may be tied to the old EHR/RCM, and in the process of updating to the new EHR/RCM, remits can send to the wrong place
* Payers simply returning payment without an accompanying remit
* Crossover claims – i.e. when a payer (typically a government payer) automatically forwards the claim to the patient’s secondary insurance – a complicated and error-prone process that often creates processing issues for the secondary payer
* Some payers don’t allow out of network providers to enroll for ERA, so when an out-of-network provider submits a claim to a payer, it can sometimes cause the remits to not get returned as expected
* For payers that allow providers to submit to the local network plan that services their region instead of the patient’s home plan, the general complexity of payer claim and remittance routing arrangements can cause issues
* Paper remits sometimes get shredded by accident or get lost in the mail

### Shared Tax Identification Numbers (TIN)
Clinics/providers owned and employed by hospitals or health systems typically bill ambulatory claims under the same tax ID as the hospital. The hospital and their ambulatory clinics often use different EHR and revenue cycle management (RCM) systems. Many large payers will only remit to a single ERA (835) receiver/pay-to address, and bank account per Tax ID. The result is remit advice that include both hospital and ambulatory claims are remitted to the hospital EHR/RCM system or the primary receiver’s EHR/RCM system only. The workflows in place to forward remit to the ambulatory EHR/RCM vary in efficiency and automation, resulting in delayed or “lost” remit files needed by the Ambulatory EHR/RCM. Manual remit retrieval from the payer may be the only option for remit file recovery for the ambulatory EHR/RCM.

