---
chapter_id: ch_live_ebpf_program_governed_by_directive_650427
topic_id: 23
family: 07_long_tail
cited_terms: ['ebpf_program_governed_by_directive', 'identifier_uniquely_identifies', 'column_pair_subject']
model: engine-refine
---

Attributes constitute the fundamental mechanism by which entities acquire descriptive properties, and their type discipline determines both the shape of stored values and the operations permissible upon them. Within the eBPF program governance layer, directives such as DIRE-0001 through DIRE-0004 govern concrete programs—tracepoint_sched, xdp_fwd, tc_egress—while the attribute schema itself declares properties like effective_date, enforcement, mandatory, and priority, each bound to an XML Schema type: xsd:date, xsd:string, xsd:boolean, xsd:integer. This type-level binding is not decorative; it enforces that the boolean attribute mandatory carries only true or false (as observed across entity DIRE-0001 through DIRE-0004), that effective_date resolves to ISO-formatted dates such as 2024-06-04 or 2025-03-23, and that priority accepts integer magnitudes ranging from 3 to 996. The separation of attribute definition from value storage—where boolean, date, integer, and varchar values each occupy their own typed value tables—ensures that type coercion never occurs implicitly and that schema evolution can proceed by adding new attribute definitions without restructuring existing value partitions.

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

Identifiers operate as the orthogonal axis of this architecture, providing stable, globally scoped references that bind abstract entities to concrete resources. The identifier registry records entries such as doi:10.1145/3641519, urn:isbn:9780131103627, and orcid:0000-0002-1825-0097, each accompanied by a format designation—JSON, E.164, CSV—and an issued_date anchoring the assignment to a point in time, as with 2024-09-07 or 2023-03-13. These identifiers do not merely label; they encode the namespace (doi, urn:isbn, orcid), the target resource (provenance node root, data pipeline stage 3, container image sha256), and the temporal provenance of the assignment. The format field further constrains interpretation, signaling that an identifier referencing data pipeline stage 3 may be serialized as JSON on one occasion (issued 2024-01-30) and as E.164 on another (issued 2023-03-13), reflecting the heterogeneity of downstream consumers.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

Column-pair subject relationships extend the attribute model into the domain of relational provenance, where pairs of columns are themselves treated as first-class entities with their own attribute-value structures. A column such as log_level may be paired with subject_column asset_tag, and this pairing—SUBJ-0001—acquires attributes like confidence (typed xsd:decimal, with observed values 0.167 and 0.312), dimension_kind (xsd:string, exemplified by "Dimension Kind 01"), method (xsd:string, "audit excerpt"), and recorded_at (xsd:dateTime, anchoring the observation to moments like 2023-03-08T01:00:53 or 2025-01-28T08:00:28). The same normalization pattern applies: attribute definitions declare names and types in one table, while typed value tables—datetime, decimal, varchar—store the actual observations, each row keyed by entity_id and attr_id. This design permits a single column pair to carry multiple attributes of different types without schema mutation, and it preserves the full provenance of each measurement through the recorded_at timestamp and the confidence score.

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

The practical consequence of this architecture is that governance, identification, and provenance are expressed through a uniform pattern: an entity is identified, its attributes are declared with types, and its values are stored in type-specific tables linked back to the entity and attribute definitions. Whether the entity is a directive governing an eBPF program, an identifier binding a DOI to a provenance node, or a column pair capturing the relationship between log_level and asset_tag, the same structural discipline applies. The issued_date on identifiers, the recorded_at on column-pair subjects, and the effective_date on directives all serve the same governance function—establishing temporal accountability for when a property was assigned, modified, or became operative. This uniformity enables cross-domain queries that reason about attributes regardless of whether they describe program enforcement policies, identifier formats, or measurement confidence scores, and it ensures that type safety is maintained at the storage layer rather than delegated to application logic.

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | asset_tag |
| SUBJ-0002 | batch_token | asset_tag |
| SUBJ-0003 | transaction_id | control_id |
| SUBJ-0004 | timestamp_utc | record_id |
| SUBJ-0005 | patient_id | dataset_uid |
| SUBJ-0006 | transaction_id | dataset_uid |
| SUBJ-0007 | batch_token | record_id |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |