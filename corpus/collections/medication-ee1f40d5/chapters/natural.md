## Healthcare Information Delivery and Patient Experience Management

Modern healthcare facilities operate as complex information ecosystems where clinical interventions, patient education materials, and digital communication channels converge to shape the care experience. At the heart of this ecosystem lies a structured data environment that tracks medications administered, the educational fact sheets distributed to patients, the digital endpoints through which information is delivered, and the survey-based metrics that quantify patient satisfaction. Understanding how these elements interrelate is essential for administrators, clinical informaticists, and quality improvement professionals who must optimize both the clinical and communicative dimensions of patient care.

The foundation of this data environment consists of five core record sets. Medications are catalogued with identifiers, brand and generic names, dosage specifications, and administration routes. Each medication record carries a reference to a supporting fact sheet and, in many cases, a patient assignment.

**Table `medications`**

| id | medication_id | brand_name | generic_name | dosage_form | strength | administration_route | medication_fact_sheet_id | patient_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4716397 | The College-Ready Promise | Distributed Review | primary-dosage-40 | seasonal-strength-95 | primary-administ-22 | 1 | 8387541 | 2025-01-01 00:14:00 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods | Adaptive Initiative D | adaptive-dosage-41 | regional-strength-96 | adaptive-administ-23 | 2 | 10207142 | 2025-02-06 03:14:00 |
| 3 | 1562853 | Navistar International | Primary Model | distributed-dosage-42 | legacy-strength-97 | distributed-administ-24 | 3 | 7119782 | 2025-03-11 06:14:00 |
| 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. | Composite Cluster | baseline-dosage-43 | compact-strength-98 | baseline-administ-25 | 4 | gd_acc_160003 | 2025-04-16 09:14:00 |

The medication records illustrate the breadth of the formulary. The College-Ready Promise (medication_id 4716397) is a primary-dosage-40 formulation administered via primary-administ-22, paired with fact sheet 7441140 and assigned to patient 8387541. General Foods (medication_id 1c87986a-8fcd-11eb-924d-9cd76263cbd0) uses an adaptive-dosage-41 formulation with adaptive-administ-23, linked to fact sheet 103191 and patient 10207142. Navistar International's Primary Model (medication_id 1562853) follows a distributed-dosage-42 protocol, while Root Inc.'s Composite Cluster (medication_id e02275d4-8fd1-11eb-924d-9cd76263cbd0) carries the identifier gd_acc_160003 and uses baseline-dosage-43 with baseline-administ-25.

Patient education materials are maintained as medication fact sheets, each with a title, a last-updated timestamp, a source system attribution, language designation, and a readability level.

**Table `medication_fact_sheets`**

| id | fact_sheet_id | title | last_updated | source_system | language | readability_level | medication_id | display_endpoint_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7441140 | Compact Initiative | 2023-06-17T17:27:00 | composite-source-39 | composite-language-45 | integrated-readabil-64 | 1 | 100 |
| 2 | 103191 | Legacy Model | 2024-11-01T00:44:00 | primary-source-40 | primary-language-46 | seasonal-readabil-65 | 2 | 101 |
| 3 | 884338 | Regional Cluster A | 2025-04-12T07:01:00 | adaptive-source-41 | adaptive-language-47 | regional-readabil-66 | 3 | 102 |
| 4 | 11330 | Seasonal Review | 2022-09-23T14:18:00 | distributed-source-42 | distributed-language-48 | legacy-readabil-67 | 4 | 103 |

The fact sheets are organized around distinct titles: Compact Initiative (fact_sheet_id 7441140, last updated 2023-06-17T17:27:00 from composite-source-39 in composite-language-45 at integrated-readabil-64 readability), Legacy Model (fact_sheet_id 103191, updated 2024-11-01T00:44:00 from primary-source-40), Regional Cluster A (fact_sheet_id 884338, updated 2025-04-12T07:01:00 from adaptive-source-41), and Seasonal Review (fact_sheet_id 11330, updated 2022-09-23T14:18:00 from distributed-source-42). Each fact sheet references a specific medication and a display endpoint, establishing the chain from clinical product through educational content to the device through which it reaches the patient.

Patient records anchor the operational data to individuals in care.

**Table `patients`**

