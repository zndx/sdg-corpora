# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Research Award
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition or honor bestowed upon an individual or group for excellence in research activities.
- **attributes**: awardIdentifier, awardYear, awardTitle, awardDate, issuingOrganization
- **relations**: awardedTo→Researcher, issuedBy→ResearchOrganization

## Researcher
- **genus**: `bfo:0000004`
- **definition**: An individual who conducts systematic investigation to establish facts, reach new conclusions, or develop new methods in a specific field.
- **attributes**: researcherIdentifier, fullLegalName, professionalTitle, militaryRank, yearsOfExperience, specialization
- **relations**: awarded→ResearchAward, affiliatedWith→ResearchOrganization, mentors→Researcher, conductsResearch→ResearchProject

## Research Organization
- **genus**: `bfo:0000040`
- **definition**: An entity established to conduct research, provide scientific expertise, or manage research programs.
- **attributes**: organizationIdentifier, organizationName, foundingYear, headquartersLocation, websiteURL, organizationType
- **relations**: awards→ResearchAward, employs→Researcher, funds→ResearchProject, locatedAt→GeographicLocation

## Research Project
- **genus**: `bfo:0000015`
- **definition**: A planned series of activities or investigations undertaken to achieve a specific scientific or medical goal.
- **attributes**: projectIdentifier, projectTitle, projectStartDate, projectEndDate, projectStatus, fundingSource, grantProgramName
- **relations**: ledBy→Researcher, fundedBy→ResearchOrganization, conductedAt→GeographicLocation, studies→HealthCondition, measures→Biomarker

## Geographic Location
- **genus**: `bfo:0000004`
- **definition**: A specific place or region where research activities, organizations, or subjects are located.
- **attributes**: locationIdentifier, locationName, locationType, city, state, country
- **relations**: hosts→ResearchOrganization, hosts→ResearchProject

## Health Condition
- **genus**: `bfo:0000015`
- **definition**: A medical or physiological state, disorder, or risk factor that is the subject of research or clinical observation.
- **attributes**: conditionIdentifier, conditionName, conditionCategory, prevalenceRate, riskFactors
- **relations**: studiedIn→ResearchProject, associatedWith→Biomarker

## Biomarker
- **genus**: `bfo:0000015`
- **definition**: A measurable biological indicator, such as a nutrient level, genetic marker, or physiological measurement, used in research to assess health status or disease risk.
- **attributes**: biomarkerIdentifier, biomarkerName, biomarkerType, measurementUnit, normalRange
- **relations**: measuredIn→ResearchProject, associatedWith→HealthCondition
