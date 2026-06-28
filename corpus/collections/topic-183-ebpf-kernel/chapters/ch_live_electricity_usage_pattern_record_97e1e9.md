---
chapter_id: ch_live_electricity_usage_pattern_record_97e1e9
topic_id: 183
family: 08_derived
cited_terms: ['electricity_usage_pattern_record', 'policy_subclass', 'log_within_span_context']
model: engine-refine
---

Electricity usage pattern records serve as the foundational entities for tracking how power consumption is characterized and classified across diverse operational contexts. Each record carries a unique identifier—such as RECO-0001 through RECO-0004—and is associated with a descriptive usage pattern label like BaseLoad-Res09, SmartMeter-8842, or CommHVAC-15, which encodes the measurement methodology and equipment profile. These records do not exist in isolation; they are systematically linked to service usage categories that define the end-use sector. A pattern such as BaseLoad-Res09 maps to the ResidentialGeneral service category, while SmartMeter-8842 corresponds to DataCenterIT, and CommHVAC-15 aligns with IndustrialProcess. The RuralCoopDist category similarly appears as a service classification for specific consumption profiles. These associations are mediated through a junction table that captures not only the subject-to-target linkage—where the usage pattern record acts as the subject and the service category as the target—but also assigns a role to each relationship, designating entities as owner, reviewer, or observer. This role-based relationship model ensures that accountability and access semantics are explicit in every association.

**t_electricity_usage_pattern_record**

| id | usage_pattern_record |
| --- | --- |
| RECO-0001 | BaseLoad-Res09 |
| RECO-0002 | SmartMeter-8842 |
| RECO-0003 | CommHVAC-15 |
| RECO-0004 | SmartMeter-8842 |
| RECO-0005 | LoadProfile-77B |
| RECO-0006 | ResNight-22 |

**t_electricity_usage_pattern_record_records_service_category**

| id | records_service_category |
| --- | --- |
| RECO-0001 | RuralCoopDist |
| RECO-0002 | DataCenterIT |
| RECO-0003 | IndustrialProcess |
| RECO-0004 | ResidentialGeneral |
| RECO-0005 | MunicipalLighting |
| RECO-0006 | MunicipalLighting |

**t_electricity_usage_pattern_record__records_service_category**

| id | electricity_id | records_service_category_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0004 | RECO-0006 | reviewer |
| RECO-0002 | RECO-0001 | RECO-0004 | owner |
| RECO-0003 | RECO-0006 | RECO-0001 | observer |
| RECO-0004 | RECO-0006 | RECO-0006 | owner |
| RECO-0005 | RECO-0005 | RECO-0004 | observer |
| RECO-0006 | RECO-0001 | RECO-0001 | observer |
| RECO-0007 | RECO-0006 | RECO-0003 | owner |
| RECO-0008 | RECO-0004 | RECO-0005 | contributor |

**t_electricity_usage_pattern_record_corresponds_to_tariff**

| id | corresponds_to_tariff |
| --- | --- |
| RECO-0001 | RealTimeWholesale |
| RECO-0002 | RealTimeWholesale |
| RECO-0003 | CriticalPeakReward |
| RECO-0004 | RealTimeWholesale |
| RECO-0005 | RealTimeWholesale |
| RECO-0006 | BasicServicePlan |
| RECO-0007 | TieredResidential |
| RECO-0008 | RealTimeWholesale |

**t_electricity_usage_pattern_record__corresponds_to_tariff**

| id | electricity_id | corresponds_to_tariff_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | RECO-0002 | contributor | Cardinality Note 01 |
| RECO-0002 | RECO-0004 | RECO-0001 | contributor | Cardinality Note 02 |
| RECO-0003 | RECO-0004 | RECO-0008 | observer | Cardinality Note 03 |
| RECO-0004 | RECO-0001 | RECO-0003 | observer | Cardinality Note 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | observer | Cardinality Note 05 |
| RECO-0006 | RECO-0005 | RECO-0001 | contributor | Cardinality Note 06 |
| RECO-0007 | RECO-0006 | RECO-0005 | observer | Cardinality Note 07 |
| RECO-0008 | RECO-0006 | RECO-0001 | reviewer | Cardinality Note 08 |

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

Tariff structure associations follow an analogous pattern, connecting usage patterns to the pricing mechanisms that govern their billing. Records such as RECO-0001, RECO-0002, and RECO-0004 all correspond to the RealTimeWholesale tariff structure, while RECO-0003 is linked to CriticalPeakReward. The junction table governing these associations introduces a cardinality note alongside the role attribute, allowing the system to express not just who plays what part in the relationship but also the multiplicity constraints—Cardinality Note 01 through Cardinality Note 04—under which the association operates. Roles in this context include contributor and observer, reflecting the different ways a usage pattern may participate in a tariff arrangement. The cardinality notes provide operational granularity, enabling the system to distinguish between one-to-one mappings and scenarios where a single usage pattern may be associated with multiple tariff structures under varying conditions.

Governance of these operational records is enforced through a policy subclass framework that defines the rules and constraints applicable to different data domains. Policies such as the Telemetry Privacy Standard, Provenance Directive, Data Retention Policy, and Metadata Governance each govern specific infrastructure components—Data Lakes, Research Archives, Sensor Networks, and API Gateways respectively. The policy attributes are typed and stored in a flexible attribute-value architecture: the effective_date attribute uses the xsd:date type with values like 2023-01-31 and 2024-06-17; the enforcement attribute is an xsd:string; the mandatory attribute is an xsd:boolean with values true or false; and the priority attribute is an xsd:integer with values ranging from 1 to 958. This type-dispatched storage pattern separates values by their XML Schema type into dedicated tables, ensuring type safety while preserving schema flexibility for evolving policy requirements.

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

The attribute-value architecture extends across multiple value types, each stored in its own table keyed by a composite of entity and attribute identifiers. Boolean values for the mandatory attribute appear as false for the Telemetry Privacy Standard and true for the Provenance Directive and Data Retention Policy. Integer priority values span a wide range, with the Telemetry Privacy Standard assigned a priority of 1 and the Provenance Directive reaching 958, reflecting the relative importance assigned to each policy. String-valued attributes capture enforcement details such as "Enforcement 02" and "Encoding 01", alongside operational metadata like "nightly summary" and locale codes such as "fr". This multi-table value storage approach allows the system to accommodate heterogeneous attribute types without requiring schema migrations when new attribute types are introduced.

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

Observability and auditability are maintained through a logging infrastructure organized within span contexts. Log files such as cache-eviction.out, batch-scheduler.log, and disk-io.trace are associated with operational spans including user-session-4492, us-east-1-cluster, ml-inference-run, and warehouse-replication. The relationship between logs and span contexts is again expressed through a role-bearing junction table, where roles like contributor and observer indicate the nature of each log's participation within a given span. This mirrors the relationship model used for usage patterns and service categories, establishing a consistent semantic framework across the entire data model. The identifier namespace is partitioned by domain—RECO for usage records, POLI for policies, and CONT for context—ensuring unambiguous reference while maintaining a uniform structural pattern for all entity types and their relationships.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |