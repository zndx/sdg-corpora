# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Regulation
- **genus**: `cco:ont00000958`
- **definition**: A formal document establishing binding rules, such as UN Regulation No. 117, governing vehicle component standards.
- **attributes**: identifier, title, status, effective_date, issuing_body
- **relations**: amendedBy→Corrigendum, governs→TyreType, supersededBy→Regulation

## Corrigendum
- **genus**: `cco:ont00000958`
- **definition**: A formal document issued to correct errors or update provisions within an existing regulation without full re-issuance.
- **attributes**: identifier, issue_number, submission_date, proposing_entity, status
- **relations**: amends→Regulation, modifies→TestProtocol, submittedBy→Expert

## Tyre Type
- **genus**: `cco:ont00000995`
- **definition**: A specific design and model of a tyre subject to type-approval and noise testing standards.
- **attributes**: type_code, manufacturer_id, rolling_noise_db, width_mm, profile_index, load_index, speed_rating
- **relations**: testedIn→TestFacility, approvedBy→TypeApprovalAuthority, measuredBy→TestProtocol

## Test Protocol
- **genus**: `bfo:0000015`
- **definition**: A standardized procedure and set of conditions for measuring tyre rolling noise and other performance metrics.
- **attributes**: protocol_id, protocol_version, measurement_unit, witnessing_required, test_environment, temperature_celsius, pressure_bar
- **relations**: appliedTo→TyreType, conductedAt→TestFacility, governedBy→Regulation

## Test Facility
- **genus**: `bfo:0000015`
- **definition**: A laboratory or physical location equipped to perform standardized tyre noise and performance testing.
- **attributes**: facility_id, facility_name, location, certification_status, owner_type
- **relations**: hosts→TestProtocol, certifiedBy→TypeApprovalAuthority, ownedBy→Manufacturer

## Type Approval Authority
- **genus**: `cco:ont00000958`
- **definition**: A designated governmental or regulatory body responsible for granting type-approval to vehicle components and overseeing testing.
- **attributes**: authority_id, authority_name, jurisdiction, witnessing_policy, contact_email
- **relations**: approves→TyreType, certifies→TestFacility, witnesses→TestProtocol
