# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Service Inspection
- **genus**: `bfo:0000015`
- **definition**: A statutory evaluation process conducted by the Social Services Inspectorate to assess the quality of social care services experienced by users and carers.
- **attributes**: inspectionId, inspectionDate, inspectionStatus, inspectionScope, findingsSummary
- **relations**: evaluates→SocialCareService, conductedBy→InspectionAgency, informs→PolicyDocument

## Social Care Service
- **genus**: `cco:ont00000995`
- **definition**: A designed provision of support, such as personal care, child care, or family support, delivered by local councils, voluntary organizations, or private agencies to meet the needs of service users.
- **attributes**: serviceCode, serviceName, serviceType, deliveryMode, isIntegrated, eligibilityCriteria
- **relations**: providedBy→ServiceAgency, serves→ServiceUser, supports→ParentingRole, assessedBy→NeedsAssessment

## Service User
- **genus**: `bfo:0000002`
- **definition**: An individual receiving social care support, specifically including disabled adults in their parenting role and their children.
- **attributes**: userId, userType, hasDisability, disabilityType, parentingStatus, needsAcknowledged
- **relations**: receives→SocialCareService, hasChild→ServiceUser, undergoes→NeedsAssessment

## Holistic Needs Led Assessment
- **genus**: `bfo:0000015`
- **definition**: A multi-professional evaluation process that covers the needs of all individuals within a family against eligibility criteria to determine access to a range of services.
- **attributes**: assessmentId, assessmentDate, assessmentType, isServiceLed, needsIdentified, assessmentOutcome
- **relations**: assesses→ServiceUser, conductedBy→ServiceAgency, triggers→SocialCareService

## Service Agency
- **genus**: `bfo:0000040`
- **definition**: An organization, such as a local council, voluntary organization, or private agency, responsible for planning and delivering social care services.
- **attributes**: agencyId, agencyName, agencyType, hasSpecificPolicy, jurisdiction, adoptionOfSocialModel
- **relations**: delivers→SocialCareService, conducts→NeedsAssessment, collaboratesWith→ServiceAgency

## Policy Document
- **genus**: `cco:ont00000958`
- **definition**: A formal record of government policy, statutory guidance, or internal agency protocols that dictates the rights, responsibilities, and operational standards for social care provision.
- **attributes**: policyRef, policyTitle, publishDate, policyScope, legislationReference, isMandatory
- **relations**: guides→ServiceAgency, defines→SocialCareService, monitoredBy→ServiceInspection
