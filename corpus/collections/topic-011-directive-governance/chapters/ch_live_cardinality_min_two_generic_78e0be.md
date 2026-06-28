---
chapter_id: ch_live_cardinality_min_two_generic_78e0be
topic_id: 11
family: 01_foundation
cited_terms: ['cardinality_min_two_generic', 'census_data_collection_process', 'census_reporting_event']
model: engine-refine
---

Census data governance rests on a structured taxonomy of collection processes, each of which bundles a screening activity with a representative survey to produce authoritative reporting events. A collection process such as the UK National Census pairs an Initial Contact Verification screening with an Agricultural Census Module survey, while the Australia Census couples a Household Mapping Exercise with a Labor Force Participation Survey. The Brazil IBGE Count and the Japan Ministry Census follow the same pattern, combining Preliminary Demographic Sampling and Coverage Measurement Study screenings, respectively, with Disability Assessment Survey and Migrant Tracking Survey instruments. This tripartite structure—process, screening, survey—ensures that every census operation can be traced from its methodological design through to the data it yields, providing an auditable chain of custody for national statistics.

**t_census_data_collection_process**

| id | census_data_collection_process | involves_screening | includes_survey |
| --- | --- | --- | --- |
| PROC-0001 | UK National Census | Initial Contact Verification | Agricultural Census Module |
| PROC-0002 | Australia Census | Household Mapping Exercise | Labor Force Participation Survey |
| PROC-0003 | Brazil IBGE Count | Preliminary Demographic Sampling | Disability Assessment Survey |
| PROC-0004 | Japan Ministry Census | Coverage Measurement Study | Migrant Tracking Survey |

**t_census_reporting_event**

| id | census_reporting_event | occurs_during_period | tracks_sector | published_on_date |
| --- | --- | --- | --- | --- |
| EVEN-0001 | Eurostat Population Census | Fiscal Year 2022-2023 | Youth Employment | 2024-01-22 |
| EVEN-0002 | French INSEE Census | Summer 2020 Collection | Microfinance Services | 2019-08-05 |
| EVEN-0003 | Eurostat Population Census | Fiscal Year 2022-2023 | Sustainable Ag | 2021-12-18 |
| EVEN-0004 | UK National Statistics Census | Q3 2021 Fieldwork Window | Elder Care | 2021-04-15 |
| EVEN-0005 | 2020 US Decennial Census | Q1 2023 Validation Period | Public Transit | 2023-10-01 |
| EVEN-0006 | Brazil IBGE Census | April 2020 Counting Period | Digital Literacy | 2023-06-28 |
| EVEN-0007 | Australian Bureau Census | Autumn 2021 Household Survey | Healthcare Access | 2024-01-22 |
| EVEN-0008 | Japan Statistics Census | Biennial 2018-2020 Cycle | Healthcare Access | 2023-10-01 |

Reporting events sit at the output end of this chain, capturing discrete instances of census publication that are anchored to a temporal window, a social enterprise sector, and a specific date. The Eurostat Population Census event, for instance, occurred during the Fiscal Year 2022-2023, tracked the Youth Employment sector, and was published on 2024-01-22. A second Eurostat Population Census event in the same dataset covers the same fiscal period but targets Sustainable Ag and carries a publication date of 2021-12-18. The French INSEE Census event took place during the Summer 2020 Collection, focused on Microfinance Services, and was published on 2019-08-05, while the UK National Statistics Census event unfolded within the Q3 2021 Fieldwork Window, tracked Elder Care, and appeared on 2021-04-15. These events serve as the primary interface between statistical production and public accountability, each one a timestamped commitment to transparency about what was measured, for whom, and when.

The attribute layer provides the metadata scaffolding that makes reporting events machine-readable and interoperable. Attributes such as encoding, label_text, and language are declared with a name and a type—in this case, all three are typed as xsd:string, indicating that their values are plain text conforming to the XML Schema standard. This type discipline ensures that downstream consumers of census metadata can parse and validate attribute values without ambiguity. The attribute definitions are stored separately from their values, a design choice that decouples schema evolution from data entry and allows the same attribute to be reused across multiple reporting events without duplication.

**t_census_reporting_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | encoding | xsd:string |
| EVEN-0002 | label_text | xsd:string |
| EVEN-0003 | language | xsd:string |

Attribute values are materialized through an entity-attribute-value mapping that ties each attribute to a specific reporting event and assigns it a concrete value. The Eurostat Population Census event EVEN-0001, for example, carries an encoding value of "Encoding 01", a label_text of "pre-release note", and a language value of "fr", indicating that this particular reporting event was prepared in French with a specific encoding scheme. A second value record for EVEN-0001 assigns the encoding "Encoding 04" to the French INSEE Census event EVEN-0002, demonstrating that encoding attributes are scoped to individual events rather than shared globally. This granular assignment model supports multilingual census outputs and allows each reporting event to carry its own set of technical annotations without imposing a one-size-fits-all schema.

**t_census_reporting_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | Encoding 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0002 | pre-release note |
| EVEN-0003 | EVEN-0001 | EVEN-0003 | fr |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | Encoding 04 |
| EVEN-0005 | EVEN-0002 | EVEN-0002 | audit excerpt |
| EVEN-0006 | EVEN-0002 | EVEN-0003 | de |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | Encoding 07 |
| EVEN-0008 | EVEN-0003 | EVEN-0002 | nightly summary |

Underpinning the entire architecture is a cardinality constraint framework that enforces minimum relationship requirements between system components. Records such as GENE-0001 and GENE-0003 carry an AtLeastTwo cardinality constraint, mandating that the associated entity maintain connections to at least two related components—PrimaryCache in the case of GENE-0001 and GENE-0003, and TargetSystem for GENE-0003. The record GENE-0002 uses the MinTwoRequired constraint to enforce a similar minimum against PrimaryCache, while GENE-0004 also applies AtLeastTwo to a ReplicaNode. These constraints are not merely descriptive; they are operational rules that prevent partial or orphaned configurations in the data pipeline, ensuring that every critical component has the redundancy or interconnectivity required for reliable census data processing.

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | PrimaryCache |
| GENE-0002 | MinTwoRequired | PrimaryCache |
| GENE-0003 | AtLeastTwo | TargetSystem |
| GENE-0004 | AtLeastTwo | ReplicaNode |
| GENE-0005 | DualAssociation | MasterNode |
| GENE-0006 | TwinConstraint | GatewayHub |