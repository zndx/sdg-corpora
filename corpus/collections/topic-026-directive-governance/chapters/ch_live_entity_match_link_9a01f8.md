---
chapter_id: ch_live_entity_match_link_9a01f8
topic_id: 26
family: 07_long_tail
cited_terms: ['entity_match_link', 'entity_type_belongs_to', 'entomological_surveillance_record']
model: engine-refine
---

Entity-centric governance rests on the premise that compliance evidence is never free-floating: every assertion must be anchored to a identifiable thing in the operational world. An entity is any governed object whose provenance, classification, or conformance must be demonstrated—a lab instrument identified as SN-4491, a sample batch SB-2214, a dataset at version v4.2.1, or a governance policy DOC-992. Infrastructure entities such as edge_gateway_12 and sensor_node_47 participate in the same model. What makes these objects durable across audits, lineage queries, and cross-system reconciliation is the identifier: an immutable surrogate key (LINK-0001, BELO-0001, RECO-0001) that survives renaming, rehosting, and schema evolution. Identifiers do not replace human-readable labels; they guarantee that when an auditor asks whether “that instrument” still satisfies its reference match three years later, the answer refers to the same logical record, not merely a string that happened to look similar at capture time.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

Relationships between entities are first-class facts, not incidental join columns. A match link asserts that one entity corresponds to another under a defined conformance regime—for example, that Lab instrument SN-4491 matches Reference standard RS-004, or that Governance policy DOC-992 matches Standard template ST-099. A parallel belongs-to pattern classifies instances under type assertions: edge_gateway_12 as an IoT Edge Device, sensor_node_47 under both Message Broker Topic and Data Quality Rule depending on analytical context. These patterns embody the associated_with and realizes semantics at the operational layer. Associated_with captures co-occurrence or contextual coupling—what observational or compliance record is situated alongside what other governed object—while realizes names the manifestation or operational outcome a record substantiates. In the entomological fact grain, associated_with_key RECO-0001 and realizes_key RECO-0002 tie a counted observation to dimensional meanings without collapsing distinct semantic roles into a single undifferentiated link.

Attributes decorate relationships with typed, queryable metadata rather than burying nuance in opaque prose. Each attr is a named property—confidence, dimension_kind, method, recorded_at—whose attr_type declares how values must be interpreted and stored. Typing against XSD primitives (xsd:decimal, xsd:string, xsd:dateTime) is not pedantry; it enforces validation, enables aggregate analytics, and prevents category errors that invalidate audit trails. A confidence score stored as xsd:decimal (0.249 on one match link, 0.772 on another) can be thresholded in control dashboards; dimension_kind as xsd:string (“Dimension Kind 01”) supports faceted reporting; recorded_at as xsd:dateTime (2025-02-02T03:38:54 versus 2023-10-04T15:34:58) establishes temporal precedence when multiple assertions compete. The misc designation for concrete stored values—whether a decimal measurement, a varchar encoding label such as “Encoding 02,” an audit excerpt, or a locale tag like es—signals that the payload is domain data carried in a generic value column, interpreted only in light of its attr and attr_type pairing.

Category supplies the taxonomic spine that keeps dimensional vocabulary governable at scale. On the realizes and associated_with axes, category partitions labels into controlled families—Realizes Category 01 through 04, Associated With Category 01 through 04—so that downstream metrics roll up consistently even when surface labels differ. A realizes_label of “Realizes Label 02” and an associated_with_label of “Associated With Label 03” are human-facing descriptors; their categories determine which control frameworks, retention policies, or escalation paths apply. Without category discipline, event_count totals become misleading: the same integer might mix qualitatively different phenomena. With it, a count of 485 events associated with RECO-0001 under Associated With Category 01 can be compared fairly against 49 events realizing RECO-0004 under Realizes Category 04, because both figures share explicit semantic envelopes.

