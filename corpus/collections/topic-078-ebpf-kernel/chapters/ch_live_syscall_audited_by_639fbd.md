---
chapter_id: ch_live_syscall_audited_by_639fbd
topic_id: 78
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by', 'taper_tolerance_constraint', 'annotation_classifies_artifact']
model: engine-refine
---

Taper tolerance constraints serve as the authoritative reference for machining interface specifications, anchoring each constraint to a standardized designation such as ISO 7/24, R8 Taper, HSK 63A, or Brown Sharpe. Each constraint receives a persistent identifier—CONS-0001 through CONS-0004—that functions as the stable key across all downstream attribute and value tables. The constraint definition itself is deliberately minimal; the operational richness emerges from the attribute-value layer, which decouples metadata from the core entity and permits heterogeneous data types to coexist without schema migration. This separation is critical in compliance environments where tolerance records must absorb evolving measurement methodologies, audit timestamps, and dimensional classifications without altering the constraint's canonical identity.

**t_taper_tolerance_constraint**

| id | taper_tolerance_constraint |
| --- | --- |
| CONS-0001 | ISO 7/24 |
| CONS-0002 | R8 Taper |
| CONS-0003 | HSK 63A |
| CONS-0004 | Brown Sharpe |
| CONS-0005 | R8 Taper |
| CONS-0006 | HSK 63A |
| CONS-0007 | HSK 63A |

**t_taper_tolerance_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | confidence | xsd:decimal |
| CONS-0002 | dimension_kind | xsd:string |
| CONS-0003 | method | xsd:string |
| CONS-0004 | recorded_at | xsd:dateTime |
| CONS-0005 | uncertainty | xsd:decimal |
| CONS-0006 | unit | xsd:string |
| CONS-0007 | value | xsd:decimal |
| CONS-0008 | encoding | xsd:string |

**t_taper_tolerance_constraint_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 2023-04-13T01:14:03 |
| CONS-0002 | CONS-0002 | CONS-0004 | 2023-11-17T04:32:31 |
| CONS-0003 | CONS-0003 | CONS-0004 | 2024-02-24T21:07:21 |
| CONS-0004 | CONS-0004 | CONS-0004 | 2024-03-22T07:54:37 |
| CONS-0005 | CONS-0005 | CONS-0004 | 2024-06-16T09:28:12 |
| CONS-0006 | CONS-0006 | CONS-0004 | 2025-04-01T15:47:40 |
| CONS-0007 | CONS-0007 | CONS-0004 | 2023-11-02T02:01:06 |

**t_taper_tolerance_constraint_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 0.573 |
| CONS-0002 | CONS-0001 | CONS-0005 | 111.04 |
| CONS-0003 | CONS-0001 | CONS-0007 | 682.01 |
| CONS-0004 | CONS-0002 | CONS-0001 | 0.728 |
| CONS-0005 | CONS-0002 | CONS-0005 | 404.41 |
| CONS-0006 | CONS-0002 | CONS-0007 | 774.28 |
| CONS-0007 | CONS-0003 | CONS-0001 | 0.546 |
| CONS-0008 | CONS-0003 | CONS-0005 | 913.78 |

**t_taper_tolerance_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0002 | Dimension Kind 01 |
| CONS-0002 | CONS-0001 | CONS-0008 | Encoding 02 |
| CONS-0003 | CONS-0001 | CONS-0009 | nightly summary |
| CONS-0004 | CONS-0001 | CONS-0010 | en |
| CONS-0005 | CONS-0001 | CONS-0003 | hybrid |
| CONS-0006 | CONS-0001 | CONS-0006 | ratio |
| CONS-0007 | CONS-0002 | CONS-0002 | Dimension Kind 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | Encoding 08 |

Attributes are declared once in a dedicated metadata table, where each attribute carries a human-readable name and an XML Schema Definition type. The attribute set for taper tolerance constraints includes confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). The xsd:decimal type signals a numeric confidence score, as seen in values such as 0.573 and 0.728 assigned to the confidence attribute of constraint CONS-0001. The xsd:string type accommodates categorical labels like Dimension Kind 01 and Encoding 02, while xsd:dateTime anchors temporal provenance to precise instants—for example, 2023-04-13T01:14:03 or 2024-03-22T07:54:37. By encoding the type at declaration time, the system enforces value validation at insertion and eliminates ambiguity in downstream queries.

Values are materialized across three type-specific tables, each keyed by a unique record identifier and linked back to its entity and attribute through foreign keys. The decimal value table stores numeric measurements; for instance, entity CONS-0001 carries three distinct decimal attributes with values 0.573, 111.04, and 682.01, each associated with a different attr_id. The varchar value table holds free-form strings, including entries such as nightly summary and en, while the datetime value table records timestamps that establish when each attribute was last updated. This tripartite value store ensures type safety without sacrificing flexibility: a single entity can simultaneously possess a decimal confidence score, a string encoding label, and a datetime provenance marker, all retrievable through a unified join on entity_id and attr_id.

The same attribute-value architecture is replicated for annotation classifications, which tag artifacts with compliance-relevant labels such as Source Verified, PII Redacted, PII Sensitive, and Deprecated. Each annotation receives its own identifier—ARTI-0001 through ARTI-0004—and its attribute schema mirrors the taper tolerance pattern, with confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Decimal confidence values for annotation ARTI-0001 include 0.727, 765.80, and 266.33, while varchar values encompass Dimension Kind 01, Encoding 02, pre-release note, and ja. Datetime provenance for annotations ranges from 2023-01-05T00:51:32 to 2024-11-30T14:24:01, providing an auditable trail of when each classification was applied or last modified.

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

Beyond tolerance and annotation domains, the system also tracks syscall audit records that associate system calls with format and language metadata. Audit identifiers AUDI-0001 through AUDI-0004 map to operations such as unlinkat, execve, epoll_ctl, and clone, each recorded in a specific format—JSON, UUID, or CSV—and annotated with a language code including fr, en, and ja. This cross-domain uniformity means that whether the entity is a machining constraint, a compliance annotation, or an audit record, the underlying model remains consistent: a stable identifier, a set of typed attributes, and a type-dispatched value store. The pattern supports governance requirements by making every attribute declaration explicit, every value type-checked, and every entity traceable through its foreign-key relationships to its metadata and measurements.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |