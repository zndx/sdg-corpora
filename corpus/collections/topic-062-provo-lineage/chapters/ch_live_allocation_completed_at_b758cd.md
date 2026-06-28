---
chapter_id: ch_live_allocation_completed_at_b758cd
topic_id: 62
family: 05_provo_lineage
cited_terms: ['allocation_completed_at', 'policy_effective_period', 'column_version_subclass']
model: engine-refine
---

In governed data environments, stable identifiers constitute the first layer of traceability upon which allocation records, policy periods, and column-version lineages are reconciled across operational stores. An identifier such as COMP-0001 or PERI-0003 is not merely a surrogate key; it anchors cross-table joins, audit reconstruction, and downstream attestation so that a completion event recorded against COMP-0003 in one relation can be unambiguously correlated with the allocation whose subject reference is COMP-0002 and whose target reference is COMP-0005, even when those identifiers appear in physically distinct tables. The discipline of identifier assignment—prefix conventions, monotonic sequencing, immutability after issuance—therefore underwrites every subsequent claim about who held which role, which policy applied in which quarter, and which column version carried which semantic attribute.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | release_2023q4 |
| VERS-0002 | operator_code | canonical_v3 |
| VERS-0003 | timestamp_utc | staging_v0.9 |
| VERS-0004 | humidity_pct | canonical_v3 |
| VERS-0005 | sample_volume_ml | draft_03 |
| VERS-0006 | ph_level | staging_v0.9 |

Entities name the objects of description within the attribute-value substrate: a column-version subclass instance identified as VERS-0001, for example, becomes the entity to which multiple typed observations attach. Governance practice treats the entity as the durable referent while attributes name the facets under measurement or declaration. Where entity_id VERS-0001 carries attr_id VERS-0001 with misc value 0.648 in the decimal store and simultaneously carries attr_id VERS-0002 with misc value Dimension Kind 01 in the varchar store, the architecture enforces a separation between the thing described and the heterogeneous properties asserted about it, permitting validators to apply type-appropriate constraints without collapsing distinct semantic dimensions into a single wide row.

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

Attributes and attribute types jointly specify what may be said and how it must be interpreted. The attr dimension—confidence, dimension_kind, method, recorded_at—defines the predicate; the attr_type dimension—xsd:decimal, xsd:string, xsd:dateTime—binds each predicate to a machine-checkable datatype contract drawn from a controlled vocabulary. Operational consequence is immediate: confidence must not be persisted as free text when its attr_type is xsd:decimal, and recorded_at must route to datetime-valued misc tables rather than varchar partitions. When every entity referencing attr_id VERS-0004 stores ISO-8601 instants such as 2024-04-09T04:38:55, reviewers can treat recorded_at as a uniform temporal audit dimension across timestamp_utc, operator_code, and humidity_pct column versions without re-deriving type rules at query time.

The misc designation marks the payload layer—the literal value held under an entity–attribute binding—partitioned by storage subclass so that precision, collation, and indexing policies align with attr_type. Decimal misc entries (0.648, 428.43, 933.19) support quantitative controls; varchar misc entries (Encoding 02, intake form, de) carry categorical or lexical content; datetime misc entries normalize event ordering for lineage proofs. Partitioning misc by value class prevents implicit coercion errors that would otherwise corrupt compliance evidence, particularly where confidence scores inform risk thresholds or where recorded_at timestamps establish precedence among staging_v0.9 and canonical_v3 column releases.

Relational governance extends beyond entity–attribute tuples through subject, target, and role, which articulate directed associations among identified records. In allocation-completion linkage, an allocation_id designated as subject (COMP-0005, COMP-0006, COMP-0002, COMP-0001) relates to a completed_at_id designated as target (COMP-0003, COMP-0003, COMP-0005, COMP-0002), while role qualifies the nature of participation—observer, owner, contributor—so that the same temporal fact (2024-04-12T09:11:08Z attached to COMP-0003) can be referenced by multiple allocations without collapsing distinct accountability postures. Role therefore functions as a non-optional semantic modifier: an owner binding on COMP-0003 carries different remediation authority than an observer binding on the same target, even when identifiers overlap.

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | data-lake-partition |
| COMP-0002 | storage-tier-archival |
| COMP-0003 | data-lake-partition |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | telemetry-ingest-pipe |
| COMP-0006 | k8s-pod-quota |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

Scope and language complete the applicability envelope for normative artifacts and human-consumable policy surfaces. Scope—local, global, team—delimits where a rule such as HIPAA Privacy Rule or NIST SP 800-53 is authoritative relative to organizational boundaries, so that a global PCI DSS v4.0 declaration effective during Q1 2025 does not improperly subsume team-scoped controls unless explicitly cross-walked. Language—es, fr—governs the linguistic rendition under which policy text, operator-facing labels, and jurisdictional notices are published, ensuring that a Spanish-language effective_during record for GDPR Compliance in Q3 2023 and a French-language NIST publication do not conflate locale with legal territorial reach. Taken together, identifier, entity, attr, attr_type, misc, subject, target, role, scope, and language form an interlocking metadata grammar: identifiers stabilize reference; entities and attributes structure description; typed misc values materialize evidence; subject–target–role edges encode accountable relationships; and scope–language pairs bound how normative content is both enforced and communicated in practice.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |