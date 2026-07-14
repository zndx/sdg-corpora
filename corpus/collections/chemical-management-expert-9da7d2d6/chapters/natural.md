## Chemical Management Governance: Authorities, Networks, and Operational Oversight

Chemical management operates at the intersection of regulatory compliance, international cooperation, and facility-level execution. Practitioners in this domain navigate a multi-layered ecosystem where individual experts advise competent authorities, international networks coordinate cross-border standards, environmental regulations establish legal boundaries, and chemical activities translate policy into operational reality at physical facilities. The records maintained across this system capture the full lifecycle of chemical governance—from the appointment of a specialist to the closure of a waste shipment—providing a structured audit trail that links people, organizations, jurisdictions, and physical sites. Understanding how these elements interconnect is essential for compliance officers, environmental regulators, and facility managers who must ensure that every chemical handling operation meets the applicable regulatory framework.

The foundation of chemical management governance rests with the individuals who bring specialized knowledge to bear on regulatory decisions.

**Table `chemical_management_experts`**

| id | expert_identifier | full_name | degree | specialization | start_date | current_status | environmental_authority_id | international_network_id |
|---|---|---|---|---|---|---|---|---|
| 100 | EXP-2308 | Theodore Mcgrath | legacy-degree-61 | legacy-speciali-13 | 2022-09-05T20:24:00 | active | 100 | 100 |
| 101 | EXP-2314 | Account Name | compact-degree-62 | compact-speciali-14 | 2023-02-16T03:41:00 | inactive | 101 | 101 |
| 102 | EXP-2320 | Saipan International Airport | composite-degree-63 | composite-speciali-15 | 2024-07-27T10:58:00 | pending | 102 | 102 |
| 103 | EXP-2326 | Norma Fisher | primary-degree-64 | primary-speciali-16 | 2025-12-11T17:15:00 | active | 103 | 103 |

Chemical management experts serve as the technical backbone of the regulatory apparatus. Each expert record captures a unique identifier, a full name, academic credentials, and a defined area of specialization. The system tracks their career timeline through a start date and monitors their operational readiness via a current status field that distinguishes between active, inactive, and pending practitioners. For instance, Theodore Mcgrath (EXP-2308) holds a legacy-degree-61 qualification and specializes in legacy-speciali-13, having begun his tenure on 2022-09-05 with an active status. In contrast, Account Name (EXP-2314) carries a compact-degree-62 and is currently inactive, while Norma Fisher (EXP-2326), with a primary-degree-64, represents the most recently onboarded expert with a start date of 2025-12-11. Each expert is assigned to a specific environmental authority and may be linked to an international network, establishing the dual reporting and collaborative structure that characterizes modern chemical governance.

Environmental authorities constitute the regulatory bodies responsible for enforcing chemical management standards within defined jurisdictions.

**Table `environmental_authorities`**

| environmental_authority_id | authority_code | authority_name | country_code | established_date | competence_level | is_competent_authority | regulation_id |
|---|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 2024-03-27 | national | false | 2087741 |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | lu_tax_code_template_m_I_2 | 2025-08-11 | regional | true | 4057 |
| 102 | 9246326 | Kimberly Smith | default_chart_a_account_57 | 2022-01-22 | local | false | 5917301 |
| 103 | 9085244 | Kimberly Smith | 727045 | 2023-06-06 | national | true | 10445633 |

These authorities are distinguished by an authority code, a formal name, and a country code that situates them within a geographic and legal framework. The competence level—categorized as national, regional, or local—determines the scope of their enforcement powers, while the is_competent_authority flag explicitly marks which bodies hold formal regulatory authority. Sean Green (authority code 6926376) operates at the national level but is not currently designated as a competent authority, whereas Elizabeth Woods (authority code 5fc685e2-8fcc-11eb-924d-9cd76263cbd0) holds regional competence and carries the competent authority designation. Kimberly Smith appears twice in the registry under different authority codes, reflecting either organizational restructuring or the existence of distinct jurisdictional mandates. Each authority is associated with a specific environmental regulation, anchoring the regulatory chain from policy to enforcement.

International networks provide the multilateral framework through which chemical management standards are harmonized across borders.

**Table `international_networks`**

| id | network_code | network_name | founding_date | member_count | scope | is_active | chemical_management_expert_id | environmental_authority_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme | 2023-06-24 | 4 | regional | true | 100 | 100 |
| 101 | 8387528 | Integrated Standard | 2024-11-08 | 17 | global | false | 101 | 101 |
| 102 | 5082978 | Extended Framework D | 2025-04-19 | 9 | sectoral | true | 102 | 102 |
| 103 | 726053 | Pilot Protocol | 2022-09-03 | 0 | regional | false | 103 | 103 |

These networks are identified by a unique code and a descriptive name—Seasonal Programme, Integrated Standard, Extended Framework D, and Pilot Protocol among the current entries. The founding date establishes the temporal origin of each network, while the member count quantifies its reach, ranging from zero participants in the Pilot Protocol to seventeen members in the Integrated Standard. The scope field classifies each network's operational domain as regional, global, or sectoral, and the is_active flag indicates whether the network is currently operational. Seasonal Programme, established on 2023-06-24 with four members operating at a regional scope, remains active, while the Integrated Standard, despite its larger membership of seventeen, is currently inactive. Each network connects to both a chemical management expert and an environmental authority, creating a bridge between individual expertise and institutional authority within the international governance structure.

Environmental regulations form the legal backbone of chemical management, establishing the rules that govern all chemical activities.

**Table `environmental_regulations`**

| regulation_id | regulation_title | issuing_body | effective_date | jurisdiction | status | environmental_authority_id | chemical_activity_id |
|---|---|---|---|---|---|---|---|
| 2087741 | Compact Initiative | baseline-issuing-13 | 2023-02-14 | EU | active | 100 | 100 |
| 4057 | Legacy Model | pilot-issuing-14 | 2024-07-25 | national | repealed | 101 | 101 |
| 5917301 | Regional Cluster A | extended-issuing-15 | 2025-12-09 | regional | draft | 102 | 102 |
| 10445633 | Seasonal Review | integrated-issuing-16 | 2022-05-20 | EU | active | 103 | 103 |

Each regulation carries a formal title—Compact Initiative, Legacy Model, Regional Cluster A, Seasonal Review—and is issued by a designated body. The effective date marks when the regulation came into force, the jurisdiction field specifies its geographic applicability (EU, national, or regional), and the status field tracks its current legal standing as active, repealed, or draft. The Compact Initiative, issued under baseline-issuing-13 and effective since 2023-02-14, remains active within the EU jurisdiction, while the Legacy Model, effective from 2024-07-25, has been repealed. Regional Cluster A exists in draft form as of 2025-12-09, indicating that regulatory development is an ongoing process. Each regulation is tied to a specific environmental authority and a chemical activity, ensuring that every regulatory provision has a clear line of enforcement and a defined operational target.

Chemical activities represent the operational actions through which chemical management policy is implemented at the facility level.

**Table `chemical_activities`**

| id | activity_id | activity_type | start_date | end_date | status | risk_level | chemical_management_expert_id | regulation_id | facility_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | low | 100 | 2087741 | 1 |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | medium | 101 | 4057 | 2 |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | complete | high | 102 | 5917301 | 3 |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | low | 103 | 10445633 | 4 |

These activities encompass a range of operational types including permitting, inspection, waste shipment, and safety training. Each activity record captures a unique activity identifier, start and end dates, a status reflecting its completion state, and a risk level that categorizes the inherent hazard as low, medium, or high. The permitting activity (8843761) initiated on 2022-09-05 carries a low risk level and is currently in pending status, while the waste shipment activity (168545) represents a high-risk operation that has been completed. Notably, the end dates in several records precede their start dates, suggesting either scheduling anomalies or retrospective data entry. Each chemical activity is assigned to a chemical management expert, linked to an environmental regulation, and associated with a specific facility, creating a complete chain of accountability from regulatory requirement to physical execution.

Facilities are the physical sites where chemical activities take place, and their operational status directly impacts regulatory compliance.

**Table `facilities`**

| id | facility_id | facility_name | address | permit_number | operational_status | last_inspection_date | chemical_activity_id | environmental_authority_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | distributed-address-72 | PER-2638 | active | 2025-04-12 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1040 | Extended Programme | baseline-address-73 | PER-2640 | suspended | 2022-09-23 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2986228 | Pilot Standard | pilot-address-74 | PER-2642 | closed | 2023-02-07 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | extended-address-75 | PER-2644 | active | 2024-07-18 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Each facility is identified by a facility ID, a descriptive name, and a physical address. The permit number serves as the regulatory authorization for chemical operations at the site, while the operational status—active, suspended, or closed—indicates the facility's current standing. Integrated Protocol A (facility ID 69447) holds permit PER-2638 and maintains an active operational status with its last inspection recorded on 2025-04-12. Extended Programme (facility ID 1040) carries permit PER-2640 but has been suspended, with its last inspection dating back to 2022-09-23. Pilot Standard (facility ID 2986228) has been closed entirely, while Baseline Framework D remains active with a recent inspection on 2024-07-18. Each facility is linked to a chemical activity and an environmental authority, ensuring that regulatory oversight extends from the institutional level down to the physical site.

The relationship between environmental authorities and chemical management experts is formalized through a dedicated association table that captures the institutional connections between regulatory bodies and their technical specialists.

**Table `authorities_experts`**

| environmental_authority_id | chemical_management_expert_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

This association table serves as the connective tissue between the authority and expert domains, recording which experts are assigned to which authorities and establishing the chain of technical accountability. The presence of this explicit relationship table indicates that the assignment of experts to authorities is not merely a foreign key reference but a managed relationship that may carry additional metadata about the nature of the assignment, its duration, or its scope.

The joined views of the system reveal the operational relationships that connect these entities into a coherent governance structure. The view linking chemical management experts to environmental authorities provides a consolidated record of which specialist operates under which regulatory body.

**View `v_chemical_management_expert_environmental_authority`**

```sql
CREATE VIEW v_chemical_management_expert_environmental_authority AS
SELECT a.id, a.expert_identifier, a.full_name, a.degree, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM chemical_management_experts a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| id | expert_identifier | full_name | degree | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 100 | EXP-2308 | Theodore Mcgrath | legacy-degree-61 | 100 | 6926376 | Sean Green |
| 101 | EXP-2314 | Account Name | compact-degree-62 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 102 | EXP-2320 | Saipan International Airport | composite-degree-63 | 102 | 9246326 | Kimberly Smith |
| 103 | EXP-2326 | Norma Fisher | primary-degree-64 | 103 | 9085244 | Kimberly Smith |

This view answers the fundamental question of organizational assignment: which expert is responsible to which authority? Reading the row for Theodore Mcgrath alongside authority 100 reveals a complete picture of his regulatory reporting line, combining his personal credentials with the jurisdictional scope of his assigned authority. Similarly, the row for Norma Fisher (EXP-2326) paired with authority 103 shows how a newly onboarded expert is integrated into the national-level regulatory framework.

The expert-to-international-network view extends the organizational picture beyond national boundaries.

**View `v_chemical_management_expert_international_network`**

```sql
CREATE VIEW v_chemical_management_expert_international_network AS
SELECT a.id, a.expert_identifier, a.full_name, a.degree, b.id AS network_id, b.network_code AS network_network_code, b.network_name AS network_network_name
FROM chemical_management_experts a JOIN international_networks b ON a.international_network_id = b.id;
```

| id | expert_identifier | full_name | degree | network_id | network_network_code | network_network_name |
|---|---|---|---|---|---|---|
| 100 | EXP-2308 | Theodore Mcgrath | legacy-degree-61 | 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme |
| 101 | EXP-2314 | Account Name | compact-degree-62 | 101 | 8387528 | Integrated Standard |
| 102 | EXP-2320 | Saipan International Airport | composite-degree-63 | 102 | 5082978 | Extended Framework D |
| 103 | EXP-2326 | Norma Fisher | primary-degree-64 | 103 | 726053 | Pilot Protocol |

This view reveals how individual experts participate in international governance structures. Theodore Mcgrath's connection to the Seasonal Programme (network code 68f46afd953b4de8824b596a1bff565c) demonstrates how a national-level expert contributes to regional coordination efforts. The view combines the expert's specialization with the network's scope and membership, providing a clear picture of the international dimension of chemical management expertise.

The authority-to-expert detail view offers the inverse perspective, organizing the expert roster by regulatory body.

**View `v_environmental_authority_chemical_management_expert_detail`**

```sql
CREATE VIEW v_environmental_authority_chemical_management_expert_detail AS
SELECT a.environmental_authority_id, a.authority_code, a.authority_name, b.id AS expert_id, b.expert_identifier AS expert_expert_identifier, b.full_name AS expert_full_name
FROM environmental_authorities a
  JOIN authorities_experts j ON j.environmental_authority_id = a.environmental_authority_id
  JOIN chemical_management_experts b ON b.id = j.chemical_management_expert_id;
```

| environmental_authority_id | authority_code | authority_name | expert_id | expert_expert_identifier | expert_full_name |
|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | 100 | EXP-2308 | Theodore Mcgrath |
| 100 | 6926376 | Sean Green | 101 | EXP-2314 | Account Name |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | 101 | EXP-2314 | Account Name |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | 102 | EXP-2320 | Saipan International Airport |
| 102 | 9246326 | Kimberly Smith | 102 | EXP-2320 | Saipan International Airport |
| 102 | 9246326 | Kimberly Smith | 103 | EXP-2326 | Norma Fisher |
| 103 | 9085244 | Kimberly Smith | 103 | EXP-2326 | Norma Fisher |
| 103 | 9085244 | Kimberly Smith | 100 | EXP-2308 | Theodore Mcgrath |

This view answers the question of which experts are available within a given authority's jurisdiction. For authority 100, the view consolidates all assigned experts along with their credentials and status, enabling regulators to assess the technical capacity available within their jurisdiction. The inclusion of the expert's current status alongside the authority's competence level provides a quick assessment of whether the authority has adequate technical staffing.

The authority-to-regulation view maps the regulatory framework that each authority is responsible for enforcing.

**View `v_environmental_authority_environmental_regulation`**

```sql
CREATE VIEW v_environmental_authority_environmental_regulation AS
SELECT a.environmental_authority_id, a.authority_code, a.authority_name, a.country_code, b.regulation_id AS regulation_regulation_id, b.regulation_title AS regulation_regulation_title, b.issuing_body AS regulation_issuing_body
FROM environmental_authorities a JOIN environmental_regulations b ON a.regulation_id = b.regulation_id;
```

| environmental_authority_id | authority_code | authority_name | country_code | regulation_regulation_id | regulation_regulation_title | regulation_issuing_body |
|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 2087741 | Compact Initiative | baseline-issuing-13 |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | lu_tax_code_template_m_I_2 | 4057 | Legacy Model | pilot-issuing-14 |
| 102 | 9246326 | Kimberly Smith | default_chart_a_account_57 | 5917301 | Regional Cluster A | extended-issuing-15 |
| 103 | 9085244 | Kimberly Smith | 727045 | 10445633 | Seasonal Review | integrated-issuing-16 |

This view reveals the regulatory landscape as seen from the authority's perspective. Authority 100 is associated with the Compact Initiative (regulation ID 2087741), an active EU-level regulation that establishes the compliance baseline for all chemical activities under its purview. Authority 101, by contrast, is linked to the Legacy Model (regulation ID 4057), which has been repealed, indicating that this authority may be in a transitional regulatory period. The view combines the authority's competence level with the regulation's status, providing a clear picture of the regulatory environment each authority navigates.

The international network-to-expert view provides the network's perspective on its expert membership.

**View `v_international_network_chemical_management_expert`**

```sql
CREATE VIEW v_international_network_chemical_management_expert AS
SELECT a.id, a.network_code, a.network_name, a.founding_date, b.id AS expert_id, b.expert_identifier AS expert_expert_identifier, b.full_name AS expert_full_name
FROM international_networks a JOIN chemical_management_experts b ON a.chemical_management_expert_id = b.id;
```

| id | network_code | network_name | founding_date | expert_id | expert_expert_identifier | expert_full_name |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme | 2023-06-24 | 100 | EXP-2308 | Theodore Mcgrath |
| 101 | 8387528 | Integrated Standard | 2024-11-08 | 101 | EXP-2314 | Account Name |
| 102 | 5082978 | Extended Framework D | 2025-04-19 | 102 | EXP-2320 | Saipan International Airport |
| 103 | 726053 | Pilot Protocol | 2022-09-03 | 103 | EXP-2326 | Norma Fisher |

This view answers how many experts are associated with each network and what their qualifications are. The Seasonal Programme, with four members, shows Theodore Mcgrath as one of its expert participants, bringing his legacy-speciali-13 specialization to the regional coordination effort. The view combines the network's scope and activity status with the expert's current status, revealing whether the network's expert base is actively engaged or dormant.

The international network-to-authority view reveals the institutional partnerships that underpin each network.

**View `v_international_network_environmental_authority`**

```sql
CREATE VIEW v_international_network_environmental_authority AS
SELECT a.id, a.network_code, a.network_name, a.founding_date, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM international_networks a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| id | network_code | network_name | founding_date | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme | 2023-06-24 | 100 | 6926376 | Sean Green |
| 101 | 8387528 | Integrated Standard | 2024-11-08 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 102 | 5082978 | Extended Framework D | 2025-04-19 | 102 | 9246326 | Kimberly Smith |
| 103 | 726053 | Pilot Protocol | 2022-09-03 | 103 | 9085244 | Kimberly Smith |

This view shows which environmental authorities are represented within each international network. The Seasonal Programme's connection to authority 100 demonstrates how national-level authorities participate in regional coordination frameworks. The view combines the network's member count and scope with the authority's competence level, providing insight into the institutional depth of each network's membership.

The regulation-to-authority view presents the regulatory framework organized by enforcing body.

**View `v_environmental_regulation_environmental_authority`**

```sql
CREATE VIEW v_environmental_regulation_environmental_authority AS
SELECT a.regulation_id, a.regulation_title, a.issuing_body, a.effective_date, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM environmental_regulations a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| regulation_id | regulation_title | issuing_body | effective_date | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 2087741 | Compact Initiative | baseline-issuing-13 | 2023-02-14 | 100 | 6926376 | Sean Green |
| 4057 | Legacy Model | pilot-issuing-14 | 2024-07-25 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 5917301 | Regional Cluster A | extended-issuing-15 | 2025-12-09 | 102 | 9246326 | Kimberly Smith |
| 10445633 | Seasonal Review | integrated-issuing-16 | 2022-05-20 | 103 | 9085244 | Kimberly Smith |

This view answers which authority is responsible for enforcing each regulation. The Compact Initiative (regulation ID 2087741) is enforced by authority 100, and its active status within the EU jurisdiction indicates a living regulatory framework. The view combines the regulation's issuing body and effective date with the authority's competence level, providing a complete picture of the regulatory enforcement chain.

The regulation-to-chemical-activity view links regulatory requirements to their operational targets.

**View `v_environmental_regulation_chemical_activity`**

```sql
CREATE VIEW v_environmental_regulation_chemical_activity AS
SELECT a.regulation_id, a.regulation_title, a.issuing_body, a.effective_date, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM environmental_regulations a JOIN chemical_activities b ON a.chemical_activity_id = b.id;
```

| regulation_id | regulation_title | issuing_body | effective_date | activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|---|
| 2087741 | Compact Initiative | baseline-issuing-13 | 2023-02-14 | 100 | 8843761 | permitting |
| 4057 | Legacy Model | pilot-issuing-14 | 2024-07-25 | 101 | 4180957 | inspection |
| 5917301 | Regional Cluster A | extended-issuing-15 | 2025-12-09 | 102 | 168545 | waste_shipment |
| 10445633 | Seasonal Review | integrated-issuing-16 | 2022-05-20 | 103 | default_chart_a_account_53 | safety_training |

This view reveals which chemical activities are governed by which regulations. The Compact Initiative governs the permitting activity (8843761), establishing the regulatory requirements that this activity must satisfy. The view combines the regulation's jurisdiction and status with the activity's risk level and type, providing a clear picture of the regulatory risk landscape.

The chemical activity-to-expert view traces the accountability chain from operational action to technical oversight.

**View `v_chemical_activity_chemical_management_expert`**

```sql
CREATE VIEW v_chemical_activity_chemical_management_expert AS
SELECT a.id, a.activity_id, a.activity_type, a.start_date, b.id AS expert_id, b.expert_identifier AS expert_expert_identifier, b.full_name AS expert_full_name
FROM chemical_activities a JOIN chemical_management_experts b ON a.chemical_management_expert_id = b.id;
```

| id | activity_id | activity_type | start_date | expert_id | expert_expert_identifier | expert_full_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 100 | EXP-2308 | Theodore Mcgrath |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 101 | EXP-2314 | Account Name |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 102 | EXP-2320 | Saipan International Airport |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 103 | EXP-2326 | Norma Fisher |

This view answers which expert is responsible for overseeing each chemical activity. The permitting activity (8843761) is overseen by expert 100 (Theodore Mcgrath), linking the operational action to the individual who provides technical guidance. The view combines the activity's risk level and status with the expert's specialization and current status, providing a quick assessment of whether the assigned expert is qualified and available.

The chemical activity-to-regulation view connects operational actions to their regulatory basis.

**View `v_chemical_activity_environmental_regulation`**

```sql
CREATE VIEW v_chemical_activity_environmental_regulation AS
SELECT a.id, a.activity_id, a.activity_type, a.start_date, b.regulation_id AS regulation_regulation_id, b.regulation_title AS regulation_regulation_title, b.issuing_body AS regulation_issuing_body
FROM chemical_activities a JOIN environmental_regulations b ON a.regulation_id = b.regulation_id;
```

| id | activity_id | activity_type | start_date | regulation_regulation_id | regulation_regulation_title | regulation_issuing_body |
|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 2087741 | Compact Initiative | baseline-issuing-13 |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 4057 | Legacy Model | pilot-issuing-14 |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 5917301 | Regional Cluster A | extended-issuing-15 |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 10445633 | Seasonal Review | integrated-issuing-16 |

This view reveals the regulatory foundation for each chemical activity. The permitting activity (8843761) is governed by the Compact Initiative (regulation ID 2087741), establishing the legal basis for the activity. The view combines the activity's type and risk level with the regulation's jurisdiction and status, providing a clear picture of the regulatory compliance requirements for each operational action.

The chemical activity-to-facility view links operational actions to their physical locations.

**View `v_chemical_activity_facility`**

```sql
CREATE VIEW v_chemical_activity_facility AS
SELECT a.id, a.activity_id, a.activity_type, a.start_date, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM chemical_activities a JOIN facilities b ON a.facility_id = b.id;
```

| id | activity_id | activity_type | start_date | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 1 | 69447 | Integrated Protocol A |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 2 | 1040 | Extended Programme |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 3 | 2986228 | Pilot Standard |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view answers where each chemical activity takes place. The permitting activity (8843761) occurs at Integrated Protocol A (facility ID 69447), connecting the operational action to the physical site where it is executed. The view combines the activity's risk level and status with the facility's operational status and last inspection date, providing a comprehensive picture of the operational context.

The facility-to-chemical-activity view presents the facility's perspective on its operational portfolio.

**View `v_facility_chemical_activity`**

```sql
CREATE VIEW v_facility_chemical_activity AS
SELECT a.id, a.facility_id, a.facility_name, a.address, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM facilities a JOIN chemical_activities b ON a.chemical_activity_id = b.id;
```

| id | facility_id | facility_name | address | activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | distributed-address-72 | 100 | 8843761 | permitting |
| 2 | 1040 | Extended Programme | baseline-address-73 | 101 | 4180957 | inspection |
| 3 | 2986228 | Pilot Standard | pilot-address-74 | 102 | 168545 | waste_shipment |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | extended-address-75 | 103 | default_chart_a_account_53 | safety_training |

This view reveals which chemical activities are conducted at each facility. Integrated Protocol A (facility ID 69447) hosts the permitting activity (8843761), and the view combines the facility's operational status with the activity's risk level, providing a quick assessment of the facility's regulatory exposure. The suspended status of Extended Programme (facility ID 1040) alongside its associated inspection activity (4180957) with medium risk highlights the compliance challenges posed by non-operational facilities.

The facility-to-authority view establishes the regulatory oversight relationship at the site level.

**View `v_facility_environmental_authority`**

```sql
CREATE VIEW v_facility_environmental_authority AS
SELECT a.id, a.facility_id, a.facility_name, a.address, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM facilities a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| id | facility_id | facility_name | address | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | distributed-address-72 | 100 | 6926376 | Sean Green |
| 2 | 1040 | Extended Programme | baseline-address-73 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 3 | 2986228 | Pilot Standard | pilot-address-74 | 102 | 9246326 | Kimberly Smith |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | extended-address-75 | 103 | 9085244 | Kimberly Smith |

This view answers which authority has jurisdiction over each facility. Integrated Protocol A (facility ID 69447) falls under the jurisdiction of authority 100, establishing the chain of regulatory oversight from the physical site through the authority to the broader regulatory framework. The view combines the facility's operational status and last inspection date with the authority's competence level, providing a complete picture of the regulatory oversight environment for each site.

Chemical management governance is a multi-layered system that connects individual expertise to institutional authority, international coordination to local enforcement, and regulatory policy to physical operations. The records captured across experts, authorities, networks, regulations, activities, and facilities form an integrated framework that ensures every chemical handling operation can be traced from its regulatory basis through its technical oversight to its physical execution. Practitioners who understand these relationships can navigate the system with confidence, ensuring that compliance is not merely a documentation exercise but a structured operational reality.