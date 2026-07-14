# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Top-Level Domain
- **genus**: `cco:ont00000995`
- **definition**: A top-level domain (TLD) is a domain name extension that constitutes the highest level in the hierarchical Domain Name System of the Internet.
- **attributes**: tldIdentifier, delegationDate, registryOperator, isDelegated, totalRegisteredNames, retailPrice
- **relations**: contains→DomainName, measuredBy→AbuseRate, hasSecurityProtocol→SecurityProtocol

## Domain Name
- **genus**: `cco:ont00000995`
- **definition**: A unique identifier in the Domain Name System that corresponds to a specific resource on the Internet.
- **attributes**: domainLabel, registrationDate, expirationDate, registrantId, status, isPrivacyProtected
- **relations**: belongsTld→TopLevelDomain, resolvedTo→IPAddress, reportedAs→AbuseReport

## Abuse Type
- **genus**: `bfo:0000015`
- **definition**: A specific category of malicious or abusive activity occurring within the Domain Name System.
- **attributes**: abuseCode, description, severityLevel, isMitigated
- **relations**: affects→DomainName, quantifiedBy→AbuseRate

## Abuse Rate
- **genus**: `bfo:0000015`
- **definition**: A statistical measurement representing the frequency or proportion of abusive activities within a specific domain or TLD over a defined period.
- **attributes**: measurementDate, rateValue, sampleSize, confidenceInterval, dataSource
- **relations**: describes→TopLevelDomain, categorizedAs→AbuseType, derivedFrom→ZoneFile

## Zone File
- **genus**: `cco:ont00000995`
- **definition**: A database file containing the authoritative records for a specific top-level domain or zone in the DNS.
- **attributes**: fileId, captureDate, recordCount, isComplete, storageLocation
- **relations**: covers→TopLevelDomain, contains→DomainName, usedIn→AbuseRate

## Security Protocol
- **genus**: `cco:ont00000995`
- **definition**: A technical standard or mechanism deployed to enhance the security of domain name resolution, such as DNSSEC.
- **attributes**: protocolName, version, deploymentStatus, lastVerified
- **relations**: protects→TopLevelDomain, correlatesWith→AbuseRate
