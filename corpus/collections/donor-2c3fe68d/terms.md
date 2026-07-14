# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Donor
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing an individual or organization providing a financial gift.
- **attributes**: donorIdentifier, donorName, streetAddress, city, state, zipCode, emailAddress, isAnonymous
- **relations**: madeGift→Donation, contactedBy→ContactRequest

## Donation
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a specific financial gift transferred from a donor to the foundation.
- **attributes**: donationIdentifier, amount, donationDate, isMemorial, isHonor, isDeferred
- **relations**: madeBy→Donor, directedTo→Program, honors→Honoree, notifies→ContactRecipient

## Program
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a specific operational area, fund, or service line where the donation is directed.
- **attributes**: programIdentifier, programName, programType
- **relations**: receivesDonation→Donation

## Honoree
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a person being memorialized or honored by a gift.
- **attributes**: honoreeName, honoreeType
- **relations**: honoredBy→Donation

## Contact Recipient
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a person designated to be notified about a memorial or honor gift.
- **attributes**: recipientName, streetAddress, city, state, zipCode, relationship
- **relations**: notifiedBy→Donation

## Contact Request
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a donor's expressed interest in volunteering, subscribing to a newsletter, or discussing deferred giving.
- **attributes**: requestIdentifier, requestType, isRequested
- **relations**: submittedBy→Donor
