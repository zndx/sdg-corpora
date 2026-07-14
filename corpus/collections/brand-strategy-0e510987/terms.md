# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Brand Strategy
- **genus**: `bfo:0000015`
- **definition**: A strategic process that defines a brand's unique story, positioning, and identity to differentiate it from competitors and attract customers.
- **attributes**: strategyId, brandName, positioningStatement, targetAudience, status, createdDate, lastModified
- **relations**: executedBy→CreativeStudio, includes→BrandIdentity

## Campaign Strategy
- **genus**: `bfo:0000015`
- **definition**: A coordinated plan for advertising campaigns that aligns online and offline efforts to engage audiences and build around a brand story.
- **attributes**: campaignId, campaignName, startDate, endDate, budget, status, channel, targetEngagementRate
- **relations**: basedOn→BrandStrategy, delivers→ContentAsset

## Content Strategy
- **genus**: `bfo:0000015`
- **definition**: A framework for creating, publishing, and managing content that unifies brand messaging and drives audience engagement across media.
- **attributes**: contentId, contentTitle, contentType, publishDate, status, conversionRate, platform
- **relations**: supports→CampaignStrategy, publishedOn→DigitalPlatform

## Responsive Website
- **genus**: `cco:ont00000995`
- **definition**: A digital property designed to display optimally across multiple devices, increasing conversion rates and traffic.
- **attributes**: websiteId, domainName, launchDate, conversionRate, trafficSource, mobileOptimized, cmsPlatform
- **relations**: developedBy→DevelopmentTeam, hosts→ContentAsset

## Mobile App
- **genus**: `cco:ont00000995`
- **definition**: A software application designed for mobile devices to engage customers and drive business growth.
- **attributes**: appId, appName, platform, launchDate, loadTime, activeUsers, status
- **relations**: developedBy→DevelopmentTeam, integratesWith→SocialMediaPlatform

## E-commerce Website
- **genus**: `cco:ont00000995`
- **definition**: A digital storefront designed to convert visitors into customers through optimized design and social media integration.
- **attributes**: ecommerceId, storeName, conversionRate, paymentGateway, inventorySystem, socialIntegration, lastAuditDate
- **relations**: developedBy→DevelopmentTeam, sells→Product

## Brand Identity
- **genus**: `cco:ont00000995`
- **definition**: A set of visual and verbal elements including logos, style guides, and standards that define a brand's unique presence.
- **attributes**: identityId, brandName, logoUrl, primaryColor, secondaryColor, fontFamily, version
- **relations**: createdFor→BrandStrategy, usedIn→PrintMaterial

## Print Material
- **genus**: `cco:ont00000995`
- **definition**: Physical marketing collateral such as business cards, brochures, and billboards that leave a lasting impression.
- **attributes**: materialId, materialType, printDate, quantity, paperType, finish, status
- **relations**: designedBy→CreativeStudio, features→BrandIdentity
