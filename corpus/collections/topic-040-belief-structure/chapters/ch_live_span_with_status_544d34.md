---
chapter_id: ch_live_span_with_status_544d34
topic_id: 40
family: 07_long_tail
cited_terms: ['span_with_status', 'directive_authored_and_applies', 'directive_traces_to_requirement']
model: engine-refine
---

The operational observability layer is anchored by the span status registry, where each tracked span—identified by a code such as STAT-0001 through STAT-0004—is associated with a concrete operational interval like certificate-renewal-cycle, data-ingestion-batch, or api-gateway-request. These spans are classified by their runtime condition: degraded, timeout, or partial_failure, with the latter appearing for both the data-ingestion-batch (STAT-0003) and the api-gateway-request (STAT-0004), indicating that multiple distinct spans can share an identical status classification. The association between spans and their statuses is mediated through a junction table that encodes not merely a binary linkage but a role-bearing relationship; each row carries a role designation—contributor or observer—that qualifies the nature of the span's participation in the status event. For instance, STAT-0001 appears as a contributor to its own degraded state (STAT-0005) and as an observer to STAT-0006, while also being observed by STAT-0005 in a separate linkage, demonstrating that the same span can occupy multiple relational positions simultaneously within the status graph.

**t_span_with_status**

| id | span |
| --- | --- |
| STAT-0001 | certificate-renewal-cycle |
| STAT-0002 | certificate-renewal-cycle |
| STAT-0003 | data-ingestion-batch |
| STAT-0004 | api-gateway-request |
| STAT-0005 | certificate-renewal-cycle |
| STAT-0006 | session-initialization |

**t_span_with_status_span_status**

| id | span_status |
| --- | --- |
| STAT-0001 | degraded |
| STAT-0002 | timeout |
| STAT-0003 | partial_failure |
| STAT-0004 | partial_failure |
| STAT-0005 | partial_failure |
| STAT-0006 | degraded |

**t_span_with_status__span_status**

| id | span_id | span_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0005 | contributor |
| STAT-0002 | STAT-0005 | STAT-0006 | observer |
| STAT-0003 | STAT-0001 | STAT-0001 | contributor |
| STAT-0004 | STAT-0001 | STAT-0002 | observer |
| STAT-0005 | STAT-0003 | STAT-0002 | owner |
| STAT-0006 | STAT-0001 | STAT-0001 | owner |
| STAT-0007 | STAT-0004 | STAT-0006 | observer |
| STAT-0008 | STAT-0003 | STAT-0004 | reviewer |

Compliance governance is structured around a directive-to-requirement traceability matrix, where regulatory instruments such as ISO 27001:2022, FDA 21 CFR Compliance, and EPA Telemetry Protocol are authored by specific requirement identifiers—REQU-0005, REQU-0001, and REQU-0001 respectively—and applied to concrete operational targets including ISO Certified Facilities, Edge Gateway Nodes, Cloud Storage Buckets, and Customer PII Datasets. The requirement registry itself enumerates the underlying control objectives: ISO 27001 Access Control, NIST SP 800-53 Rev 5, GDPR Data Retention, and Data Classification Policy, each of which serves as a leaf node in the compliance derivation chain. This two-tier structure—directives that cite requirements and apply to assets—enables auditors to trace a finding from a physical or logical target back through the directive that governs it to the requirement that mandates it, forming a complete evidentiary chain.

**t_directive_authored_and_applies**

| id | directive | authored_by | applies_to |
| --- | --- | --- | --- |
| APPL-0001 | ISO 27001:2022 | REQU-0005 | ISO Certified Facilities |
| APPL-0002 | FDA 21 CFR Compliance | REQU-0001 | Edge Gateway Nodes |
| APPL-0003 | EPA Telemetry Protocol | REQU-0001 | Cloud Storage Buckets |
| APPL-0004 | FDA 21 CFR Compliance | REQU-0002 | Customer PII Datasets |
| APPL-0005 | GDPR Data Retention | REQU-0005 | Financial Ledger Tables |
| APPL-0006 | Encryption Standard AES-256 | REQU-0004 | HIPAA Covered Entities |

Attribute metadata for both directive and requirement entities is declared in parallel schema tables that define the shape of extensible properties: effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). These declarations appear identically in the attribute registries for both the directive-to-apply and directive-to-trace relationships, reflecting a unified attribute vocabulary across the compliance domain. The attribute definitions are not merely catalog entries; they govern the type discipline of the value tables that follow, ensuring that date values such as 2023-01-05, 2024-10-27, 2025-04-09, and 2024-01-05 are stored in the date-specific value table, while boolean flags like true and false are confined to the boolean value table, and integer priorities—ranging from 4 to 736 in the requirement traces and from 5 to 165 in the directive applications—are persisted in the integer value table.

The value tables implement an entity-attribute-value pattern where each row binds a specific entity identifier to a specific attribute identifier and a typed value, thereby decoupling the attribute schema from the data storage. For directive applications, the boolean value table records that the mandatory attribute (APPL-0003) is set to true across all four directive entities (APPL-0001 through APPL-0004), while the date value table assigns distinct effective dates to each directive entity, and the integer value table captures both priority scores (5 for APPL-0001 and APPL-0002) and secondary numeric attributes (736 for APPL-0001 and 165 for APPL-0002). The varchar value table holds freeform strings such as Encoding 01, Enforcement 02, pre-release note, and ja, bound to attributes APPL-0007, APPL-0002, APPL-0008, and APPL-0009 respectively. An analogous structure governs requirement traces, where the mandatory attribute (REQU-0003) is true only for REQU-0003 and false for the remaining three requirements, effective dates span from 2023-08-06 to 2025-05-18, and integer values include both low-priority indicators (4) and larger numeric codes (132, 453). This separation of attribute declarations from their typed values permits schema evolution—new attributes can be declared without DDL changes—and enforces type safety at query time by routing lookups to the appropriate value table based on the declared attr_type.

**t_directive_authored_and_applies_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| APPL-0001 | effective_date | xsd:date |
| APPL-0002 | enforcement | xsd:string |
| APPL-0003 | mandatory | xsd:boolean |
| APPL-0004 | priority | xsd:integer |
| APPL-0005 | review_cycle_days | xsd:integer |
| APPL-0006 | scope | xsd:string |
| APPL-0007 | encoding | xsd:string |
| APPL-0008 | label_text | xsd:string |

**t_directive_authored_and_applies_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0003 | true |
| APPL-0002 | APPL-0002 | APPL-0003 | true |
| APPL-0003 | APPL-0003 | APPL-0003 | true |
| APPL-0004 | APPL-0004 | APPL-0003 | true |
| APPL-0005 | APPL-0005 | APPL-0003 | false |
| APPL-0006 | APPL-0006 | APPL-0003 | false |

**t_directive_authored_and_applies_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0001 | 2023-01-05 |
| APPL-0002 | APPL-0002 | APPL-0001 | 2024-10-27 |
| APPL-0003 | APPL-0003 | APPL-0001 | 2025-04-09 |
| APPL-0004 | APPL-0004 | APPL-0001 | 2024-01-05 |
| APPL-0005 | APPL-0005 | APPL-0001 | 2023-12-27 |
| APPL-0006 | APPL-0006 | APPL-0001 | 2023-04-20 |

**t_directive_authored_and_applies_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0004 | 5 |
| APPL-0002 | APPL-0001 | APPL-0005 | 736 |
| APPL-0003 | APPL-0002 | APPL-0004 | 5 |
| APPL-0004 | APPL-0002 | APPL-0005 | 165 |
| APPL-0005 | APPL-0003 | APPL-0004 | 3 |
| APPL-0006 | APPL-0003 | APPL-0005 | 417 |
| APPL-0007 | APPL-0004 | APPL-0004 | 1 |
| APPL-0008 | APPL-0004 | APPL-0005 | 521 |

**t_directive_authored_and_applies_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0007 | Encoding 01 |
| APPL-0002 | APPL-0001 | APPL-0002 | Enforcement 02 |
| APPL-0003 | APPL-0001 | APPL-0008 | pre-release note |
| APPL-0004 | APPL-0001 | APPL-0009 | ja |
| APPL-0005 | APPL-0001 | APPL-0006 | Scope 05 |
| APPL-0006 | APPL-0002 | APPL-0007 | Encoding 06 |
| APPL-0007 | APPL-0002 | APPL-0002 | Enforcement 07 |
| APPL-0008 | APPL-0002 | APPL-0008 | pre-release note |

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001 Access Control |
| REQU-0002 | NIST SP 800-53 Rev 5 |
| REQU-0003 | GDPR Data Retention |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | ISO 27001:2022 |

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