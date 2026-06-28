---
chapter_id: ch_live_profile_has_cardinality_708cef
topic_id: 30
family: 02_observation_measurement
cited_terms: ['profile_has_cardinality', 'two_disjoint_artifacts', 'kernelhook_in_kernel_module']
model: engine-refine
---

Identifiers serve as the immutable anchors of any governed data fabric, uniquely distinguishing entities across the entire schema. An identifier such as `CARD-0001` or `ARTI-0001` functions as a primary key that binds together disparate attribute-value pairs, cardinality measurements, and provenance metadata into a single coherent record. Entities—whether they represent software artifacts like `etl-job` and `config-bundle`, kernel modules such as `ntoskrnl.exe` and `nvlddmkm.sys`, or abstract cardinality constructs—are always addressed through these identifiers, which appear as foreign keys in value tables to establish referential integrity. The entity identifier `ARTI-0001`, for instance, simultaneously anchors a value of `9d2b7a16` for a string attribute, a date value of `2023-05-13`, and integer measurements of `36` and `5`, demonstrating how a single entity can carry heterogeneous attribute types while remaining traceable through one key.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |

Attributes and their declared types form the schema's descriptive layer, specifying both what is measured and in what format. Attribute names such as `checksum`, `created_date`, `identifier`, and `license` are paired with type declarations drawn from XML Schema and custom ontologies—`xsd:string` for textual values like `MPL-2.0`, `xsd:date` for temporal values like `2024-02-28`, and `cco:DesignativeICE` for designative identifiers. This type discipline is enforced through separate value tables partitioned by data type: `t_two_disjoint_artifacts_val_varchar` stores string values including the UUID `urn:uuid:9f2a` and the region `ap-south-2`, `t_two_disjoint_artifacts_val_date` holds date values, and `t_two_disjoint_artifacts_val_int` contains integer measurements such as `462` and `3`. The separation by type ensures that each attribute's value is validated against its declared schema, preventing type mismatches across the entity-attribute-value model.

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

Cardinality, category, confidence, and uncertainty constitute the quantitative assessment layer, providing a structured mechanism for evaluating the reliability and scope of measured properties. Cardinality records—identified by keys like `CARD-0001` through `CARD-0004`—carry descriptive labels (`Cardinality Label 01`, `Cardinality Label 02`) and are classified into categories (`Cardinality Category 01` through `Cardinality Category 04`). Each cardinality measurement is accompanied by a confidence score ranging from `0.226` to `0.994`, indicating the degree of certainty in the assessment, and an uncertainty value spanning `284.36` to `622.09`, quantifying the margin of error. The measured value itself—such as `728.94` or `380.57`—represents the point estimate, while the confidence and uncertainty fields together define the statistical bounds within which the estimate is considered valid. This four-field structure (cardinality key, confidence, uncertainty, value) enables downstream consumers to weight measurements appropriately and apply confidence thresholds when making governance decisions.

Licensing and location provide the compliance and operational context necessary for artifact governance. License declarations such as `CC-BY-4.0`, `GPL-3.0`, `MIT`, and `MPL-2.0` are stored as attributes of entities and kernel module mappings, establishing the legal framework under which each component may be used, modified, or redistributed. Location metadata—values including `zone-b`, `us-east-1`, `eu-west-3`, and `ap-south-2`—anchors artifacts to specific geographic or logical regions, enabling data residency compliance and operational routing. In the kernel hook mapping table, each relationship between a hook such as `PsSetCreateProcessNotify_Monitor` and a module like `ntoskrnl.exe` carries both a license and a location, ensuring that the provenance and deployment context of kernel-level components are fully documented and auditable. Together, these fields transform raw entity-attribute data into a governance-ready record that satisfies regulatory requirements for software composition analysis and infrastructure compliance.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |