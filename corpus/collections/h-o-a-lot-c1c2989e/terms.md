# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Homeowners Association Property Lot
- **genus**: `bfo:0000004`
- **definition**: A specific parcel of real property within the Mountain High HOA jurisdiction, subject to the Declarations and Restrictions.
- **attributes**: lotIdentifier, legalDescription, county, parcelNumber
- **relations**: hasViolation→HOA_Violation, hasAssessment→HOA_Assessment

## Homeowners Association Member
- **genus**: `bfo:0000002`
- **definition**: An individual or entity holding membership rights and obligations within the Mountain High HOA, typically the owner of an HOA_Lot.
- **attributes**: memberIdentifier, votingRightsStatus, recreationalAccessStatus, contactEmail
- **relations**: ownsLot→HOA_Lot, isSubjectOf→HOA_Violation

## Homeowners Association Rule Violation
- **genus**: `bfo:0000015`
- **definition**: An instance of non-compliance with the Mountain High HOA Declarations, Restrictions, Protective Covenants, or Rules and Regulations.
- **attributes**: violationIdentifier, violationType, severityLevel, isContinuing, reportedDate, resolutionStatus
- **relations**: occursOnLot→HOA_Lot, attributedToMember→HOA_Member, triggersAssessment→HOA_Assessment, triggersRemedy→HOA_RemedialAction

## HOA Financial Assessment
- **genus**: `cco:ont00000995`
- **definition**: A monetary charge levied against a specific HOA_Lot, including fines for violations, late charges, and abatement costs.
- **attributes**: assessmentIdentifier, assessmentType, amount, dueDate, paymentStatus, issuanceDate
- **relations**: leviedOnLot→HOA_Lot, derivedFromViolation→HOA_Violation, calculatedBy→HOA_Board

## HOA Remedial Action
- **genus**: `bfo:0000015`
- **definition**: A formal enforcement procedure undertaken by the Association to address a violation, including self-help abatement, fines, or legal proceedings.
- **attributes**: actionIdentifier, actionType, initiationDate, status, costIncurred
- **relations**: addressesViolation→HOA_Violation, targetsMember→HOA_Member, resultsInAssessment→HOA_Assessment

## Homeowners Association Board of Directors
- **genus**: `bfo:0000040`
- **definition**: The governing body of the Mountain High HOA authorized to enforce rules, impose fines, and manage remedial actions.
- **attributes**: boardIdentifier, meetingDate, quorumStatus
- **relations**: issuesAssessment→HOA_Assessment, authorizesAction→HOA_RemedialAction

## HOA Management Company
- **genus**: `bfo:0000040`
- **definition**: The external entity contracted to handle day-to-day operations, initial complaint intake, and conflict resolution for the HOA.
- **attributes**: companyIdentifier, companyName, contractStartDate
- **relations**: handlesComplaint→HOA_Violation, escalatesToBoard→HOA_Board
