# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Person
- **genus**: `bfo:0000002`
- **definition**: A human being who holds a professional role or membership within an organizational context.
- **attributes**: personId, fullName, emailAddress, phone, yearsOfExperience
- **relations**: holdsRole→ProfessionalRole, memberOf→Organization, contactedBy→MediaEnquiry

## Organization
- **genus**: `bfo:0000040`
- **definition**: A social entity such as an association, corporation, or council that serves an industry or professional community.
- **attributes**: orgId, orgName, website, missionStatement, visionStatement
- **relations**: employs→Person, hasCouncilMember→Person, servesIndustry→IndustrySector

## Professional Role
- **genus**: `bfo:0000023`
- **definition**: A position or function held by a person within an organization, defining their responsibilities and strategic focus.
- **attributes**: roleTitle, department, startDate, responsibilities, reportingTo
- **relations**: heldBy→Person, partOf→Organization, focusesOn→StrategicInitiative

## Strategic Initiative
- **genus**: `bfo:0000015`
- **definition**: A planned organizational activity or program designed to achieve specific business growth or operational goals.
- **attributes**: initiativeId, initiativeName, targetRegion, status, description
- **relations**: drivenBy→ProfessionalRole, targetsMarket→GeographicMarket, supportsIndustry→IndustrySector

## Geographic Market
- **genus**: `bfo:0000002`
- **definition**: A specific region, country, or territory targeted for business expansion or operational presence.
- **attributes**: marketId, regionName, countryCode, marketType
- **relations**: targetedBy→StrategicInitiative, contains→IndustrySector

## Industry Sector
- **genus**: `bfo:0000002`
- **definition**: A specific segment of the economy or professional field served by an organization or initiative.
- **attributes**: sectorId, sectorName, classificationCode
- **relations**: servedBy→Organization, supportedBy→StrategicInitiative
