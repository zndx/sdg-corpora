# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Approval Certificate
- **genus**: `cco:ont00000958`
- **definition**: A formal document issued by an approval body certifying that specific products meet defined standards.
- **attributes**: approvalId, approvalStandard, approvalGrantedDate, dateAuthorized, revisionRequest, issuingOrganization, issuingOfficer, issuingOfficerTitle
- **relations**: certifies→ProductModel, issuedTo→Manufacturer

## Manufacturer
- **genus**: `bfo:0000040`
- **definition**: An organization responsible for the production and design of the certified pipe and fittings.
- **attributes**: legalName, address, city, postalCode, country
- **relations**: produces→ProductModel

## Product Model
- **genus**: `cco:ont00000995`
- **definition**: A specific design and specification of a pipe or fitting subject to approval.
- **attributes**: modelNumber, productDescription, nominalPipeSize, ratedWorkingPressurePsi, ratedWorkingPressureKpa, remarks
- **relations**: certifiedBy→ApprovalCertificate, manufacturedBy→Manufacturer, hasMaterialSpecification→MaterialSpecification, hasDimensionalStandard→DimensionalStandard

## Material Specification
- **genus**: `cco:ont00000995`
- **definition**: The defined material composition and properties for the pipe or fitting.
- **attributes**: materialType, serviceApplication
- **relations**: specifies→ProductModel

## Dimensional Standard
- **genus**: `cco:ont00000995`
- **definition**: The standard defining the physical dimensions and pressure ratings of the product.
- **attributes**: standardName, standardVersion, pressureRatingBasis
- **relations**: appliesTo→ProductModel
