# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Accredited Course Unit or Module
- **genus**: `cco:ont00000995`
- **definition**: A formally accredited educational unit or module defining a specific learning outcome and assessment structure within a vocational training framework.
- **attributes**: unitCode, unitTitle, trainingTypeCode, trainingTypeName, accreditationStatus, currentEffectiveDate, expiryDate, isRestricted
- **relations**: hasRecognitionManager→RecognitionAuthority, hasCurrencyPeriod→CurrencyPeriod, hasRestriction→Restriction, hasContactDetail→ContactDetail

## Vocational Education Regulatory Authority
- **genus**: `bfo:0000023`
- **definition**: A government body or statutory regulator responsible for accrediting, monitoring, and maintaining the currency of vocational training units.
- **attributes**: authorityName, legalBasis, jurisdiction, accreditationStartDate
- **relations**: accredits→CourseUnit

## Regulatory Currency Period
- **genus**: `bfo:0000015`
- **definition**: A defined temporal interval during which a course unit remains valid and recognized under a specific legislative or regulatory framework.
- **attributes**: periodStartDate, periodEndDate, legislativeReference, isCurrentPeriod
- **relations**: appliesTo→CourseUnit, governedBy→RecognitionAuthority

## Course Delivery Restriction
- **genus**: `bfo:0000015`
- **definition**: A conditional limitation or constraint applied to the delivery, enrollment, or recognition of a specific course unit.
- **attributes**: restrictionType, restrictionDescription, restrictionStartDate, restrictionEndDate, isActive
- **relations**: appliesTo→CourseUnit

## Administrative Contact Point
- **genus**: `cco:ont00000995`
- **definition**: A recorded communication channel or administrative point of contact associated with the management or delivery of a course unit.
- **attributes**: contactType, contactValue, contactStartDate, contactEndDate, isPrimary
- **relations**: associatedWith→CourseUnit