| patient_id | admission_date | discharge_date | room_number | bed_number | hcahps_score | medication_id | medication_fact_sheet_id | display_endpoint_id |
|---|---|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | BED-2363 | 12.70 | 1 | 1 | 100 |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | BED-2369 | 15.40 | 2 | 2 | 101 |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | BED-2375 | 18.10 | 3 | 3 | 102 |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | BED-2381 | 20.80 | 4 | 4 | 103 |

Patient 8387541 was admitted on 2023-06-22 and discharged on 2022-09-02, occupying room ROO-2106, bed BED-2363, with an HCAHPS score of 12.70. Patient 10207142, admitted 2024-11-06 and discharged 2023-02-13, occupied ROO-2113/BED-2369 with a score of 15.40. Patient 7119782, admitted 2025-04-17 and discharged 2024-07-24, was in ROO-2120/BED-2375 with a score of 18.10. Patient gd_acc_160003, admitted 2022-09-01 and discharged 2025-12-08, occupied ROO-2127/BED-2381 with the highest recorded score of 20.80. Each patient record links to a medication, a fact sheet, and a display endpoint, forming a complete care episode record.

Digital communication infrastructure is tracked through display endpoints, which represent the physical devices through which patient-facing information is rendered.

**Table `display_endpoints`**

| id | endpoint_id | device_type | ip_address | status | location_room | last_heartbeat | medication_fact_sheet_id | patient_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV | extended-ip-15 | active | baseline-location-97 | 2022-09-07T20:36:00 | 1 | 8387541 |
| 101 | 48753442 | mobileDevice | integrated-ip-16 | inactive | pilot-location-98 | 2023-02-18T03:53:00 | 2 | 10207142 |
| 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer | seasonal-ip-17 | maintenance | extended-location-99 | 2024-07-02T10:10:00 | 3 | 7119782 |
| 103 | 10238272 | digitalWhiteboard | regional-ip-18 | active | integrated-location-100 | 2025-12-13T17:27:00 | 4 | gd_acc_160003 |

Endpoint 100 (57da7384-8fcc-11eb-924d-9cd76263cbd0) is a bedsideTV at baseline-location-97 with extended-ip-15, currently active, with its last heartbeat recorded at 2022-09-07T20:36:00. Endpoint 101 (48753442) is a mobileDevice at pilot-location-98 with integrated-ip-16, currently inactive, last seen at 2023-02-18T03:53:00. Endpoint 102 (2bc4116a-8fcc-11eb-924d-9cd76263cbd0) is a computer at extended-location-99 with seasonal-ip-17, in maintenance status, with a heartbeat of 2024-07-02T10:10:00. Endpoint 103 (10238272) is a digitalWhiteboard at integrated-location-100 with regional-ip-18, active, last heartbeating at 2025-12-13T17:27:00. The device types span bedside television, mobile device, computer, and digital whiteboard, reflecting the multi-modal nature of patient information delivery.

Patient satisfaction is measured through HCAHPS metrics, which capture survey responses across clinical categories.

**Table `h_c_a_h_p_s_metrics`**

| h_c_a_h_p_s_metric_id | metric_id | survey_date | category | score | benchmark | trend | patient_id | medication_fact_sheet_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | 2024-07-23 | medicationCommunication | 9.20 | 15.45 | improving | 8387541 | 1 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-07 | painManagement | 13.40 | 18.90 | stable | 10207142 | 2 |
| 3 | 2986226 | 2022-05-18 | dischargeInformation | 17.60 | 22.35 | declining | 7119782 | 3 |
| 4 | 2002007020010 | 2023-10-02 | medicationCommunication | 21.80 | 25.80 | improving | gd_acc_160003 | 4 |

The metric records span categories including medicationCommunication, painManagement, and dischargeInformation. Metric 3744010 (h_c_a_h_p_s_metric_id 1) for patient 8387541, surveyed on 2024-07-23, recorded a medicationCommunication score of 9.20 against a benchmark of 15.45, with an improving trend. Metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (h_c_a_h_p_s_metric_id 2) for patient 10207142, surveyed on 2025-12-07, captured painManagement at 13.40 versus a benchmark of 18.90, marked stable. Metric 2986226 (h_c_a_h_p_s_metric_id 3) for patient 7119782, surveyed on 2022-05-18, recorded dischargeInformation at 17.60 against a benchmark of 22.35, trending declining. Metric 2002007020010 (h_c_a_h_p_s_metric_id 4) for patient gd_acc_160003, surveyed on 2023-10-02, showed medicationCommunication at 21.80 versus a benchmark of 25.80, also improving. Each metric links to a patient and a fact sheet, enabling traceability from survey response back to the educational materials the patient received.

### Medication-to-Fact-Sheet Relationships

The view v_medication_medication_fact_sheet joins the medications table with the medication_fact_sheets table on the medication_fact_sheet_id foreign key, producing a direct mapping between each medication and its corresponding educational document. This join answers the question: which fact sheet supports which medication?

**View `v_medication_medication_fact_sheet`**

```sql
CREATE VIEW v_medication_medication_fact_sheet AS
SELECT a.id, a.medication_id, a.brand_name, a.generic_name, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM medications a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| id | medication_id | brand_name | generic_name | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 1 | 4716397 | The College-Ready Promise | Distributed Review | 1 | 7441140 | Compact Initiative |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods | Adaptive Initiative D | 2 | 103191 | Legacy Model |
| 3 | 1562853 | Navistar International | Primary Model | 3 | 884338 | Regional Cluster A |
| 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. | Composite Cluster | 4 | 11330 | Seasonal Review |

The joined result confirms a one-to-one correspondence in the current dataset. The College-Ready Promise (id 1, medication_id 4716397) maps to the Compact Initiative fact sheet (sheet_id 1, sheet_fact_sheet_id 7441140). General Foods (id 2, medication_id 1c87986a-8fcd-11eb-924d-9cd76263cbd0) maps to the Legacy Model (sheet_id 2, sheet_fact_sheet_id 103191). Navistar International (id 3, medication_id 1562853) maps to Regional Cluster A (sheet_id 3, sheet_fact_sheet_id 884338). Root Inc. (id 4, medication_id e02275d4-8fd1-11eb-924d-9cd76263cbd0) maps to Seasonal Review (sheet_id 4, sheet_fact_sheet_id 11330). This alignment ensures that every medication in the formulary has a documented educational counterpart.

### Medication-to-Patient Assignments

The view v_medication_patient joins medications with patients, revealing which patients are associated with which medications. This relationship supports clinical tracking and medication reconciliation.

**View `v_medication_patient`**

```sql
CREATE VIEW v_medication_patient AS
SELECT a.id, a.medication_id, a.brand_name, a.generic_name, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM medications a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | medication_id | brand_name | generic_name | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 1 | 4716397 | The College-Ready Promise | Distributed Review | 8387541 | 2023-06-22 | 2022-09-02 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods | Adaptive Initiative D | 10207142 | 2024-11-06 | 2023-02-13 |
| 3 | 1562853 | Navistar International | Primary Model | 7119782 | 2025-04-17 | 2024-07-24 |
| 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. | Composite Cluster | gd_acc_160003 | 2022-09-01 | 2025-12-08 |

In the current data, each medication is assigned to exactly one patient, forming a clear care episode. The College-Ready Promise (id 1, medication_id 4716397) is assigned to patient 8387541. General Foods (id 2, medication_id 1c87986a-8fcd-11eb-924d-9cd76263cbd0) is assigned to patient 10207142. Navistar International (id 3, medication_id 1562853) is assigned to patient 7119782. Root Inc. (id 4, medication_id e02275d4-8fd1-11eb-924d-9cd76263cbd0) is assigned to patient gd_acc_160003. This structure enables administrators to trace medication administration back to individual patient records for audit and quality review.

### Fact-Sheet-to-Medication Reverse Lookup

The view v_medication_fact_sheet_medication performs the inverse join, starting from the fact sheet side and resolving the associated medication. This perspective is useful when a clinician or administrator begins with an educational document and needs to identify the clinical product it supports.

**View `v_medication_fact_sheet_medication`**

```sql
CREATE VIEW v_medication_fact_sheet_medication AS
SELECT a.id, a.fact_sheet_id, a.title, a.last_updated, b.id AS medication_id, b.medication_id AS medication_medication_id, b.brand_name AS medication_brand_name
FROM medication_fact_sheets a JOIN medications b ON a.medication_id = b.id;
```

