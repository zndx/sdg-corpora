---
chapter_id: ch_live_board_membership_4e10fa
topic_id: 159
family: 08_derived
cited_terms: ['board_membership', 'claim_basic', 'allocation_associated_with_agent']
model: engine-refine
---

Within a governance and compliance framework, every auditable object is anchored by a unique identifier that serves as the immutable reference point across all tracking, reporting, and relationship-resolution operations. These identifiers—such as `MEMB-0001` for a board membership record, `CLAI-0001` for a compliance claim, or `AGEN-0001` for an agent allocation—function as the primary keys that bind together disparate data about the same real-world entity. The identifier is the single point of truth that allows an analyst to trace a claim about model accuracy falling below its service-level agreement back through its attributes, its recorded timestamps, and any participant associations without ambiguity.

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_allocation_associated_with_agent**

| id | allocation |
| --- | --- |
| AGEN-0001 | data-ingest-queue |
| AGEN-0002 | telemetry-ingest-window |
| AGEN-0003 | cloud-vpc-subnet |
| AGEN-0004 | compute-fleet-reserve |
| AGEN-0005 | analytics-pipeline-slice |
| AGEN-0006 | prod-cpu-batch |

**t_allocation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | helm-release-controller |
| AGEN-0002 | governance-policy-engine |
| AGEN-0003 | governance-policy-engine |
| AGEN-0004 | lab-sample-tracker |
| AGEN-0005 | helm-release-controller |
| AGEN-0006 | helm-release-controller |

Attributes extend the descriptive capacity of each entity beyond its core identity by capturing typed properties in a normalized, type-safe manner. The attribute definition itself—such as `confidence` typed as `xsd:decimal`, `dimension_kind` as `xsd:string`, or `recorded_at` as `xsd:dateTime`—is declared once and then referenced across multiple value tables that segregate data by its XSD type. This type-disaggregated design means that a single entity like `CLAI-0001` can carry a decimal value of `0.443` for its confidence metric, a string value of `Dimension Kind 01` for its classification, and a datetime value of `2025-05-28T11:02:08` for its recording timestamp, each stored in its appropriately typed value table and linked back through the entity and attribute identifiers. The separation of attribute metadata from attribute values ensures that schema evolution—adding a new attribute or changing its type—does not require restructuring existing value rows.

Categories and labels provide the classification layer that enables aggregation and filtering across the governed population. A participant record identified as `MEMB-0002` carries both a human-readable label, `Has Participant Label 02`, and a categorical designation, `Has Participant Category 02`, which together support both display and analytical queries. In practice, this dual-labeling approach allows compliance dashboards to present readable participant descriptions while the underlying category values drive roll-up reports, such as counting how many board events fall under each participant category or comparing event volumes across categorical groupings.

The fact table structure captures measurable operational activity by linking an identifier to a participant and recording an event count, producing figures such as `236` events for `MEMB-0001` or `403` events for `MEMB-0002`. These event counts represent the quantitative backbone of compliance monitoring, enabling trend analysis, threshold alerting, and audit trail verification. The foreign-key relationship between the fact table's participant reference and the dimension table of participants ensures that every event count can be traced back to a classified, labeled entity, maintaining the chain of custody that auditors require.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

Relationships between governance objects are expressed through junction tables that encode a subject, a target, and a role, forming a triple that describes not just that two entities are connected but how they are connected. An allocation such as `data-ingest-queue` (`AGEN-0005`) may be associated with a resource like `helm-release-controller` (`AGEN-0004`) in the role of `observer`, while another allocation (`AGEN-0006`) shares the same target in the role of `contributor`. This subject-target-role pattern captures the nuanced permissions and responsibilities that define the operational landscape, allowing the framework to answer questions about which allocations have access to which resources and under what capacity. Historical associations are preserved separately, ensuring that the current state of relationships can be distinguished from past configurations, a critical capability for compliance investigations that require reconstructing the state of the system at a point in time.

**t_allocation_associated_with_agent__was_associated_with**

| id | allocation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | AGEN-0004 | observer |
| AGEN-0002 | AGEN-0006 | AGEN-0004 | contributor |
| AGEN-0003 | AGEN-0005 | AGEN-0005 | contributor |
| AGEN-0004 | AGEN-0002 | AGEN-0004 | observer |
| AGEN-0005 | AGEN-0003 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0002 | owner |
| AGEN-0008 | AGEN-0002 | AGEN-0001 | owner |