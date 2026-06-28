---
chapter_id: ch_live_labrun_uses_instrument_3c0a96
topic_id: 47
family: 02_observation_measurement
cited_terms: ['labrun_uses_instrument', 'directive_only_governs', 'existential_two_clauses']
model: engine-refine
---

The `identifier` functions as the immutable anchor across the relational topology, uniquely resolving instances such as `INST-0001` or `GOVE-0001` to their respective operational or governance contexts. Within this framework, the `entity` designation serves as the foreign key that binds heterogeneous attribute values to specific instrument instances, ensuring that telemetry and metadata remain strictly scoped to the originating hardware, whether it be a `ThermoFisher Q-Exactive` or a `Hitachi S-4800`. The `attr` column delineates the semantic property under observation—ranging from `duration_seconds` and `end_time` to `exit_code` and `host_name`—while the `attr type` column enforces strict data typing via XML Schema definitions, explicitly categorizing values as `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, or `xsd:string`. This typed attribute architecture permits the normalized storage of complex operational states without violating first normal form, thereby preserving data integrity across distributed laboratory environments.

**t_labrun_uses_instrument_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INST-0001 | duration_seconds | xsd:decimal |
| INST-0002 | end_time | xsd:dateTime |
| INST-0003 | exit_code | xsd:integer |
| INST-0004 | host_name | xsd:string |
| INST-0005 | log_level | xsd:string |
| INST-0006 | phase | xsd:string |
| INST-0007 | retry_count | xsd:integer |
| INST-0008 | scheduled_at | xsd:dateTime |

The actual instantiation of these attributes is managed through specialized value tables categorized under `misc` data, where the physical representation of the data aligns precisely with the declared `attr type`. Temporal precision is maintained in the datetime repository, recording execution milestones such as `2023-07-28T22:24:46` and `2024-09-04T14:41:30` against their corresponding entity and attribute identifiers. Numerical telemetry, including decimal measurements like `397.40` and `2693.73`, as well as integer counters such as `889` and `321`, are segregated into their respective typed stores to optimize query performance and enforce type safety. String-based metadata, encompassing host identifiers like `ingest-21` and status descriptors such as `Log Level 02`, are similarly isolated, ensuring that the underlying schema remains rigorously normalized while accommodating the full spectrum of laboratory instrumentation data.

**t_labrun_uses_instrument_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0002 | 2023-07-28T22:24:46 |
| INST-0002 | INST-0001 | INST-0008 | 2024-09-04T14:41:30 |
| INST-0003 | INST-0001 | INST-0009 | 2025-06-09T20:56:36 |
| INST-0004 | INST-0002 | INST-0002 | 2024-06-06T14:47:39 |
| INST-0005 | INST-0002 | INST-0008 | 2025-04-06T19:57:44 |
| INST-0006 | INST-0002 | INST-0009 | 2023-06-18T12:50:38 |
| INST-0007 | INST-0003 | INST-0002 | 2023-05-25T22:41:33 |
| INST-0008 | INST-0003 | INST-0008 | 2023-09-07T05:37:31 |

**t_labrun_uses_instrument_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0001 | 397.40 |
| INST-0002 | INST-0002 | INST-0001 | 2693.73 |
| INST-0003 | INST-0003 | INST-0001 | 4636.55 |
| INST-0004 | INST-0004 | INST-0001 | 1173.52 |
| INST-0005 | INST-0005 | INST-0001 | 1814.21 |
| INST-0006 | INST-0006 | INST-0001 | 5265.62 |

**t_labrun_uses_instrument_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0003 | 889 |
| INST-0002 | INST-0001 | INST-0007 | 321 |
| INST-0003 | INST-0002 | INST-0003 | 608 |
| INST-0004 | INST-0002 | INST-0007 | 248 |
| INST-0005 | INST-0003 | INST-0003 | 589 |
| INST-0006 | INST-0003 | INST-0007 | 121 |
| INST-0007 | INST-0004 | INST-0003 | 16 |
| INST-0008 | INST-0004 | INST-0007 | 442 |

**t_labrun_uses_instrument_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0004 | ingest-21 |
| INST-0002 | INST-0001 | INST-0005 | Log Level 02 |
| INST-0003 | INST-0001 | INST-0006 | execution |
| INST-0004 | INST-0001 | INST-0010 | superseded |
| INST-0005 | INST-0001 | INST-0011 | Triggered By 05 |
| INST-0006 | INST-0002 | INST-0004 | worker-07 |
| INST-0007 | INST-0002 | INST-0005 | Log Level 07 |
| INST-0008 | INST-0002 | INST-0006 | review |

Governance and regulatory compliance are codified through a parallel structure that binds specific directives to operational assets via the `effectivedate` and `enforcement` mechanisms. Each regulatory mandate, whether it be `CCPA Section 1798.100`, `ICH Q10`, or `FDA 21 CFR Part 11`, is assigned a unique `identifier` and linked to the relevant system component, such as a `laboratory reagent inventory` or `telemetry log streams`. The `effectivedate` column establishes the temporal boundary of regulatory applicability, anchoring directives to precise calendar dates such as `2023-05-14` or `2024-03-28`, thereby allowing auditors to reconstruct the exact compliance posture of an asset at any point in time. Concurrently, the `enforcement` column dictates the operational weight of the directive, uniformly classifying these mandates as `mandatory` to eliminate ambiguity in policy execution across the infrastructure.

**t_directive_only_governs**

| id | directive | related | effective_date | enforcement |
| --- | --- | --- | --- | --- |
| GOVE-0001 | CCPA Section 1798.100 | laboratory reagent inventory | 2023-05-14 | mandatory |
| GOVE-0002 | ICH Q10 | industrial control systems | 2023-04-09 | mandatory |
| GOVE-0003 | FDA 21 CFR Part 11 | telemetry log streams | 2024-03-28 | mandatory |
| GOVE-0004 | PCI DSS v4.0 | financial transaction logs | 2023-10-25 | mandatory |
| GOVE-0005 | HIPAA Privacy Rule | financial transaction logs | 2023-11-19 | advisory |
| GOVE-0006 | PCI DSS v4.0 | access credential vaults | 2023-08-29 | advisory |
| GOVE-0007 | HIPAA Privacy Rule | biometric authentication data | 2025-01-19 | advisory |
| GOVE-0008 | HIPAA Privacy Rule | research cohort datasets | 2024-12-25 | advisory |

The broader system topology is further articulated through existential clauses that define the interdependencies between core services and their supporting infrastructure. An existential clause maps a primary service, such as `TelemetryHub` or `DataLake`, to its requisite dependencies, including `BackupVault`, `IndexServer`, and `CacheLayer`, while simultaneously tracking secondary relationships like `VersionTag` or `ValidationSet`. This relational mapping ensures that the provenance of a laboratory run—identified by codes such as `RUN-2024-A7` or `PROT-XRAY-03`—can be fully traced through the instrument it utilizes, the attributes it generates, and the existential dependencies that sustain its underlying data pipeline. By maintaining this granular linkage between identifiers, attributes, and governance directives, the framework provides a comprehensive, auditable record of both the technical execution and the regulatory adherence of every operational event.

**t_labrun_uses_instrument**

| id | labrun | uses |
| --- | --- | --- |
| INST-0001 | RUN-2024-A7 | ThermoFisher Q-Exactive |
| INST-0002 | PROT-XRAY-03 | Hitachi S-4800 |
| INST-0003 | CYTO-20241022 | Bruker Avance III |
| INST-0004 | GENOME-READ-04 | Olympus BX63 |
| INST-0005 | FIELD-MAP-09 | Shimadzu GCMS-TQ8050 |
| INST-0006 | ASSAY-Q3-24 | Waters Xevo TQ-S |

**t_existential_two_clauses**

| id | existential | related | related_2 |
| --- | --- | --- | --- |
| CLAU-0001 | TelemetryHub | BackupVault | VersionTag |
| CLAU-0002 | DataLake | IndexServer | AuditTrail |
| CLAU-0003 | AuditLog | IndexServer | QualityFlag |
| CLAU-0004 | TelemetryHub | CacheLayer | ValidationSet |
| CLAU-0005 | DataLake | SourceCluster | RetentionRule |
| CLAU-0006 | DataPipeline | CacheLayer | AuditTrail |
| CLAU-0007 | StreamProcessor | GatewayRouter | AuditTrail |
| CLAU-0008 | TelemetryHub | GatewayRouter | QualityFlag |