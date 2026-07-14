# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Donor
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a person or organization that provides a financial gift to the foundation.
- **attributes**: donorId, donorName, streetAddress, city, state, zipCode, emailAddress, isAnonymous
- **relations**: madeGift→Donation, contactedAbout→ContactRequest

## Donation
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a specific financial gift provided by a donor to the foundation.
- **attributes**: donationId, amount, isAnonymous, isMemorial, isHonor, donationDate
- **relations**: madeBy→Donor, honors→Honoree, directedTo→Fund

## Honoree
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a person or organization being commemorated or honored by a donation.
- **attributes**: honoreeId, honoreeName, isMemorial
- **relations**: honoredBy→Donation, notifiedVia→NotificationContact

## Notification Contact
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a person or organization to be notified about a memorial or honor gift.
- **attributes**: contactId, contactName, streetAddress, city, state, zipCode, relationship
- **relations**: notifiesAbout→Honoree

## Fund
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a specific financial category, program, or purpose to which a donation is directed.
- **attributes**: fundId, fundName, fundDescription
- **relations**: receivesDonation→Donation

## Contact Request
- **genus**: `bfo:0000040`
- **definition**: A real, independent continuant entity representing a donor's explicit request to be contacted regarding specific foundation activities.
- **attributes**: requestId, discussDeferredGiving, volunteerTime, joinNewsletter
- **relations**: requestedBy→Donor