| id | fact_sheet_id | title | last_updated | medication_id | medication_medication_id | medication_brand_name |
|---|---|---|---|---|---|---|
| 1 | 7441140 | Compact Initiative | 2023-06-17T17:27:00 | 1 | 4716397 | The College-Ready Promise |
| 2 | 103191 | Legacy Model | 2024-11-01T00:44:00 | 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods |
| 3 | 884338 | Regional Cluster A | 2025-04-12T07:01:00 | 3 | 1562853 | Navistar International |
| 4 | 11330 | Seasonal Review | 2022-09-23T14:18:00 | 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. |

The result mirrors the forward mapping: Compact Initiative (sheet_id 1, sheet_fact_sheet_id 7441140) resolves to The College-Ready Promise (id 1, medication_id 4716397). Legacy Model (sheet_id 2, sheet_fact_sheet_id 103191) resolves to General Foods (id 2, medication_id 1c87986a-8fcd-11eb-924d-9cd76263cbd0). Regional Cluster A (sheet_id 3, sheet_fact_sheet_id 884338) resolves to Navistar International (id 3, medication_id 1562853). Seasonal Review (sheet_id 4, sheet_fact_sheet_id 11330) resolves to Root Inc. (id 4, medication_id e02275d4-8fd1-11eb-924d-9cd76263cbd0). The symmetry between this view and v_medication_medication_fact_sheet confirms data consistency across the join direction.

### Fact-Sheet-to-Display-Endpoint Delivery Chain

The view v_medication_fact_sheet_display_endpoint joins medication_fact_sheets with display_endpoints, revealing the delivery infrastructure for each educational document. This join answers: through which device is a given fact sheet presented to the patient?

**View `v_medication_fact_sheet_display_endpoint`**

```sql
CREATE VIEW v_medication_fact_sheet_display_endpoint AS
SELECT a.id, a.fact_sheet_id, a.title, a.last_updated, b.id AS endpoint_id, b.endpoint_id AS endpoint_endpoint_id, b.device_type AS endpoint_device_type
FROM medication_fact_sheets a JOIN display_endpoints b ON a.display_endpoint_id = b.id;
```

| id | fact_sheet_id | title | last_updated | endpoint_id | endpoint_endpoint_id | endpoint_device_type |
|---|---|---|---|---|---|---|
| 1 | 7441140 | Compact Initiative | 2023-06-17T17:27:00 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV |
| 2 | 103191 | Legacy Model | 2024-11-01T00:44:00 | 101 | 48753442 | mobileDevice |
| 3 | 884338 | Regional Cluster A | 2025-04-12T07:01:00 | 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer |
| 4 | 11330 | Seasonal Review | 2022-09-23T14:18:00 | 103 | 10238272 | digitalWhiteboard |

Each fact sheet is routed through a specific endpoint. Compact Initiative (sheet_id 1, sheet_fact_sheet_id 7441140) is delivered via endpoint 100 (57da7384-8fcc-11eb-924d-9cd76263cbd0), a bedsideTV at baseline-location-97. Legacy Model (sheet_id 2, sheet_fact_sheet_id 103191) is delivered via endpoint 101 (48753442), a mobileDevice at pilot-location-98. Regional Cluster A (sheet_id 3, sheet_fact_sheet_id 884338) is delivered via endpoint 102 (2bc4116a-8fcc-11eb-924d-9cd76263cbd0), a computer at extended-location-99. Seasonal Review (sheet_id 4, sheet_fact_sheet_id 11330) is delivered via endpoint 103 (10238272), a digitalWhiteboard at integrated-location-100. This mapping is critical for understanding which devices are actively supporting patient education and which may require attention due to inactive or maintenance status.

### Patient-to-Medication Care Episodes

The view v_patient_medication joins patients with medications, providing a patient-centric view of medication assignments. This is the primary lens for clinical review and medication reconciliation.

**View `v_patient_medication`**

```sql
CREATE VIEW v_patient_medication AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.room_number, b.id AS medication_id, b.medication_id AS medication_medication_id, b.brand_name AS medication_brand_name
FROM patients a JOIN medications b ON a.medication_id = b.id;
```

| patient_id | admission_date | discharge_date | room_number | medication_id | medication_medication_id | medication_brand_name |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | 1 | 4716397 | The College-Ready Promise |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | General Foods |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | 3 | 1562853 | Navistar International |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | 4 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Root Inc. |

Patient 8387541 is associated with medication id 1 (medication_id 4716397, The College-Ready Promise). Patient 10207142 is associated with medication id 2 (medication_id 1c87986a-8fcd-11eb-924d-9cd76263cbd0, General Foods). Patient 7119782 is associated with medication id 3 (medication_id 1562853, Navistar International). Patient gd_acc_160003 is associated with medication id 4 (medication_id e02275d4-8fd1-11eb-924d-9cd76263cbd0, Root Inc.). The join preserves the full medication detail alongside the patient record, enabling side-by-side review of clinical product and patient context.

### Patient-to-Fact-Sheet Education Traceability

The view v_patient_medication_fact_sheet joins patients with medication_fact_sheets, establishing which educational materials each patient received. This is essential for compliance auditing and for correlating education exposure with satisfaction outcomes.

**View `v_patient_medication_fact_sheet`**

```sql
CREATE VIEW v_patient_medication_fact_sheet AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.room_number, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM patients a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| patient_id | admission_date | discharge_date | room_number | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | 1 | 7441140 | Compact Initiative |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | 2 | 103191 | Legacy Model |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | 3 | 884338 | Regional Cluster A |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | 4 | 11330 | Seasonal Review |

Patient 8387541 received Compact Initiative (sheet_id 1, sheet_fact_sheet_id 7441140). Patient 10207142 received Legacy Model (sheet_id 2, sheet_fact_sheet_id 103191). Patient 7119782 received Regional Cluster A (sheet_id 3, sheet_fact_sheet_id 884338). Patient gd_acc_160003 received Seasonal Review (sheet_id 4, sheet_fact_sheet_id 11330). The one-to-one alignment between patient and fact sheet in this dataset simplifies the analysis, though in production environments, patients may receive multiple fact sheets across a care episode.

### Patient-to-Display-Endpoint Device Assignment

The view v_patient_display_endpoint joins patients with display_endpoints, revealing which device each patient uses to access information. This supports device utilization analysis and infrastructure planning.

**View `v_patient_display_endpoint`**

```sql
CREATE VIEW v_patient_display_endpoint AS
SELECT a.patient_id, a.admission_date, a.discharge_date, a.room_number, b.id AS endpoint_id, b.endpoint_id AS endpoint_endpoint_id, b.device_type AS endpoint_device_type
FROM patients a JOIN display_endpoints b ON a.display_endpoint_id = b.id;
```

| patient_id | admission_date | discharge_date | room_number | endpoint_id | endpoint_endpoint_id | endpoint_device_type |
|---|---|---|---|---|---|---|
| 8387541 | 2023-06-22 | 2022-09-02 | ROO-2106 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV |
| 10207142 | 2024-11-06 | 2023-02-13 | ROO-2113 | 101 | 48753442 | mobileDevice |
| 7119782 | 2025-04-17 | 2024-07-24 | ROO-2120 | 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer |
| gd_acc_160003 | 2022-09-01 | 2025-12-08 | ROO-2127 | 103 | 10238272 | digitalWhiteboard |

Patient 8387541 is assigned to endpoint 100 (57da7384-8fcc-11eb-924d-9cd76263cbd0), a bedsideTV at baseline-location-97, currently active. Patient 10207142 is assigned to endpoint 101 (48753442), a mobileDevice at pilot-location-98, currently inactive. Patient 7119782 is assigned to endpoint 102 (2bc4116a-8fcc-11eb-924d-9cd76263cbd0), a computer at extended-location-99, in maintenance. Patient gd_acc_160003 is assigned to endpoint 103 (10238272), a digitalWhiteboard at integrated-location-100, active. The status field is particularly important: two of the four endpoints are not currently active, which may indicate gaps in information delivery for patients 10207142 and 7119782.

### Display-Endpoint-to-Fact-Sheet Content Routing

The view v_display_endpoint_medication_fact_sheet joins display_endpoints with medication_fact_sheets, showing which educational content is routed through each device. This is the operational view for IT and clinical education teams managing content deployment.

**View `v_display_endpoint_medication_fact_sheet`**

```sql
CREATE VIEW v_display_endpoint_medication_fact_sheet AS
SELECT a.id, a.endpoint_id, a.device_type, a.ip_address, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM display_endpoints a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| id | endpoint_id | device_type | ip_address | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV | extended-ip-15 | 1 | 7441140 | Compact Initiative |
| 101 | 48753442 | mobileDevice | integrated-ip-16 | 2 | 103191 | Legacy Model |
| 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer | seasonal-ip-17 | 3 | 884338 | Regional Cluster A |
| 103 | 10238272 | digitalWhiteboard | regional-ip-18 | 4 | 11330 | Seasonal Review |

