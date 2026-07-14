# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Small and Medium-sized Enterprise
- **genus**: `cco:ont00000995`
- **definition**: A privately held business with a small number of employees and limited amount of assets and revenues, typically meeting specific quantitative criteria defined by national governments.
- **attributes**: enterpriseId, name, employeeCount, annualRevenue, sector, countryOfOperation, isPubliclyTraded, foundingDate
- **relations**: operatesIn→MarketSector, locatedIn→Jurisdiction, employs→Employee, hasOwner→BusinessOwner

## Business Owner
- **genus**: `bfo:0000023`
- **definition**: An individual who holds an ownership stake in an enterprise and exercises control over its strategic direction.
- **attributes**: ownerId, fullName, generation, age, title, yearsOfExperience, exitPlan, exitTimeframe
- **relations**: owns→SME, residesIn→Jurisdiction, participatedIn→Survey

## Employee
- **genus**: `bfo:0000023`
- **definition**: An individual engaged in work for an employer in exchange for financial or other compensation.
- **attributes**: employeeId, fullName, role, department, startDate, terminationDate, isLeader, performanceRating
- **relations**: worksFor→SME, holdsPosition→JobRole, residesIn→Jurisdiction

## Job Role
- **genus**: `bfo:0000023`
- **definition**: A specific position within an organization that defines a set of responsibilities, required skills, and reporting relationships.
- **attributes**: roleId, title, department, requiredSkills, isLeadership, minQualifications, salaryRange
- **relations**: filledBy→Employee, belongsToMany→Department

## Market Sector
- **genus**: `bfo:0000004`
- **definition**: A distinct group of businesses or industries that share common characteristics, products, or services.
- **attributes**: sectorId, name, industryClassificationCode, growthRate, isGrowthSector, description
- **relations**: contains→SME, operatesIn→Jurisdiction

## Jurisdiction
- **genus**: `bfo:0000004`
- **definition**: A geographical or administrative area over which a legal or regulatory authority has control.
- **attributes**: jurisdictionId, name, countryCode, region, population, gdp, regulatoryEnvironment
- **relations**: contains→SME, contains→BusinessOwner, contains→Employee

## Business Survey
- **genus**: `cco:ont00000958`
- **definition**: A structured questionnaire or study designed to collect data from a specific population to gain insights into business trends and challenges.
- **attributes**: surveyId, title, commissionedBy, conductedBy, startDate, endDate, totalRespondents, countriesCovered, timeframe
- **relations**: surveyed→BusinessOwner, commissionedBy→Organization, conductedBy→Organization
