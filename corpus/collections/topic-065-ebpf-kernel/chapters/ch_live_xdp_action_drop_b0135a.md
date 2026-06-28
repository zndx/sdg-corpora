---
chapter_id: ch_live_xdp_action_drop_b0135a
topic_id: 65
family: 07_long_tail
cited_terms: ['xdp_action_drop', 'xdp_action_pass', 'xdp_action_redirect']
model: engine-refine
---

XDP (eXpress Data Path) actions represent the fundamental operations performed on network packets at kernel bypass speed, and their governance requires a structured taxonomy that distinguishes between drop and pass behaviors. Drop actions enforce security and compliance boundaries by discarding packets that violate policy, with concrete enforcement mechanisms including quarantine for isolating suspicious traffic, conntrack_drop for stateful connection tracking violations, acl_denied for access control list failures, and threat_block for identified threat signatures. These drop actions are bound to specific XDP interfaces such as wlan0_monitor for wireless traffic inspection, veth1_filter for virtual Ethernet filtering, docker0_hook for container network enforcement, and nfqueue_bridge for netfilter queue integration. Conversely, pass actions permit packets to continue through the networking stack, with operational purposes ranging from route-to-lake for data lake ingestion, validate-schema for data format verification, sync-replica for distributed state propagation, to tag-PII for personally identifiable information marking. The pass actions operate on interfaces like prod-ingest-xdp for production data ingestion, edge-telemetry-xdp for edge-collected metrics, and compliance-xdp for regulatory traffic analysis.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | quarantine |
| DROP-0002 | veth1_filter | conntrack_drop |
| DROP-0003 | docker0_hook | acl_denied |
| DROP-0004 | nfqueue_bridge | threat_block |
| DROP-0005 | eth0_ingress | acl_denied |
| DROP-0006 | wlan0_monitor | threat_block |

**t_xdp_action_pass**

| id | xdp |
| --- | --- |
| PASS-0001 | prod-ingest-xdp |
| PASS-0002 | edge-telemetry-xdp |
| PASS-0003 | compliance-xdp |
| PASS-0004 | prod-ingest-xdp |
| PASS-0005 | streaming-fabric-xdp |
| PASS-0006 | cloud-sync-xdp |

**t_xdp_action_pass_x_d_p_action**

| id | x_d_p_action |
| --- | --- |
| PASS-0001 | route-to-lake |
| PASS-0002 | validate-schema |
| PASS-0003 | sync-replica |
| PASS-0004 | tag-PII |
| PASS-0005 | drop-invalid |
| PASS-0006 | encrypt-payload |

The relationship between XDP actions and their operational roles is modeled through a many-to-many association that captures the principle of least privilege in action governance. Each association between a pass action and an XDP action carries a role designation—observer for read-only monitoring, owner for full administrative control, or contributor for modification rights—ensuring that the right personnel can exercise the right level of authority over packet processing decisions. This role-based access model is critical in production environments where multiple teams manage different stages of the data pipeline, from edge collection through ingestion to compliance enforcement.

**t_xdp_action_pass__x_d_p_action**

| id | xdp_id | x_d_p_action_id | role |
| --- | --- | --- | --- |
| PASS-0001 | PASS-0001 | PASS-0005 | observer |
| PASS-0002 | PASS-0002 | PASS-0004 | owner |
| PASS-0003 | PASS-0005 | PASS-0003 | observer |
| PASS-0004 | PASS-0005 | PASS-0005 | contributor |
| PASS-0005 | PASS-0003 | PASS-0006 | observer |
| PASS-0006 | PASS-0005 | PASS-0006 | contributor |
| PASS-0007 | PASS-0005 | PASS-0001 | observer |
| PASS-0008 | PASS-0002 | PASS-0001 | contributor |

Attribute metadata enriches XDP actions with contextual information necessary for auditability and operational decision-making. Attributes are defined with typed values that support diverse data needs: string attributes such as checksums for data integrity verification, identifiers for traceability, license designations like CC-BY-4.0 for usage rights, and geographic indicators such as us-east-1 for data residency compliance; date attributes recording creation timestamps like 2025-02-22 or 2023-10-04 for lifecycle management; and integer attributes capturing quantitative measures such as packet counts or buffer sizes. The attribute type system leverages XML Schema datatypes including xsd:string for text, xsd:date for temporal values, and custom namespaces like cco:DesignativeICE for organizational identifiers, ensuring type safety and enabling automated validation of attribute values.

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

**dim_x_d_p_action**

| id | x_d_p_action_label | x_d_p_action_category |
| --- | --- | --- |
| REDI-0001 | X D P Action Label 01 | X D P Action Category 01 |
| REDI-0002 | X D P Action Label 02 | X D P Action Category 02 |
| REDI-0003 | X D P Action Label 03 | X D P Action Category 03 |
| REDI-0004 | X D P Action Label 04 | X D P Action Category 04 |
| REDI-0005 | X D P Action Label 05 | X D P Action Category 05 |
| REDI-0006 | X D P Action Label 06 | X D P Action Category 06 |
| REDI-0007 | X D P Action Label 07 | X D P Action Category 07 |

The dimensional model underlying XDP action management separates measurable facts from descriptive context to support analytical queries and operational reporting. The fact table records quantitative metrics for each XDP action instance, including size in bytes—values such as 263,642,012 bytes for large batch operations, 113,807,155 bytes for medium payloads, and 185,269,640 bytes for standard processing units—alongside version numbers ranging from 4 through 9 that track action evolution and enable rollback procedures. The dimension table provides categorical classification through action labels and categories, organizing actions into structured groupings that facilitate policy aggregation and compliance reporting. This separation of concerns between facts and dimensions enables efficient star-schema queries that answer operational questions about action throughput, size distribution, and version adoption across the XDP infrastructure.

**fact_xdp**

| id | x_d_p_action_key | size_bytes | version |
| --- | --- | --- | --- |
| REDI-0001 | REDI-0005 | 263642012 | 9 |
| REDI-0002 | REDI-0005 | 113807155 | 4 |
| REDI-0003 | REDI-0003 | 185269640 | 5 |
| REDI-0004 | REDI-0006 | 206478920 | 6 |