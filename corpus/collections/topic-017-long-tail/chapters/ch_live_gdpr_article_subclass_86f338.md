---
chapter_id: ch_live_gdpr_article_subclass_86f338
topic_id: 17
family: 07_long_tail
cited_terms: ['gdpr_article_subclass', 'dataset_subclass', 'ebpfprogram_loaded_in_kernel']
model: engine-refine
---

The governance of data assets across distributed infrastructures demands a rigorous taxonomy that reconciles regulatory obligations with technical provenance. At the regulatory layer, article subclassifications such as ARTI-0001 through ARTI-0004 anchor specific compliance regimes—Brazilian LGPD and Canadian PIPEDA—while cross-referencing distinct statutory instruments including the Australian Privacy Act, Japanese APPI, and Article 9. These mappings are not merely cataloguing exercises; they establish the legal ontology against which every data asset is evaluated. The junction table linking article subclasses to their parent articles introduces a role-based relationship model, where entities assume positions of owner, contributor, or observer, thereby encoding accountability chains that trace from abstract regulation to concrete data stewardship.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

Physical data residency forms the second pillar of this governance architecture. Dataset records carry explicit location markers—eu-west-3, rack-7, us-east-1—that determine which jurisdictional frameworks apply and which data protection requirements must be satisfied. A dataset named sensor_telemetry_q4, containing a latency_ms column, may reside in eu-west-3 and fall under one regulatory regime, while financial_ledger_jan, with its patient_id column, occupies rack-7 and triggers entirely different compliance obligations. The misc column further enriches this classification with descriptive labels such as IoT Device Inventory, Supply Chain Manifest, Genomic Variant Registry, and Geo Spatial Raster Map, providing semantic context that bridges technical metadata with business domain understanding.

**t_dataset_subclass**

| id | dataset | column | location | name |
| --- | --- | --- | --- | --- |
| DATA-0001 | sensor_telemetry_q4 | latency_ms | eu-west-3 | IoT Device Inventory |
| DATA-0002 | iot_device_registry | sensor_id | rack-7 | Supply Chain Manifest |
| DATA-0003 | financial_ledger_jan | patient_id | rack-7 | Genomic Variant Registry |
| DATA-0004 | iot_device_registry | device_mac | us-east-1 | Geo Spatial Raster Map |
| DATA-0005 | compliance_audit_log | geo_lat | us-east-1 | Supply Chain Manifest |
| DATA-0006 | network_traffic_capture | temperature_c | rack-7 | IoT Device Inventory |
| DATA-0007 | network_traffic_capture | temperature_c | on-prem-dc1 | Financial Ledger Q1 |
| DATA-0008 | financial_ledger_jan | patient_id | eu-west-3 | Clinical Vitals Archive |

The technical provenance of kernel-level programs introduces a third dimension of governance, captured through the fact table for eBPF programs and its associated dimension for load locations. Program identifiers such as KERN-0001 through KERN-0004 reference loaded_in keys that connect to a dimension table where each entry carries a label and a category designation. The size_bytes column records substantial resource footprints—784335640 bytes for one program, 641704069 for another—while version numbers (9, 11, 12) establish revision lineage. These metrics are not incidental; they inform capacity planning, audit trails, and the assessment of system integrity, particularly in environments where kernel-level instrumentation must be both performant and compliant with security policies.

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |

The foreign-key relationships between these tables create a unified query surface that enables cross-domain analysis. A dataset's location can be correlated with the regulatory articles that govern it, and those articles can be traced through role assignments to the entities responsible for compliance. Similarly, eBPF program sizes and versions can be filtered by their load category, enabling operators to identify which program versions are deployed in which environments and at what resource cost. The subject and target columns in the junction table encode directional relationships—ARTI-0005 appears as both a subject and a target across different records, indicating that regulatory articles can themselves be subjects of other articles' provisions, creating a graph of interdependent obligations.

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

This multi-layered schema reflects the reality that modern data governance operates at the intersection of law, infrastructure, and software engineering. No single table captures the full picture; instead, the identifier column serves as the universal key across all entities, enabling joins that reveal how a dataset in rack-7 containing patient identifiers is governed by Brazilian LGPD provisions, which are themselves linked through observer and owner roles to specific regulatory articles, all while the systems that process this data run eBPF programs of known size and version in categorized load environments. The architecture supports both granular compliance reporting and holistic system visibility, ensuring that regulatory requirements are traceable to their technical implementation without sacrificing operational clarity.