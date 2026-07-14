## Investigation Operations in Legal Technology

Modern legal technology organizations manage complex investigation workflows that span multiple operational domains. At the center of these operations are investigation cases—structured records that track the lifecycle of compliance reviews, litigation support, fraud inquiries, and cyber security assessments. Each case carries a unique identifier, a descriptive title, a date range, and a status that reflects its current standing. Cases such as Integrated Assessment A (identifier 39800622) and Extended Survey (identifier 4891) demonstrate the range of work handled, while case_type values like compliance_breach, litigation, fraud, and cyber_security categorize the nature of the inquiry. The data_volume field, measured in units ranging from 9.95 to 18.80, quantifies the informational scope of each investigation.

**Table `investigation_cases`**

| case_id | case_title | start_date | end_date | case_status | case_type | data_volume | lab_id | engine_id | data_analysis_tool_id |
|---|---|---|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | compliance_breach | 9.95 | 2106706 | 5006437 | 100 |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | litigation | 12.90 | 1437591 | 726035 | 101 |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | closed | fraud | 15.85 | 12042 | 8843749 | 102 |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | cyber_security | 18.80 | 1562831 | 209207 | 103 |

Every investigation case is anchored to a legal tech solution lab, which serves as the operational home for the work. These labs are the primary organizational units, each identified by a lab_id and a descriptive name such as Baseline Protocol D or Distributed Programme. The location field uses coded identifiers like extended-location-99 and integrated-location-100 to denote where the lab's operations are centered. Establishment dates span from 2022 to 2025, reflecting the evolving nature of these organizations. The isms_compliant flag indicates whether a lab adheres to information security management standards, with values alternating between true and false across the portfolio. Service scope further differentiates labs, with categories including discovery, forensics, cyber_security, and independent_committee. Supported languages—english, japanese, chinese, and korean—reflect the multilingual capabilities required for cross-border investigations.

**Table `legal_tech_solution_labs`**

| lab_id | lab_name | location | establishment_date | isms_compliant | service_scope | supported_languages | discovery_operation_center_id | forensic_operation_center_id | engine_id | data_analysis_tool_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | false | discovery | english | 1 | 100 | 5006437 | 100 |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | true | forensics | japanese | 2 | 101 | 726035 | 101 |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | false | cyber_security | chinese | 3 | 102 | 8843749 | 102 |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | true | independent_committee | korean | 4 | 103 | 209207 | 103 |

Each lab is equipped with specialized operational centers that handle distinct phases of the investigation lifecycle. Discovery operation centers focus on evidence gathering and disclosure, while forensic operation centers concentrate on data recovery, analysis, and reporting. The discovery centers are identified by a discovery_operation_center_id and a center_id, with names such as Seasonal Survey and Integrated Corridor. Their focus_area values—discovery, evidence_disclosure, and international_litigation—define the scope of their mandate. Data sources range from servers and computers to cloud environments and mobile_devices, while analysis_techniques include data_analysis and log_based_behavioral_analysis.

**Table `discovery_operation_centers`**

| discovery_operation_center_id | center_id | center_name | focus_area | data_sources | analysis_techniques | lab_id | case_id |
|---|---|---|---|---|---|---|---|
| 1 | 5844261 | Seasonal Survey | discovery | servers | data_analysis | 2106706 | 39800622 |
| 2 | 1437588 | Integrated Corridor | evidence_disclosure | computers | log_based_behavioral_analysis | 1437591 | 4891 |
| 3 | 6564397 | Extended Series D | international_litigation | cloud | data_analysis | 12042 | 17374813 |
| 4 | default_chart_a_tax_13 | Pilot Assessment | discovery | mobile_devices | log_based_behavioral_analysis | 1562831 | state_uk_9 |

Forensic operation centers mirror this structure with their own identifiers and operational parameters. The forensic_operation_center_id and center_id pair uniquely identifies each center, and center_name values like Seasonal Survey and Integrated Corridor appear alongside their discovery counterparts, reflecting the dual-capability design of some facilities. Focus areas encompass forensics, fraud_investigation, and digital_forensics. The techniques employed—data_salvaging, data_restoration, log_tracing, and behavioral_analysis—represent the technical toolkit available to forensic analysts. The reporting_capability field, a boolean indicator, signals whether a center can produce formal forensic reports, with values of true and false distributed across the centers.

**Table `forensic_operation_centers`**

