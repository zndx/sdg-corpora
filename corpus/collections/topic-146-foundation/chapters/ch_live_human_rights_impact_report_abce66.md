---
chapter_id: ch_live_human_rights_impact_report_abce66
topic_id: 146
family: 08_derived
cited_terms: ['human_rights_impact_report', 'identifier_subclass', 'flood_asset_vulnerability_assessment']
model: engine-refine
---

Identifiers serve as the foundational addressing mechanism across the system, each instance carrying a unique surrogate key and resolving to a human-readable value such as HANDLE-1234/5678, SEQ-NF2024, SN-8842XJ, or ACCN-GSM7829104. These identifiers do not exist in isolation; they designate concrete entities—telemetry-stream appears as the target of three distinct identifiers, while calibration-run is identified by a fourth—establishing a many-to-one mapping between the addressing layer and the objects under management. The attribute schema governing these identifiers is itself parameterized: checksum_algo, code, format, and issued_date are declared as typed properties, with the first three constrained to xsd:string and the final to xsd:date, enabling a uniform mechanism for attaching heterogeneous metadata to any identifier instance.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | telemetry-stream |
| IDEN-0002 | SEQ-NF2024 | telemetry-stream |
| IDEN-0003 | SN-8842XJ | telemetry-stream |
| IDEN-0004 | ACCN-GSM7829104 | calibration-run |
| IDEN-0005 | RUN-20231105 | wet-lab-sample |
| IDEN-0006 | GUID-f47ac10b | quality-control-report |
| IDEN-0007 | DOI-10.1234/abc | clinical-trial-arm |

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

Attribute values are materialized through a split-value architecture that separates temporal and textual data into dedicated stores. Date-valued attributes such as issued_date resolve to concrete points—2023-11-13, 2024-05-25, 2024-09-11, 2025-05-27—while string-valued attributes carry operational descriptors including Checksum Algo 01, B-12, Encoding 03, and JSON. This separation ensures type safety at query time while preserving the flexibility to attach an arbitrary set of named attributes to any identifier entity, with the attribute definition and its value linked through a common attr_id reference.

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

Reporting relationships are captured through a fact table that associates identifier records with reports_on entities and quantifies the volume of events each association has generated. Identifier REPO-0001 reports on REPO-0006 and has accumulated 369 events; REPO-0002, also reporting on REPO-0006, carries 491 events; REPO-0003 links to REPO-0005 with 354 events; and REPO-0004 points to REPO-0007 with 167 events. The reports_on dimension enriches these associations with human-readable labels—Reports On Label 01 through Reports On Label 04—and categorical classifications—Reports On Category 01 through Reports On Category 04—providing the semantic context necessary for aggregation and filtering without embedding free text within the fact table itself.

**fact_human**

| id | reports_on_key | event_count |
| --- | --- | --- |
| REPO-0001 | REPO-0006 | 369 |
| REPO-0002 | REPO-0006 | 491 |
| REPO-0003 | REPO-0005 | 354 |
| REPO-0004 | REPO-0007 | 167 |
| REPO-0005 | REPO-0007 | 8 |
| REPO-0006 | REPO-0001 | 333 |
| REPO-0007 | REPO-0001 | 488 |
| REPO-0008 | REPO-0002 | 207 |

**dim_reports_on**

| id | reports_on_label | reports_on_category |
| --- | --- | --- |
| REPO-0001 | Reports On Label 01 | Reports On Category 01 |
| REPO-0002 | Reports On Label 02 | Reports On Category 02 |
| REPO-0003 | Reports On Label 03 | Reports On Category 03 |
| REPO-0004 | Reports On Label 04 | Reports On Category 04 |
| REPO-0005 | Reports On Label 05 | Reports On Category 05 |
| REPO-0006 | Reports On Label 06 | Reports On Category 06 |
| REPO-0007 | Reports On Label 07 | Reports On Category 07 |

Flood asset vulnerability assessments constitute a parallel domain of structured records that document the condition and risk posture of physical infrastructure. Each assessment carries a descriptive title—2022 Pakistan Monsoon, Partial System Failure, Levee Seepage, Bridge Foundation Scour—and evaluates a specific asset condition state such as High Erosion Risk, Critical Structural Failure, or Complete Bypass Failure. The vulnerability state identified by each assessment is independently catalogued, with entries like Water Treatment Inundation, Thames Spring Overflow, and Hurricane Ida Surge appearing as distinct risk classifications. Each assessment record is annotated with a label_text field—calibration record and nightly summary appear across the dataset—and a language code (de, fr, ja) that governs the presentation locale, enabling multilingual dissemination of vulnerability findings without duplicating the underlying assessment data.

**t_flood_asset_vulnerability_assessment**

| id | flood_asset_vulnerability_assessment | assesses_asset_condition | identifies_vulnerability_state | label_text | language |
| --- | --- | --- | --- | --- | --- |
| ASSE-0001 | 2022 Pakistan Monsoon | 2022 Pakistan Monsoon | Water Treatment Inundation | calibration record | de |
| ASSE-0002 | Partial System Failure | High Erosion Risk | Thames Spring Overflow | nightly summary | fr |
| ASSE-0003 | Levee Seepage | Critical Structural Failure | Thames Spring Overflow | nightly summary | fr |
| ASSE-0004 | Bridge Foundation Scour | Complete Bypass Failure | Hurricane Ida Surge | nightly summary | ja |
| ASSE-0005 | Moderate Siltation | Complete Bypass Failure | Elevated Seepage Rate | intake form | es |
| ASSE-0006 | Low Drainage Capacity | Total Inundation | Moderate Siltation | audit excerpt | fr |
| ASSE-0007 | Severe Foundation Compromise | Water Treatment Inundation | Gulf Coast Storm Flood | intake form | es |
| ASSE-0008 | Critical Structural Failure | Critical Structural Failure | Pump Station Submersion | pre-release note | en |