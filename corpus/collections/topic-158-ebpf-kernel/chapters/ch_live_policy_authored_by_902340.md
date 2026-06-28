---
chapter_id: ch_live_policy_authored_by_902340
topic_id: 158
family: 01_foundation
cited_terms: ['policy_authored_by', 'annotation_classifies_artifact', 'ebpfprogram_min_one_hook']
model: engine-refine
---

Governance frameworks for policy artifacts rely on a structured registry where each document is assigned a unique identifier and classified by its regulatory provenance and enforcement posture. The policy table anchors this registry with identifiers such as AUTH-0001 through AUTH-0004, each tied to a specific regulatory instrument — AWS IAM Permission Boundary, PCI DSS Access Standards, ISO 27001 Controls, and the EU AI Risk Framework respectively. Authorship is attributed to authoritative bodies including the European Commission, NIST Computer Security, and the Federal Trade Commission, while a mandatory flag distinguishes binding requirements from advisory guidance; ISO 27001 Controls and the EU AI Risk Framework carry mandatory enforcement, whereas the AWS IAM and PCI DSS entries are marked as non-mandatory. Character encoding, predominantly latin1 with one instance of ascii, ensures cross-platform compatibility of the policy text across heterogeneous systems.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | European Commission | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | NIST Computer Security | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | NIST Computer Security | true | ascii |
| AUTH-0004 | EU AI Risk Framework | Federal Trade Commission | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | Federal Trade Commission | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | AWS Compliance Office | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | SOC 2 Audit Board | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | Federal Trade Commission | false | unicode |

Annotation classification provides a parallel taxonomy for labeling artifacts according to their data-handling characteristics. Each artifact receives a classification such as Source Verified, PII Redacted, PII Sensitive, or Deprecated, establishing a metadata layer that governs downstream processing and access controls. These classifications are not monolithic; they are decomposed into typed attributes — confidence scores expressed as xsd:decimal, categorical descriptors like dimension_kind and method as xsd:string, and temporal markers recorded_at as xsd:dateTime — enabling fine-grained, schema-constrained annotation of each artifact's properties.

The value tables implement a vertical entity-attribute-value model where each attribute type is materialized in its own store. Decimal values such as 0.727 and 0.091 capture confidence levels, while 765.80 and 266.33 represent dimensional measurements; string values encode categorical metadata including Dimension Kind 01, Encoding 02, pre-release note, and the locale identifier ja; and datetime values record precise timestamps ranging from 2023-01-05T00:51:32 to 2024-11-30T14:24:01. Each value row references an entity through entity_id and an attribute definition through attr_id, forming foreign-key links back to the artifact and attribute definition tables. This normalization ensures type safety — a decimal value is never conflated with a string or timestamp — while supporting an open-ended attribute schema that accommodates new annotation types without schema migration.

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Source Verified |
| ARTI-0002 | PII Redacted |
| ARTI-0003 | PII Sensitive |
| ARTI-0004 | Deprecated |
| ARTI-0005 | GDPR Compliant |
| ARTI-0006 | GDPR Compliant |

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

The eBPF program dimension introduces a systems-level observability layer, tracking kernel-space programs by their attachment points, binary footprint, and version lineage. Programs are identified by handles such as HOOK-0001 through HOOK-0004 and are linked via attaches_to_hook_key to a dimension table that categorizes each hook point by a human-readable label and a categorical classification. Binary sizes span from 113,209,263 bytes to 784,335,640 bytes, reflecting the substantial memory footprint of complex eBPF programs, while version numbers cluster around 9 through 12, indicating iterative refinement cycles. The dimension table provides the semantic context — attaching to hook labels and categories — that transforms raw key references into an interpretable taxonomy of kernel attachment points.

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |