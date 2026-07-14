# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Inspection Report
- **genus**: `cco:ont00000958`
- **definition**: A formal document produced by the Social Services Inspectorate detailing the findings, methodology, and recommendations of an inspection into services supporting disabled adults in their parenting role.
- **attributes**: reportId, publicationDate, referenceCode, publisher, status
- **relations**: conductedBy→InspectionBody, focusesOn→ServiceDomain

## Inspection Body
- **genus**: `bfo:0000015`
- **definition**: A statutory organization or agency, such as the Social Services Inspectorate, responsible for exercising oversight, conducting evaluations, and providing professional advice on social care services.
- **attributes**: bodyName, parentDepartment, statutoryPowers, jurisdiction

## Service Domain
- **genus**: `cco:ont00000995`
- **definition**: A specific area of social care provision, such as parenting support for disabled adults, that is subject to assessment, planning, and delivery by local authorities and partner agencies.
- **attributes**: domainName, targetPopulation, serviceType, isHolistic
- **relations**: assessedIn→InspectionReport

## Needs Assessment
- **genus**: `bfo:0000015`
- **definition**: A holistic, needs-led process used to identify the eligibility and requirements of individuals and families against established criteria, serving as a gateway to accessing a range of support services.
- **attributes**: assessmentId, assessmentDate, assessmentType, familySize, status
- **relations**: conductedFor→FamilyUnit, informs→ServicePlan

## Family Unit
- **genus**: `bfo:0000015`
- **definition**: A household or social group comprising disabled adults and their children, recognized as a discrete unit for the purpose of receiving integrated social care and parenting support.
- **attributes**: familyId, hasDisabledParent, hasChildren, impairmentType
- **relations**: undergoes→NeedsAssessment, receives→ServiceDelivery

## Service Delivery
- **genus**: `cco:ont00000995`
- **definition**: The actual provision of care, support, or intervention by a local authority, voluntary organization, or private agency to meet the identified needs of a family unit.
- **attributes**: deliveryId, startDate, endDate, providerType, qualityRating
- **relations**: serves→FamilyUnit, fulfillsNeedFrom→NeedsAssessment

## Policy Instrument
- **genus**: `cco:ont00000958`
- **definition**: A formal document, act, or strategic framework, such as the Children Act 1989 or a local authority strategy, that establishes rights, responsibilities, and guidelines for social care provision.
- **attributes**: instrumentId, title, enactmentDate, scope, isStatutory
- **relations**: governs→ServiceDomain, guides→NeedsAssessment
