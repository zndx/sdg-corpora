---
chapter_id: ch_live_electricity_usage_pattern_record_e05a7d
topic_id: 186
family: 08_derived
cited_terms: ['electricity_usage_pattern_record', 'annotation_assigned_by', 'gdpr_data_subject_right']
model: engine-refine
---

Electricity usage pattern records are the operational backbone of demand characterization, tariff alignment, and compliance traceability in modern grid and retail-energy programs. A usage pattern record names a concrete consumption profile—such as BaseLoad-Res09 for a residential baseline, SmartMeter-8842 for interval-meter telemetry, or CommHVAC-15 for commercial heating and cooling load—and is addressed throughout the governance fabric by a stable identifier (for example RECO-0001 through RECO-0004). That identifier is not merely a database key; it is the durable handle by which auditors, market operators, and downstream analytics reconcile the same physical or contractual usage fact across service classifications, tariff mappings, annotation provenance, and privacy-rights enforcement. Without such identifiers, cross-system reconciliation of who observed what load under which tariff, and with what evidentiary confidence, would collapse into ambiguous string matching.

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

Each usage pattern record participates in two orthogonal classification regimes that govern how energy is priced and how obligations attach. Service usage categories situate a record within operational context: RuralCoopDist, DataCenterIT, IndustrialProcess, and ResidentialGeneral express materially different load shapes, regulatory exposure, and settlement rules. Tariff structures, by contrast, encode the commercial and market mechanism under which consumption is valued—RealTimeWholesale for volatile nodal exposure versus CriticalPeakReward for demand-response incentives. The same SmartMeter-8842 profile may appear more than once in the corpus because distinct records can share a pattern label while differing in category or tariff correspondence; governance therefore treats the identifier as authoritative and treats human-readable pattern names as descriptive aliases that must never substitute for keyed identity in compliance workflows.

Relationships between governed objects are modeled explicitly through subject–target bindings rather than implicit foreign-key convenience. In a subject–target assertion, the subject is the entity whose behavior or classification is being described—here, an electricity usage pattern record identified as electricity_id—and the target is the related entity whose definition applies, such as a service usage category or a tariff structure. Each binding carries a role that qualifies the nature of participation: an owner exercises accountable control over category assignment, a reviewer attests classification without owning it, an observer holds read-only visibility, and a contributor supplies tariff-mapping input without final pricing authority. When RECO-0004 is linked as owner to a service category while another record holds reviewer or observer roles on related edges, the resulting accountability graph answers audit questions that flat many-to-many tables cannot—who had authority, who merely witnessed, and who supplied derivative inputs.

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

Cardinality notes exist precisely because many-to-many relationships in energy compliance are rarely unconstrained. A cardinality note documents the intended multiplicity, optionality, or exceptional allowance governing a subject–target link—Cardinality Note 01 through Cardinality Note 04 in the tariff correspondence set signal that each mapping edge may be governed by distinct structural rules, such as permitting multiple wholesale correspondences for interval-metered load while restricting critical-peak mappings to a single active tariff per settlement period. Operators consult cardinality notes during data-quality review and regulatory submission to determine whether an observed graph—say, multiple RealTimeWholesale correspondences for one record—is valid by policy or signals a reconciliation defect. Ignoring cardinality annotation turns permissible modeling flexibility into undetected integrity violations.

Extensible attribute modeling separates what is being described from how it is typed and where values live. An entity is any governed object that can bear attributes: a usage pattern record, an annotation assignment, or a GDPR data subject right. An attr names a semantic property—confidence, dimension_kind, method, recorded_at on annotations; effective_date, enforcement, mandatory, priority on rights—and attr_type declares its syntactic contract using XSD-aligned types such as xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:boolean, and xsd:integer. Values themselves are stored as misc payloads in type-appropriate repositories, so a confidence of 0.167 and a recorded_at of 2025-05-21T21:38:03 are not interchangeable strings but validated facts bound to entity ASSI-0001 through attr ASSI-0001 and ASSI-0004 respectively. This pattern prevents schema drift: new attributes can be introduced without widening core tables, and validators can reject misc values that violate attr_type before they pollute audit trails.

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

**t_gdpr_data_subject_right_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0003 | true |
| RIGH-0002 | RIGH-0002 | RIGH-0003 | true |
| RIGH-0003 | RIGH-0003 | RIGH-0003 | false |
| RIGH-0004 | RIGH-0004 | RIGH-0003 | true |
| RIGH-0005 | RIGH-0005 | RIGH-0003 | true |
| RIGH-0006 | RIGH-0006 | RIGH-0003 | true |