Endpoint 100 (57da7384-8fcc-11eb-924d-9cd76263cbd0, bedsideTV) delivers Compact Initiative (sheet_id 1, sheet_fact_sheet_id 7441140). Endpoint 101 (48753442, mobileDevice) delivers Legacy Model (sheet_id 2, sheet_fact_sheet_id 103191). Endpoint 102 (2bc4116a-8fcc-11eb-924d-9cd76263cbd0, computer) delivers Regional Cluster A (sheet_id 3, sheet_fact_sheet_id 884338). Endpoint 103 (10238272, digitalWhiteboard) delivers Seasonal Review (sheet_id 4, sheet_fact_sheet_id 11330). The device-to-content mapping is consistent with the fact sheet-to-endpoint linkage, confirming that content routing is properly configured across the infrastructure.

### Display-Endpoint-to-Patient User Context

The view v_display_endpoint_patient joins display_endpoints with patients, providing the reverse perspective: which patient is served by which device. This is useful for device-level support and for understanding patient-device pairing patterns.

**View `v_display_endpoint_patient`**

```sql
CREATE VIEW v_display_endpoint_patient AS
SELECT a.id, a.endpoint_id, a.device_type, a.ip_address, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM display_endpoints a JOIN patients b ON a.patient_id = b.patient_id;
```

| id | endpoint_id | device_type | ip_address | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | bedsideTV | extended-ip-15 | 8387541 | 2023-06-22 | 2022-09-02 |
| 101 | 48753442 | mobileDevice | integrated-ip-16 | 10207142 | 2024-11-06 | 2023-02-13 |
| 102 | 2bc4116a-8fcc-11eb-924d-9cd76263cbd0 | computer | seasonal-ip-17 | 7119782 | 2025-04-17 | 2024-07-24 |
| 103 | 10238272 | digitalWhiteboard | regional-ip-18 | gd_acc_160003 | 2022-09-01 | 2025-12-08 |

Endpoint 100 (57da7384-8fcc-11eb-924d-9cd76263cbd0, bedsideTV) serves patient 8387541. Endpoint 101 (48753442, mobileDevice) serves patient 10207142. Endpoint 102 (2bc4116a-8fcc-11eb-924d-9cd76263cbd0, computer) serves patient 7119782. Endpoint 103 (10238272, digitalWhiteboard) serves patient gd_acc_160003. The pairing is consistent with the patient-to-endpoint assignment, confirming that each patient has a dedicated device for information delivery.

### HCAHPS Metric-to-Patient Survey Attribution

The view v_h_c_a_h_p_s_metric_patient joins h_c_a_h_p_s_metrics with patients, linking survey responses to the individuals who provided them. This is the primary analytical view for quality improvement teams tracking satisfaction trends.

**View `v_h_c_a_h_p_s_metric_patient`**

```sql
CREATE VIEW v_h_c_a_h_p_s_metric_patient AS
SELECT a.h_c_a_h_p_s_metric_id, a.metric_id, a.survey_date, a.category, b.patient_id AS patient_patient_id, b.admission_date AS patient_admission_date, b.discharge_date AS patient_discharge_date
FROM h_c_a_h_p_s_metrics a JOIN patients b ON a.patient_id = b.patient_id;
```

| h_c_a_h_p_s_metric_id | metric_id | survey_date | category | patient_patient_id | patient_admission_date | patient_discharge_date |
|---|---|---|---|---|---|---|
| 1 | 3744010 | 2024-07-23 | medicationCommunication | 8387541 | 2023-06-22 | 2022-09-02 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-07 | painManagement | 10207142 | 2024-11-06 | 2023-02-13 |
| 3 | 2986226 | 2022-05-18 | dischargeInformation | 7119782 | 2025-04-17 | 2024-07-24 |
| 4 | 2002007020010 | 2023-10-02 | medicationCommunication | gd_acc_160003 | 2022-09-01 | 2025-12-08 |

Metric 3744010 (h_c_a_h_p_s_metric_id 1) is attributed to patient 8387541, with a medicationCommunication score of 9.20 against a benchmark of 15.45, trending improving. Metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (h_c_a_h_p_s_metric_id 2) is attributed to patient 10207142, with a painManagement score of 13.40 versus a benchmark of 18.90, marked stable. Metric 2986226 (h_c_a_h_p_s_metric_id 3) is attributed to patient 7119782, with a dischargeInformation score of 17.60 against a benchmark of 22.35, trending declining. Metric 2002007020010 (h_c_a_h_p_s_metric_id 4) is attributed to patient gd_acc_160003, with a medicationCommunication score of 21.80 versus a benchmark of 25.80, also improving. The trend field provides an at-a-glance indicator of whether performance is moving toward or away from the benchmark.

### HCAHPS Metric-to-Fact-Sheet Educational Correlation

The view v_h_c_a_h_p_s_metric_medication_fact_sheet joins h_c_a_h_p_s_metrics with medication_fact_sheets, enabling analysis of whether specific educational materials correlate with specific satisfaction outcomes. This is the analytical bridge between education delivery and measured patient experience.

**View `v_h_c_a_h_p_s_metric_medication_fact_sheet`**

```sql
CREATE VIEW v_h_c_a_h_p_s_metric_medication_fact_sheet AS
SELECT a.h_c_a_h_p_s_metric_id, a.metric_id, a.survey_date, a.category, b.id AS sheet_id, b.fact_sheet_id AS sheet_fact_sheet_id, b.title AS sheet_title
FROM h_c_a_h_p_s_metrics a JOIN medication_fact_sheets b ON a.medication_fact_sheet_id = b.id;
```

| h_c_a_h_p_s_metric_id | metric_id | survey_date | category | sheet_id | sheet_fact_sheet_id | sheet_title |
|---|---|---|---|---|---|---|
| 1 | 3744010 | 2024-07-23 | medicationCommunication | 1 | 7441140 | Compact Initiative |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 2025-12-07 | painManagement | 2 | 103191 | Legacy Model |
| 3 | 2986226 | 2022-05-18 | dischargeInformation | 3 | 884338 | Regional Cluster A |
| 4 | 2002007020010 | 2023-10-02 | medicationCommunication | 4 | 11330 | Seasonal Review |

Metric 3744010 (h_c_a_h_p_s_metric_id 1) correlates with Compact Initiative (sheet_id 1, sheet_fact_sheet_id 7441140), yielding a medicationCommunication score of 9.20. Metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (h_c_a_h_p_s_metric_id 2) correlates with Legacy Model (sheet_id 2, sheet_fact_sheet_id 103191), yielding a painManagement score of 13.40. Metric 2986226 (h_c_a_h_p_s_metric_id 3) correlates with Regional Cluster A (sheet_id 3, sheet_fact_sheet_id 884338), yielding a dischargeInformation score of 17.60. Metric 2002007020010 (h_c_a_h_p_s_metric_id 4) correlates with Seasonal Review (sheet_id 4, sheet_fact_sheet_id 11330), yielding a medicationCommunication score of 21.80. While the current dataset contains only one metric per fact sheet, in a production environment this join would support statistical analysis of whether certain educational content formats or readability levels produce measurably different satisfaction outcomes.

### Synthesis

The data environment described here forms a coherent operational model for healthcare information delivery. Medications are linked to their educational fact sheets, which are in turn routed through specific display endpoints to individual patients. HCAHPS survey metrics provide a feedback loop, connecting patient satisfaction scores back to the medications, fact sheets, and devices involved in the care episode. The twelve views presented above cover every pairwise relationship among the five core record sets, enabling analysts to approach the data from any angle: from the medication outward, from the patient inward, from the device contextually, or from the survey metric backward through the care chain. This structure supports both real-time operational monitoring and retrospective quality analysis, ensuring that decisions about clinical products, educational content, and digital infrastructure are grounded in complete, traceable evidence.