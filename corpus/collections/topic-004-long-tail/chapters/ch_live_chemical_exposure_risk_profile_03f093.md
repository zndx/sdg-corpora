---
chapter_id: ch_live_chemical_exposure_risk_profile_03f093
topic_id: 4
family: 08_derived
cited_terms: ['chemical_exposure_risk_profile', 'labrun_observed_at_site', 'mass_function_basic']
model: engine-refine
---

Chemical exposure risk profiles serve as structured assessments that link specific hazardous substances to their anticipated human health consequences. Each profile is uniquely identified—PROF-0001 through PROF-0004—and carries a descriptive label such as PulmonaryEdema, WaterborneRoute, DermatologicalBurns, or HydrogenSulfide. The profile's scope is defined by two relational dimensions: the toxic industrial chemical or exposure pathway it evaluates, captured in the assesses_exposure_to column, and the human health outcome it estimates, recorded in estimates_impact_on. For instance, profile PROF-0001 evaluates exposure to SoilDeposition and estimates its impact on VaporCloud, while PROF-0003 assesses DermalContact and estimates its impact on RenalDysfunction. These profiles are further contextualized by encoding standards—unicode, ascii, utf8, latin1—and language codes such as en, es, and de, ensuring that risk documentation is both machine-readable and accessible to multilingual stakeholders.

**t_chemical_exposure_risk_profile**

| id | chemical_exposure_risk_profile | assesses_exposure_to | estimates_impact_on | encoding | language |
| --- | --- | --- | --- | --- | --- |
| PROF-0001 | PulmonaryEdema | SoilDeposition | VaporCloud | unicode | en |
| PROF-0002 | WaterborneRoute | SulfurMustard | DermalContact | ascii | es |
| PROF-0003 | DermatologicalBurns | DermalContact | RenalDysfunction | utf8 | de |
| PROF-0004 | HydrogenSulfide | HepaticToxicity | DermalContact | latin1 | es |
| PROF-0005 | Ammonia | IngestionPathway | RespiratoryFailure | ascii | en |

Laboratory run data is organized around an entity-attribute-value (EAV) architecture that separates structural definitions from stored values. The entity layer is anchored by t_labrun_observed_at_site, which associates individual laboratory runs—PCR-ALPHA, RUN-2023-A4, WET-LAB-44, PLATE-A12—with the physical locations where they occur, including FIELD-STATION-9, CLEAN-ROOM-A, SECURE-VAULT-3, and BUILDING-C. Each entity receives a stable identifier such as SITE-0001 or SITE-0002, providing a consistent reference point across all subsequent attribute and value tables. This separation of concerns allows the schema to accommodate a wide variety of measured properties without requiring schema migrations when new attributes are introduced.

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FIELD-STATION-9 |
| SITE-0002 | RUN-2023-A4 | CLEAN-ROOM-A |
| SITE-0003 | WET-LAB-44 | SECURE-VAULT-3 |
| SITE-0004 | PLATE-A12 | BUILDING-C |
| SITE-0005 | BATCH-8812 | LAB-WING-D |
| SITE-0006 | NEXTRA-GEN-03 | BENCH-12 |
| SITE-0007 | BATCH-8812 | CORE-FACILITY |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

Attribute definitions reside in t_labrun_observed_at_site_attr, where each attribute is assigned a name and a type from the XSD namespace. Attributes such as duration_seconds, end_time, exit_code, and host_name are typed as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. The attr_type column establishes the semantic contract for how values must be interpreted, enabling type-safe validation at query time. When a new measurement type is required—say, a timestamp for run completion or an integer for an exit status—the schema simply adds a row to this attribute table rather than altering any value-storing table.

Value storage is partitioned by data type across four dedicated tables, each keyed by a unique identifier and linked to its entity and attribute through foreign keys. The t_labrun_observed_at_site_val_datetime table holds temporal values like 2024-11-18T14:57:47 and 2025-06-11T00:43:59, while t_labrun_observed_at_site_val_decimal stores numeric measurements such as 3858.44 and 5434.21. Integer-valued attributes—exit codes and counters—appear in t_labrun_observed_at_site_val_int with values like 263, 199, and 302, and string-valued attributes such as host names and status messages are stored in t_labrun_observed_at_site_val_varchar, containing entries like ingest-21, Log Level 02, closeout, and failed. This type-partitioned design ensures that each value is stored in its most efficient representation and that type coercion errors are prevented at the storage layer.

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |

Mass function records introduce a parallel metadata dimension, capturing the nature of mass measurements alongside the methods and encodings used to produce them. Entries such as Filter cake, Effluent mass, Target mass, and Total solids are each associated with a collection method—automated or manual—and an encoding standard—ascii or latin1. The method column distinguishes between automated and manual procedures, which is critical for traceability and quality assurance in laboratory workflows. Together with the encoding field, these columns provide the provenance information necessary to assess the reliability and interoperability of mass function data across different systems and reporting formats.

**t_mass_function_basic**

| id | mass | method | encoding |
| --- | --- | --- | --- |
| FUNC-0001 | Filter cake | automated | ascii |
| FUNC-0002 | Effluent mass | manual | latin1 |
| FUNC-0003 | Target mass | automated | latin1 |
| FUNC-0004 | Total solids | manual | ascii |
| FUNC-0005 | Effluent mass | hybrid | latin1 |
| FUNC-0006 | Feedstock mass | automated | latin1 |