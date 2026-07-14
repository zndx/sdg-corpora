# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## VPN Server Device
- **genus**: `bfo:0000040`
- **definition**: A physical micro-server appliance that terminates VPN tunnels and manages network access policies for connected clients.
- **attributes**: serialNumber, firmwareVersion, maxConcurrentConnections, powerConsumptionWatts, formFactor, status
- **relations**: enforcesPolicy→SecurityPolicy, supportsProtocol→VpnProtocol, servesClient→VpnClient

## VPN Hardware Client
- **genus**: `bfo:0000040`
- **definition**: A hardware gateway device that routes local device traffic through a secure VPN tunnel to a remote server.
- **attributes**: serialNumber, firmwareVersion, connectionMode, routingMode, macAddress, status
- **relations**: connectsToServer→VpnServer, supportsProtocol→VpnProtocol, routesTrafficFor→NetworkDevice

## VPN Protocol
- **genus**: `bfo:0000040`
- **definition**: A standardized set of rules and encryption methods used to establish secure point-to-point connections over the Internet.
- **attributes**: protocolName, encryptionStandard, portNumber, transportLayer, isDeprecated, securityRating
- **relations**: implementedBy→VpnServer, implementedBy→VpnClient

## Network Security Policy
- **genus**: `bfo:0000040`
- **definition**: A configured set of management rules, access controls, and encryption standards applied to a private network segment.
- **attributes**: policyId, policyName, lastUpdated, encryptionLevel, accessControlMode, auditLogRetentionDays
- **relations**: enforcedOn→VpnServer, governsNetwork→NetworkSegment

## Private Network Segment
- **genus**: `bfo:0000040`
- **definition**: A logically isolated portion of a private network (home or company) that is secured and managed by the VPN infrastructure.
- **attributes**: segmentId, segmentName, subnetMask, gatewayIp, locationType, isolationLevel
- **relations**: containsDevice→NetworkDevice, securedBy→VpnServer

## End-User Network Device
- **genus**: `bfo:0000040`
- **definition**: A computing endpoint (desktop, mobile, or IoT) that generates traffic routed through the VPN client or directly to the private network.
- **attributes**: deviceId, deviceName, deviceType, osVersion, macAddress, lastSeen, isAuthenticated
- **relations**: connectedToClient→VpnClient, residesIn→NetworkSegment, generatesTraffic→DataPacket

## Encrypted Data Packet
- **genus**: `bfo:0000040`
- **definition**: A discrete unit of data transmitted across the Internet, encapsulated and encrypted within a VPN tunnel to prevent industrial espionage.
- **attributes**: packetId, payloadSizeBytes, timestamp, encryptionAlgorithm, protocolType, isEncrypted, integrityCheckHash
- **relations**: routedBy→VpnClient, terminatedBy→VpnServer, originatesFrom→NetworkDevice
