# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Mobile Worker
- **genus**: `bfo:0000040`
- **definition**: A human employee who requires remote access to corporate network resources from various locations and devices.
- **attributes**: workerId, employeeName, department, role, deviceType, osPlatform, authenticationRealm, lastLoginTimestamp
- **relations**: authenticatedVia→AuthenticationServer, assignedRole→UserRole, usesDevice→EndpointDevice, connectsTo→VPNGateway

## VPN Gateway
- **genus**: `bfo:0000040`
- **definition**: A network-based infrastructure node that terminates remote VPN connections and routes traffic to the corporate network.
- **attributes**: gatewayId, location, region, maxConcurrentUsers, encryptionProtocol, status, capacityUtilization
- **relations**: routesTo→CorporateNetwork, servesUsers→MobileWorker, usesEquipment→NetworkEquipment

## Corporate Network
- **genus**: `bfo:0000040`
- **definition**: The internal private network infrastructure containing business-critical applications and data resources.
- **attributes**: networkId, networkName, ipRange, securityLevel, lastAuditDate
- **relations**: hostsResources→BusinessResource, connectedVia→VPNGateway

## Business Resource
- **genus**: `bfo:0000040`
- **definition**: A specific application, file share, or service within the corporate network that mobile workers require access to.
- **attributes**: resourceId, resourceName, resourceType, accessProtocol, isSSOSupported, maxConnections
- **relations**: accessibleByRole→UserRole, hostedOn→CorporateNetwork

## User Role
- **genus**: `bfo:0000023`
- **definition**: A defined permission set that determines which corporate resources a mobile worker is authorized to access.
- **attributes**: roleId, roleName, roleDescription, maxResources
- **relations**: grantsAccessTo→BusinessResource, assignedToWorker→MobileWorker

## Network Equipment
- **genus**: `bfo:0000040`
- **definition**: Physical hardware appliances that provide the underlying infrastructure for VPN termination and routing.
- **attributes**: equipmentId, manufacturer, model, firmwareVersion, status
- **relations**: deploysAt→VPNGateway

## Authentication Server
- **genus**: `bfo:0000040`
- **definition**: A directory or identity management system that validates user credentials and enforces access policies.
- **attributes**: serverId, serverType, serverAddress, isPrimary
- **relations**: validatesWorker→MobileWorker
