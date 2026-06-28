---
chapter_id: ch_live_video_surveillance_activity_c38995
topic_id: 16
family: 08_derived
cited_terms: ['video_surveillance_activity', 'verification_min_one_evidence', 'gdpr_lawful_basis']
model: engine-refine
---

Video surveillance operations are catalogued through a structured activity registry that captures the operational scope of each monitoring deployment. Each activity—identified by a code such as ACTI-0001 through ACTI-0004—is assigned a descriptive label (AdminOffice, EastWing_Patrol, Gymnasium, ParkingLotA) and is bound to a monitored zone (Courtyard, MainEntrance_Day, Gymnasium, ParkingLot_Dusk_Rec) and a specific device type (Fixed_Lens_Camera, IP_Overwatch_Node, Multi_Sensor_Array, Thermal_Array_Sensor). This tripartite linkage ensures that every surveillance action can be traced to both its physical coverage area and the hardware responsible for data capture, establishing an auditable chain from operational intent to technical implementation.

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |

The evidentiary backbone of the system is built around verification records that produce and validate compliance artifacts. A verification event—whether an ISO27001 Compliance Audit, a Data Lineage Trace, a Cryptographic Signature Check, or a Schema Migration Validation—generates evidence identified by codes such as BASI-0001 through BASI-0004. These evidence records are not monolithic; they decompose into typed attribute-value pairs stored across four parallel value tables, each specialized for a distinct XML Schema datatype. Duration measurements are persisted as decimals (2280.75, 2844.65, 2804.04, 5144.39), temporal markers as ISO 8601 datetimes (2023-07-04T07:08:55, 2025-01-31T12:45:17, 2025-03-23T07:51:24, 2023-01-29T08:52:43), exit codes and numeric identifiers as integers (414, 360, 47, 492), and free-form descriptors as variable-length strings (node-a01, Log Level 02, review, failed). The attribute schema itself is defined in a companion table that maps each attribute name—duration_seconds, end_time, exit_code, host_name—to its corresponding xsd type, enabling dynamic schema validation without hardcoding.

**t_verification_min_one_evidence**

| id | verification | produces_evidence |
| --- | --- | --- |
| EVID-0001 | ISO27001 Compliance Audit | BASI-0002 |
| EVID-0002 | Data Lineage Trace | BASI-0001 |
| EVID-0003 | Cryptographic Signature Check | BASI-0003 |
| EVID-0004 | Schema Migration Validation | BASI-0001 |
| EVID-0005 | Data Lineage Trace | BASI-0002 |
| EVID-0006 | Schema Migration Validation | BASI-0003 |

**t_verification_min_one_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | duration_seconds | xsd:decimal |
| EVID-0002 | end_time | xsd:dateTime |
| EVID-0003 | exit_code | xsd:integer |
| EVID-0004 | host_name | xsd:string |
| EVID-0005 | log_level | xsd:string |
| EVID-0006 | phase | xsd:string |
| EVID-0007 | retry_count | xsd:integer |
| EVID-0008 | scheduled_at | xsd:dateTime |

**t_verification_min_one_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | 2023-07-04T07:08:55 |
| EVID-0002 | EVID-0001 | EVID-0008 | 2025-01-31T12:45:17 |
| EVID-0003 | EVID-0001 | EVID-0009 | 2025-03-23T07:51:24 |
| EVID-0004 | EVID-0002 | EVID-0002 | 2023-01-29T08:52:43 |
| EVID-0005 | EVID-0002 | EVID-0008 | 2025-02-10T17:00:11 |
| EVID-0006 | EVID-0002 | EVID-0009 | 2023-01-05T10:52:26 |
| EVID-0007 | EVID-0003 | EVID-0002 | 2023-12-08T22:39:20 |
| EVID-0008 | EVID-0003 | EVID-0008 | 2023-06-23T05:07:56 |

**t_verification_min_one_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 2280.75 |
| EVID-0002 | EVID-0002 | EVID-0001 | 2844.65 |
| EVID-0003 | EVID-0003 | EVID-0001 | 2804.04 |
| EVID-0004 | EVID-0004 | EVID-0001 | 5144.39 |
| EVID-0005 | EVID-0005 | EVID-0001 | 1607.16 |
| EVID-0006 | EVID-0006 | EVID-0001 | 959.65 |

**t_verification_min_one_evidence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0003 | 414 |
| EVID-0002 | EVID-0001 | EVID-0007 | 360 |
| EVID-0003 | EVID-0002 | EVID-0003 | 47 |
| EVID-0004 | EVID-0002 | EVID-0007 | 492 |
| EVID-0005 | EVID-0003 | EVID-0003 | 443 |
| EVID-0006 | EVID-0003 | EVID-0007 | 122 |
| EVID-0007 | EVID-0004 | EVID-0003 | 839 |
| EVID-0008 | EVID-0004 | EVID-0007 | 199 |

**t_verification_min_one_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | node-a01 |
| EVID-0002 | EVID-0001 | EVID-0005 | Log Level 02 |
| EVID-0003 | EVID-0001 | EVID-0006 | review |
| EVID-0004 | EVID-0001 | EVID-0010 | failed |
| EVID-0005 | EVID-0001 | EVID-0011 | Triggered By 05 |
| EVID-0006 | EVID-0002 | EVID-0004 | edge-03 |
| EVID-0007 | EVID-0002 | EVID-0005 | Log Level 07 |
| EVID-0008 | EVID-0002 | EVID-0006 | closeout |

GDPR compliance is enforced through a lawful basis registry that anchors each evidence record to a recognized regulatory framework. The basis entries reference either the AI Act Framework or the CCPA Policy and are linked to evidence identifiers (EVID-0001, EVID-0005, EVID-0006) that serve as the connective tissue between operational surveillance and legal justification. Each lawful basis record carries its own set of typed attributes—effective_date, enforcement, mandatory, and priority—stored in the same normalized value-table pattern. Dates such as 2023-01-18, 2023-01-24, 2025-03-25, and 2023-04-09 establish temporal validity windows; boolean flags (true, false) indicate mandatory applicability; integer values (4, 683, 470) encode priority rankings; and varchar fields capture enforcement metadata (Encoding 01, Enforcement 02, intake form, ja).

**t_gdpr_lawful_basis**

| id | gdpr | lawful_basis |
| --- | --- | --- |
| BASI-0001 | AI Act Framework | EVID-0001 |
| BASI-0002 | CCPA Policy | EVID-0006 |
| BASI-0003 | CCPA Policy | EVID-0006 |
| BASI-0004 | CCPA Policy | EVID-0005 |
| BASI-0005 | AI Act Framework | EVID-0002 |
| BASI-0006 | NIS Directive | EVID-0005 |

**t_gdpr_lawful_basis_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BASI-0001 | effective_date | xsd:date |
| BASI-0002 | enforcement | xsd:string |
| BASI-0003 | mandatory | xsd:boolean |
| BASI-0004 | priority | xsd:integer |
| BASI-0005 | review_cycle_days | xsd:integer |
| BASI-0006 | scope | xsd:string |
| BASI-0007 | encoding | xsd:string |
| BASI-0008 | label_text | xsd:string |

**t_gdpr_lawful_basis_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0003 | false |
| BASI-0002 | BASI-0002 | BASI-0003 | true |
| BASI-0003 | BASI-0003 | BASI-0003 | true |
| BASI-0004 | BASI-0004 | BASI-0003 | false |
| BASI-0005 | BASI-0005 | BASI-0003 | true |
| BASI-0006 | BASI-0006 | BASI-0003 | false |

**t_gdpr_lawful_basis_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0001 | 2023-01-18 |
| BASI-0002 | BASI-0002 | BASI-0001 | 2023-01-24 |
| BASI-0003 | BASI-0003 | BASI-0001 | 2025-03-25 |
| BASI-0004 | BASI-0004 | BASI-0001 | 2023-04-09 |
| BASI-0005 | BASI-0005 | BASI-0001 | 2024-12-12 |
| BASI-0006 | BASI-0006 | BASI-0001 | 2025-03-12 |

**t_gdpr_lawful_basis_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0004 | 4 |
| BASI-0002 | BASI-0001 | BASI-0005 | 683 |
| BASI-0003 | BASI-0002 | BASI-0004 | 4 |
| BASI-0004 | BASI-0002 | BASI-0005 | 470 |
| BASI-0005 | BASI-0003 | BASI-0004 | 2 |
| BASI-0006 | BASI-0003 | BASI-0005 | 535 |
| BASI-0007 | BASI-0004 | BASI-0004 | 1 |
| BASI-0008 | BASI-0004 | BASI-0005 | 87 |

**t_gdpr_lawful_basis_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0007 | Encoding 01 |
| BASI-0002 | BASI-0001 | BASI-0002 | Enforcement 02 |
| BASI-0003 | BASI-0001 | BASI-0008 | intake form |
| BASI-0004 | BASI-0001 | BASI-0009 | ja |
| BASI-0005 | BASI-0001 | BASI-0006 | Scope 05 |
| BASI-0006 | BASI-0002 | BASI-0007 | Encoding 06 |
| BASI-0007 | BASI-0002 | BASI-0002 | Enforcement 07 |
| BASI-0008 | BASI-0002 | BASI-0008 | nightly summary |

The foreign-key architecture creates a coherent compliance graph: video surveillance activities reference monitored environments and employed devices; verification evidence records are produced by specific verification events and carry typed attribute values; and GDPR lawful basis entries tie regulatory frameworks back to evidence identifiers, which in turn reference the verification records that generated them. This interlocking structure means that any surveillance deployment can be traced from its operational label through its hardware and coverage area, into the verification evidence it produces, and finally to the legal basis that authorizes its data processing—each hop validated by explicit foreign-key constraints and each attribute value typed against a known schema.