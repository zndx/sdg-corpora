---
chapter_id: ch_live_transformation_ends_at_f24ea0
topic_id: 34
family: 05_provo_lineage
cited_terms: ['transformation_ends_at', 'schemaorg_event_location', 'syscall_at_security_tier']
model: engine-refine
---

Security tier classification anchors how monitored system activity is segmented for authorization review, incident triage, and control attestation. In syscall-oriented telemetry programs, each observed event is attributed to a tier whose label and category jointly express the sensitivity envelope and the governance bucket in which that activity must be interpreted. A tier keyed as TIER-0003, for example, carries the label “At Security Tier Label 03” and falls under “At Security Tier Category 03,” while companion fact records bind those tiers to quantitative workload: 238 events at TIER-0003, 52 at TIER-0001, 198 at TIER-0005, and 382 at TIER-0004. Event count is therefore not decorative metadata; it is the operational signal that tells compliance officers whether a tier’s observed volume is proportionate to its declared category, whether sampling thresholds should be tightened, and whether anomalous spikes warrant escalation against the tier’s control objectives.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

Identifier discipline is the spine that makes such segmentation auditable across otherwise heterogeneous pipelines. Stable, human- and machine-readable keys—ENDS-0001 through ENDS-0004 for transformation terminations, LOCA-0001 through LOCA-0004 for schema.org event locations, TIER-0001 through TIER-0004 for security tiers—permit correlation without collapsing distinct records into ambiguous aggregates. When a feature engineering routine terminates at 2024-05-17T07:30:00Z with log level critical and retry count 216, that identifier (ENDS-0002) can be joined to the provenance context of the ingestion job it affected; when an ETL pipeline run and a telemetry normalization pass both end at 2024-02-28T16:45:12Z, identical timestamps do not imply identical outcomes because their identifiers, log levels (info versus warning), and retry counts (210 versus 307) preserve separable audit trails. In governance practice, identifier integrity is treated as a first-class control: loss of referential uniqueness undermines tier rollups, attribute lineage, and downstream evidentiary admissibility.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | ETL pipeline run | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | Feature engineering routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | Telemetry normalization pass | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | Schema migration script | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Audit record sync | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Schema migration script | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | Data reconciliation workflow | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | ETL pipeline run | 2024-01-22T18:10:55Z | warning | 196 |

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | AWS us-east-1 |
| LOCA-0002 | data-lake-ingestion-job | Basement Server Room |
| LOCA-0003 | provenance-trace-record | Room 4B Server Hall |
| LOCA-0004 | provenance-trace-record | Network Zone Secure |
| LOCA-0005 | field-observation-dataset | Network Zone Secure |
| LOCA-0006 | governance-policy-update | Basement Server Room |
| LOCA-0007 | lab-sample-tracker | AWS us-east-1 |
| LOCA-0008 | field-observation-dataset | Facility 7 Calibration Lab |

Entity and attribute modeling extend identifier semantics into structured assertions about where events occur and what is known about them. An entity such as LOCA-0001 denotes a concrete event-location record—here, an audit-log-archive situated in AWS us-east-1—while attr names (checksum, created_date, identifier, license) declare which facets of that entity are material to policy enforcement. Attribute type governs validation and interchange: checksum and license values are constrained as xsd:string, created_date as xsd:date, and identifier as cco:DesignativeICE, signaling that naming conventions for ICE designators apply rather than free-text string semantics alone. Typed value stores then materialize those assertions without polluting the entity’s core record: created_date misc values of 2024-05-14, 2024-02-21, 2023-06-13, and 2023-08-21 attach to attr_id LOCA-0002 across entities LOCA-0001–LOCA-0004; integer misc values (400, 6, 223, 6) and varchar misc values (c0ffee42, ref-8842, Apache-2.0, ap-south-2) bind to distinct attribute keys on the same or related entities. Category, in parallel, classifies tiers; misc, in parallel, holds the heterogeneous payload that tier labels and attribute values require—two “misc” channels serving different layers of the same compliance graph.

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |

Log level and retry count operationalize the resilience and severity posture of transformation workloads that produce and refresh this metadata. Log level records whether a terminating process exited under routine observability (info), elevated concern (warning), or conditions that may invalidate dependent attestations (critical); a critical termination on a feature engineering routine is qualitatively different from a warning on a schema migration script even when both complete with non-zero retry counts. Retry count quantifies automated recovery behavior: values of 210, 216, 307, and 446 across ENDS-0001–ENDS-0004 indicate sustained re-execution rather than single-pass success, which compliance reviewers interpret against defined ceilings, backoff policies, and data-integrity checks. In mature programs, high retry counts paired with warning or critical log levels trigger mandatory review of downstream tier assignments and event-count aggregates, on the grounds that unstable transformations may have partially written attribute values or misc fields that no longer match the entity’s authoritative state.

Taken together, at security tier, category, event count, entity, attr, attr type, identifier, log level, misc, and retry count form a closed evidentiary loop for security operations and assurance reporting. Tier and category define the control frame; event count measures activity within that frame; entity and attr structures localize assertions to physical or logical venues—from Basement Server Room to Network Zone Secure—while attr type and misc ensure those assertions remain machine-validated and licensable (Apache-2.0) or traceable (ref-8842, c0ffee42). Identifiers stitch transformation outcomes to location metadata and tier facts; log level and retry count attest whether the pipelines that maintain those linkages ran within acceptable operational bounds. Auditors who can traverse this loop without schema narration—by following keys, typed values, and quantitative rollups—can substantiate not only what was observed at each security tier, but how the organization knew it, where it was recorded, and whether the mechanisms that produced that knowledge themselves complied with the program’s reliability and severity thresholds.

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |