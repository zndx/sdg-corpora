# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Special Interest Group
- **genus**: `bfo:0000040`
- **definition**: A formally organized community of researchers dedicated to advancing a specific academic field, such as logic and computation.
- **attributes**: identifier, name, foundingYear, status, missionStatement
- **relations**: hasOfficer→Officer, hasCommittee→Committee, publishes→Newsletter, organizes→Conference, collaboratesWith→SpecialInterestGroup

## Officer
- **genus**: `bfo:0000040`
- **definition**: An individual holding a formal leadership or administrative role within a Special Interest Group.
- **attributes**: role, appointmentDate, termEndDate, status
- **relations**: servesIn→SpecialInterestGroup, isMemberOf→ResearchCommunity

## Conference
- **genus**: `bfo:0000040`
- **definition**: A formal gathering of researchers to present and discuss findings, often organized under a specific cluster or by a Special Interest Group.
- **attributes**: name, location, startDate, endDate, expectedAttendance, cluster
- **relations**: organizedBy→SpecialInterestGroup, partOfCluster→ConferenceCluster, featuresEvent→LaunchEvent

## Research Area
- **genus**: `bfo:0000040`
- **definition**: A distinct field of academic inquiry, such as modal logic or computability theory, that falls under the purview of a Special Interest Group.
- **attributes**: name, classification, description
- **relations**: coveredBy→SpecialInterestGroup, taughtIn→Curriculum

## Newsletter
- **genus**: `bfo:0000040`
- **definition**: A periodic electronic publication containing community news, technical columns, and feedback, published by a Special Interest Group.
- **attributes**: frequency, format, startDate, status
- **relations**: publishedBy→SpecialInterestGroup, containsSection→NewsletterSection

## Curriculum
- **genus**: `bfo:0000040`
- **definition**: An educational program or syllabus, such as an undergraduate computer science curriculum, that advocates for the inclusion of specific research areas.
- **attributes**: level, institutionType, status
- **relations**: advocatedBy→SpecialInterestGroup, includesTopic→ResearchArea
