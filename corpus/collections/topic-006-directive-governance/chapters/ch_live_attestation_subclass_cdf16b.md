---
chapter_id: ch_live_attestation_subclass_cdf16b
topic_id: 6
family: 03_directive_governance
cited_terms: ['attestation_subclass', 'attestation_with_supporting_evidence', 'attribute_set_basic']
model: engine-refine
---

Attestation governance rests on a small set of compositional primitives that separate what is being asserted from how it is typed, keyed, and bound to operational context. An identifier supplies the durable handle by which every record participates in audit trails, cross-references, and downstream reconciliation: attestations such as VulnerabilityScan-Q3 and Supply Chain Certification carry stable keys in the ATTE-0001 through ATTE-0004 range, while evidence linkages and attribute-set definitions resolve through parallel namespaces (EVID-0001–EVID-0004 for attestations paired with supporting artifacts, SET-0001–SET-0004 for reusable attribute templates). Because identifiers are assigned once and referenced everywhere, they allow heterogeneous value stores—decimal durations, integer exit codes, timestamped end points, and textual host labels—to remain logically attached to the same governed object even when physical storage is partitioned by datatype.

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

**t_attribute_set_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SET-0001 | confidence | xsd:decimal |
| SET-0002 | dimension_kind | xsd:string |
| SET-0003 | method | xsd:string |
| SET-0004 | recorded_at | xsd:dateTime |
| SET-0005 | uncertainty | xsd:decimal |
| SET-0006 | unit | xsd:string |
| SET-0007 | value | xsd:decimal |
| SET-0008 | encoding | xsd:string |

The entity primitive names the subject of assertion: not the row that holds a value, but the attestation or attribute-set instance to which that value belongs. Multiple observations may therefore converge on a single entity without collapsing their meaning. A VulnerabilityScan-Q3 run (entity ATTE-0001) simultaneously records an end_time of 2025-01-08T20:38:13, a duration_seconds of 1293.13, an exit_code of 806, and a host_name of gw-12; an EncryptionKeyRotation attestation (entity ATTE-0002) carries its own end_time and exit_code while reusing attribute definitions declared at the subclass level. In attribute-set governance, entity SET-0001 accumulates confidence scores, dimensional metadata, method descriptors, and a recorded_at timestamp drawn from distinct attribute slots, demonstrating that entity is the semantic anchor while individual value rows remain narrowly scoped observations.

Attr and attr_type jointly define the contract under which misc—the concrete stored datum—may be admitted into evidence. Attr names the semantic field (duration_seconds, end_time, exit_code, host_name; or, in basic attribute sets, confidence, dimension_kind, method, recorded_at), while attr_type binds each name to an XSD datatype that governs parsing, comparison, and retention policy. Declaring duration_seconds as xsd:decimal and exit_code as xsd:integer prevents category errors at ingestion: a firmware integrity workflow cannot silently persist a textual label where an integer completion code is required, and a SOC2 review cannot treat a timestamp as an unqualified string. The misc values themselves—1293.13 and 215.34 beside 4975.39 and 778.44 for duration_seconds across four attestations, or 0.501 versus 0.946 for confidence on sensor-oriented sets—are evidence only insofar as they satisfy the attr_type declared for their attr; misc is therefore not miscellaneous in the colloquial sense but the typed payload whose admissibility is predetermined by the attribute declaration.

Lifecycle governance introduces phase and triggeredby as orthogonal controls on when and why an attestation-with-evidence record enters the corpus. Phase situates work along a controlled progression—initiation, execution, review, closeout—so that reviewers can distinguish preparatory artifacts from those that close a control period. A GitOps-Deployment attestation paired with an Encryption Key Manifest is recorded at initiation and triggered_by event, signaling that an operational signal—not a scheduled batch—opened the evidentiary chain; by contrast, SOC2-TypeII and SOC2 Compliance Review entries at execution and review phases, with TLS Certificate Bundle and Digital Signature Block attachments, show how the same compliance family advances through substantiation rather than terminating at first capture. Closeout-phase SOC2-TypeII supported by a SHA256 Checksum Hash illustrates terminal integrity verification before archival.

Triggeredby complements phase by documenting provenance of initiation: event-driven attestations (GitOps-Deployment, SOC2-TypeII at initiation) reflect reactive control activation—deployments, alerts, or policy breaches—whereas api-triggered records (SOC2 Compliance Review, closeout SOC2-TypeII) denote programmatic invocation, suitable for connector-driven audits and automated hash verification. Together, phase and triggeredby allow investigators to answer not only what was attested and with which supporting evidence, but whether the record arose from human-timed review, machine-timed execution, or an externally originated signal. That distinction matters for control design: event triggers demand sub-minute capture latency and immutable ordering, while api triggers assume authenticated callers and schema-valid payloads.

**t_attestation_with_supporting_evidence**

| id | attestation | with_supporting_evidence | phase | triggered_by |
| --- | --- | --- | --- | --- |
| EVID-0001 | GitOps-Deployment | Encryption Key Manifest | initiation | event |
| EVID-0002 | SOC2-TypeII | TLS Certificate Bundle | execution | event |
| EVID-0003 | SOC2 Compliance Review | Digital Signature Block | review | api |
| EVID-0004 | SOC2-TypeII | SHA256 Checksum Hash | closeout | api |

In practice, these primitives interlock across attestation subclasses and reusable attribute sets without duplicating semantics. Subclass-level declarations bind attr to attr_type once; entity-scoped value partitions then store misc under type-safe tables so that a Supply Chain Certification may reuse end_time and duration_seconds definitions established for EncryptionKeyRotation while attribute sets such as Sensor ID and Data Source publish parallel attr contracts for confidence and recorded_at. Identifiers thread through every layer so that a single ATTE-0001 entity can be correlated with EVID-0001 evidence, SET-0001 measurement templates, and heterogeneous misc—decimal, integer, datetime, varchar—without losing referential discipline. Organizations that treat attr and attr_type as normative schema, entity as the unit of accountability, identifier as the audit spine, misc as typed fact, and phase with triggeredby as temporal and causal metadata obtain a governance model that scales from vulnerability scanning and firmware checks to SOC2 closeout and sensor telemetry under one evidence architecture.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | VulnerabilityScan-Q3 |
| ATTE-0002 | EncryptionKeyRotation |
| ATTE-0003 | Firmware Integrity Check |
| ATTE-0004 | Supply Chain Certification |
| ATTE-0005 | Network Penetration Test |
| ATTE-0006 | DataLineage-Verified |
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

**t_attribute_set_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0004 | 2025-04-11T14:14:38 |
| SET-0002 | SET-0002 | SET-0004 | 2024-10-27T12:43:31 |
| SET-0003 | SET-0003 | SET-0004 | 2023-07-18T04:02:37 |
| SET-0004 | SET-0004 | SET-0004 | 2025-04-28T09:26:57 |
| SET-0005 | SET-0005 | SET-0004 | 2023-08-28T23:05:03 |
| SET-0006 | SET-0006 | SET-0004 | 2024-02-14T11:29:41 |

**t_attribute_set_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0001 | 0.501 |
| SET-0002 | SET-0001 | SET-0005 | 613.30 |
| SET-0003 | SET-0001 | SET-0007 | 863.60 |
| SET-0004 | SET-0002 | SET-0001 | 0.946 |
| SET-0005 | SET-0002 | SET-0005 | 609.02 |
| SET-0006 | SET-0002 | SET-0007 | 173.62 |
| SET-0007 | SET-0003 | SET-0001 | 0.926 |
| SET-0008 | SET-0003 | SET-0005 | 843.81 |

**t_attribute_set_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0002 | Dimension Kind 01 |
| SET-0002 | SET-0001 | SET-0008 | Encoding 02 |
| SET-0003 | SET-0001 | SET-0009 | audit excerpt |
| SET-0004 | SET-0001 | SET-0010 | fr |
| SET-0005 | SET-0001 | SET-0003 | hybrid |
| SET-0006 | SET-0001 | SET-0006 | ratio |
| SET-0007 | SET-0002 | SET-0002 | Dimension Kind 07 |
| SET-0008 | SET-0002 | SET-0008 | Encoding 08 |