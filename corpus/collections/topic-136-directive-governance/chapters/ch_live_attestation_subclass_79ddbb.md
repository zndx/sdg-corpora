---
chapter_id: ch_live_attestation_subclass_79ddbb
topic_id: 136
family: 03_directive_governance
cited_terms: ['attestation_subclass', 'equiv_intersect_artifact_with_part', 'soc2_availability_subclass']
model: engine-refine
---

COMPLIANCE AND GOVERNANCE FRAMEWORK — ATTRIBUTES, ENTITIES, AND PROVENANCE

The foundation of any auditable compliance system rests upon the disciplined separation of what is being attested from the properties that describe it. Attestation records—identified by stable handles such as ATTE-0001 through ATTE-0004—serve as the primary entities around which all governance activity orbits. Each attestation carries a categorical label, whether SOC2-TypeII, VulnerabilityScan-Q3, SecureBoot-Enabled, or TPM-Attestation, establishing the scope and nature of the claim. These identifiers are not merely labels; they are the immutable keys that bind every subsequent attribute definition, value assignment, and provenance record to a single, traceable compliance event. An attestation entity persists as the anchor point across all relational tables, its identifier referenced repeatedly as the entity_id in value tables, ensuring that every measured property can be unambiguously traced back to the compliance claim it supports.

Attributes and their types form the schema layer that gives structure to compliance evidence. The attribute definition tables declare both the semantic name of a property—duration_seconds, end_time, exit_code, host_name, effective_date, enforcement, mandatory, priority—and its enforced data type, drawn from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string, xsd:date, xsd:boolean. This type discipline is not decorative; it is the mechanism by which the system guarantees that a duration is stored as a decimal (1293.13, 215.34, 4975.39, 778.44), a timestamp as an ISO 8601 datetime (2025-01-08T20:38:13, 2024-01-27T20:47:31, 2024-07-24T11:57:07), a status code as an integer (806, 470, 695, 409), and a textual descriptor as a variable-length string (gw-12, Log Level 02, review, superseded, Encoding 01, Enforcement 02, nightly summary, fr). The value tables are partitioned by type precisely because compliance evidence must be queryable, comparable, and machine-readable without ambiguity. A boolean flag such as mandatory—evaluated as true for AVAI-0001 and AVAI-0002, false for AVAI-0003 and AVAI-0004—carries different semantic weight than a date value like 2024-07-01 or 2023-09-25, and the type separation ensures that each is handled by the correct validation logic.

The misc column across all value tables represents the actual compliance evidence—the measured, observed, or declared values that auditors and automated systems inspect. These values are not free-form; they are constrained by their associated attr_type and linked to their parent entity through the entity_id foreign key. The integer values 378 and 753 associated with the priority attribute in the SOC2 availability subclass, for instance, quantify enforcement urgency in a way that supports threshold-based alerting. The string value superseded in the attestation value table signals a lifecycle state change, while review indicates an attestation pending human validation. Each misc value is a discrete piece of evidence, and the relational structure ensures that no value exists in isolation—it is always attributable to a specific attribute on a specific attestation entity.

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

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

Checksums and ownership fields provide the provenance layer that transforms raw compliance data into accountable governance records. The equivalence intersection artifact table carries a checksum column—values such as c0ffee42, 1a4b6c2d, and a3f9c21e—that serves as a content fingerprint for artifact-part relationships, enabling integrity verification across distributed systems. The owner column assigns accountability: platform-team, governance, and ml-infra are the responsible parties for different artifact classifications, including data_lineage_node, log_pattern_delta, and record_linkage_set. This ownership is not metadata for its own sake; it is the mechanism by which compliance obligations are distributed across organizational units. When an artifact such as PART-0001 (data_lineage_node, checksum c0ffee42, owner platform-team) references an attestation part (ATTE-0003), the owner field answers the question that auditors always ask: who is responsible for this evidence?

**t_equiv_intersect_artifact_with_part**

| id | equiv | has_part | checksum | owner |
| --- | --- | --- | --- | --- |
| PART-0001 | data_lineage_node | ATTE-0003 | c0ffee42 | platform-team |
| PART-0002 | log_pattern_delta | ATTE-0003 | 1a4b6c2d | platform-team |
| PART-0003 | record_linkage_set | ATTE-0003 | a3f9c21e | governance |
| PART-0004 | data_lineage_node | ATTE-0001 | c0ffee42 | ml-infra |
| PART-0005 | contract_alpha_v2 | ATTE-0001 | 1a4b6c2d | ml-infra |
| PART-0006 | entity_resolution_run | ATTE-0007 | 7b14de08 | analytics |
| PART-0007 | metric_namespace_prod | ATTE-0006 | c0ffee42 | ml-infra |

The SOC2 availability subclass demonstrates how domain-specific compliance frameworks are modeled within the same structural paradigm. Records such as AVAI-0001 through AVAI-0004 carry SOC report designations—SOC 3 Public Report, SOC 2 Privacy Assessment, SOC 2 Type I Assessment, SOC 1 Financial Audit—and link to attestation entities through the for_s_o_c2_domain foreign key, establishing that AVAI-0004 maps to ATTE-0004, AVAI-0001 to ATTE-0001, AVAI-0003 to ATTE-0007, and AVAI-0002 to ATTE-0005. The attribute definitions for this subclass—effective_date, enforcement, mandatory, priority—mirror the structure of the general attestation attributes but are scoped to the availability domain. The integer values 5 and 4 for the priority attribute, paired with boolean mandatory flags and date values spanning from 2023-09-25 to 2024-07-01, create a complete picture of availability compliance posture that can be queried, compared, and reported upon. The system's design ensures that every identifier, every attribute type, every checksum, and every owner assignment participates in a single coherent graph of compliance evidence.

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

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | ATTE-0004 |
| AVAI-0002 | SOC 2 Privacy Assessment | ATTE-0001 |
| AVAI-0003 | SOC 2 Type I Assessment | ATTE-0007 |
| AVAI-0004 | SOC 1 Financial Audit | ATTE-0005 |
| AVAI-0005 | SOC 2 Type I Assessment | ATTE-0003 |
| AVAI-0006 | SOC 1 Type I Report | ATTE-0005 |
| AVAI-0007 | SOC 2 Privacy Assessment | ATTE-0001 |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |