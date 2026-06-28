---
chapter_id: ch_live_universal_generic_97dfb9
topic_id: 61
family: 01_foundation
cited_terms: ['universal_generic', 'subclass_disjoint_from_artifact', 'home_electricity_reduction_program']
model: engine-refine
---

Within the governance framework, identifiers serve as the immutable anchors that bind every relational construct to a verifiable entity. The universal taxonomy assigns codes such as GENE-0001 through GENE-0004 to abstract categories—Governance Framework, Taxonomy Node, Event Category, Validation Pattern—each of which may be associated with downstream formats like CSV Stream, Parquet Format, Binary Blob, or YAML Config. Disjoint artifact classification operates in parallel: identifiers ARTI-0001 through ARTI-0004 are each constrained to a single exclusive category, whether lab-assay-protocol, sensor-telemetry-stream, or telemetry-metadata-index, ensuring that no artifact straddles mutually incompatible domains. These identifier tables establish the controlled vocabulary and partitioning logic that the operational tables later instantiate.

**t_universal_generic**

| id | universal | related |
| --- | --- | --- |
| GENE-0001 | Governance Framework | CSV Stream |
| GENE-0002 | Taxonomy Node | Parquet Format |
| GENE-0003 | Event Category | Binary Blob |
| GENE-0004 | Validation Pattern | YAML Config |
| GENE-0005 | Compliance Rule | MessagePack |
| GENE-0006 | Taxonomy Node | XML Document |
| GENE-0007 | Compliance Rule | Parquet Format |
| GENE-0008 | Data Standard | JSON Schema |

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |

The operational heart of the system is the reduction program, a structured initiative designed to influence household electricity consumption. Programs such as the EcoHome Initiative, SmartThermostat Rebate, PowerDown Project, and NetZero Home are each assigned a unique program identifier (PROG-0001 through PROG-0004) and may address one or more targeted usage metrics—Seasonal Peak, Daily kWh Consumption, Base Load Baseline. A program's relationship to a usage metric is not merely declarative; it is mediated through a junction table that records the subject (the home or program entity), the target (the usage metric), and the role the subject plays with respect to that metric. In practice, PROG-0001 may act as owner of the Daily kWh Consumption metric while PROG-0005 assumes a reviewer role over the same target, and PROG-0006 observes Base Load Baseline. The role column—owner, reviewer, observer—encodes the nature of the subject's engagement with the target, distinguishing between authoritative control, evaluative oversight, and passive monitoring.

**t_home_electricity_reduction_program**

| id | reduction_program |
| --- | --- |
| PROG-0001 | EcoHome Initiative |
| PROG-0002 | SmartThermostat Rebate |
| PROG-0003 | PowerDown Project |
| PROG-0004 | NetZero Home |
| PROG-0005 | DemandResponse Trial |
| PROG-0006 | SmartThermostat Rebate |

**t_home_electricity_reduction_program__targets_participant**

| id | home_id | targets_participant_id | role |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0001 | PROG-0007 | contributor |
| PROG-0002 | PROG-0003 | PROG-0002 | contributor |
| PROG-0003 | PROG-0002 | PROG-0007 | reviewer |
| PROG-0004 | PROG-0001 | PROG-0003 | reviewer |
| PROG-0005 | PROG-0006 | PROG-0004 | contributor |
| PROG-0006 | PROG-0003 | PROG-0007 | observer |
| PROG-0007 | PROG-0001 | PROG-0002 | contributor |
| PROG-0008 | PROG-0004 | PROG-0004 | contributor |

**t_home_electricity_reduction_program_addresses_usage_metric**

| id | addresses_usage_metric |
| --- | --- |
| PROG-0001 | Seasonal Peak |
| PROG-0002 | Daily kWh Consumption |
| PROG-0003 | Base Load Baseline |
| PROG-0004 | Daily kWh Consumption |
| PROG-0005 | Base Load Baseline |
| PROG-0006 | Base Load Baseline |

**t_home_electricity_reduction_program__addresses_usage_metric**

| id | home_id | addresses_usage_metric_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | PROG-0004 | reviewer | Cardinality Note 01 |
| PROG-0002 | PROG-0001 | PROG-0006 | owner | Cardinality Note 02 |
| PROG-0003 | PROG-0001 | PROG-0006 | observer | Cardinality Note 03 |
| PROG-0004 | PROG-0006 | PROG-0002 | observer | Cardinality Note 04 |
| PROG-0005 | PROG-0002 | PROG-0005 | contributor | Cardinality Note 05 |
| PROG-0006 | PROG-0005 | PROG-0005 | contributor | Cardinality Note 06 |
| PROG-0007 | PROG-0003 | PROG-0003 | observer | Cardinality Note 07 |
| PROG-0008 | PROG-0006 | PROG-0002 | contributor | Cardinality Note 08 |

Household participants represent the human or organizational actors that reduction programs are designed to reach. The participant registry includes categories such as MultiGen Home, Property Manager, and SingleParent Household, each linked to one or more programs through a dedicated targets-participant junction table. This table records the program identifier, the participant identifier, and the role the participant assumes—contributor or reviewer—within the program's execution. For instance, PROG-0001 designates a contributor role for its associated participant, while PROG-0003 assigns a reviewer role, reflecting different levels of operational involvement. The same participant, such as Property Manager, may appear across multiple programs (PROG-0002 and PROG-0004), indicating that a single entity can hold distinct roles in different program contexts.

**t_home_electricity_reduction_program_targets_participant**

| id | targets_participant |
| --- | --- |
| PROG-0001 | MultiGen Home |
| PROG-0002 | Property Manager |
| PROG-0003 | SingleParent Household |
| PROG-0004 | Property Manager |
| PROG-0005 | Suburban Dweller |
| PROG-0006 | Large Family Unit |
| PROG-0007 | Urban Apartment |

Cardinality notes provide the final layer of constraint specification, attached to the program-to-metric junction table to document multiplicity rules and business constraints. Each association between a subject home and a target usage metric carries a cardinality annotation—Cardinality Note 01 through Cardinality Note 04—that clarifies whether the relationship is mandatory, optional, one-to-one, or one-to-many. These notes are not metadata for their own sake; they govern validation logic, query planning, and downstream reporting. A home that is both owner and observer of different metrics (as PROG-0001 is with Daily kWh Consumption and PROG-0006) may carry different cardinality constraints for each association, reflecting the distinct operational requirements of each role-target pairing. Together, the cardinality notes, roles, and identifier chains form a complete specification of how programs, participants, and usage metrics interrelate within the governance framework.