---
chapter_id: ch_live_column_lineage_describes_pair_da1c6c
topic_id: 36
family: 05_provo_lineage
cited_terms: ['column_lineage_describes_pair', 'xdp_action_drop', 'ebpfmap_used_by_program']
model: engine-refine
---

Effective data governance and network policy enforcement depend on a unified tracking fabric that anchors disparate telemetry, lineage, and runtime metadata to stable identifiers. Each record—whether a column lineage mapping, an eXpress Data Path drop rule, or an eBPF map instance—is assigned a unique identifier that serves as the primary key for cross-domain correlation. These identifiers bind to an entity, representing the actionable object under observation, and enable auditors to reconstruct the full provenance of a data flow or policy decision. By standardizing on a consistent identification scheme, organizations can trace how raw inputs such as telemetry_payload or raw_customer_id transform through intermediate stages like parsed_telemetry or order_timestamp, while simultaneously correlating those transformations with the network controls and runtime resources that govern them.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | quarantine |
| DROP-0002 | veth1_filter | conntrack_drop |
| DROP-0003 | docker0_hook | acl_denied |
| DROP-0004 | nfqueue_bridge | threat_block |
| DROP-0005 | eth0_ingress | acl_denied |
| DROP-0006 | wlan0_monitor | threat_block |

Provenance accuracy is quantified through confidence scores and methodological tags that distinguish automated discovery from human-curated mappings. In column lineage tracking, relationships between source and target columns are evaluated and assigned confidence values ranging from 0.259 to 0.783, reflecting the degree of certainty in the inferred connection. A lineage pair linking tax_calc_engine to parsed_telemetry via telemetry_payload carries a confidence of 0.290 and is classified as manual, indicating deliberate engineering oversight, whereas the relationship between price_normalization and raw_customer_id achieves a confidence of 0.783 through a hybrid approach, suggesting algorithmic validation supplemented by review. These metrics are essential for compliance frameworks that require defensible audit trails, as they allow operators to prioritize high-confidence transformations while flagging low-confidence links for remediation.

**t_column_lineage_describes_pair**

| id | column | from_column | to_column | confidence | method |
| --- | --- | --- | --- | --- | --- |
| PAIR-0001 | tax_calc_engine | telemetry_payload | parsed_telemetry | 0.290 | manual |
| PAIR-0002 | tax_calc_engine | raw_customer_id | order_timestamp | 0.319 | manual |
| PAIR-0003 | price_normalization | product_sku | raw_customer_id | 0.783 | hybrid |
| PAIR-0004 | pii_masking_rule | masked_ip_address | parsed_telemetry | 0.259 | hybrid |

Policy enforcement actions are similarly enriched with structured attributes that standardize how drop rules are documented and versioned. Each XDP action—whether quarantine, conntrack_drop, acl_denied, or threat_block—is associated with a set of attr such as checksum, created_date, identifier, and license, each bound to a strict attr type definition like xsd:string, xsd:date, or cco:DesignativeICE. This type discipline ensures that heterogeneous values are normalized before storage: dates are captured as ISO-formatted strings (2025-02-22, 2023-10-04), licensing tags are preserved as machine-readable identifiers (CC-BY-4.0), and operational metadata such as region tags (us-east-1) or UUIDs (urn:uuid:9f2a) are retained without schema drift. Integer-valued attributes, including counters and size metrics, are stored separately to maintain type safety, while a misc column accommodates unstructured or transient data that does not fit predefined categories.

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

Runtime resource tracking completes the governance loop by monitoring the footprint and evolution of eBPF maps, which serve as the shared memory backbone for kernel-level observability. Each map instance is cataloged with a size bytes metric that reflects its memory allocation—ranging from approximately 31 million bytes to over 354 million bytes—and a version number that tracks schema or behavioral changes across deployments. These resources are attributed to specific programs through a used by program key, which is resolved against a dimensional catalog that assigns each program a human-readable label and a functional category. This classification enables capacity planning and compliance reporting, as operators can correlate memory consumption with program purpose, ensuring that high-footprint maps are justified by their operational role and properly version-controlled.

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

Together, these components form a cohesive audit fabric that links data lineage, network policy, and runtime telemetry into a single traceable system. The interplay between identifiers, entities, and typed attributes ensures that every transformation, drop rule, and memory allocation can be reconstructed, validated, and attributed to a specific program or category. Confidence scores and methodological tags provide the necessary granularity for risk assessment, while versioning and size metrics maintain operational discipline over kernel-level resources. For compliance frameworks, this architecture eliminates black-box dependencies by making provenance explicit, type constraints enforce data integrity, and categorical classifications align technical artifacts with organizational governance requirements.