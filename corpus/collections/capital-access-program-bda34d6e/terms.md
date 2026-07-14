# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Capital Access Program
- **genus**: `cco:ont00000958`
- **definition**: A structured financial instrument or policy mechanism designed to deploy public or private capital to support small business growth, infrastructure development, and economic expansion within a jurisdiction.
- **attributes**: programIdentifier, programName, establishedDate, totalFinancedAmount, maxGuaranteeAmount, programStatus, targetJurisdiction
- **relations**: administeredBy→EconomicDevelopmentBank, deliveredThrough→FinancialDevelopmentCorporation, supports→SmallBusiness, targets→UnderservedCommunity

## Economic Development Bank
- **genus**: `cco:ont00000995`
- **definition**: A state-chartered municipal entity with broad authority to issue bonds, provide credit enhancements, and finance public infrastructure and private development to stimulate economic growth.
- **attributes**: bankIdentifier, bankName, foundingYear, governingOffice, totalFinancedAmount, bondIssuanceAuthority, jurisdiction
- **relations**: administers→CapitalAccessProgram, leverages→FinancialDevelopmentCorporation, finances→InfrastructureProject, targets→SmallBusiness

## Financial Development Corporation
- **genus**: `cco:ont00000995`
- **definition**: A non-profit entity created through legislation to leverage public dollars, support lender credit or bond risk, and deploy capital investment to small businesses and community development projects.
- **attributes**: fdcIdentifier, fdcName, establishmentDate, publicDollarsLeveraged, totalGuaranteeIssuance, deploymentStatus, jurisdiction
- **relations**: delivers→CapitalAccessProgram, supports→SmallBusiness, partnersWith→InstitutionalLender, targets→UnderservedCommunity

## Small Business
- **genus**: `bfo:0000015`
- **definition**: A commercial enterprise receiving financial support, loan guarantees, or capital access to facilitate growth, job creation, employee retention, and tax base expansion.
- **attributes**: businessIdentifier, businessName, industrySector, employeeCount, jobCreationCommitment, employeeRetentionCommitment, taxBaseImpact
- **relations**: receivesSupportFrom→CapitalAccessProgram, isSupportedBy→FinancialDevelopmentCorporation, locatedIn→UnderservedCommunity, employs→Employee

## Underserved Community
- **genus**: `bfo:0000004`
- **definition**: A geographic neighborhood or jurisdiction characterized by limited access to capital, credit, or economic development resources, targeted for intervention by public finance programs.
- **attributes**: communityIdentifier, communityName, geographicBoundary, populationDensity, medianIncome, accessLevel, targetedStatus
- **relations**: hosts→SmallBusiness, receivesInvestmentFrom→CapitalAccessProgram, isLocatedIn→Jurisdiction

## Infrastructure Project
- **genus**: `bfo:0000015`
- **definition**: A public or private development initiative involving the construction, improvement, or financing of physical assets such as roads, utilities, or commercial facilities to support economic activity.
- **attributes**: projectIdentifier, projectName, projectType, totalCost, financedAmount, startDate, completionDate, projectStatus
- **relations**: financedBy→EconomicDevelopmentBank, locatedIn→UnderservedCommunity, supports→SmallBusiness, createsJobsFor→Employee

## Institutional Lender
- **genus**: `cco:ont00000995`
- **definition**: A financial institution such as a commercial bank, credit union, or community development financial institution that deploys capital and extends credit to small businesses with risk support from public entities.
- **attributes**: lenderIdentifier, lenderName, lenderType, totalCapitalDeployed, riskTolerance, jurisdiction
- **relations**: partnersWith→FinancialDevelopmentCorporation, extendsCreditTo→SmallBusiness, receivesRiskSupportFrom→CapitalAccessProgram, operatesIn→Jurisdiction
