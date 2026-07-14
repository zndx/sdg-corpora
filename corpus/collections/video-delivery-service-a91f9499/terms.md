# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Video Delivery Service
- **genus**: `bfo:0000040`
- **definition**: A cloud-based software and service offering that enables the delivery of premium movie and TV content to end-users across multiple platforms and devices.
- **attributes**: serviceId, serviceTier, uptimePercentage, supportedPlatforms, region, status
- **relations**: supports→VideoCodec, uses→DRMSystem, deliversTo→ClientOrganization

## Digital Rights Management System
- **genus**: `bfo:0000040`
- **definition**: An industry-grade software system used to protect digital media content from unauthorized access and distribution.
- **attributes**: drmId, vendorName, encryptionStandard, complianceLevel, licenseServerUrl
- **relations**: protects→VideoDeliveryService, implements→StreamingProtocol

## Video Codec
- **genus**: `bfo:0000040`
- **definition**: A software or hardware tool used to compress and decompress digital video data for efficient storage and transmission.
- **attributes**: codecId, codecName, compressionRatio, bitrate, resolution
- **relations**: usedIn→VideoDeliveryService, requires→NetworkInfrastructure

## Client Organization
- **genus**: `bfo:0000040`
- **definition**: A business entity, such as an online retailer, distributor, or media company, that purchases and utilizes the video delivery services.
- **attributes**: clientId, organizationName, industrySector, region, accountManager
- **relations**: subscribesTo→VideoDeliveryService, requiresSupportFrom→TechnicalSupportEngineer, locatedIn→NetworkInfrastructure

## Technical Support Engineer
- **genus**: `bfo:0000040`
- **definition**: A professional responsible for providing technical assistance, troubleshooting, and support for video delivery services and client infrastructure.
- **attributes**: engineerId, name, location, experienceYears, languages, educationLevel, employmentStatus
- **relations**: supports→ClientOrganization, troubleshoots→NetworkInfrastructure, employs→VideoDeliveryService

## Network Infrastructure
- **genus**: `bfo:0000040`
- **definition**: The underlying hardware and software systems, including TCP/IP networking components, that facilitate the transmission of video data.
- **attributes**: networkId, protocol, bandwidth, latency, operatingSystem, status
- **relations**: connects→ClientOrganization, transmits→VideoCodec, monitoredBy→TechnicalSupportEngineer