| forensic_operation_center_id | center_id | center_name | focus_area | techniques | reporting_capability | lab_id | case_id |
|---|---|---|---|---|---|---|---|
| 100 | 5844261 | Seasonal Survey | forensics | data_salvaging | true | 2106706 | 39800622 |
| 101 | 1437588 | Integrated Corridor | fraud_investigation | data_restoration | false | 1437591 | 4891 |
| 102 | 6564397 | Extended Series D | digital_forensics | log_tracing | true | 12042 | 17374813 |
| 103 | default_chart_a_tax_13 | Pilot Assessment | forensics | behavioral_analysis | false | 1562831 | state_uk_9 |

Beyond physical centers, the investigation infrastructure relies on computational resources: AI engines and data analysis tools. AI engines are identified by engine_id and named with designations such as Baseline Series D and Distributed Assessment. Each engine carries a version identifier (seasonal-version-71, regional-version-72, legacy-version-73, compact-version-74) and a training_data classification (primary-training-34, adaptive-training-35, distributed-training-36, baseline-training-37) that describes the nature of its training corpus. The supported_languages field aligns with the lab's multilingual capabilities, and processing_efficiency—a numeric metric ranging from 23.70 to 37.80—quantifies the engine's throughput. Higher values indicate greater computational efficiency.

**Table `a_i_engines`**

| engine_id | engine_name | version | training_data | supported_languages | processing_efficiency | lab_id | case_id |
|---|---|---|---|---|---|---|---|
| 5006437 | Baseline Series D | seasonal-version-71 | primary-training-34 | english | 23.70 | 2106706 | 39800622 |
| 726035 | Distributed Assessment | regional-version-72 | adaptive-training-35 | japanese | 28.40 | 1437591 | 4891 |
| 8843749 | Adaptive Survey | legacy-version-73 | distributed-training-36 | chinese | 33.10 | 12042 | 17374813 |
| 209207 | Primary Corridor A | compact-version-74 | baseline-training-37 | korean | 37.80 | 1562831 | state_uk_9 |

Data analysis tools provide complementary functionality, identified by a composite id, a tool_id, and a tool_name. Tools such as Composite Model, Compact Cluster A, Legacy Review, and Regional Initiative serve different analytical purposes. The tool_type field categorizes them as litigation_support, data_analysis, log_tracing, or information_aggregation, while the developer field uses coded identifiers like extended-develope-63 and integrated-develope-64. Versions follow the same pattern as the AI engines, and the features field—data_collection, preservation, analysis, and reporting—describes the primary capability each tool offers.

**Table `data_analysis_tools`**

| id | tool_id | tool_name | tool_type | developer | version | features | lab_id | case_id |
|---|---|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | litigation_support | extended-develope-63 | seasonal-version-71 | data_collection | 2106706 | 39800622 |
| 101 | 195360 | Compact Cluster A | data_analysis | integrated-develope-64 | regional-version-72 | preservation | 1437591 | 4891 |
| 102 | 3355763 | Legacy Review | log_tracing | seasonal-develope-65 | legacy-version-73 | analysis | 12042 | 17374813 |
| 103 | 8387539 | Regional Initiative | information_aggregation | regional-develope-66 | compact-version-74 | reporting | 1562831 | state_uk_9 |

The relationships between these entities become most visible through the joined views that connect investigation cases to their supporting infrastructure. The view vw_investigation_case_legal_tech_solution_lab maps each case to its parent lab, answering the question of which organizational unit is responsible for a given investigation. In this join, case 39800622 (Integrated Assessment A) links to lab 2106706 (Baseline Protocol D), while case 4891 (Extended Survey) connects to lab 1437591 (Distributed Programme). The view preserves all case attributes alongside lab details, enabling analysts to trace a case back to its operational home, including the lab's isms_compliant status and service_scope.

