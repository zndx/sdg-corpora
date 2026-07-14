# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## License Application
- **genus**: `cco:ont00000958`
- **definition**: A formal request submitted by a Service Provider to the Bank of Guyana for authorization to operate within the Payment System.
- **attributes**: applicationId, submissionDate, status, regulatoryReference
- **relations**: submittedBy→ServiceProvider, evaluatedBy→RegulatoryAuthority, requiresFee→FeeSchedule

## Service Provider
- **genus**: `cco:ont00000995`
- **definition**: A legal entity or organization applying for and holding a license to operate as a business within the Payment System.
- **attributes**: legalName, incorporationDate, shareholdingStructure, complianceStatus
- **relations**: submits→LicenseApplication, maintains→CustodianAccount, establishes→AgentNetwork

## Fee Schedule
- **genus**: `cco:ont00000958`
- **definition**: A structured set of monetary requirements including application, license, renewal, and capital deposit fees mandated by the regulatory framework.
- **attributes**: applicationFee, initialLicenseFee, annualRenewalFee, currency
- **relations**: appliesTo→LicenseApplication, mandatedBy→RegulatoryAuthority

## Custodian Account
- **genus**: `cco:ont00000995`
- **definition**: A financial account held and managed by a Commercial Bank to ensure customer funds are ring-fenced from the Service Provider's operational funds.
- **attributes**: accountNumber, minimumCapitalRequirement, assetLiquidityStatus, bankIdentifier
- **relations**: belongs_to→ServiceProvider, managedBy→CommercialBank

## Regulatory Authority
- **genus**: `bfo:0000015`
- **definition**: The central banking institution responsible for overseeing the Payment System, issuing licenses, and enforcing compliance with the National Payments Act.
- **attributes**: authorityName, websiteUrl, effectiveDate, oversightScope
- **relations**: issues→LicenseApplication, enforces→ComplianceRequirement

## Compliance Requirement
- **genus**: `bfo:0000015`
- **definition**: A specific operational, financial, or legal obligation that a Service Provider must fulfill to maintain their license and operate within the Payment System.
- **attributes**: requirementId, category, legalReference, isMandatory
- **relations**: appliesTo→ServiceProvider, enforcedBy→RegulatoryAuthority
