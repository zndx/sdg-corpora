---
chapter_id: ch_live_requirement_has_priority_00fa40
topic_id: 11
family: 03_directive_governance
cited_terms: ['requirement_has_priority', 'electricity_usage_pattern_record', 'ice_exactly_one_subject']
model: engine-refine
---

Requirements in the governance framework are modelled as typed entities whose attributes are stored in a value-type normalisation pattern. The core mapping between requirements and their assigned priorities is captured in a junction table that links each requirement—such as Latency threshold, Backup interval, Throughput minimum, and Audit log frequency—to a subject identifier, with the subject codes SUBJ-0003, SUBJ-0004, SUBJ-0002, and SUBJ-0005 respectively. The attribute schema for these priority records is declared in a separate definition table, where each attribute carries a name and an XSD type: effective_date is typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. Values for these attributes are materialised in four distinct value tables keyed by the attribute type, ensuring type safety at the storage layer. Boolean attributes such as the mandatory flag resolve to false across all four priority records PRIO-0001 through PRIO-0004; date attributes yield values ranging from 2023-04-21 to 2024-08-03; integer attributes carry values from 2 to 806; and string attributes encode values such as Encoding 01, Enforcement 02, intake form, and ja. This separation of attribute metadata from value instances permits heterogeneous typing without schema migration and supports the addition of new attribute types through value table extension rather than structural alteration.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | SUBJ-0003 |
| PRIO-0002 | Backup interval | SUBJ-0004 |
| PRIO-0003 | Throughput minimum | SUBJ-0002 |
| PRIO-0004 | Audit log frequency | SUBJ-0005 |
| PRIO-0005 | Throughput minimum | SUBJ-0007 |
| PRIO-0006 | Encryption standard | SUBJ-0003 |
| PRIO-0007 | Throughput minimum | SUBJ-0005 |
| PRIO-0008 | Fault tolerance level | SUBJ-0003 |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

Usage pattern records in the electricity domain follow a parallel normalisation strategy, with each record identified by a code such as BaseLoad-Res09, SmartMeter-8842, CommHVAC-15, and SmartMeter-8842, the latter appearing as a repeated value indicating that the same usage pattern may be referenced across multiple contexts. These records are associated with service usage categories—RuralCoopDist, DataCenterIT, IndustrialProcess, and ResidentialGeneral—through a dedicated association table that encodes the relationship with a role qualifier. The role column distinguishes between reviewer, owner, and observer, establishing that the same usage pattern may participate in multiple service category relationships with different semantic roles. For instance, the usage pattern RECO-0004 is linked to service category RECO-0004 with the role reviewer, while RECO-0001 and RECO-0006 are both associated with RECO-0001 and RECO-0006 respectively under the owner role. This role-based association model enables a single usage pattern to serve multiple service categories simultaneously, each relationship carrying its own governance semantics.

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

The correspondence between usage pattern records and tariff structures introduces an additional layer of cardinality constraint. A direct mapping table links each usage pattern to a tariff structure such as RealTimeWholesale or CriticalPeakReward, with RealTimeWholesale appearing three times across the sample records, indicating its prevalence as a default or fallback tariff. The junction table governing this relationship extends the association model with a cardinality_note column, where entries such as Cardinality Note 01 through Cardinality Note 04 provide additional constraints on the multiplicity of the relationship. Roles in this context include contributor and observer, distinguishing between entities that actively shape the tariff correspondence and those that monitor it. The subject-target pairing in this junction table—where electricity_id references the usage pattern and corresponds_to_tariff_id references the tariff structure—establishes a directed relationship with explicit role semantics and cardinality documentation, ensuring that tariff assignments are auditable and governed by defined constraints.

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

Identity and provenance are managed through the ICE (Identity Constraint Expression) framework, which enforces exactly-one subject constraints on records. The subject table maps each ICE identifier to a descriptive label—Calibration Manifest, Provenance Graph Export, Raw Observation Feed—and links it to a related priority record, with Provenance Graph Export appearing twice (SUBJ-0002 and SUBJ-0004) to indicate that the same manifest may be referenced under different identity contexts. Attributes for ICE subjects are uniformly typed as xsd:string, with attribute names including encoding, label_text, and language. Value instances for these attributes include Encoding 01, nightly summary, fr, and Encoding 04, where the language attribute fr suggests internationalisation support and the encoding attributes provide machine-readable identifiers for downstream processing. The entity_id column in the value table ties each attribute value back to its parent subject, maintaining referential integrity across the identity constraint hierarchy.

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | PRIO-0001 |
| SUBJ-0002 | Provenance Graph Export | PRIO-0008 |
| SUBJ-0003 | Raw Observation Feed | PRIO-0001 |
| SUBJ-0004 | Provenance Graph Export | PRIO-0004 |
| SUBJ-0005 | Schema Registry Entry | PRIO-0003 |
| SUBJ-0006 | Audit Trail Report | PRIO-0002 |
| SUBJ-0007 | Schema Registry Entry | PRIO-0002 |
| SUBJ-0008 | Sensor Configuration File | PRIO-0007 |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |