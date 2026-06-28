---
chapter_id: ch_live_directive_traces_to_requirement_16cfe4
topic_id: 4
family: 03_directive_governance
cited_terms: ['directive_traces_to_requirement', 'trace_with_root_span', 'universal_generic']
model: engine-refine
---

In a structured compliance governance system, regulatory directives such as ISO 27001:2022, PCI DSS v4.0, the EU AI Act Article 9, and internal Data Classification Policy are decomposed into discrete, traceable requirements identified by codes like REQU-0001 through REQU-0004. Each requirement carries a set of typed attributes that define its operational characteristics—effective dates, enforcement status, mandatory flags, and priority levels—where attribute types are strictly constrained to XML Schema primitives such as xsd:date, xsd:string, xsd:boolean, and xsd:integer. This type discipline ensures that attribute values are stored and validated consistently across the framework, preventing semantic drift when requirements are referenced by downstream processes or audit tooling.

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

Attribute values are materialized in dedicated value tables keyed by the requirement identifier, with the entity column serving as the foreign key that binds a specific requirement instance to its attribute assignment. For instance, the mandatory attribute (attr_id REQU-0003) resolves to true for one requirement and false for the others, signaling which controls carry non-negotiable obligations. Effective dates span from 2023-08-06 through 2025-05-18, reflecting phased rollouts and the temporal dimension of compliance obligations. Priority integers such as 4, 132, and 453 quantify relative importance, while string-valued attributes capture freeform metadata like "Encoding 01," "Enforcement 02," "nightly summary," and locale codes such as "ja." This separation of attribute schema from attribute values follows a normalized entity-attribute-value pattern that supports extensibility without schema migration.

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

The governance framework extends beyond individual requirements through a universal mapping layer that associates high-level constructs—Governance Framework, Taxonomy Node, Event Category, Validation Pattern—with specific requirement identifiers. This indirection allows a single requirement like REQU-0001 to be classified under multiple governance concepts simultaneously, enabling multi-dimensional reporting and cross-cutting analysis. The related column in this mapping table points back to requirements, creating a many-to-many relationship that captures the overlapping nature of regulatory obligations without duplicating requirement definitions.

**t_universal_generic**

| id | universal | related |
| --- | --- | --- |
| GENE-0001 | Governance Framework | REQU-0001 |
| GENE-0002 | Taxonomy Node | REQU-0005 |
| GENE-0003 | Event Category | REQU-0004 |
| GENE-0004 | Validation Pattern | REQU-0005 |
| GENE-0005 | Compliance Rule | REQU-0001 |
| GENE-0006 | Taxonomy Node | REQU-0005 |
| GENE-0007 | Compliance Rule | REQU-0003 |
| GENE-0008 | Data Standard | REQU-0004 |

On the operational side, execution traces are captured as fact records that link each trace to a root span through the root_span_key foreign key, establishing a hierarchical relationship between child traces and their originating root span. The root span dimension table provides descriptive labels such as Root Span Label 01 through Root Span Label 04 and categorical classifications like Root Span Category 01 through Root Span Category 04, which serve as the primary grouping keys for trace aggregation and analysis. Trace records carry a size_bytes metric that can reach into the hundreds of megabytes—values such as 475,324,433 and 941,223,628 bytes reflect the volume of telemetry collected per trace—and a version number that tracks the evolution of the trace schema or instrumentation library, with observed versions ranging from 4 to 12.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |