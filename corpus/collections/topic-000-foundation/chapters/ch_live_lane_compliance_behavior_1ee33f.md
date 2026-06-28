---
chapter_id: ch_live_lane_compliance_behavior_1ee33f
topic_id: 0
family: 08_derived
cited_terms: ['lane_compliance_behavior', 'outlier_detection_targets_dataset', 'existential_anchored_to_artifact_via_part']
model: engine-refine
---

Lane compliance behavior constitutes the foundational observational unit within the governance schema, each instance uniquely identified by an alphanumeric key such as BEHA-0001 through BEHA-0004 and classified by its operational context—whether an I-280 Express Lane, an I-70 Eastbound corridor, an SR-520 Toll segment, or a Route 128 North thoroughfare. These identifiers serve as the primary anchor for all downstream relational joins, ensuring that every behavioral observation can be traced to its originating lane classification without ambiguity. The behavioral taxonomy is further enriched through its association with the street traffic configuration to which each behavior pertains; a behavior may manifest on a Tunnel Approach Lane, an Urban Signalized Intersection, a Highway Work Zone, or a Bridge Deck Section, each environment imposing distinct operational constraints and compliance expectations. The junction table linking behaviors to street types introduces the cardinality_note attribute, which documents the nature of the multiplicity constraint governing each association—Cardinality Note 01 through Cardinality Note 04 encoding whether a given lane behavior is singularly or multiply attributable to a particular street configuration, thereby preserving referential integrity across the dimensional model.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

**t_lane_compliance_behavior_involves_operator**

| id | involves_operator |
| --- | --- |
| BEHA-0001 | Heavy Haul Supervisor |
| BEHA-0002 | Delivery Van Operator |
| BEHA-0003 | Autonomous Fleet Unit |
| BEHA-0004 | RideShare Driver |
| BEHA-0005 | RideShare Driver |
| BEHA-0006 | Logistics Coordinator |
| BEHA-0007 | Autonomous Fleet Unit |

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

**t_lane_compliance_behavior__occurs_on_street_type**

| id | lane_id | occurs_on_street_type_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| BEHA-0001 | BEHA-0003 | BEHA-0006 | observer | Cardinality Note 01 |
| BEHA-0002 | BEHA-0004 | BEHA-0002 | observer | Cardinality Note 02 |
| BEHA-0003 | BEHA-0002 | BEHA-0001 | owner | Cardinality Note 03 |
| BEHA-0004 | BEHA-0001 | BEHA-0005 | reviewer | Cardinality Note 04 |
| BEHA-0005 | BEHA-0001 | BEHA-0006 | observer | Cardinality Note 05 |
| BEHA-0006 | BEHA-0001 | BEHA-0003 | contributor | Cardinality Note 06 |
| BEHA-0007 | BEHA-0004 | BEHA-0006 | contributor | Cardinality Note 07 |
| BEHA-0008 | BEHA-0006 | BEHA-0004 | observer | Cardinality Note 08 |

Operator involvement in lane compliance events is captured through a separate dimension table that maps each behavior to a vehicle operator entity, ranging from a Heavy Haul Supervisor and a Delivery Van Operator to an Autonomous Fleet Unit and a RideShare Driver. The associative junction table between behaviors and operators introduces the role attribute, which specifies the functional capacity in which the operator participates—designated as either reviewer or owner—thereby distinguishing between entities that audit compliance outcomes and those that bear direct operational responsibility. This role distinction is critical for governance workflows, as it determines authorization boundaries and accountability chains; a Heavy Haul Supervisor acting as reviewer on BEHA-0002 exercises a different class of authority than an Autonomous Fleet Unit designated as owner on BEHA-0005. The same role attribute appears in the behavior-to-street-type junction, where it assumes values of observer, owner, and reviewer, indicating that the role dimension is a shared governance construct applied consistently across multiple association types rather than being scoped to a single relationship.

**t_lane_compliance_behavior__involves_operator**

| id | lane_id | involves_operator_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0002 | BEHA-0005 | reviewer |
| BEHA-0002 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0003 | BEHA-0005 | BEHA-0005 | owner |
| BEHA-0004 | BEHA-0002 | BEHA-0003 | owner |
| BEHA-0005 | BEHA-0003 | BEHA-0006 | owner |
| BEHA-0006 | BEHA-0003 | BEHA-0007 | contributor |
| BEHA-0007 | BEHA-0003 | BEHA-0006 | contributor |
| BEHA-0008 | BEHA-0002 | BEHA-0007 | observer |

Outlier detection and characterization are modeled through a star schema pattern, with the fact_outlier table serving as the central fact entity and dim_outlier providing the corresponding dimension attributes. Each outlier record is identified by a composite key such as DATA-0001 through DATA-0004 and linked to a specific outlier_key value—DATA-0001, DATA-0002, or DATA-0003—enabling the aggregation of repeated observations under a shared anomaly signature. The duration_seconds column records the temporal extent of each outlier event with sub-second precision, yielding values such as 3360.34 seconds for DATA-0001 and 6466.78 seconds for DATA-0002, which span approximately 56 minutes to nearly 107 minutes and reflect the varying persistence of anomalous conditions across different operational contexts. The exit_code column captures the termination or classification code associated with each outlier—values of 760, 4, 490, and 124 representing distinct resolution states or severity classifications—while the retry_count column quantifies the number of remediation attempts, ranging from 101 retries for DATA-0003 to 308 retries for DATA-0004, providing a direct measure of operational difficulty in resolving the anomalous condition.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 3360.34 | 760 | 293 |
| DATA-0002 | DATA-0001 | 6466.78 | 4 | 225 |
| DATA-0003 | DATA-0002 | 5282.09 | 490 | 101 |
| DATA-0004 | DATA-0003 | 1182.39 | 124 | 308 |
| DATA-0005 | DATA-0002 | 3041.72 | 808 | 59 |
| DATA-0006 | DATA-0005 | 3852.38 | 619 | 489 |
| DATA-0007 | DATA-0003 | 1453.07 | 682 | 1 |

The dimension table dim_outlier enriches the fact records with human-readable classification attributes: the misc column (outlier_label) assigns descriptive identifiers such as Outlier Label 01 through Outlier Label 04, while the category column (outlier_category) groups outliers into broader classification buckets—Outlier Category 01 through Outlier Category 04—enabling aggregation and trend analysis across the anomaly dataset. This separation of mutable descriptive metadata from the immutable fact measurements follows established dimensional modeling conventions, ensuring that label changes and category reclassifications do not necessitate updates to the underlying fact records. The existential anchoring mechanism, realized through the t_existential_anchored_to_artifact_via_part table, extends the governance model beyond behavioral and anomaly data by establishing traceability links between abstract governance rules and their physical or logical instantiation points. Each anchor record carries an identifier such as PART-0001 through PART-0004, an existential reference like GovernanceRule77 or ObservationDrone04, a URI pointing to the artifact's storage location—hdfs://cluster/staging, abfss://prod/silver, or s3://lake/raw—and a location attribute specifying the physical or logical deployment site, including rack-7, eu-west-3, and on-prem-dc1, thereby closing the traceability loop from abstract policy to concrete infrastructure.

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DATA-0001 | Outlier Label 01 | Outlier Category 01 |
| DATA-0002 | Outlier Label 02 | Outlier Category 02 |
| DATA-0003 | Outlier Label 03 | Outlier Category 03 |
| DATA-0004 | Outlier Label 04 | Outlier Category 04 |
| DATA-0005 | Outlier Label 05 | Outlier Category 05 |
| DATA-0006 | Outlier Label 06 | Outlier Category 06 |

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |