---
chapter_id: ch_live_schemaorg_review_target_328393
topic_id: 24
family: 07_long_tail
cited_terms: ['schemaorg_review_target', 'dataset_was_derived_from', 'soc2_processing_integrity']
model: engine-refine
---

In the architecture of data governance, the identifier serves as the immutable anchor, a unique key that stabilizes an entity across the shifting dependencies of a complex ecosystem. Whether designating a technical asset such as `TARG-0001` or a lineage record such as `FROM-0002`, these identifiers provide the necessary granularity to trace an object from its origin to its operational deployment. A `SoftwareApplication` mapped to a `GraphQLEndpoint` under the identifier `TARG-0001` is structurally distinct from a `Person` or a `Service`, yet the identifier ensures that each entity remains a discrete, addressable node within the broader relational graph. This precision is equally critical in data lineage, where identifiers like `FROM-0001` and `FROM-0004` distinguish between the derivation of `iot_edge_logs` and the archival restoration of `patient_demographics_clean`, preventing conflation between disparate data streams and ensuring that every asset can be uniquely referenced during an audit.

The relational dynamic between subject and target establishes the precise lineage and dependency of these assets, defining not merely what an object is, but how it interacts with its environment. In the context of data derivation, the subject represents the derived entity—such as `market_index_history` or `patient_demographics_clean`—while the target denotes the source material, ranging from a `raw_sensor_stream` to a `regulatory_filing_pdf`. This subject-target coupling is not arbitrary; it reflects a strict causal chain where the integrity of the target directly influences the validity of the subject. For instance, the transition from a `warehouse_staging_area` to a structured dataset requires an explicit mapping, ensuring that every transformation is auditable and that the provenance of sensitive information, such as patient demographics, can be rigorously verified against its original source.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

A relationship is not merely a structural link but a governance directive defined by the role attribute, which assigns accountability and access rights within the subject-target pair. The role—whether `owner`, `contributor`, `reviewer`, or `observer`—transforms a passive connection into an active compliance mechanism. In SOC2 processing integrity frameworks, for example, the relationship record `INTE-0004` captures the governance dynamic where `Nexus Cloud Services` acts as a `reviewer` of a `report generation` domain, while `GlobalPay Systems` assumes the role of `reviewer` for `customer onboarding` processes. Similarly, in technical asset management, the relationship `TARG-0001` designates a `Service` as the `owner` of an `AzureBlobStorage` target, whereas a `PostgreSQLTable` is managed by a `contributor`. These roles ensure that every interaction is governed by a clear policy, delineating who is responsible for the maintenance of the target and who is authorized to modify the subject.

This tripartite structure—identifier, subject, target, and role—transcends individual domains, providing a universal syntax for compliance and technical mapping across heterogeneous systems. Whether governing the processing integrity of a `Pinnacle SaaS Platform` against a `report generation` domain or mapping a `SoftwareApplication` to a `GraphQLEndpoint`, the underlying logic remains consistent. The system accommodates complex, multi-faceted relationships where a single entity, such as `Quantum Retail Group`, may hold multiple roles across different targets, acting as an `owner` in one context and a `reviewer` in another. By enforcing this rigorous relational schema, organizations can maintain a granular, evidence-based record of their data assets, ensuring that every `archival_tape_restore` or `customer onboarding` workflow is backed by a clear chain of custody and unambiguous ownership.

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |