---
chapter_id: ch_live_subclass_to_directive_ice_6e2dd2
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_to_directive_ice', 'digital_media_service', 'attestation_subclass']
model: engine-refine
---

The architecture of compliance metadata rests upon a disciplined separation between declarative definitions and their runtime instantiations, a pattern that becomes evident when examining how attestation records are structured across multiple normalized tables. Each attestation subclass—whether SOC2-TypeII, VulnerabilityScan-Q3, SecureBoot-Enabled, or TPM-Attestation—is assigned a unique identifier such as ATTE-0001 or ATTE-0002, establishing a stable reference point from which all associated attribute definitions and their concrete values are resolved. The attribute schema itself is captured in a dedicated definition table where each attribute carries a human-readable name like duration_seconds, end_time, exit_code, or host_name, paired with a strict type annotation drawn from the XML Schema namespace: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. This type discipline is not merely documentary; it governs the physical storage layout, as the system partitions attribute values into four distinct value tables—t_attestation_subclass_val_decimal, t_attestation_subclass_val_datetime, t_attestation_subclass_val_int, and t_attestation_subclass_val_varchar—each keyed by a composite of entity_id and attr_id that binds a specific attestation instance to a specific attribute definition.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SOC2-TypeII |
| ATTE-0002 | VulnerabilityScan-Q3 |
| ATTE-0003 | SecureBoot-Enabled |
| ATTE-0004 | TPM-Attestation |
| ATTE-0005 | GitOps-Deployment |
| ATTE-0006 | AccessControlReview |
| ATTE-0007 | ThirdPartyVendorRisk |

**t_attestation_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2025-01-08T20:38:13 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2024-01-27T20:47:31 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2024-07-24T11:57:07 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2024-04-06T01:35:21 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-02-15T00:38:24 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2023-06-05T10:05:45 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2024-06-10T20:49:48 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2023-08-11T12:49:10 |

**t_attestation_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 1293.13 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 215.34 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 4975.39 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 778.44 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5119.03 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 3990.60 |
| ATTE-0007 | ATTE-0007 | ATTE-0001 | 1452.26 |

**t_attestation_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | gw-12 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | review |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | edge-03 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | closeout |

The value tables demonstrate how type-safe storage is enforced at the schema level. A single attestation entity, ATTE-0001, for instance, carries a duration_seconds value of 1293.13 stored in the decimal table, an end_time of 2025-01-08T20:38:13 in the datetime table, an exit_code of 806 in the integer table, and a host_name of gw-12 in the varchar table—all simultaneously, all type-coherent, all traceable back to their respective attribute definitions through the entity_id and attr_id foreign keys. The decimal values span a wide operational range, from 215.34 for ATTE-0002 to 4975.39 for ATTE-0003, while the integer exit codes cluster in the hundreds (409, 470, 695, 806), and the varchar values include both machine identifiers and lifecycle states such as review and superseded. This multi-table value decomposition avoids the null-waste problem of a single wide table while preserving full type fidelity across heterogeneous attribute domains.

Parallel to the attestation model, the service-oriented dimension of the framework organizes functional capabilities through a star-schema arrangement centered on the fact_digital fact table. This table records event_count measurements—311, 322, 297, and 386 for its four rows—each associated with a provides_function_key that references the dim_provides_function dimension. The dimension table itself carries two descriptive columns: provides_function_label, which holds human-readable labels such as Provides Function Label 01 through Provides Function Label 04, and provides_function_category, which assigns categorical groupings like Provides Function Category 01 through Provides Function Category 04. The event_count column serves as the primary numeric measure, enabling aggregation and trend analysis across functional categories, while the dimension's label and category columns provide the semantic context necessary for reporting and governance dashboards.

**fact_digital**

| id | provides_function_key | event_count |
| --- | --- | --- |
| SERV-0001 | SERV-0005 | 311 |
| SERV-0002 | SERV-0003 | 322 |
| SERV-0003 | SERV-0002 | 297 |
| SERV-0004 | SERV-0002 | 386 |
| SERV-0005 | SERV-0005 | 377 |
| SERV-0006 | SERV-0006 | 162 |

Directive compliance is captured through a separate subclassing mechanism embodied in the t_subclass_to_directive_ice table, which maps identifiers such as ICE-0001 through ICE-0004 to specific directive types including ProvenanceTraceRequirement and EncryptionStandard, alongside CalibrationInstruction appearing twice across the dataset. Each mapping carries an encoding specification—either ascii or unicode—and a label_text field that provides operational context, with values such as intake form, calibration record, and nightly summary. The encoding column is particularly significant in multi-tenant or internationalized deployments, as it determines the character set for downstream data exchange and archival. The duplication of CalibrationInstruction across ICE-0003 and ICE-0004, distinguished only by their encoding (unicode versus ascii) and label_text (nightly summary versus intake form), illustrates how the same directive can be instantiated under different technical constraints while remaining traceable to a single compliance requirement.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

The unifying principle across all these structures is the consistent use of identifier columns as the primary key for every table and the strategic deployment of foreign-key relationships—provides_function_key in fact_digital referencing dim_provides_function, and the entity_id/attr_id composite in each value table referencing their respective definition tables—to maintain referential integrity without denormalization. The misc column, appearing as the value carrier in all four attestation value tables, serves as a generic value placeholder whose semantic meaning is entirely determined by the attr_type of the referenced attribute definition, a design that permits schema evolution without DDL changes. Together, these tables form a coherent metadata fabric where identifiers anchor every record, types constrain every value, categories organize every function, and encodings govern every character stream, producing a system that is simultaneously rigorous in its type discipline and flexible in its capacity to absorb new attestation types and directive subclasses without structural modification.

**dim_provides_function**

| id | provides_function_label | provides_function_category |
| --- | --- | --- |
| SERV-0001 | Provides Function Label 01 | Provides Function Category 01 |
| SERV-0002 | Provides Function Label 02 | Provides Function Category 02 |
| SERV-0003 | Provides Function Label 03 | Provides Function Category 03 |
| SERV-0004 | Provides Function Label 04 | Provides Function Category 04 |
| SERV-0005 | Provides Function Label 05 | Provides Function Category 05 |
| SERV-0006 | Provides Function Label 06 | Provides Function Category 06 |

**t_attestation_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 806 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 470 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 695 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 409 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 704 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 30 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 773 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 233 |