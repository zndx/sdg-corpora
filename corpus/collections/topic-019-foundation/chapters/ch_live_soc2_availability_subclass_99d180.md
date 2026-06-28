---
chapter_id: ch_live_soc2_availability_subclass_99d180
topic_id: 19
family: 07_long_tail
cited_terms: ['soc2_availability_subclass', 'subclass_to_descriptive_ice', 'log_within_span_context']
model: engine-refine
---

The attribute-value paradigm underpins the governance of SOC 2 availability subclassifications, where each attribute—such as `effective_date`, `enforcement`, `mandatory`, or `priority`—is formally declared with a precise type constraint drawn from the XML Schema definition space: `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively. This type discipline ensures that every value assigned to an attribute conforms to its declared schema, preventing type coercion errors at ingestion time. The attribute definitions themselves are catalogued in a dedicated registry, each entry carrying a stable identifier like `AVAI-0001` through `AVAI-0004`, which serves as the canonical reference point for all downstream value assignments and cross-table joins.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | Financial Controls |
| AVAI-0002 | SOC 2 Privacy Assessment | Financial Controls |
| AVAI-0003 | SOC 2 Type I Assessment | Availability Criteria |
| AVAI-0004 | SOC 1 Financial Audit | Network Infrastructure |
| AVAI-0005 | SOC 2 Type I Assessment | Security Criteria |
| AVAI-0006 | SOC 1 Type I Report | Confidentiality Criteria |
| AVAI-0007 | SOC 2 Privacy Assessment | Privacy Criteria |

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

Entities represent the concrete instances to which attributes are bound—here, the SOC 2 availability subclassifications such as "SOC 2 Privacy Assessment," "SOC 2 Type I Assessment," and "SOC 3 Public Report," each associated with a domain like "Financial Controls," "Availability Criteria," or "Network Infrastructure." The entity-attribute relationship is materialized through a family of typed value tables, partitioned by the attribute's data type. Boolean attributes resolve through a dedicated value store where entries like `AVAI-0001` link entity `AVAI-0001` to attribute `AVAI-0003` with the value `true`, while `AVAI-0003` maps the same attribute to `false`, capturing the binary enforcement posture across different subclassifications. Date attributes follow an analogous pattern, with effective dates such as `2024-07-01`, `2024-03-01`, `2023-09-25`, and `2024-01-04` anchoring each entity to its temporal validity window. Integer attributes store quantitative measures—values of `5` and `378` for one entity, `4` and `753` for another—while string attributes capture free-form descriptors like "Encoding 01," "Enforcement 02," and "nightly summary," alongside locale codes such as `fr`.

Descriptive metadata extends the entity model through a separate registry that pairs a descriptive identifier with human-readable label text and a language code. Entries such as `ICE-0001` through `ICE-0004` associate descriptive keys like `schema_version_patch`, `annotation_layer_b`, and `metadata_registry` with label texts including "intake form," "calibration record," and "audit excerpt," each annotated with a language tag—`en` or `de`—enabling multilingual presentation layers to resolve the appropriate label for a given locale. This separation of machine-readable identifiers from user-facing labels supports internationalization without requiring schema changes when new languages are introduced.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |

The relationship between operational logs and execution spans is governed by a tripartite join structure that distinguishes the subject of a relationship from its target, with the role attribute specifying the nature of the association. Log entries such as `cache-eviction.out`, `batch-scheduler.log`, and `disk-io.trace` serve as subjects, while span contexts like `user-session-4492`, `us-east-1-cluster`, `ml-inference-run`, and `warehouse-replication` function as targets. The junction table records each pairing with a role designation—`reviewer`, `observer`, or `contributor`—that semantically qualifies the log's relationship to the span. For instance, log `CONT-0004` appears in multiple span contexts with the role `contributor`, indicating that the `disk-io.trace` file participates actively in both `us-east-1-cluster` and `ml-inference-run` spans, while a separate log entry assumes the role of `reviewer` against a different span, reflecting a passive auditing posture. This subject-target-role triad provides a flexible, extensible mechanism for expressing heterogeneous relationships without hardcoding them into the schema.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |