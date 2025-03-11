## Background

### Plain Language Summary about this Guide
The Da Vinci Postable Remittance Implementation Guide defines a standardized method for healthcare providers to electronically request and receive duplicates of an originally transmitted remittance advice, which are explanations of payments from insurance payers.

Currently, providers often rely on inefficient and time-consuming methods to retrieve duplicates like payer portals, phone calls, or faxes to obtain these documents. This Implementation Guide enables providers to search for remittances based on criteria such as claim information, patient details, or payment data. Providers can then download the remittance electronically, typically as an 835 document or a Portable Document Format (PDF).  

The Da Vinci Postable Remittance Implementation Guide offers a solution for streamlining the duplicate retrieval process, potentially reducing manual effort and improving efficiency for healthcare providers.

### Introduction

The intent of this FHIR Implementation Guide is to create a Postable Remittance (Remit) FHIR API to retrieve a copy of a previously issued remittance. Rather than going to a number of different payer/clearinghouse portals or making phone calls to payers, this API is intended to make it simpler for providers/vendors to retrieve a copy of the already issued remittance.

The current processes to retrieve missing remits are largely manual – portal retrieval, phone calls, and faxes. The FHIR standard and FHIR API can help automate the workflow and increase adoption of using APIs to alleviate the reliance on manual workflows. Automation opportunities would remove most of the need for human interaction, and, in doing so, reduce the risk of human error and reduce cost.

In scenarios where remits are missing due to any reasons, providers/vendors can request a copy of an already issued 835 or paper remit via the API, and payers/clearinghouses will respond with an attachment which is the copy of the HIPAA compliant 835 or pdf of a paper remit that the payer/clearinghouse already issued.

![Basic EDI Workflow](basic_workflow.png "Basic EDI Workflow"){:style="float: none;}

There is excessive time and effort spent by payer and provider organizations to obtain missing remits.

* Gaps in EDI: In a Shared TIN scenario, EDI transactions do not cover this use case since the same 835 generally are not delivered to multiple destinations.  See below for more information about the Shared TIN scenario.
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
* If a remittance is sent as a paper, that can sometimes get shredded by accident or get lost in the mail

### Shared Tax Identification Numbers (TIN)
Clinics/providers owned and employed by hospitals or health systems typically bill ambulatory claims under the same tax ID as the hospital. The hospital and their ambulatory clinics often use different EHR and revenue cycle management (RCM) systems. Many large payers will only remit to a single ERA (835) receiver/pay-to address, and bank account per Tax ID. The result is remit advice that include both hospital and ambulatory claims are remitted to the hospital EHR/RCM system or the primary receiver’s EHR/RCM system only. The workflows in place to forward remit to the ambulatory EHR/RCM vary in efficiency and automation, resulting in delayed or “lost” remit files needed by the Ambulatory EHR/RCM. Manual remit retrieval from the payer may be the only option for remit file recovery for the ambulatory EHR/RCM.

### Content and Organization
This implementation guide (and the menu for it) is organized into the following sections:

* *Background* - Supporting informative pages that do not set conformance expectations
  * [Reading this IG](background.html) points to key pages in the FHIR spec and other source specifications that must be understood in order to understand this guide
  * [Use Cases](usecases.html) describes the intent of the implementation guide, gives examples of its use, and provides a high-level overview of expected process flow
  * [Project and Participants](credits.html) gives a high-level overview of Da Vinci and identifies the individuals and organizations involved in developing this implementation guide
* *Specification* - Pages that set conformance expectations
  * [Conformance Expectations](conformance.html) defines base language and expectations for declaring conformance with the guide
  * [Privacy, Safety, and Security](security.html) covers considerations around data access, protection, and similar concepts that apply to all implementations
* *FHIR Artifacts*
  * [Overview](fhirArtifacts.html) introduces and provides links to the profiles, search parameters and other FHIR artifacts used in this implementation guide
  * [Artifacts](artifacts.html) points to the complete list of artifacts defined in this guide
* *Base Specifications* - Quick links to the various specifications this guide derives from
* *Support* - Links to help with use of this guide
  * *Discussion Forum* is a place to ask questions about the guide, discuss potential issues, and search through prior discussions
  * *Project Home* includes information about project calls, agendas, past minutes, and instructions for how to participate
  * *Implementer Support* provides information about reference implementations, resources for testing, known errata, regulatory considerations, and practical implementation pathways
  * *Project Dashoard* shows new and historical issues that have been logged against the specification, proposed dispositions, unapplied changes, etc.
  * *Propose a Change* allows formal submission of requests for change to the specification.  (Consider raising on the discussion forum first.)
  * [Downloads](downloads.html) allows download of this and other specifications, as well as other useful files

### Dependencies

This guide also relies on a number of parent implementation guides:

{% include dependency-table-nontech.xhtml %}

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.

### Intellectual Property Considerations
This implementation guide and the underlying FHIR specification are licensed as public domain under the [FHIR license](http://hl7.org/fhir/R4/license.html#license). The license page also describes rules for the use of the FHIR name and logo.

{% include ip-statements.xhtml %}
