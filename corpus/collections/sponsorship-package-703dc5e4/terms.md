# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Sponsorship Package
- **genus**: `cco:ont00000995`
- **definition**: A structured offering of benefits and recognition tiers available for purchase by organizations to support RWN major events.
- **attributes**: packageId, packageName, tierLevel, price, benefitsDescription, validFrom, validUntil
- **relations**: supports→MajorEvent, purchasedBy→SponsoringOrganization

## Major Event
- **genus**: `bfo:0000015`
- **definition**: A significant annual gathering hosted by RWN designed to foster community, recognize achievements, and generate operating budget support.
- **attributes**: eventId, eventName, eventDate, venueName, venueAddress, eventType, annualEdition, theme
- **relations**: hostedBy→RochesterWomenNetwork, honors→AwardRecipient, features→NetworkingSession, includes→SilentAuction

## Award Recipient
- **genus**: `bfo:0000002`
- **definition**: A local woman recognized for her professional achievements, leadership potential, or inspirational impact on other women.
- **attributes**: recipientId, recipientName, awardCategory, yearsInField, nominationYear, isFinalist, isWinner
- **relations**: recognizedAt→MajorEvent, nominatedBy→RochesterWomenNetwork

## Sponsoring Organization
- **genus**: `bfo:0000040`
- **definition**: A business, professional entity, or individual that provides financial or in-kind support to RWN events in exchange for visibility and networking opportunities.
- **attributes**: orgId, orgName, businessType, contactEmail, contactPhone, membershipStatus
- **relations**: purchases→SponsorshipPackage, participatesIn→ConferenceMarketplace

## Networking Session
- **genus**: `bfo:0000015`
- **definition**: A structured or informal period during an event designed to facilitate connections between attendees, honorees, and sponsors.
- **attributes**: sessionId, sessionName, startTime, endTime, location, isMandatory
- **relations**: partOf→MajorEvent, attendedBy→SponsoringOrganization

## Silent Auction
- **genus**: `bfo:0000015`
- **definition**: A fundraising activity held during the W Award Celebration where items are bid on, with proceeds supporting RWN programming.
- **attributes**: auctionId, auctionDate, totalProceeds, numberOfItems, status
- **relations**: heldAt→MajorEvent, funds→RochesterWomenNetwork

## Conference Marketplace
- **genus**: `cco:ont00000995`
- **definition**: A designated area or platform within the Summit Business Conference where business owners display products and services to attendees.
- **attributes**: marketplaceId, boothCount, setupDate, dismantleDate, status
- **relations**: partOf→MajorEvent, occupiedBy→SponsoringOrganization
