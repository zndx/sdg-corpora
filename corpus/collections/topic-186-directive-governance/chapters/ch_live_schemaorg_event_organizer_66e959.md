---
chapter_id: ch_live_schemaorg_event_organizer_66e959
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_event_organizer', 'column_renamed_from', 'policy_only_applies_to']
model: engine-refine
---

Within metadata governance frameworks, the identifier serves as the immutable anchor for every registered entity—whether an event organizer, a column rename record, or a policy applicability rule. Identifiers such as ORGA-0001, FROM-0001, and APPL-0001 provide stable, machine-readable keys that persist across schema migrations and policy revisions. These identifiers are not arbitrary; they follow a structured convention that encodes the entity class (organizer, rename-from, applies-to) and a sequential ordinal, enabling rapid lookup and referential integrity across the metadata catalog. An organizer like ORGA-0001, which represents the Edge Compute Fest hosted by MongoDB Events, remains addressable regardless of how its descriptive properties change over time.

**t_schemaorg_event_organizer**

| id | schemaorg | organizer |
| --- | --- | --- |
| ORGA-0001 | Edge Compute Fest | MongoDB Events |
| ORGA-0002 | Telemetry Conference | Linux Foundation |
| ORGA-0003 | Stream Processing Conclave | Open Source Alliance |
| ORGA-0004 | Governance Workshop | MongoDB Events |
| ORGA-0005 | Stream Processing Conclave | IEEE Computer Society |
| ORGA-0006 | Edge Compute Fest | IEEE Computer Society |
| ORGA-0007 | Cloud Observability Meetup | DataBricks Inc |

**t_schemaorg_event_organizer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0006 | 440 |
| ORGA-0002 | ORGA-0001 | ORGA-0008 | 7 |
| ORGA-0003 | ORGA-0002 | ORGA-0006 | 450 |
| ORGA-0004 | ORGA-0002 | ORGA-0008 | 6 |
| ORGA-0005 | ORGA-0003 | ORGA-0006 | 147 |
| ORGA-0006 | ORGA-0003 | ORGA-0008 | 6 |
| ORGA-0007 | ORGA-0004 | ORGA-0006 | 298 |
| ORGA-0008 | ORGA-0004 | ORGA-0008 | 7 |

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | recorded_at |
| FROM-0002 | measurement_timestamp | log_category |
| FROM-0003 | config_version | body_mass_index |
| FROM-0004 | batch_run_id | specimen_number |
| FROM-0005 | event_type | release_tag |
| FROM-0006 | patient_bmi | body_mass_index |

**t_policy_only_applies_to**

| id | policy | applies_to | effective_date | priority |
| --- | --- | --- | --- | --- |
| APPL-0001 | Privacy Shield Compliance | Public APIs | 2023-08-29 | 5 |
| APPL-0002 | Encryption Baseline | Production Clusters | 2023-11-05 | 5 |
| APPL-0003 | Data Classification Guideline | Third Party Vendors | 2023-08-21 | 3 |
| APPL-0004 | Data Classification Guideline | Third Party Vendors | 2023-12-18 | 3 |
| APPL-0005 | Data Retention Standard | Legacy Mainframe | 2024-11-09 | 4 |
| APPL-0006 | Data Classification Guideline | CI/CD Pipelines | 2023-01-13 | 2 |
| APPL-0007 | Vendor Risk Assessment | Financial Records | 2025-03-17 | 2 |
| APPL-0008 | Network Segmentation Rule | Legacy Mainframe | 2024-05-19 | 2 |

Attributes and their types form the extensible property layer that attaches domain-specific metadata to each entity. The attr_name column captures the semantic label of a property—checksum, created_date, license, confidence, or recorded_at—while attr_type declares its data semantics using a schema-aware vocabulary such as xsd:string, xsd:date, cco:DesignativeICE, xsd:decimal, or xsd:dateTime. This separation of name from type is deliberate: it allows the same attribute name to carry different type constraints in different entity contexts, and it enables type-safe validation without hardcoding property definitions into the entity schema. For instance, the checksum attribute on an organizer is typed as xsd:string, whereas the confidence attribute on a column rename record is typed as xsd:decimal, reflecting their distinct consumption patterns.

The entity relationship binds attribute values to their owning records through a foreign-key linkage that preserves the one-to-many cardinality between an entity and its properties. The entity_id column in the value tables points back to the parent record—ORGA-0001 owns multiple attribute values, FROM-0001 anchors its own set of decimals and strings, and APPL-0001 carries its policy applicability metadata. This design supports rich, multi-valued entities without denormalization: an organizer can carry a checksum, a created_date, an identifier, and a license, each stored in its own typed value table, while a column rename record carries a dimension_kind string, a recorded_at datetime, and a confidence decimal. The value tables themselves are partitioned by type—val_date, val_int, val_varchar, val_decimal, val_datetime—ensuring that type coercion never occurs at query time and that each value lands in the column whose schema matches its attr_type declaration.

**t_schemaorg_event_organizer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ORGA-0001 | checksum | xsd:string |
| ORGA-0002 | created_date | xsd:date |
| ORGA-0003 | identifier | cco:DesignativeICE |
| ORGA-0004 | license | xsd:string |
| ORGA-0005 | mime_type | xsd:string |
| ORGA-0006 | size_bytes | xsd:long |
| ORGA-0007 | uri | xsd:string |
| ORGA-0008 | version | xsd:integer |

**t_schemaorg_event_organizer_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0002 | 2024-07-16 |
| ORGA-0002 | ORGA-0002 | ORGA-0002 | 2023-04-02 |
| ORGA-0003 | ORGA-0003 | ORGA-0002 | 2023-04-02 |
| ORGA-0004 | ORGA-0004 | ORGA-0002 | 2023-04-08 |
| ORGA-0005 | ORGA-0005 | ORGA-0002 | 2023-03-07 |
| ORGA-0006 | ORGA-0006 | ORGA-0002 | 2023-12-15 |
| ORGA-0007 | ORGA-0007 | ORGA-0002 | 2023-05-20 |

**t_schemaorg_event_organizer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0001 | 7b14de08 |
| ORGA-0002 | ORGA-0001 | ORGA-0003 | gid://svc/77 |
| ORGA-0003 | ORGA-0001 | ORGA-0004 | CC-BY-4.0 |
| ORGA-0004 | ORGA-0001 | ORGA-0009 | ap-south-2 |
| ORGA-0005 | ORGA-0001 | ORGA-0005 | application/xml |
| ORGA-0006 | ORGA-0001 | ORGA-0010 | Name 06 |
| ORGA-0007 | ORGA-0001 | ORGA-0011 | platform-team |
| ORGA-0008 | ORGA-0001 | ORGA-0012 | Tags 08 |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

Effective dates and priorities govern the temporal and precedence dimensions of policy applicability rules. The effectivedate column records when a rule becomes operative—Privacy Shield Compliance took effect on 2023-08-29, Encryption Baseline on 2023-11-05, and the Data Classification Guideline has two distinct effective dates (2023-08-21 and 2023-12-18) reflecting its phased rollout to Third Party Vendors. The priority column assigns a numeric weight to each rule, with values such as 3 and 5 indicating relative precedence when multiple policies apply to the same target. A policy with priority 5, like Privacy Shield Compliance or Encryption Baseline, supersedes a priority-3 rule such as Data Classification Guideline in conflict resolution. This dual-axis model—temporal activation combined with numeric precedence—enables governance teams to manage overlapping obligations without manual reconciliation.

The misc column across the typed value tables holds the actual property payloads, each constrained by its table's type discipline. String-valued properties include license identifiers like CC-BY-4.0, geographic designators such as ap-south-2, and encoded resource URIs like gid://svc/77. Date values capture creation timestamps ranging from 2023-04-02 to 2024-07-16, while datetime values record precise moments like 2025-03-21T00:09:12 and 2023-10-22T03:45:48. Decimal values carry numeric metadata such as 0.429, 0.690, 695.20, and 442.17, and integer values store counts like 440, 450, 7, and 6. By segregating values into type-specific tables, the framework guarantees that a checksum hash (7b14de08) never collides with a confidence score (0.429) in the same storage layer, and that temporal queries on effectivedate or recorded_at operate on properly typed columns without runtime casting.