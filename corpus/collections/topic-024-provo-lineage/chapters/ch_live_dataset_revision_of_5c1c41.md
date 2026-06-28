---
chapter_id: ch_live_dataset_revision_of_5c1c41
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_revision_of', 'syscall_at_security_tier', 'verification_basic']
model: engine-refine
---

Security tier classification anchors how operational telemetry is interpreted under governance policy: each tier receives a stable identifier—`TIER-0001` through `TIER-0004` in the reference corpus—and a human-readable label paired with a categorical grouping that situates the tier within the broader control framework. Labels such as *At Security Tier Label 03* and categories such as *At Security Tier Category 03* do not merely decorate records; they establish the vocabulary auditors, platform engineers, and data stewards share when deciding whether a workload may ingest, transform, or publish a given asset. The dimensional layer holds these definitions, while fact records attach measurable activity to them. A syscall fact keyed `TIER-0003` may reference `at_security_tier_key` `TIER-0001` and carry an `event_count` of 238, whereas another row records 382 events at `TIER-0004` and 52 at `TIER-0001`; the spread of counts—238, 52, 198, 382—signals uneven syscall density across tiers and furnishes the quantitative basis for thresholding, anomaly review, and capacity planning without collapsing distinct enforcement postures into a single undifferentiated stream.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

Identifier discipline runs through the entire model and is what makes cross-table reasoning possible. Revision records carry identifiers such as `REVI-0001` and `REVI-0004`; verification entities use `VERI-0001` through `VERI-0004`; tier and syscall facts reuse the `TIER-####` namespace. An identifier is not an display name: it is the join key that binds a compliance snapshot to its measured attributes, a dataset revision to its predecessor, and a syscall aggregate to the tier dimension that defines its sensitivity. When `fact_syscall` references `TIER-0005` while the dimension table materializes only `TIER-0001`–`TIER-0004`, practitioners confront a referential integrity question—whether the missing tier is latent, deprecated, or erroneously keyed—illustrating why identifier governance must precede analytic trust.

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

Dataset lineage and format metadata extend the same accountability logic into the asset layer. A revision identifier such as `REVI-0003` names `satellite-telemetry-v2` as the successor to `proteomics-mass-spec-v1`, while `REVI-0001` ties `sensor-fusion-calibration` to `grid-load-forecast-base`; the `was_revision_of` relationship encodes provenance so that downstream consumers know which baseline a published artifact supersedes. Mime type—recorded here as `application/xml`, `application/octet-stream`, or `application/parquet`—declares how bytes must be parsed, validated, and scanned, and therefore which technical controls apply before an object crosses a tier boundary. Owner (`ml-infra` for fusion calibration and genomics reads, `governance` for churn features) assigns custodial responsibility: the party accountable for retention, access reviews, and escalation when verification or syscall telemetry indicates drift from policy.

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | sensor-fusion-calibration | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | customer-churn-features | market-index-initial | application/octet-stream | governance |
| REVI-0003 | satellite-telemetry-v2 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | genomics-raw-reads-q3 | baseline-genomics-q2 | application/parquet | ml-infra |

Verification practice in this framework treats each check—*Compliance snapshot test*, *Calibration certificate review*, *Pipeline integrity check*, *Sensor drift assessment*—as an entity (`VERI-0001`, `VERI-0002`, and so on) whose evidentiary payload is decomposed into typed attributes rather than flattened into wide tables. Attribute name (`attr`) and attribute type (`attr_type`) form a contract: `duration_seconds` is `xsd:decimal`, `end_time` is `xsd:dateTime`, `exit_code` is `xsd:integer`, `host_name` is `xsd:string`. Values land in type-specific stores keyed by entity and attribute, so a decimal table may hold `500.97` and `4833.98` for `duration_seconds` on distinct entities, an integer table may record exit codes `182` and `828`, and a datetime table may timestamp events from `2023-02-01T08:41:13` through `2025-05-09T15:15:58`. The `misc` field, in turn, absorbs the heterogeneous residue of operational reality—tier labels, categorical tags, varchar outcomes such as `ingest-21` or `complete`, log levels, execution phases—without forcing premature normalization. This entity–attribute–value pattern preserves schema stability as new verification dimensions appear: practitioners register the attribute and its XSD type once, then populate values per entity, enabling compliance reporting to compare like types while still narrating each verification’s full context.

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

In operation, these elements interlock. Security tier and category classify where syscall volume (`event_count`) may accumulate without violating segregation expectations; identifier and owner ensure every revision (`REVI-0002` on `customer-churn-features`, mime `application/octet-stream`, owner `governance`) and every verification entity remains attributable; mimetype and lineage govern what transformations are permitted before data ascends to a higher tier. Attribute typing prevents silent coercion—treating `2023-06-08T16:52:03` as a number or `4488.38` as a string would corrupt audit trails—while entity-centric storage keeps each verification episode intact for retrospective review. Read collectively, the corpus demonstrates a governance architecture in which classification (tier, category), identity (identifier, entity), custody (owner), structure (attr, attr_type, mimetype), measurement (event_count), and residual context (misc) are separable concerns that only acquire compliance force when joined through disciplined keys and typed evidence.

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |