# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## User Account
- **genus**: `cco:ont00000995`
- **definition**: A digital identity record representing a user's authenticated session and credential set on a computing system.
- **attributes**: accountId, username, lastPasswordChangeDate, passwordExpiryDays, accountStatus
- **relations**: hasCredential→PasswordCredential, managesDevice→MacBookPro

## Password Credential
- **genus**: `cco:ont00000995`
- **definition**: A cryptographic secret value used to authenticate a user account, subject to periodic rotation policies.
- **attributes**: credentialId, hashAlgorithm, strengthLevel, isExpired, rotationPolicyId
- **relations**: belongsToOne→UserAccount, usedForService→NetworkService

## MacBook Pro Device
- **genus**: `cco:ont00000995`
- **definition**: A portable computing hardware unit running macOS, serving as the endpoint for user authentication and network configuration.
- **attributes**: serialNumber, modelIdentifier, osVersion, lastRebootDate, isRebootRequired
- **relations**: hostsUserAccount→UserAccount, configuresNetwork→NetworkConfiguration

## Network Configuration
- **genus**: `cco:ont00000995`
- **definition**: A structured set of parameters defining network connectivity, including SSID associations, authentication methods, and credential storage.
- **attributes**: configId, ssidName, securityProtocol, isAutoJoinEnabled, lastUpdatedDate
- **relations**: belongsToDevice→MacBookPro, referencesService→NetworkService

## Network Service
- **genus**: `cco:ont00000995`
- **definition**: A remote or local network resource requiring authentication, such as Wi-Fi networks, cloud storage, or email servers.
- **attributes**: serviceId, serviceName, protocolType, requiresCredential, lastCredentialUpdate
- **relations**: associatedWithConfig→NetworkConfiguration, authenticatedBy→PasswordCredential
