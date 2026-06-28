---
chapter_id: ch_live_schemaorg_person_birthplace_62e7de
topic_id: 107
family: 07_long_tail
cited_terms: ['schemaorg_person_birthplace', 'directive_not_obsolete', 'lineage_edge_via_transformation']
model: engine-refine
---

In governance and compliance information systems, stable identifiers anchor every auditable assertion: a directive such as CIS Critical Security Controls carries OBSO-0001, while a birthplace dimension resolves through BIRT-0001, and a lineage edge through TRAN-0001. These keys are not display labels; they are durable handles that let heterogeneous records—facts, dimensions, typed attribute definitions, and per-entity values—reference one another without ambiguity across ingestion, reconciliation, and downstream reporting. When Inventory Reconciliation is asserted twice as a lineage operation (TRAN-0001 and TRAN-0004), the repeated semantic label does not collapse distinct provenance events; the identifier preserves separable audit trails even where human-readable names converge.

**t_directive_not_obsolete**

| id | directive | directive_2 |
| --- | --- | --- |
| OBSO-0001 | CIS Critical Security Controls | IHE Patient Identity Cross |
| OBSO-0002 | OGC API Features Standard | HL7 FHIR Implementation Guide |
| OBSO-0003 | IEEE 802.11ax Standard | HIPAA Security Rule |
| OBSO-0004 | CIS Benchmark Distribution 8 | OWASP Testing Guide v4 |
| OBSO-0005 | OWASP Application Security Guide | NIST CSF v2 Profile |
| OBSO-0006 | OWASP Application Security Guide | CIS Critical Security Controls |
| OBSO-0007 | MITRE ATT&CK Framework | OWASP Testing Guide v4 |

**t_directive_not_obsolete_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSO-0001 | effective_date | xsd:date |
| OBSO-0002 | enforcement | xsd:string |
| OBSO-0003 | mandatory | xsd:boolean |
| OBSO-0004 | priority | xsd:integer |
| OBSO-0005 | review_cycle_days | xsd:integer |
| OBSO-0006 | scope | xsd:string |
| OBSO-0007 | encoding | xsd:string |
| OBSO-0008 | label_text | xsd:string |

Birthplace and category supply provenance and classification for factual records whose physical footprint is measurable. A schema.org-aligned fact keyed BIRT-0001 may declare birthplace_key BIRT-0006 while sibling facts point to BIRT-0002, BIRT-0001, and BIRT-0005, each tying the assertion to a birthplace dimension row whose misc field carries a human label (Birthplace Label 01 through Birthplace Label 04) and whose category partitions the same dimension into Birthplace Category 01–04. Version governs temporal or editorial state independently of identity: the four illustrated facts run versions 3, 5, 4, and 8, signaling that lineage consumers must resolve “which revision” before comparing content. Size_bytes quantifies storage cost and operational risk at rest—values ranging from 114301972 to 998785819 bytes—so capacity planning, retention policy, and deduplication targets can be tied to concrete artifacts rather than nominal catalog entries.

Directive governance in this model treats each standard or control framework as an entity whose obligations are decomposed into named attributes with machine-checkable types. Attributes effective_date, enforcement, mandatory, and priority are declared with attr_type bindings to xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively, which forces values into typed satellite tables rather than a single undifferentiated misc column. The entity identifier on value rows (for example OBSO-0003 for mandatory on CIS Critical Security Controls, HIPAA Security Rule, and peers) links a specific directive instance to a specific attr definition, so the same attr_name can be evaluated consistently whether the underlying framework is OGC API Features Standard or IEEE 802.11ax Standard. Typed misc payloads then carry the operational semantics: effective_date instances cluster around 2024-10-21, 2024-03-22, and 2024-07-16; mandatory evaluates true only for OBSO-0001 and false elsewhere; priority integers such as 5 and 703 on OBSO-0001 illustrate that integer-typed attrs admit wide dynamic range within one entity; varchar misc holds enforcement strings (Enforcement 02), encodings (Encoding 01), and short tokens (en, intake form) where string attrs are not enumerated in the core attr registry.

**t_directive_not_obsolete_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0003 | true |
| OBSO-0002 | OBSO-0002 | OBSO-0003 | false |
| OBSO-0003 | OBSO-0003 | OBSO-0003 | false |
| OBSO-0004 | OBSO-0004 | OBSO-0003 | false |
| OBSO-0005 | OBSO-0005 | OBSO-0003 | true |
| OBSO-0006 | OBSO-0006 | OBSO-0003 | true |
| OBSO-0007 | OBSO-0007 | OBSO-0003 | true |

