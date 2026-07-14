# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Video Surveillance Installation Project
- **genus**: `bfo:0000015`
- **definition**: A planned or executed deployment of video surveillance infrastructure for a specific site or organization.
- **attributes**: installationId, projectName, targetScale, deploymentDate, status, totalCost
- **relations**: uses→ServerHardware, uses→StorageSystem, uses→VideoManagementSoftware, targets→ClientOrganization, deliveredBy→ChannelPartner

## Enterprise Server Unit
- **genus**: `cco:ont00000995`
- **definition**: A physical computing unit (rack, blade, tower, or hyperscale) provided by Dell for processing surveillance data.
- **attributes**: serverId, manufacturer, formFactor, modelNumber, serialNumber, warrantyExpiry, isManagedService
- **relations**: suppliedBy→Dell, installedIn→SurveillanceInstallation

## Data Storage Infrastructure
- **genus**: `cco:ont00000995`
- **definition**: Physical or logical storage infrastructure (SAN, NAS, DAS, backup) used to retain surveillance video and metadata.
- **attributes**: storageId, storageType, capacityTB, manufacturer, modelNumber, encryptionEnabled
- **relations**: suppliedBy→Dell, storesDataFor→SurveillanceInstallation

## VMS Platform
- **genus**: `cco:ont00000958`
- **definition**: Proprietary software suite for managing, viewing, and recording video feeds from surveillance cameras.
- **attributes**: softwareId, version, licenseType, maxCameras, supportsHD, supportsIP, supportsAnalog
- **relations**: developedBy→Infinova, deployedIn→SurveillanceInstallation

## End-User Organization
- **genus**: `bfo:0000040`
- **definition**: The entity (government, industry, banking, retail, etc.) that commissions and utilizes the surveillance system.
- **attributes**: orgId, orgName, sector, region, orgSize
- **relations**: commissioned→SurveillanceInstallation

## System Integrator / Reseller
- **genus**: `bfo:0000023`
- **definition**: A third-party business entity authorized to design, implement, and support surveillance projects on behalf of Infinova and Dell.
- **attributes**: partnerId, partnerName, certificationLevel, serviceArea
- **relations**: delivers→SurveillanceInstallation, represents→Infinova, represents→Dell