Event_count translates decorated relationships into measurable operational signal. In the entomological fact pattern, counts of 311, 166, 49, and 485 quantify how often a given realizes–associated_with pairing occurred in the observation stream—not as a vague “activity level,” but as an auditable frequency tied to dimensional keys. Analysts use these counts to detect drift: a sudden drop from hundreds of events to dozens may indicate sensor degradation, policy change, or classification error rather than a true ecological shift. Because each fact row binds realizes_key and associated_with_key independently (RECO-0002 realizing RECO-0005 while associated with RECO-0001, or RECO-0004 appearing in both roles across rows), the model preserves asymmetry that many-to-many summaries would flatten. The count remains interpretable only when identifiers, attrs, and categories remain intact through the pipeline.

**fact_entomological**

| id | realizes_key | associated_with_key | event_count |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0002 | RECO-0001 | 311 |
| RECO-0002 | RECO-0005 | RECO-0005 | 166 |
| RECO-0003 | RECO-0004 | RECO-0003 | 49 |
| RECO-0004 | RECO-0004 | RECO-0001 | 485 |
| RECO-0005 | RECO-0006 | RECO-0001 | 380 |
| RECO-0006 | RECO-0003 | RECO-0005 | 490 |
| RECO-0007 | RECO-0004 | RECO-0007 | 321 |
| RECO-0008 | RECO-0002 | RECO-0003 | 179 |

In practice, these constructs interlock into a defensible compliance narrative. An auditor tracing Sample batch SB-2214 follows match link LINK-0002 through its confidence (0.772), method string, and recorded_at timestamp to Validation suite VS-605, while parallel belongs-to assertions explain how sensor_node_47 participates in messaging and quality-rule contexts with their own confidence scores and nightly-summary misc values. Dimensional lookups enrich raw facts so that associated_with and realizes are never opaque foreign keys: they resolve to labeled, categorized meanings suitable for committee review. The architecture’s strength is separation of concerns—entities for identity, typed attrs for evidentiary detail, categories for policy alignment, event_count for scale—without sacrificing joinability. Teams that treat identifiers as contracts, attr_types as enforcement boundaries, and realizes versus associated_with as distinct semantic commitments gain a knowledge layer that survives re-platforming and satisfies the evidentiary standard that governance frameworks demand: every number, date, and label must be traceable to what it is about, how it was asserted, and why it matters.

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | IoT Edge Device |
| BELO-0002 | sensor_node_47 | Message Broker Topic |
| BELO-0003 | governance_policy_fin | Cloud Storage Bucket |
| BELO-0004 | sensor_node_47 | Data Quality Rule |
| BELO-0005 | edge_gateway_12 | Network Telemetry |
| BELO-0006 | edge_gateway_12 | Data Quality Rule |
| BELO-0007 | ml_feature_store_prod | Message Broker Topic |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

**dim_realizes**

| id | realizes_label | realizes_category |
| --- | --- | --- |
| RECO-0001 | Realizes Label 01 | Realizes Category 01 |
| RECO-0002 | Realizes Label 02 | Realizes Category 02 |
| RECO-0003 | Realizes Label 03 | Realizes Category 03 |
| RECO-0004 | Realizes Label 04 | Realizes Category 04 |
| RECO-0005 | Realizes Label 05 | Realizes Category 05 |
| RECO-0006 | Realizes Label 06 | Realizes Category 06 |

**dim_associated_with**

| id | associated_with_label | associated_with_category |
| --- | --- | --- |
| RECO-0001 | Associated With Label 01 | Associated With Category 01 |
| RECO-0002 | Associated With Label 02 | Associated With Category 02 |
| RECO-0003 | Associated With Label 03 | Associated With Category 03 |
| RECO-0004 | Associated With Label 04 | Associated With Category 04 |
| RECO-0005 | Associated With Label 05 | Associated With Category 05 |
| RECO-0006 | Associated With Label 06 | Associated With Category 06 |
| RECO-0007 | Associated With Label 07 | Associated With Category 07 |
| RECO-0008 | Associated With Label 08 | Associated With Category 08 |