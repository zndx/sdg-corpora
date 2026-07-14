# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Business Account
- **genus**: `cco:ont00000995`
- **definition**: A digital record representing a commercial entity's subscription and administrative profile within the timeSSD platform.
- **attributes**: businessIdentifier, vatNumber, registeredAddress, subscriptionStatus, primaryLanguage
- **relations**: hasAdministrator→SoftwareAdministrator, ownsPrivateData→WorkMethod, usesSoftware→LaborCostingSoftware

## Software Administrator
- **genus**: `bfo:0000023`
- **definition**: A role played by a user who holds exclusive administrative rights and subscription management authority for a specific business account.
- **attributes**: administratorId, roleStatus, authorizationLevel
- **relations**: managesAccount→BusinessAccount, authoredData→WorkMethod

## Work Method
- **genus**: `cco:ont00000995`
- **definition**: A structured digital record containing operation lists, standard times, and layout planning data used for labor costing and workflow development.
- **attributes**: methodId, dataClassification, creationDate, exportFormat, languageCode
- **relations**: containsElement→MotionElement, ownedBy→BusinessAccount, usesBaseData→StandardElementLibrary

## Motion Element
- **genus**: `cco:ont00000995`
- **definition**: A fundamental unit of work or motion within a method, which may be a predefined standard item or a custom-developed component.
- **attributes**: elementId, elementType, standardTimeValue, copyrightOwner
- **relations**: partOfMethod→WorkMethod, translatesTo→LocalizedDescription

## Standard Element Library
- **genus**: `cco:ont00000995`
- **definition**: The proprietary initial database content (ELF) containing predefined macros, methods, and motion elements owned by the platform company.
- **attributes**: libraryVersion, contentStatus, lastUpdated
- **relations**: providesElement→MotionElement, ownedBy→PlatformCompany

## Localized Description
- **genus**: `cco:ont00000995`
- **definition**: A translated text record for a motion element or interface standard text, allowing multilingual access to the software content.
- **attributes**: localeCode, textContent, translationStatus
- **relations**: describesElement→MotionElement

## Platform Company
- **genus**: `bfo:0000004`
- **definition**: The legal entity (Astailor Shine S.R.L.) that operates the timeSSD platform, holds copyright over the ELF database, and manages software licenses.
- **attributes**: companyRegistrationNumber, vatNumber, registeredOffice, jurisdiction
- **relations**: operatesSoftware→LaborCostingSoftware, ownsLibrary→StandardElementLibrary

## Labor Costing Software
- **genus**: `cco:ont00000995`
- **definition**: The proprietary software system dedicated to labor costing, work method development, and layout planning, utilizing a pay-as-you-go licensing model.
- **attributes**: softwareVersion, licensingModel, ediEnabled, exportCapabilities
- **relations**: usedBy→BusinessAccount, hostsLibrary→StandardElementLibrary
