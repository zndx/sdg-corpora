# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## User Account
- **genus**: `cco:ont00000995`
- **definition**: A persistent digital identity record for a student or staff member that stores authentication credentials and access permissions for institutional services.
- **attributes**: accountId, username, temporaryPassword, status, enrollmentDate, lastLoginTimestamp
- **relations**: hasCredential→AuthenticationCredential, accessesService→DigitalService, usesDevice→UserDevice

## Authentication Credential
- **genus**: `cco:ont00000995`
- **definition**: A specific set of credentials (username and password) used to authenticate a user account against a digital service.
- **attributes**: credentialId, credentialType, isTemporary, issueDate, expiryDate
- **relations**: belongs_to→UserAccount, valid_for_service→DigitalService

## Digital Service
- **genus**: `cco:ont00000995`
- **definition**: A software application or platform provided by the institution that users access via the internet, such as Mūrau or Office 365.
- **attributes**: serviceId, serviceName, baseUrl, serviceType, status, lastUpdated
- **relations**: provides_app→SoftwareApplication, supports_sso→SingleSignOnProtocol, stores_data_in→CloudStorage

## Software Application
- **genus**: `cco:ont00000995`
- **definition**: A specific program or tool within a digital service suite, such as Word, Teams, or OneNote, used for academic or administrative tasks.
- **attributes**: appId, appName, version, platform, isBlendedLearningTool
- **relations**: part_of_service→DigitalService, installed_on→UserDevice, used_in_course→CourseModule

## User Device
- **genus**: `cco:ont00000995`
- **definition**: A physical computing device owned or used by a user to access institutional digital services and applications.
- **attributes**: deviceId, deviceType, osType, lastSyncDate
- **relations**: owned_by→UserAccount, runs_app→SoftwareApplication

## Cloud Storage
- **genus**: `cco:ont00000995`
- **definition**: A remote, internet-based storage facility where user documents are automatically saved and synchronized across devices.
- **attributes**: storageId, storageName, capacityTb, isPrivate, autoSaveEnabled
- **relations**: belongs_to_service→DigitalService, stores_document→UserDocument

## User Document
- **genus**: `cco:ont00000995`
- **definition**: A digital file created or edited by a user within a software application, stored in cloud storage to prevent data loss.
- **attributes**: documentId, fileName, fileType, lastModified, isSynced
- **relations**: created_by→UserAccount, stored_in→CloudStorage, created_with_app→SoftwareApplication