**View `vw_investigation_case_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_investigation_case_legal_tech_solution_lab AS
SELECT a.case_id, a.case_title, a.start_date, a.end_date, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM investigation_cases a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| case_id | case_title | start_date | end_date | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 2106706 | Baseline Protocol D | extended-location-99 |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1437591 | Distributed Programme | integrated-location-100 |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 12042 | Adaptive Standard | seasonal-location-101 |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1562831 | Primary Framework A | regional-location-102 |

The view vw_investigation_case_a_i_engine connects each investigation case to the AI engine that processes its data. Case 39800622 is associated with engine 5006437 (Baseline Series D), which operates at a processing_efficiency of 23.70 and supports english. Case 4891 uses engine 726035 (Distributed Assessment) with an efficiency of 28.40 and japanese language support. This join reveals the computational resources assigned to each investigation and allows comparison of efficiency metrics across cases. The training_data classification—primary-training-34 for the first case and adaptive-training-35 for the second—provides context for the engine's analytical capabilities.

**View `vw_investigation_case_a_i_engine`**

```sql
CREATE VIEW vw_investigation_case_a_i_engine AS
SELECT a.case_id, a.case_title, a.start_date, a.end_date, b.engine_id AS engine_engine_id, b.engine_name AS engine_engine_name, b.version AS engine_version
FROM investigation_cases a JOIN a_i_engines b ON a.engine_id = b.engine_id;
```

| case_id | case_title | start_date | end_date | engine_engine_id | engine_engine_name | engine_version |
|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 5006437 | Baseline Series D | seasonal-version-71 |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 726035 | Distributed Assessment | regional-version-72 |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 8843749 | Adaptive Survey | legacy-version-73 |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 209207 | Primary Corridor A | compact-version-74 |

Similarly, vw_investigation_case_data_analysis_tool links cases to the data analysis tools they employ. Case 39800622 uses tool comi (Composite Model), a litigation_support tool with data_collection features, while case 4891 uses tool 195360 (Compact Cluster A), a data_analysis tool focused on preservation. The tool_type and features fields in this view help analysts understand the analytical approach applied to each case's data. Case 17374813 (Pilot Corridor) is paired with tool 3355763 (Legacy Review), a log_tracing tool with analysis features, demonstrating the diversity of tools deployed across the investigation portfolio.

**View `vw_investigation_case_data_analysis_tool`**

```sql
CREATE VIEW vw_investigation_case_data_analysis_tool AS
SELECT a.case_id, a.case_title, a.start_date, a.end_date, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM investigation_cases a JOIN data_analysis_tools b ON a.data_analysis_tool_id = b.id;
```

| case_id | case_title | start_date | end_date | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | comi | Composite Model |
| 4891 | Extended Survey | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | 195360 | Compact Cluster A |
| 17374813 | Pilot Corridor | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 3355763 | Legacy Review |
| state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 8387539 | Regional Initiative |

The relationship between legal tech solution labs and discovery operation centers is captured in vw_legal_tech_solution_lab_discovery_operation_center. This view answers which discovery center supports each lab. Lab 2106706 (Baseline Protocol D) is linked to discovery center 1 (Seasonal Survey), which focuses on discovery using servers as data sources and data_analysis techniques. Lab 1437591 (Distributed Programme) connects to center 2 (Integrated Corridor), specializing in evidence_disclosure with computers as sources and log_based_behavioral_analysis techniques. The view preserves the lab's service_scope alongside the center's focus_area, enabling cross-referencing between the lab's overall mandate and the center's specific role.

**View `vw_legal_tech_solution_lab_discovery_operation_center`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_discovery_operation_center AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.discovery_operation_center_id AS center_discovery_operation_center_id, b.center_id AS center_center_id, b.center_name AS center_center_name
FROM legal_tech_solution_labs a JOIN discovery_operation_centers b ON a.discovery_operation_center_id = b.discovery_operation_center_id;
```

| lab_id | lab_name | location | establishment_date | center_discovery_operation_center_id | center_center_id | center_center_name |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 1 | 5844261 | Seasonal Survey |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 2 | 1437588 | Integrated Corridor |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 3 | 6564397 | Extended Series D |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 4 | default_chart_a_tax_13 | Pilot Assessment |

The counterpart view vw_legal_tech_solution_lab_forensic_operation_center maps labs to their forensic centers. Lab 2106706 is associated with forensic center 100 (Seasonal Survey), which focuses on forensics using data_salvaging techniques and has reporting_capability set to true. Lab 1437591 links to center 101 (Integrated Corridor), specializing in fraud_investigation with data_restoration techniques and reporting_capability of false. This join is critical for understanding which labs have formal reporting capabilities and which forensic techniques are available at each location.

**View `vw_legal_tech_solution_lab_forensic_operation_center`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_forensic_operation_center AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.forensic_operation_center_id AS center_forensic_operation_center_id, b.center_id AS center_center_id, b.center_name AS center_center_name
FROM legal_tech_solution_labs a JOIN forensic_operation_centers b ON a.forensic_operation_center_id = b.forensic_operation_center_id;
```

| lab_id | lab_name | location | establishment_date | center_forensic_operation_center_id | center_center_id | center_center_name |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 100 | 5844261 | Seasonal Survey |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 101 | 1437588 | Integrated Corridor |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 102 | 6564397 | Extended Series D |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 103 | default_chart_a_tax_13 | Pilot Assessment |

The view vw_legal_tech_solution_lab_a_i_engine connects each lab to the AI engine it operates. Lab 2106706 runs engine 5006437 (Baseline Series D), while lab 1437591 operates engine 726035 (Distributed Assessment). The view combines lab attributes such as location and supported_languages with engine details including version, training_data, and processing_efficiency. This allows administrators to assess whether the computational resources at each lab are appropriately matched to the lab's language capabilities and operational demands. Lab 1562831 (Primary Framework A), for instance, runs engine 209207 (Primary Corridor A) with the highest processing_efficiency of 37.80, supporting korean operations.

**View `vw_legal_tech_solution_lab_a_i_engine`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_a_i_engine AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.engine_id AS engine_engine_id, b.engine_name AS engine_engine_name, b.version AS engine_version
FROM legal_tech_solution_labs a JOIN a_i_engines b ON a.engine_id = b.engine_id;
```

| lab_id | lab_name | location | establishment_date | engine_engine_id | engine_engine_name | engine_version |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 5006437 | Baseline Series D | seasonal-version-71 |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 726035 | Distributed Assessment | regional-version-72 |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 8843749 | Adaptive Survey | legacy-version-73 |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 209207 | Primary Corridor A | compact-version-74 |

The view vw_legal_tech_solution_lab_data_analysis_tool links labs to their data analysis tools. Lab 2106706 uses tool comi (Composite Model) with data_collection features, while lab 1437591 employs tool 195360 (Compact Cluster A) for preservation. Lab 12042 (Adaptive Standard) uses tool 3355763 (Legacy Review), a log_tracing tool, and lab 1562831 uses tool 8387539 (Regional Initiative) for information_aggregation and reporting. This join provides a clear inventory of the analytical tools available at each lab, supporting resource planning and capability assessment.

**View `vw_legal_tech_solution_lab_data_analysis_tool`**

```sql
CREATE VIEW vw_legal_tech_solution_lab_data_analysis_tool AS
SELECT a.lab_id, a.lab_name, a.location, a.establishment_date, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM legal_tech_solution_labs a JOIN data_analysis_tools b ON a.data_analysis_tool_id = b.id;
```

| lab_id | lab_name | location | establishment_date | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 2106706 | Baseline Protocol D | extended-location-99 | 2024-07-11 | 100 | comi | Composite Model |
| 1437591 | Distributed Programme | integrated-location-100 | 2025-12-22 | 101 | 195360 | Compact Cluster A |
| 12042 | Adaptive Standard | seasonal-location-101 | 2022-05-06 | 102 | 3355763 | Legacy Review |
| 1562831 | Primary Framework A | regional-location-102 | 2023-10-17 | 103 | 8387539 | Regional Initiative |

From the perspective of discovery operation centers, the view vw_discovery_operation_center_legal_tech_solution_lab reverses the relationship, showing which lab each discovery center serves. Discovery center 1 (Seasonal Survey) serves lab 2106706 (Baseline Protocol D), while center 2 (Integrated Corridor) serves lab 1437591 (Distributed Programme). The view includes the center's focus_area, data_sources, and analysis_techniques alongside the lab's name, location, and isms_compliant status. This perspective is useful for understanding the operational footprint of each discovery center and the labs it supports.

**View `vw_discovery_operation_center_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_discovery_operation_center_legal_tech_solution_lab AS
SELECT a.discovery_operation_center_id, a.center_id, a.center_name, a.focus_area, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM discovery_operation_centers a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| discovery_operation_center_id | center_id | center_name | focus_area | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 1 | 5844261 | Seasonal Survey | discovery | 2106706 | Baseline Protocol D | extended-location-99 |
| 2 | 1437588 | Integrated Corridor | evidence_disclosure | 1437591 | Distributed Programme | integrated-location-100 |
| 3 | 6564397 | Extended Series D | international_litigation | 12042 | Adaptive Standard | seasonal-location-101 |
| 4 | default_chart_a_tax_13 | Pilot Assessment | discovery | 1562831 | Primary Framework A | regional-location-102 |

The view vw_discovery_operation_center_investigation_case connects discovery centers to the cases they support. Center 1 (Seasonal Survey) is linked to case 39800622 (Integrated Assessment A), a compliance_breach case with data_volume of 9.95. Center 2 (Integrated Corridor) supports case 4891 (Extended Survey), a litigation case with data_volume of 12.90. The view combines the center's focus_area and analysis_techniques with the case's case_type, start_date, end_date, and case_status, enabling analysts to understand which types of investigations are handled by which centers and their current status.

**View `vw_discovery_operation_center_investigation_case`**

```sql
CREATE VIEW vw_discovery_operation_center_investigation_case AS
SELECT a.discovery_operation_center_id, a.center_id, a.center_name, a.focus_area, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM discovery_operation_centers a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| discovery_operation_center_id | center_id | center_name | focus_area | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 1 | 5844261 | Seasonal Survey | discovery | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 2 | 1437588 | Integrated Corridor | evidence_disclosure | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 3 | 6564397 | Extended Series D | international_litigation | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 4 | default_chart_a_tax_13 | Pilot Assessment | discovery | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The forensic counterpart, vw_forensic_operation_center_legal_tech_solution_lab, maps forensic centers to their parent labs. Forensic center 100 (Seasonal Survey) serves lab 2106706 (Baseline Protocol D), while center 101 (Integrated Corridor) serves lab 1437591 (Distributed Programme). The view includes the center's focus_area, techniques, and reporting_capability alongside lab details. Center 100, with reporting_capability set to true and techniques including data_salvaging, provides a different operational profile from center 101, which has reporting_capability of false and uses data_restoration techniques.

**View `vw_forensic_operation_center_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_forensic_operation_center_legal_tech_solution_lab AS
SELECT a.forensic_operation_center_id, a.center_id, a.center_name, a.focus_area, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM forensic_operation_centers a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| forensic_operation_center_id | center_id | center_name | focus_area | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 100 | 5844261 | Seasonal Survey | forensics | 2106706 | Baseline Protocol D | extended-location-99 |
| 101 | 1437588 | Integrated Corridor | fraud_investigation | 1437591 | Distributed Programme | integrated-location-100 |
| 102 | 6564397 | Extended Series D | digital_forensics | 12042 | Adaptive Standard | seasonal-location-101 |
| 103 | default_chart_a_tax_13 | Pilot Assessment | forensics | 1562831 | Primary Framework A | regional-location-102 |

The view vw_forensic_operation_center_investigation_case links forensic centers to the cases they support. Center 100 (Seasonal Survey) is associated with case 39800622 (Integrated Assessment A), while center 101 (Integrated Corridor) supports case 4891 (Extended Survey). The view combines the center's techniques and reporting_capability with the case's case_type, case_status, and data_volume. This join is essential for understanding which forensic capabilities are applied to which investigations and whether formal reporting is available for each case.

**View `vw_forensic_operation_center_investigation_case`**

```sql
CREATE VIEW vw_forensic_operation_center_investigation_case AS
SELECT a.forensic_operation_center_id, a.center_id, a.center_name, a.focus_area, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM forensic_operation_centers a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| forensic_operation_center_id | center_id | center_name | focus_area | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 100 | 5844261 | Seasonal Survey | forensics | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 101 | 1437588 | Integrated Corridor | fraud_investigation | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 102 | 6564397 | Extended Series D | digital_forensics | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 103 | default_chart_a_tax_13 | Pilot Assessment | forensics | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The AI engine perspective is captured in vw_a_i_engine_legal_tech_solution_lab, which connects each engine to the lab that operates it. Engine 5006437 (Baseline Series D) is operated by lab 2106706 (Baseline Protocol D), and engine 726035 (Distributed Assessment) by lab 1437591 (Distributed Programme). The view combines engine attributes—version, training_data, supported_languages, and processing_efficiency—with lab details including location, isms_compliant status, and service_scope. This perspective enables capacity planning by showing which labs run which engines and the efficiency levels they provide.