**t_gdpr_data_subject_right_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0001 | 2025-05-21 |
| RIGH-0002 | RIGH-0002 | RIGH-0001 | 2023-03-20 |
| RIGH-0003 | RIGH-0003 | RIGH-0001 | 2023-03-03 |
| RIGH-0004 | RIGH-0004 | RIGH-0001 | 2025-02-10 |
| RIGH-0005 | RIGH-0005 | RIGH-0001 | 2023-06-13 |
| RIGH-0006 | RIGH-0006 | RIGH-0001 | 2024-07-25 |

**t_gdpr_data_subject_right_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0004 | 5 |
| RIGH-0002 | RIGH-0001 | RIGH-0005 | 122 |
| RIGH-0003 | RIGH-0002 | RIGH-0004 | 3 |
| RIGH-0004 | RIGH-0002 | RIGH-0005 | 392 |
| RIGH-0005 | RIGH-0003 | RIGH-0004 | 1 |
| RIGH-0006 | RIGH-0003 | RIGH-0005 | 97 |
| RIGH-0007 | RIGH-0004 | RIGH-0004 | 3 |
| RIGH-0008 | RIGH-0004 | RIGH-0005 | 865 |

**t_gdpr_data_subject_right_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0007 | Encoding 01 |
| RIGH-0002 | RIGH-0001 | RIGH-0002 | Enforcement 02 |
| RIGH-0003 | RIGH-0001 | RIGH-0008 | change rationale |
| RIGH-0004 | RIGH-0001 | RIGH-0009 | ja |
| RIGH-0005 | RIGH-0001 | RIGH-0006 | Scope 05 |
| RIGH-0006 | RIGH-0002 | RIGH-0007 | Encoding 06 |
| RIGH-0007 | RIGH-0002 | RIGH-0002 | Enforcement 07 |
| RIGH-0008 | RIGH-0002 | RIGH-0008 | change rationale |

Annotations close the loop between operational telemetry and legal defensibility by recording who asserted what, under which rights, and with what metadata. An annotation such as compliance_audit, telemetry_ingestion, or provenance_trace is assigned_by a grants_data_subject_right holder—RIGH-0005 or RIGH-0006 in the assignment graph—so that every compliance_audit stamp or provenance_trace lineage carries an explicit authorization chain back to GDPR-framed entitlements like Right to Withdraw Consent or California CCPA. Rights themselves are entities with their own typed attributes: mandatory true or false governs whether downstream processing must halt when a right is invoked, effective_date anchors temporal validity, and integer priority resolves conflicts when multiple rights apply to the same annotation event. Together, identifier-grounded usage pattern records, role-qualified subject–target graphs, cardinality-governed tariff correspondence, and XSD-typed attribute layers form a coherent compliance architecture in which load characterization, market pricing, provenance, and data-subject protection are queryable as first-class facts rather than inferred from undocumented joins.

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

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | RIGH-0005 |
| ASSI-0002 | telemetry_ingestion | RIGH-0006 |
| ASSI-0003 | provenance_trace | RIGH-0005 |
| ASSI-0004 | provenance_trace | RIGH-0006 |
| ASSI-0005 | source_system_sync | RIGH-0004 |
| ASSI-0006 | source_system_sync | RIGH-0004 |

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_gdpr_data_subject_right**

| id | gdpr | grants_data_subject_right |
| --- | --- | --- |
| RIGH-0001 | Right to Withdraw Consent | ASSI-0005 |
| RIGH-0002 | California CCPA | ASSI-0005 |
| RIGH-0003 | Right to Object | ASSI-0002 |
| RIGH-0004 | Right to Lodge Complaint | ASSI-0006 |
| RIGH-0005 | Right to Automated Decisions | ASSI-0002 |
| RIGH-0006 | Right to Withdraw Consent | ASSI-0006 |

**t_gdpr_data_subject_right_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RIGH-0001 | effective_date | xsd:date |
| RIGH-0002 | enforcement | xsd:string |
| RIGH-0003 | mandatory | xsd:boolean |
| RIGH-0004 | priority | xsd:integer |
| RIGH-0005 | review_cycle_days | xsd:integer |
| RIGH-0006 | scope | xsd:string |
| RIGH-0007 | encoding | xsd:string |
| RIGH-0008 | label_text | xsd:string |