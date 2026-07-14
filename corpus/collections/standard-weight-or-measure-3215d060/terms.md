# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Standard Weight or Measure
- **genus**: `cco:ont00000995`
- **definition**: A physical artifact or reference sample maintained as the official standard for weight or measure, certified by the National Bureau of Standards and stored in the Governor's office.
- **attributes**: standardIdentifier, certificationDate, lastCertificationDate, nextCertificationDueDate, storageLocation, certificationStatus, standardType, isPrimaryStandard
- **relations**: storedIn→SecureStorageFacility, certifiedBy→CertificationAuthority, usedForVerificationOf→FieldStandard, usedForScientificPurposeOf→ScientificStudy

## Secure Storage Facility
- **genus**: `bfo:0000015`
- **definition**: A designated secure location within the Governor's office where official standards of weight and measure are kept and maintained.
- **attributes**: facilityIdentifier, facilityName, locationDescription, securityLevel, accessControlPolicy, isAuthorizedForRemoval
- **relations**: housesStandard→StandardWeightOrMeasure, managedBy→GovernmentOffice

## Certification Authority
- **genus**: `bfo:0000015`
- **definition**: The National Bureau of Standards, an organization responsible for certifying the accuracy and suitability of official standards of weight and measure.
- **attributes**: authorityIdentifier, authorityName, certificationProtocol, certificationFrequency, isFederalAgency
- **relations**: certifiesStandard→StandardWeightOrMeasure, issuesCertificationFor→StandardWeightOrMeasure

## Field Standard
- **genus**: `cco:ont00000995`
- **definition**: A portable or operational standard of weight or measure used in the field, verified against the primary standards maintained in the Governor's office.
- **attributes**: fieldStandardIdentifier, verificationDate, verificationStatus, usageContext, isPortable, lastCalibrationDate
- **relations**: verifiedBy→StandardWeightOrMeasure, usedIn→FieldOperation

## Government Office
- **genus**: `bfo:0000015`
- **definition**: An official administrative office, such as the Governor's office or the Secretary of Commerce's office, responsible for housing and managing standards of weight and measure.
- **attributes**: officeIdentifier, officeName, officeType, jurisdictionLevel, isResponsibleForStandards
- **relations**: housesStandard→StandardWeightOrMeasure, managesFacility→SecureStorageFacility, overseesFunction→WeightsAndMeasuresFunction

## Weights and Measures Function
- **genus**: `bfo:0000015`
- **definition**: The administrative and regulatory activity related to the maintenance, certification, and verification of standards of weight and measure, transferred from the Governor to the Secretary of Commerce.
- **attributes**: functionIdentifier, functionName, functionStatus, transferDate, originalResponsibleOffice, currentResponsibleOffice
- **relations**: managedBy→GovernmentOffice, involvesStandard→StandardWeightOrMeasure, involvesFieldStandard→FieldStandard
