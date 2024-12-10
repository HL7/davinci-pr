### Systems
This mplementation guide defines the responsibilities of the two types of systems:

[**Client systems**](CapabilityStatement-PostableRemittanceClientCapabilities.html) are typically Electronic Medical Record (EHR) systems but could theoretically be any system needing to retrieve a postable remittance.

[**Server systems**](CapabilityStatement-PostableRemittanceServerCapabilities.html) (or servers) are typically payer systems or clearing houses that act on behalf of payer organizations.

### MustSupport
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that ought to be adhered to to avoid suboptimal interoperability but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where there is no recommendation for or against adoption.

As well, profiles in this implementation guide make use of the [mustSupport]({{site.data.fhir.path}}profiling.html#mustsupport) element.  Base expectations for the intepretations of these terms are set in the [FHIR core specification]({{site.data.fhir.path}}conformance-rules.html#conflang) and general Da Vinci-wide expectations are [defined in HRex]({{site.data.fhir.ver.hrex}}/conformance.html).  Also see the mustSupport rules for the [HRex]({{site.data.fhir.ver.hrex}}/conformance.html#mustsupport) which apply to content adhering to data elements profiled in those guides.
