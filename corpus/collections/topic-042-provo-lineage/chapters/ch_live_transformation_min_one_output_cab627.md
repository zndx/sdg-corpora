---
chapter_id: ch_live_transformation_min_one_output_cab627
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_min_one_output', 'flood_defence_condition_characterisation', 'schemaorg_review_author']
model: engine-refine
---

An identifier is the stable, auditable handle by which every governed artefact is referenced across transformation pipelines, flood-defence condition assessments, and metadata registries. Whether denoted OUTP-0001 for a normalization transformation, CHAR-0003 for a cross-sensor calibration characterisation, or AUTH-0002 for a LocalBusiness review author, the identifier does not merely label a row; it binds provenance, permits cross-table reconciliation, and ensures that downstream validation can retrieve the same logical object irrespective of storage partition or export format. In transformation governance, identifiers on outputs (OUTP-0001 through OUTP-0004) anchor both the transformation definition and its declared output datasets—parsed access logs, curated events tables, standardized inventory indices—so that lineage queries can be answered without inferring identity from descriptive text alone.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Person | James Wilson |
| AUTH-0002 | LocalBusiness | Michael Brown |
| AUTH-0003 | SoftwareApplication | Jane Doe |
| AUTH-0004 | Event | Sarah Miller |
| AUTH-0005 | Place | Jane Doe |
| AUTH-0006 | SoftwareApplication | Robert Chen |

Entity denotes the thing whose attributes are recorded, typed, and valued; in the Schema.org review-author register, each entity (AUTH-0001 through AUTH-0004) corresponds to a concrete review participant mapped to a Schema.org class—Person, LocalBusiness, SoftwareApplication, Event—and a named individual such as James Wilson or Jane Doe. Attributes (attr) name the governed properties attached to an entity: checksum, created_date, identifier, license. Each attr is not free text; it is constrained by attr_type, which declares the semantic and syntactic contract under which values may be asserted. Thus created_date is bound to xsd:date, checksum and license to xsd:string, and identifier to the specialised cco:DesignativeICE type, signalling that this field participates in a designative identification scheme rather than a generic character string. The separation of attr from attr_type is foundational: the name states what is being described; the type states how descriptions may be validated, compared, and exchanged.

**t_schemaorg_review_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |

**t_schemaorg_review_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 103 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 471 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 5 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 402 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 1 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 318 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 3 |

**t_schemaorg_review_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 1a4b6c2d |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | ref-8842 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | CC-BY-4.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | application/xml |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | data-engineering |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Misc carries the instantiated value of an attribute for a given entity, partitioned by representation so that integrity checks remain type-appropriate. For AUTH-0001, misc appears as a varchar checksum 1a4b6c2d, a designative identifier ref-8842, license CC-BY-4.0, and deployment tag on-prem-dc1; for AUTH-0002, misc includes integer counts 103 and 471 alongside dates 2024-11-14. The same attr_id (AUTH-0002 for created_date) yields distinct misc values across entities—2025-02-16, 2024-11-14, 2023-06-05, 2023-01-18—demonstrating that governance records are entity-specific assertions, not global constants. Compliance depends on this tripartite structure: entity identifies the bearer, attr names the obligation or descriptor, misc furnishes the evidence of fulfilment.

Subject and target formalise directed relationships between governed objects, while role qualifies the nature of participation. In the transformation-to-output_dataset linkage, the subject is the transformation (OUTP-0006 for three outputs, OUTP-0003 for one), the target is the output_dataset identity (OUTP-0003, OUTP-0005, OUTP-0001, OUTP-0003), and role distinguishes reviewer from contributor from observer. A single subject transformation—OUTP-0006 performing data normalization—may therefore relate to multiple targets with differentiated roles: OUTP-0001 as reviewer over parsed access logs, OUTP-0002 and OUTP-0003 as contributors to curated events tables. This pattern prevents ambiguous many-to-many graphs: every edge is typed, every participant's accountability is explicit, and audit trails can determine who observed, who contributed, and who held review authority without reconstructing intent from co-occurrence alone.

Flood-defence condition characterisation names the methodological stance by which asset state is inferred and reported. The register records four distinct characterisations—ExpertReviewPanel, GroundTruthSampling, CrossSensorCalibration, UncertaintyPropagated—each identified (CHAR-0001 through CHAR-0004) and each optionally coupled to earth observation data and to a validation process. Earthobservationdata specifies the remote-sensing or geospatial source implicated in the characterisation: CopernicusDEM, Sentinel1GRD, LiDARBathymetry. Validationprocess names the evidentiary procedure used to corroborate or bound the characterisation: HistoricalBaselineMatch, GroundTruthSampling, SeineBreach2016. Where CHAR-0002 employs GroundTruthSampling as both characterisation method and validation process with Sentinel1GRD, the framework makes method and verification legible as separate commitments; where CHAR-0003 and CHAR-0004 pair LiDARBathymetry with SeineBreach2016, the same observational stack is stress-tested against a documented historical breach event rather than against contemporaneous field samples alone.

Together, identifier, entity, attr, attr_type, and misc constitute the metadata compliance substrate; subject, target, and role constitute the relational governance substrate; and flooddefenceconditioncharacterisation, earthobservationdata, and validationprocess constitute the domain-specific assurance substrate for geospatial flood infrastructure. Transformation records (data normalization, format conversion) and their output datasets remain traceable only when identifiers propagate through all three substrates without breakage. An operational guide grounded in this model therefore treats every assertion as a typed edge or a typed value, every participant as a role-bound relationship, and every flood-defence assessment as a characterisation explicitly tied to the earth observation inputs and validation processes that justify its publication. Deviations—misc values that contravene attr_type, targets without declared subjects, or characterisations lacking validationprocess—are not mere data-quality defects; they are compliance failures because they remove the evidential chain on which authorised release depends.

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |