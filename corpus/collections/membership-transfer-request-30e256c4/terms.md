# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Membership Transfer Request
- **genus**: `cco:ont00000995`
- **definition**: A record of a formal request to transfer a BPRO membership from one individual to another or to allow a departing employee to retain it.
- **attributes**: requestId, submissionDate, status, transferReason, processingDays
- **relations**: submittedBy→RequestSubmitter, involvesOriginalMember→BPROMember, involvesRecipient→BPROMember, coversPrograms→BenefitProgram

## Request Submitter
- **genus**: `bfo:0000002`
- **definition**: An individual who submits the membership transfer request on behalf of the agency or member.
- **attributes**: submitterName, submitterEmail
- **relations**: submitsRequest→MembershipTransferRequest

## BPRO Member
- **genus**: `bfo:0000002`
- **definition**: An individual who holds or held a BPRO membership, either as the original member or the recipient.
- **attributes**: memberName, memberEmail, isFormerMember, membershipDurationMonths, membershipType
- **relations**: isOriginalMemberOf→MembershipTransferRequest, isRecipientOf→MembershipTransferRequest

## Benefit Program
- **genus**: `bfo:0000004`
- **definition**: A specific social service or benefit program administered by the agency, such as Medicaid or TANF.
- **attributes**: programCode, programName
- **relations**: isCoveredByRequest→MembershipTransferRequest
