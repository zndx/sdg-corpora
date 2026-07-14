# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## EUSR Registration Card
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital credential issued to an individual to certify their registration status and associated trade categories within the Energy & Utility Skills framework.
- **attributes**: cardId, cardType, issueDate, expiryDate, holderName, tradeCategory, vatExcludedPrice
- **relations**: hasCategory→RegistrationCategory

## EUSR Registration Category
- **genus**: `bfo:0000015`
- **definition**: A specific trade or professional classification (e.g., Electrician, Plumber) that defines the scope of work an individual is registered to perform.
- **attributes**: categoryId, categoryName, categoryCode, isAdditional
- **relations**: assignedToCard→RegistrationCard

## Trainer Approval Status
- **genus**: `bfo:0000015`
- **definition**: A formal authorization granted to an individual allowing them to deliver training under specific approved schemes.
- **attributes**: approvalId, approvalType, grantDate, expiryDate, vatExcludedPrice
- **relations**: grantedForScheme→TrainingScheme, heldByTrainer→Trainer

## Approved Training Scheme
- **genus**: `bfo:0000015`
- **definition**: A structured educational program or framework (e.g., SHEA, NWH, BESC, SCO) that defines the curriculum and standards for training delivery.
- **attributes**: schemeCode, schemeName, schemeType, isSmartMetering
- **relations**: requiresApproval→TrainerApproval, requiresProviderApproval→ProviderApproval

## Organisation Provider Approval
- **genus**: `bfo:0000015`
- **definition**: An organizational accreditation allowing an entity to deliver training programs and undergo audits within specific approved schemes.
- **attributes**: approvalId, approvalStatus, grantDate, expiryDate, vatExcludedPrice
- **relations**: grantedForScheme→TrainingScheme, heldByOrganisation→TrainingOrganisation, subjectToAudit→ProviderAudit

## Annual Provider Audit
- **genus**: `bfo:0000015`
- **definition**: A periodic compliance review and assessment conducted to verify that a training provider maintains the required standards for their approved schemes.
- **attributes**: auditId, auditDate, auditType, auditResult, vatExcludedPrice
- **relations**: conductedForApproval→ProviderApproval, conductedByAuditor→Auditor

## Training Provider Organisation
- **genus**: `bfo:0000015`
- **definition**: A legal entity or business organization authorized to deliver training programs and employ trainers within the Energy & Utility Skills framework.
- **attributes**: organisationId, organisationName, registrationNumber, contactEmail, contactPhone
- **relations**: holdsApproval→ProviderApproval, employsTrainer→Trainer

## Approved Trainer
- **genus**: `bfo:0000015`
- **definition**: An individual professional who has been granted approval to deliver training content under specific approved schemes.
- **attributes**: trainerId, firstName, lastName, emailAddress, isApproved
- **relations**: holdsApproval→TrainerApproval, employedBy→TrainingOrganisation
