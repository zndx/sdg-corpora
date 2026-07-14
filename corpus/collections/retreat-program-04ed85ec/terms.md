# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Retreat Program
- **genus**: `cco:ont00000995`
- **definition**: A designed event or program offering spiritual instruction and community immersion.
- **attributes**: programIdentifier, programName, startDate, endDate, location, isAnnual
- **relations**: hostedBy→SpiritualOrganization, requiresDonation→Donation

## Donation
- **genus**: `cco:ont00000995`
- **definition**: A voluntary transfer of resources or funds to support a spiritual mission or organization.
- **attributes**: donationId, amount, currencyCode, donationDate, status, isAnonymous
- **relations**: givenBy→SpiritualSeeker, supports→SpiritualOrganization, funds→RetreatProgram

## Spiritual Seeker
- **genus**: `bfo:0000004`
- **definition**: A person engaged in spiritual practice, seeking connection with the Divine through generosity and self-giving.
- **attributes**: seekerId, firstName, lastName, emailAddress, memberSince, isAnonymous
- **relations**: makesDonation→Donation, attends→RetreatProgram, commitsTo→SpiritualPath

## Spiritual Path
- **genus**: `bfo:0000015`
- **definition**: A structured practice or tradition focused on self-giving (kenosis) and connection with the Divine.
- **attributes**: pathId, pathName, corePrinciple, originTradition, isUniversal
- **relations**: practicedBy→SpiritualSeeker, instructedAt→RetreatProgram

## Spiritual Organization
- **genus**: `bfo:0000040`
- **definition**: An entity or community dedicated to spiritual practice, teaching, and community support.
- **attributes**: orgId, orgName, foundingDate, missionStatement, isNonProfit
- **relations**: hosts→RetreatProgram, receivesDonations→Donation, supports→SpiritualSeeker
