# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Crown Dependency
- **genus**: `cco:ont00000995`
- **definition**: A self-governing possession of the Crown that is not part of the United Kingdom but for which the UK is responsible for international relations and defence.
- **attributes**: identifier, name, location, population, economicStatus, historicalLink
- **relations**: hasDepartmentResponsible→GovernmentDepartment, hasHumanRightsFramework→HumanRightsInstrument

## Overseas Territory
- **genus**: `cco:ont00000995`
- **definition**: A territory under the jurisdiction and sovereignty of the United Kingdom that is not part of the UK itself, often former colonial acquisitions.
- **attributes**: identifier, name, location, population, economicStatus, historicalLink, nonSelfGoverning
- **relations**: hasDepartmentResponsible→GovernmentDepartment, hasHumanRightsFramework→HumanRightsInstrument, receivesDevelopmentFunding→DevelopmentFunding

## Government Department
- **genus**: `cco:ont00000995`
- **definition**: A ministry or department of the UK government responsible for specific policy areas or territories.
- **attributes**: identifier, name, responsibilityArea
- **relations**: overseesTerritory→CrownDependency, overseesTerritory→OverseasTerritory

## Human Rights Instrument
- **genus**: `cco:ont00000995`
- **definition**: A legal document or treaty that establishes standards for the protection of human rights.
- **attributes**: identifier, name, type, status
- **relations**: appliesToTerritory→CrownDependency, appliesToTerritory→OverseasTerritory

## Development Funding
- **genus**: `cco:ont00000995`
- **definition**: Financial assistance provided by the UK government to support economic and social development in Overseas Territories.
- **attributes**: identifier, amount, currency, startDate, endDate, purpose
- **relations**: providedToTerritory→OverseasTerritory
