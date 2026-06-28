---
chapter_id: ch_live_dataset_at_version_6c7458
topic_id: 191
family: 07_long_tail
cited_terms: ['dataset_at_version', 'qualification_process', 'attestation_min_one_signer']
model: engine-refine
---

The governance of data provenance and access control rests upon a layered attestation model in which each attestation record carries a typed attribute schema and a set of heterogeneous value bindings. An attestation such as Chain of Custody Review or Security Baseline Validation is identified by a unique identifier—SIGN-0001, SIGN-0002, and so forth—and its attribute definitions are catalogued separately, each attribute declared with a name and a type drawn from the XSD vocabulary: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. The actual values for these attributes are stored in type-specific tables, each keyed by an entity reference that points back to the attestation record and an attribute reference that resolves to the schema definition. A single attestation may thus accumulate a decimal value of 1355.00 for duration_seconds, an integer value of 392 for exit_code, a string value of node-b14 for host_name, and a timestamp of 2023-01-30T09:27:18 for end_time, all bound through the same entity identifier. This separation of schema from value enables type-safe validation while preserving the flexibility to attach an arbitrary number of typed attributes to any attestation without altering the core table structure.

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

**t_attestation_min_one_signer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

The qualification process table formalizes the pathway through which participants earn championship entry, linking each process to a mandatory membership registration and a resulting championship entry. The Regional Wildcard Series requires a USATF Athletic License and yields a Playoff Wildcard Spot; the Continental Draft Combine demands a FIFA Member Federation credential and produces a Final Four Invitation; the North American Open Bracket similarly requires a USATF Athletic License and confers a Playoff Wildcard Spot. These mappings are not merely descriptive—they encode the eligibility logic that governs who may advance, what credential must be held, and what prize or position is awarded upon completion. The identifier PROC-0001 through PROC-0004 anchors each process definition, while the membership registration and championship entry fields serve as the foreign keys that connect this table to the broader credentialing and awards infrastructure.

**t_qualification_process**

| id | qualification_process | requires_membership | yields_championship_entry |
| --- | --- | --- | --- |
| PROC-0001 | Regional Wildcard Series | FIDE Master Rating | Finals Roster Position |
| PROC-0002 | Continental Draft Combine | FIFA Member Federation | Final Four Invitation |
| PROC-0003 | Regional Wildcard Series | USATF Athletic License | Playoff Wildcard Spot |
| PROC-0004 | North American Open Bracket | USATF Athletic License | Playoff Wildcard Spot |

Dataset versioning is managed through a tripartite structure that separates the dataset identity from its version label and from the relationship between them. The t_dataset_at_version table records each versioned dataset by identifier—VERS-0001 through VERS-0004—and associates it with a dataset name such as Landsat-8-OLI, UrbanAirQuality, or ATLAS-ICU-Cohort. The t_dataset_at_version_at_dataset_version table provides the human-readable version string, including values like v3.0.0-stable, release-2023-Q4, build-4491, and v2.1.0. The junction table t_dataset_at_version__at_dataset_version then binds a subject dataset version to a target at_dataset_version through a role, which may be contributor, owner, or reviewer. This three-table arrangement allows a single dataset version to participate in multiple relationships with different roles, supporting complex provenance chains where VERS-0004 acts as a contributor to VERS-0002, VERS-0002 as an owner of VERS-0001, and VERS-0001 as a reviewer of VERS-0004.

**t_dataset_at_version**

| id | dataset |
| --- | --- |
| VERS-0001 | Landsat-8-OLI |
| VERS-0002 | UrbanAirQuality |
| VERS-0003 | Landsat-8-OLI |
| VERS-0004 | ATLAS-ICU-Cohort |
| VERS-0005 | SatelliteTelemetryRaw |
| VERS-0006 | GeospatialRoadNetwork |

**t_dataset_at_version_at_dataset_version**

| id | at_dataset_version |
| --- | --- |
| VERS-0001 | v3.0.0-stable |
| VERS-0002 | release-2023-Q4 |
| VERS-0003 | build-4491 |
| VERS-0004 | v2.1.0 |
| VERS-0005 | build-4491 |
| VERS-0006 | release-2023-Q4 |
| VERS-0007 | v2.1.0 |
| VERS-0008 | v2.1.0 |

**t_dataset_at_version__at_dataset_version**

| id | dataset_id | at_dataset_version_id | role |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0004 | VERS-0002 | contributor |
| VERS-0002 | VERS-0002 | VERS-0001 | owner |
| VERS-0003 | VERS-0005 | VERS-0001 | reviewer |
| VERS-0004 | VERS-0001 | VERS-0004 | contributor |
| VERS-0005 | VERS-0005 | VERS-0007 | owner |
| VERS-0006 | VERS-0002 | VERS-0007 | reviewer |
| VERS-0007 | VERS-0003 | VERS-0003 | reviewer |
| VERS-0008 | VERS-0003 | VERS-0002 | owner |

The entity column in the attestation value tables serves as the foreign key that ties typed attribute values back to their parent attestation record, while the attr column resolves to the attribute definition in the schema table. The misc column holds the actual value, whose type is determined by the table in which it appears—decimal, datetime, integer, or varchar—ensuring that the value is stored in the appropriate format without requiring type coercion at query time. This design mirrors the discipline of a formal contract where each clause is precisely typed and each binding is explicitly referenced: just as a solicitation document specifies the contract number, solicitation number, and issuing agency with unambiguous identifiers, the attestation model specifies the entity, the attribute, and the value with the same level of structural rigor, enabling auditable reconstruction of every attestation's complete state from its constituent parts.

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |