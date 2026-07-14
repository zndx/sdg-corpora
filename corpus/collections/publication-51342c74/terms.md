# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## A periodical or newspaper issued to the public
- **genus**: `cco:ont00000995`
- **definition**: A periodical or newspaper issued to the public, including print and online editions.
- **attributes**: publicationId, title, language, frequency, status, circulationCount, onlinePageViews, uniqueVisitors
- **relations**: publishedBy→MediaGroup, deliveredVia→DeliveryPlatform

## A corporate entity that publishes media content
- **genus**: `cco:ont00000995`
- **definition**: A corporate entity that publishes media content and operates various media platforms.
- **attributes**: groupId, groupName, headquartersLocation, foundingYear, marketShare, totalAudience, totalPageViews, totalUniqueVisitors
- **relations**: publishes→Publication, owns→Subsidiary, operates→DeliveryPlatform

## A channel or medium through which media content is distributed
- **genus**: `cco:ont00000995`
- **definition**: A channel or medium through which media content is distributed, including print, online, and mobile platforms.
- **attributes**: platformId, platformName, platformType, accessMethod, activeStatus, monthlyVisitors, monthlyPageViews
- **relations**: delivers→Publication, operatedBy→MediaGroup

## A company controlled by a parent media group
- **genus**: `cco:ont00000995`
- **definition**: A company controlled by a parent media group, often operating in a specific media or advertising niche.
- **attributes**: subsidiaryId, subsidiaryName, ownershipPercentage, businessType, operationalStatus, location
- **relations**: ownedBy→MediaGroup, operates→DeliveryPlatform

## A network for distributing outdoor or digital advertising
- **genus**: `cco:ont00000995`
- **definition**: A network for distributing outdoor or digital advertising, often managed by a subsidiary.
- **attributes**: networkId, networkName, networkType, coverageArea, activeStatus, monthlyImpressions
- **relations**: managedBy→Subsidiary, delivers→Publication

## A broadcast channel for audio content
- **genus**: `cco:ont00000995`
- **definition**: A broadcast channel for audio content, often part of a joint venture or subsidiary.
- **attributes**: channelId, channelName, frequency, language, operationalStatus, audienceSize
- **relations**: operatedBy→JointVenture, leverages→Publication

## A business entity formed by two or more parties
- **genus**: `cco:ont00000995`
- **definition**: A business entity formed by two or more parties, often to operate specific media or advertising services.
- **attributes**: ventureId, ventureName, ownershipStructure, businessType, operationalStatus, location
- **relations**: operates→RadioChannel, ownedBy→MediaGroup
