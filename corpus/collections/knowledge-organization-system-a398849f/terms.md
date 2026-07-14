# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Knowledge Organization System
- **genus**: `cco:ont00000995`
- **definition**: A structured system of controlled terms, vocabularies, or taxonomies used to organize and retrieve information resources.
- **attributes**: identifier, name, version, lastUpdated, scope, status
- **relations**: containsTerm→ControlledTerm, usedBy→TaggingActivity

## Controlled Term
- **genus**: `cco:ont00000995`
- **definition**: A standardized vocabulary item within a knowledge organization system, representing a specific concept with controlled spelling and disambiguation.
- **attributes**: termId, prefLabel, altLabel, definition, broaderTerm, narrowerTerm, relatedTerm
- **relations**: partOfSystem→KnowledgeOrganizationSystem, synonymOf→ControlledTerm, broaderThan→ControlledTerm, narrowerThan→ControlledTerm

## Social Tag
- **genus**: `cco:ont00000995`
- **definition**: An uncontrolled, user-generated keyword or phrase applied to a digital resource to describe its content or context.
- **attributes**: tagId, tagText, spellingVariant, usageCount, firstUsed, lastUsed, isAmbiguous
- **relations**: appliedTo→DigitalResource, createdBy→User, mapsTo→ControlledTerm

## Digital Resource
- **genus**: `cco:ont00000995`
- **definition**: A digital object or document within a repository or collection that is indexed, classified, or tagged for discovery and retrieval.
- **attributes**: resourceId, title, format, dateCreated, dateModified, sizeBytes, status
- **relations**: taggedWith→SocialTag, indexedBy→ControlledTerm, ownedBy→User, partOfCollection→DigitalCollection

## Tagging Activity
- **genus**: `bfo:0000015`
- **definition**: The process or event of applying social tags or controlled terms to digital resources by users or indexers.
- **attributes**: activityId, startTime, endTime, method, qualityScore, indexerRole
- **relations**: targetsResource→DigitalResource, usesSystem→KnowledgeOrganizationSystem, appliesTag→SocialTag, appliesTerm→ControlledTerm, performedBy→User

## User
- **genus**: `bfo:0000023`
- **definition**: An individual or agent who interacts with digital resources, either by tagging them, creating them, or indexing them.
- **attributes**: userId, username, registrationDate, role, affiliation, isActive
- **relations**: creates→DigitalResource, tags→SocialTag, performsActivity→TaggingActivity

## Digital Collection
- **genus**: `cco:ont00000995`
- **definition**: A curated set of digital resources organized for specific purposes, such as research, education, or archival preservation.
- **attributes**: collectionId, name, description, dateEstablished, resourceCount, accessLevel
- **relations**: containsResource→DigitalResource, usesSystem→KnowledgeOrganizationSystem, managedBy→User
