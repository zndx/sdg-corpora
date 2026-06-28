---
chapter_id: ch_live_belief_interval_only_unit_range_12b5c2
topic_id: 2
family: 06_belief_structure
cited_terms: ['belief_interval_only_unit_range', 'policy_with_jurisdiction', 'ebpfprogram_basic']
model: engine-refine
---

Belief intervals, jurisdictional policies, and kernel-resident enforcement artifacts share a common requirement: every governed object must be addressable, typed, and auditable across time. The identifier serves as the durable handle that survives schema evolution, cross-system federation, and compliance review. A throughput projection carries RANG-0001 as its primary key and anchors to jurisdictional context through belief_lower_bound JURI-0003, which in turn maps to European Union policy under the same numbering scheme used for packet loss guarantees (RANG-0003 bound to JURI-0001 and Financial Conduct Authority policy) and noise floor estimates (RANG-0004 bound to JURI-0005). That parallel naming—RANG- for interval records, JURI- for policy-with-jurisdiction records, EBPF- for program facts—permits lineage queries without collapsing distinct semantic roles into a single namespace.

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | JURI-0003 |
| RANG-0002 | throughput projection | JURI-0004 |
| RANG-0003 | packet loss guarantee | JURI-0001 |
| RANG-0004 | noise floor estimate | JURI-0005 |
| RANG-0005 | thermal drift assertion | JURI-0004 |
| RANG-0006 | packet loss guarantee | JURI-0004 |

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | RANG-0006 |
| JURI-0002 | European Union | RANG-0003 |
| JURI-0003 | European Union | RANG-0001 |
| JURI-0004 | FISMA | RANG-0002 |
| JURI-0005 | California Attorney General | RANG-0005 |
| JURI-0006 | Federal Trade Commission | RANG-0001 |

The entity is the subject of assertion: the thing about which attributes are recorded, not the attribute definition itself. In typed value stores, entity_id points at the interval or jurisdiction record under description while attr_id selects which facet of that record is being asserted. RANG-0001 therefore accumulates heterogeneous claims under one entity key—confidence 0.727 and 0.788 stored as xsd:decimal misc values, dimension_kind "Dimension Kind 01" and encoding metadata as xsd:string misc values, and a recorded_at timestamp of 2025-06-14T16:53:04 held in the datetime misc column—without duplicating the core interval row. Jurisdictional entities exhibit the same pattern: JURI-0003 carries mandatory true (xsd:boolean), effective_date 2025-06-18 (xsd:date), priority 1 (xsd:integer), and enforcement strings such as "Enforcement 02" and locale markers "ja" and "fr" where misc absorbs values whose surface syntax differs but whose governance role is identical.

Attr and attr_type constitute the contract layer that governs how misc may be interpreted. Attr names—confidence, dimension_kind, method, recorded_at on intervals; effective_date, enforcement, mandatory, priority on jurisdictions—declare the semantic field; attr_type binds each name to an XSD datatype that routes persistence to the correct physical store and constrains validation at ingest. A decimal attr_type permits only numeric misc such as 281.42 and 343.70; a dateTime attr_type requires ISO-8601 misc like 2023-03-26T19:32:25; boolean attr_type rejects ambiguous strings in favor of explicit true/false. Operational teams treat attr_type as the enforcement hook: misc without a matching attr_type is non-compliant data, and attr definitions versioned independently of entity rows allow retroactive re-typing only under controlled migration, preserving audit trails that tie each misc value to the attr_id that authorized its shape at write time.

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

Category and ebpfprogram extend the same governance model from declarative beliefs and policies into executable kernel instrumentation. An ebpfprogram is identified by ebpfprogram_key—EBPF-0001, EBPF-0003, EBPF-0005 in the fact layer—and described in the dimension by ebpfprogram_label and ebpfprogram_category values such as "Ebpfprogram Category 03." Category partitions programs for scope control: which binaries may load under which jurisdictional mandate, which size thresholds trigger review, and which version bands are permitted in production. Fact rows materialize those programs as deployable artifacts with size_bytes documenting on-disk or in-memory footprint—784335640 bytes at version 12 for EBPF-0001, 113209263 bytes at version 11 where ebpfprogram_key EBPF-0003 appears in multiple fact rows reflecting revision history—and version supplying the integer lineage operators use to detect drift, enforce rollback policy, and correlate runtime behavior with the belief intervals those programs are meant to guarantee.

Size_bytes and version matter because eBPF enforcement is both a capacity and a change-management problem. A program weighing 641704069 bytes at version 9 imposes different verifier and memory constraints than one at 161013093 bytes at version 12, and regulators expect those material facts to sit alongside—not inside—the semantic labels that category and misc provide elsewhere in the corpus. Version 12 appearing on both EBPF-0001 and EBPF-0005 signals independent release tracks that must not be conflated when ebpfprogram_key reuse (EBPF-0003 recorded twice at versions 9 and 11) indicates supersession rather than duplication error. Compliance workflows therefore join identifier across fact and dimension, filter by category for jurisdictional applicability (EU intervals bound to RANG-0001 and RANG-0002, FISMA to RANG-0002 via JURI-0004), and require that every misc value, every size_bytes entry, and every version increment trace to an entity and attr pair whose attr_type was valid at the effective_date or recorded_at stamped on the governing record.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

In practice, operators treat misc as the evidence payload and the surrounding keys as the notarial frame. Whether misc holds 0.727 confidence, "change rationale," or false for mandatory jurisdiction JURI-0003, retrieval always proceeds entity → attr → attr_type → typed misc, with identifier providing the join key at each hop. ebpfprogram rows add binary provenance to that chain so that a throughput projection credentialed under EU policy and a packet loss guarantee under FCA oversight can be shown to have been evaluated against specific program sizes and versions at known timestamps. The density of this arrangement—parallel prefixes, XSD-typed attrs, fact-dimension split for executable assets—is what allows a single governance framework to span statistical beliefs, regulatory policy, and kernel-level enforcement without collapsing their distinct evidentiary standards into one undifferentiated value column.

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |