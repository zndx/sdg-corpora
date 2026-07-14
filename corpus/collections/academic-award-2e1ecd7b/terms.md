# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Award
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition or honor bestowed upon an individual for professional achievement or contribution in a specific field.
- **attributes**: awardIdentifier, awardName, issuingOrganization, awardDate, awardCategory
- **relations**: awardedTo→Researcher, issuedBy→ProfessionalSociety

## Researcher
- **genus**: `bfo:0000004`
- **definition**: An individual who conducts systematic investigation to establish facts, reach new conclusions, or develop new knowledge in a specific domain.
- **attributes**: researcherIdentifier, fullLegalName, primaryDegree, secondaryDegree, currentInstitution, currentTitle, researchFocus
- **relations**: receivedAward→AcademicAward, holdsLeadershipRole→LeadershipPosition, affiliatedWith→AcademicInstitution

## Professional Society
- **genus**: `bfo:0000040`
- **definition**: An organized association of professionals in a specific field, established to promote the interests of its members and advance the discipline.
- **attributes**: societyIdentifier, societyName, foundingYear, headquartersLocation, membershipCount, primaryDiscipline
- **relations**: awards→AcademicAward, elects→Researcher, hosts→LeadershipPosition

## Leadership Position
- **genus**: `bfo:0000023`
- **definition**: A formal role within an organization or society that carries specific responsibilities, authority, and decision-making power.
- **attributes**: positionIdentifier, positionTitle, organizationName, startDate, endDate, positionStatus
- **relations**: heldBy→Researcher, within→ProfessionalSociety

## Academic Institution
- **genus**: `bfo:0000040`
- **definition**: An educational organization dedicated to higher learning, research, and the advancement of knowledge through teaching and scholarly activities.
- **attributes**: institutionIdentifier, institutionName, foundingYear, locationCity, locationState, locationCountry, institutionType
- **relations**: employs→Researcher, awardedDegreeTo→Researcher, hosts→LeadershipPosition
