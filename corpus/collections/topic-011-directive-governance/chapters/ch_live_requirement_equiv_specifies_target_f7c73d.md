---
chapter_id: ch_live_requirement_equiv_specifies_target_f7c73d
topic_id: 11
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'requirement_has_priority', 'requirement_min_one_verification']
model: engine-refine
---

Requirement governance in distributed compliance architectures rests on a small set of relational primitives that separate what is being asserted from how it is typed, who bears responsibility, and how instances are unambiguously referenced across audits. An identifier supplies that last function: a durable, surrogate key—such as TARG-0002 for a lineage-tracing obligation or PRIO-0003 for a throughput minimum classified Critical—that remains stable even when natural-language labels drift. Identifiers propagate through join tables and value stores so that a single requirement can participate in multiple semantic relations without conflating records; the Architecture Review Board’s verification of a 50 ms latency threshold and an Internal Audit Team’s review of backup frequency both resolve through distinct VERI-* keys while still anchoring to the same underlying compliance object. In operational practice, identifiers are the currency of traceability: they appear in change tickets, evidence bundles, and crosswalks between policy corpora, and they must never be recycled when a requirement is superseded.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | Trivial |
| PRIO-0002 | Backup interval | Medium |
| PRIO-0003 | Throughput minimum | Critical |
| PRIO-0004 | Audit log frequency | Critical |
| PRIO-0005 | Throughput minimum | Minor |
| PRIO-0006 | Encryption standard | Trivial |
| PRIO-0007 | Throughput minimum | Major |
| PRIO-0008 | Fault tolerance level | Essential |

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | Architecture Review Board |
| VERI-0002 | Audit log completeness | Architecture Review Board |
| VERI-0003 | Backup frequency daily | Internal Audit Team |
| VERI-0004 | Backup frequency daily | Certification Authority |
| VERI-0005 | Schema validation strict | NIST 800-53 |
| VERI-0006 | PII masking rule | Architecture Review Board |

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

The entity marks the unit of description to which attributes attach—the priority assignment, the verification record, the scoped applicability row—not merely the business noun printed on a control card. When effective_date is recorded as 2024-08-03 for one entity and 2023-04-21 for another, the distinction is carried by entity_id binding each dated fact to its owning instance rather than by duplicating attribute definitions. This pattern matters because compliance metadata is rarely flat: the same attribute name can mean different things in different contexts, and typed value tables exist precisely so that enforcement strings, mandatory flags, and integer priority ranks do not share a single undifferentiated column. Entities therefore function as the compositional center of the model; relationships fan out from them, and attribute values accrete around them as auditable property sets.

Attributes and attribute types form the schema layer that governs those property sets before any concrete value is admitted. An attr such as mandatory or enforcement names the semantic slot; attr_type—xsd:boolean, xsd:date, xsd:string, xsd:integer—declares the interpretive contract under which values will be validated, serialized, and compared. The separation is not cosmetic: storing false four times for mandatory across PRIO and VERI records only makes sense when each false is typed as boolean and tied to the correct attr_id, while priority ranks of 3 and 806 remain integers distinct from locale codes like ja or fr held as strings. Governance frameworks depend on this typing to enforce consistency at ingestion—dates must parse as calendar instants, enforcement labels must not silently coerce into numbers—and to support automated reasoning over obligations whose machine-readable surface must align with regulatory text.

Values land in the misc role as the instantiated content once entity, attr, and attr_type have fixed the slot. Misc is deliberately generic in name because the physical representation is delegated to type-specialized stores: booleans in one relation, dates in another, integers and varchar payloads elsewhere. A verification record may therefore carry mandatory=false alongside change rationale as a varchar annotation and priority=542 as an integer weight, each misc value meaningful only in the triple (entity, attr, type) that produced it. For reviewers, misc is where policy meets evidence: Encoding 01 and Enforcement 02 are not decorative strings but operational encodings of how a control is expressed and applied; effective_date boundaries determine whether an assertion was in force when an incident occurred. Dense registries treat misc as immutable fact rows versioned by identifier, not as free text appended to a spreadsheet cell.

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |

Relational assertions beyond scalar properties are expressed through subject and target, which orient directed edges between governed objects. A requirement that specifies KafkaProtocol or GDPRArticle positions the requirement as subject and the protocol or legal article as target; conversely, when AuditLogFormat specifies JSONSchema, the direction of the edge encodes which artifact constrains which. The same subject–target grammar extends to applicability: a latency threshold applies_to CloudStorage while backup and audit obligations reach DataLake deployments, with requirement_id and applies_to_id pairs materializing scope. Without explicit subject and target roles, scope creep and ambiguous inheritance are inevitable—an EU data-center control might be read as applying to all storage classes unless the graph states otherwise. Subject–target pairs are thus the structural vocabulary for impact analysis: change a target specification and every inbound subject edge signals downstream reassessment.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |

Role and cardinality_note annotate those edges with governance semantics and quantitative intent. Role answers who participates in the relationship—owner for a JSONSchema binding, contributor for a CloudStorage applicability, reviewer for a DataLake observer assignment, reviewer again on a specifies link—so accountability is carried on the association itself rather than inferred from org charts. Cardinality notes (Cardinality Note 01 through Cardinality Note 04 in the applicability fabric) document whether a link is mandatory, singular, or permissibly repeated, preventing silent many-to-many sprawl when auditors expect at least one verifier or exactly one owning party. Together, role and cardinality_note convert a bare graph into an enforceable operating model: they tell implementers which relationships must exist before a requirement counts as satisfied, and they tell assessors which human or automated actor must attest each edge. In mature compliance handbooks, these annotations are first-class data, not marginal comments, because they determine whether a Critical priority on audit log frequency, verified by a Certification Authority, actually binds to the intended deployment surface or merely sits inert in a catalog row.