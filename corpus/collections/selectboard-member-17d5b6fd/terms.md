# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Selectboard Member
- **genus**: `bfo:0000040`
- **definition**: A person holding an elected or appointed role on the municipal Selectboard, exercising governance authority.
- **attributes**: memberId, fullName, roleTitle, appointmentDate, termEndDate, isExOfficio
- **relations**: holdsRoleIn→MunicipalBoard, represents→Committee, votesOn→Motion

## Municipal Board
- **genus**: `bfo:0000002`
- **definition**: A formal governing body of a municipality, such as a Selectboard, responsible for administrative and policy decisions.
- **attributes**: boardId, boardName, jurisdictionName, meetingSchedule, officialNewspaper
- **relations**: hasMember→SelectboardMember, adoptsPolicy→Policy, managesFund→MunicipalFund

## Motion
- **genus**: `bfo:0000015`
- **definition**: A formal proposal made by a member of a governing body for the body to take a specific action or adopt a policy.
- **attributes**: motionId, motionText, voteResult, meetingDate, isAdopted
- **relations**: proposedBy→SelectboardMember, secondedBy→SelectboardMember, addresses→Policy, addresses→License

## Policy
- **genus**: `bfo:0000016`
- **definition**: A formal rule, procedure, or guideline adopted by a municipal body to govern operations or conduct.
- **attributes**: policyId, policyName, adoptionDate, versionNumber, isCurrent
- **relations**: adoptedBy→MunicipalBoard, governs→SelectboardMember, definesThresholdFor→FundingRequest

## License
- **genus**: `bfo:0000016`
- **definition**: An official permit issued by a municipality authorizing a business to operate or sell specific regulated goods.
- **attributes**: licenseId, businessName, licenseClass, issueDate, expiryDate, status
- **relations**: issuedBy→MunicipalBoard, approvedVia→Motion, heldBy→BusinessEntity

## Business Entity
- **genus**: `bfo:0000002`
- **definition**: A commercial organization or proprietorship operating within the municipality's jurisdiction.
- **attributes**: businessId, legalName, dbaName, businessType, industrySector
- **relations**: holdsLicense→License, locatedIn→Parcel, receivesFundingFrom→MunicipalFund

## Municipal Fund
- **genus**: `bfo:0000016`
- **definition**: A designated pool of municipal financial resources, such as tax revenue or grants, allocated for specific public purposes.
- **attributes**: fundId, fundName, fiscalYear, totalAllocation, currentBalance, spendingThreshold
- **relations**: managedBy→MunicipalBoard, funds→Project, supports→BusinessEntity

## Project
- **genus**: `bfo:0000015`
- **definition**: A planned municipal initiative or infrastructure improvement funded by public resources.
- **attributes**: projectId, projectName, estimatedCost, approvalLevel, status
- **relations**: fundedBy→MunicipalFund, locatedOn→Parcel, requiresApprovalFrom→MunicipalBoard

## Parcel
- **genus**: `bfo:0000002`
- **definition**: A defined piece of land within the municipality, used for zoning, ownership, or infrastructure purposes.
- **attributes**: parcelId, address, zoningDistrict, landUse, ownerName, isPubliclyAccessible
- **relations**: hostedBy→BusinessEntity, siteFor→Project, maintainedBy→MunicipalBoard