**View `vw_a_i_engine_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_a_i_engine_legal_tech_solution_lab AS
SELECT a.engine_id, a.engine_name, a.version, a.training_data, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM a_i_engines a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| engine_id | engine_name | version | training_data | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 5006437 | Baseline Series D | seasonal-version-71 | primary-training-34 | 2106706 | Baseline Protocol D | extended-location-99 |
| 726035 | Distributed Assessment | regional-version-72 | adaptive-training-35 | 1437591 | Distributed Programme | integrated-location-100 |
| 8843749 | Adaptive Survey | legacy-version-73 | distributed-training-36 | 12042 | Adaptive Standard | seasonal-location-101 |
| 209207 | Primary Corridor A | compact-version-74 | baseline-training-37 | 1562831 | Primary Framework A | regional-location-102 |

The view vw_a_i_engine_investigation_case links AI engines to the cases they process. Engine 5006437 (Baseline Series D) processes case 39800622 (Integrated Assessment A), while engine 726035 (Distributed Assessment) handles case 4891 (Extended Survey). The view combines engine efficiency metrics with case attributes including case_type, data_volume, and case_status. This allows analysts to correlate engine performance with case characteristics—for example, examining whether higher-efficiency engines are assigned to larger data_volume cases.

**View `vw_a_i_engine_investigation_case`**

```sql
CREATE VIEW vw_a_i_engine_investigation_case AS
SELECT a.engine_id, a.engine_name, a.version, a.training_data, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM a_i_engines a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| engine_id | engine_name | version | training_data | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 5006437 | Baseline Series D | seasonal-version-71 | primary-training-34 | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 726035 | Distributed Assessment | regional-version-72 | adaptive-training-35 | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 8843749 | Adaptive Survey | legacy-version-73 | distributed-training-36 | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 209207 | Primary Corridor A | compact-version-74 | baseline-training-37 | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

Finally, vw_data_analysis_tool_legal_tech_solution_lab connects data analysis tools to their parent labs. Tool comi (Composite Model) is used by lab 2106706 (Baseline Protocol D), and tool 195360 (Compact Cluster A) by lab 1437591 (Distributed Programme). The view includes tool attributes such as tool_type, developer, version, and features alongside lab details. This join provides a clear mapping of tool-to-lab assignments, supporting inventory management and capability analysis.

**View `vw_data_analysis_tool_legal_tech_solution_lab`**

```sql
CREATE VIEW vw_data_analysis_tool_legal_tech_solution_lab AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.lab_id AS lab_lab_id, b.lab_name AS lab_lab_name, b.location AS lab_location
FROM data_analysis_tools a JOIN legal_tech_solution_labs b ON a.lab_id = b.lab_id;
```

| id | tool_id | tool_name | tool_type | lab_lab_id | lab_lab_name | lab_location |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | litigation_support | 2106706 | Baseline Protocol D | extended-location-99 |
| 101 | 195360 | Compact Cluster A | data_analysis | 1437591 | Distributed Programme | integrated-location-100 |
| 102 | 3355763 | Legacy Review | log_tracing | 12042 | Adaptive Standard | seasonal-location-101 |
| 103 | 8387539 | Regional Initiative | information_aggregation | 1562831 | Primary Framework A | regional-location-102 |

The view vw_data_analysis_tool_investigation_case links data analysis tools to the cases they support. Tool comi (Composite Model) supports case 39800622 (Integrated Assessment A), while tool 195360 (Compact Cluster A) supports case 4891 (Extended Survey). The view combines tool_type and features with case attributes including case_type, data_volume, and case_status. This perspective is valuable for understanding which analytical approaches are applied to different types of investigations and whether tool capabilities align with case requirements.

**View `vw_data_analysis_tool_investigation_case`**

```sql
CREATE VIEW vw_data_analysis_tool_investigation_case AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.case_id AS case_case_id, b.case_title AS case_case_title, b.start_date AS case_start_date
FROM data_analysis_tools a JOIN investigation_cases b ON a.case_id = b.case_id;
```

| id | tool_id | tool_name | tool_type | case_case_id | case_case_title | case_start_date |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | litigation_support | 39800622 | Integrated Assessment A | 2022-09-05T20:24:00 |
| 101 | 195360 | Compact Cluster A | data_analysis | 4891 | Extended Survey | 2023-02-16T03:41:00 |
| 102 | 3355763 | Legacy Review | log_tracing | 17374813 | Pilot Corridor | 2024-07-27T10:58:00 |
| 103 | 8387539 | Regional Initiative | information_aggregation | state_uk_9 | Baseline Series D | 2025-12-11T17:15:00 |

The investigation management framework described here integrates six core entity types—investigation cases, legal tech solution labs, discovery operation centers, forensic operation centers, AI engines, and data analysis tools—into a coherent operational architecture. Each case is assigned to a lab, which in turn operates discovery and forensic centers, runs AI engines, and deploys data analysis tools. The joined views provide multiple perspectives on these relationships, enabling analysts to trace a case from its origin through its supporting infrastructure, assess the capabilities available at each operational level, and plan resource allocation based on the interconnected nature of the system. The fictional organizations, centers, and tools documented in these records represent a complete operational ecosystem designed to handle the full spectrum of legal technology investigations.