**t_directive_not_obsolete_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0001 | 2024-10-21 |
| OBSO-0002 | OBSO-0002 | OBSO-0001 | 2024-03-22 |
| OBSO-0003 | OBSO-0003 | OBSO-0001 | 2024-07-16 |
| OBSO-0004 | OBSO-0004 | OBSO-0001 | 2024-10-21 |
| OBSO-0005 | OBSO-0005 | OBSO-0001 | 2023-05-26 |
| OBSO-0006 | OBSO-0006 | OBSO-0001 | 2023-06-12 |
| OBSO-0007 | OBSO-0007 | OBSO-0001 | 2025-06-10 |

**t_directive_not_obsolete_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0004 | 5 |
| OBSO-0002 | OBSO-0001 | OBSO-0005 | 703 |
| OBSO-0003 | OBSO-0002 | OBSO-0004 | 4 |
| OBSO-0004 | OBSO-0002 | OBSO-0005 | 418 |
| OBSO-0005 | OBSO-0003 | OBSO-0004 | 2 |
| OBSO-0006 | OBSO-0003 | OBSO-0005 | 865 |
| OBSO-0007 | OBSO-0004 | OBSO-0004 | 5 |
| OBSO-0008 | OBSO-0004 | OBSO-0005 | 415 |

**t_directive_not_obsolete_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0007 | Encoding 01 |
| OBSO-0002 | OBSO-0001 | OBSO-0002 | Enforcement 02 |
| OBSO-0003 | OBSO-0001 | OBSO-0008 | intake form |
| OBSO-0004 | OBSO-0001 | OBSO-0009 | en |
| OBSO-0005 | OBSO-0001 | OBSO-0006 | Scope 05 |
| OBSO-0006 | OBSO-0002 | OBSO-0007 | Encoding 06 |
| OBSO-0007 | OBSO-0002 | OBSO-0002 | Enforcement 07 |
| OBSO-0008 | OBSO-0002 | OBSO-0008 | nightly summary |

Confidence and uncertainty articulate complementary—not redundant—qualities of lineage assertions that connect business processes to transforming systems. An edge asserting Inventory Reconciliation via Genomic Variant Catalog may carry confidence 0.439 alongside uncertainty 766.93, whereas Patient Cohort Extraction through Clinical Trial Registry drops confidence to 0.111 with uncertainty 650.52, and Timezone Normalization through Financial Risk Pipeline rises to 0.554 confidence at 878.86 uncertainty. High confidence does not imply low uncertainty in this corpus: TRAN-0003 pairs 0.554 with the largest uncertainty among the four, teaching practitioners to treat confidence as belief in the asserted mapping and uncertainty as dispersion or error budget on that belief, often arising from estimator variance, incomplete metadata, or ambiguous transformation boundaries. Governance workflows should persist both measures on t_lineage_edge_via_transformation-style records so that automated promotion rules, human review queues, and compliance attestations can threshold differently on precision of match versus breadth of doubt.

Operationally, identifier discipline, typed attrs, birthplace/category context, version and size_bytes on facts, and confidence/uncertainty on lineage form a closed evidentiary chain from authoritative directive text (CIS Benchmark Distribution 8 cross-referenced with OWASP Testing Guide v4 at the directive level) through normalized attribute values to the transformations that produced reconciled inventory or cohort extracts. Misc fields remain the deliberate escape hatch for labels and literal values that are not themselves first-class dimensions, which keeps attr and attr_type as the contract layer and misc as the payload layer. Mature deployments version facts before rewriting them, attach birthplace_key before certifying origin, split values by XSD type to preserve validation, and require minimum confidence with bounded uncertainty before lineage edges participate in regulatory lineage graphs—so that what auditors inspect is not a flat export but a typed, keyed, and uncertainty-aware graph of obligations and provenance.

**fact_schemaorg**

| id | birthplace_key | size_bytes | version |
| --- | --- | --- | --- |
| BIRT-0001 | BIRT-0006 | 895265030 | 3 |
| BIRT-0002 | BIRT-0002 | 114301972 | 5 |
| BIRT-0003 | BIRT-0001 | 338701831 | 4 |
| BIRT-0004 | BIRT-0005 | 998785819 | 8 |

**dim_birthplace**

| id | birthplace_label | birthplace_category |
| --- | --- | --- |
| BIRT-0001 | Birthplace Label 01 | Birthplace Category 01 |
| BIRT-0002 | Birthplace Label 02 | Birthplace Category 02 |
| BIRT-0003 | Birthplace Label 03 | Birthplace Category 03 |
| BIRT-0004 | Birthplace Label 04 | Birthplace Category 04 |
| BIRT-0005 | Birthplace Label 05 | Birthplace Category 05 |
| BIRT-0006 | Birthplace Label 06 | Birthplace Category 06 |

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |