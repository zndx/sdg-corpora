## Healthcare Regulatory Compliance and Service Oversight

Healthcare delivery operates within a tightly regulated framework where clinical services must demonstrate ongoing compliance across multiple dimensions of care quality. The regulatory ecosystem tracks inspections, findings, patient outcomes, clinician qualifications, and medication management through interconnected records that together form a comprehensive picture of service performance. Each clinical service—whether delivering composite, primary, or adaptive care—undergoes periodic evaluation against standardized criteria, and the results of those evaluations cascade through the entire organizational structure, linking inspections to findings, clinicians to patients, and medicines to clinical need.

**Table `inspection_events`**

| inspection_event_id | inspection_date | inspection_type | regulatory_basis | overall_safety_rating | overall_effectiveness_rating | overall_caring_rating | overall_responsive_rating | overall_well_led_rating | clinical_service_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2025-12-03T23:09:00 | announced | distributed-regulato-78 | safe | effective | caring | responsive | well-led | 100 |
| 101 | 2022-05-14T06:26:00 | unannounced | baseline-regulato-79 | unsafe | ineffective | uncaring | unresponsive | poorly-led | 101 |
| 102 | 2023-10-25T13:43:00 | comprehensive | pilot-regulato-80 | requires_improvement | requires_improvement | requires_improvement | requires_improvement | requires_improvement | 102 |
| 103 | 2024-03-09T20:00:00 | announced | extended-regulato-81 | safe | effective | caring | responsive | well-led | 103 |

Inspection events represent the formal assessment mechanism through which regulatory bodies evaluate clinical services. Each event carries a date, a type—announced, unannounced, or comprehensive—and a regulatory basis that identifies the specific framework under which the inspection was conducted. The five-domain rating model captures the essential dimensions of care quality: safety, effectiveness, caring, responsiveness, and well-led leadership. An inspection such as event 100, conducted on 2025-12-03 under the distributed-regulato-78 framework, awarded uniformly positive ratings across all five domains, reflecting a service operating at a high standard. By contrast, event 101, an unannounced inspection on 2022-05-14, returned uniformly negative ratings—unsafe, ineffective, uncaring, unresponsive, and poorly-led—signaling a service in serious distress. The comprehensive inspection type, as seen in event 102, tends to produce more nuanced assessments, with event 102 assigning requires_improvement across all domains, indicating systemic deficiencies that demand structured remediation.

**Table `clinical_services`**

| id | service_id | service_type | operating_hours | location_address | location_postcode | number_of_clinicians | number_of_support_staff | service_status |
|---|---|---|---|---|---|---|---|---|
| 100 | 1996925 | composite-service-81 | pilot-operatin-50 | baseline-location-61 | LOC-2383 | 5 | 34 | active |
| 101 | 3990164 | primary-service-82 | extended-operatin-51 | pilot-location-62 | LOC-2387 | 9 | 38 | suspended |
| 102 | 5844258 | adaptive-service-83 | integrated-operatin-52 | extended-location-63 | LOC-2391 | 13 | 42 | closed |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | seasonal-operatin-53 | integrated-location-64 | LOC-2395 | 17 | 46 | active |

Clinical services form the operational backbone of the healthcare delivery network. Each service is characterized by its type—composite-service-81, primary-service-82, adaptive-service-83, or distributed-service-84—alongside its operating model, physical location, and staffing levels. Service 100, operating under the pilot-operatin-50 model at baseline-location-61 with postcode LOC-2383, employs five clinicians and thirty-four support staff and maintains an active status. Service 101, running the extended-operatin-51 model, has nine clinicians and thirty-eight support staff but holds a suspended status, suggesting a temporary halt in operations pending remediation. Service 102, with the largest staffing complement of thirteen clinicians and forty-two support staff, operates under the integrated-operatin-52 model but carries a closed status, indicating permanent cessation. Service 103, the distributed-service-84, maintains active operations with seventeen clinicians and forty-six support staff under the seasonal-operatin-53 model.

**Table `regulatory_findings`**

| finding_id | finding_category | finding_status | finding_description | finding_date | prior_finding_id | clinical_service_id | inspection_event_id | regulatory_requirement_id |
|---|---|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 2025-08-26T19:09:00 | client-focus | 100 | 100 | 1000 |
| 4793483 | effective | non_compliant | Composite Protocol | 2022-01-10T02:26:00 | 575200 | 101 | 101 | 1001 |
| 6564384 | caring | requires_improvement | Compact Programme | 2023-06-21T09:43:00 | 9125635 | 102 | 102 | 1002 |
| 8928500 | responsive | compliant | Legacy Standard D | 2024-11-05T16:00:00 | 1186102 | 103 | 103 | 1003 |

Regulatory findings translate the broad assessments of inspection events into specific, actionable observations. Each finding is categorized along the same five quality dimensions—safe, effective, caring, responsive—and assigned a status of compliant, non_compliant, or requires_improvement. Finding dbea2f30-8fcb-11eb-924d-9cd76263cbd0, classified under the safe category and dated 2025-08-26, describes the Primary Framework A and carries a compliant status, indicating that the associated clinical service meets the required standard. Finding 4793483, categorized as effective and dated 2022-01-10, describes the Composite Protocol and carries a non_compliant status, signaling a failure to meet the effectiveness criterion. The findings also track prior findings through the prior_finding_id field, enabling auditors to follow the evolution of compliance issues over time. Finding 6564384, categorized as caring and dated 2023-06-21, references prior finding 9125635, suggesting a historical pattern of concern in the caring dimension that has persisted to the current requires_improvement assessment.

**Table `patients`**

| id | patient_id | patient_age | patient_gender | consultation_frequency | feedback_rating | risk_screening_status | clinical_service_id | finding_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8387541 | 27 | male | baseline-consulta-67 | positive | screened | 100 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
| 2 | 10207142 | 38 | female | pilot-consulta-68 | neutral | not_screened | 101 | 4793483 |
| 3 | 7119782 | 49 | other | extended-consulta-69 | negative | at_risk | 102 | 6564384 |
| 4 | gd_acc_160003 | 60 | male | integrated-consulta-70 | positive | screened | 103 | 8928500 |

Patient records connect individuals to the clinical services they receive and the regulatory findings that affect their care. Each patient record includes demographic information—age, gender—and operational details such as consultation frequency, feedback rating, and risk screening status. Patient 1, aged 27 and male, receives baseline-consulta-67 level consultation, provides a positive feedback rating, and holds a screened risk status, linked to clinical service 100 and finding dbea2f30-8fcb-11eb-924d-9cd76263cbd0. Patient 2, aged 38 and female, receives pilot-consulta-68 consultation with a neutral feedback rating and not_screened risk status, associated with service 101 and finding 4793483. Patient 3, aged 49 and identifying as other, receives extended-consulta-69 consultation, provides a negative feedback rating, and holds an at_risk screening status, linked to service 102 and finding 6564384. Patient 4, aged 60 and male, receives integrated-consulta-70 consultation with a positive feedback rating and screened risk status, connected to service 103 and finding 8928500.

**Table `clinicians`**

| id | clinician_id | clinician_name | specialization | training_completed | safeguarding_awareness | supervision_status | clinical_service_id |
|---|---|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | legacy-speciali-13 | false | true | supervised | 100 |
| 101 | 2986233 | Primary Assessment | compact-speciali-14 | true | false | unsupervised | 101 |
| 102 | 168567 | Composite Survey D | composite-speciali-15 | false | true | supervised | 102 |
| 103 | 884366 | Compact Corridor | primary-speciali-16 | true | false | unsupervised | 103 |

Clinicians are the professional staff who deliver care within clinical services. Each clinician record identifies their specialization, training completion status, safeguarding awareness, and supervision status. Clinician 100, named Adaptive Series, holds legacy-speciali-13 specialization, has not completed training (training_completed is false), maintains safeguarding awareness, and operates under supervised status within clinical service 100. Clinician 101, named Primary Assessment, holds compact-speciali-14 specialization, has completed training, lacks safeguarding awareness, and operates under unsupervised status within service 101. Clinician 102, named Composite Survey D, holds composite-speciali-15 specialization, has not completed training, maintains safeguarding awareness, and operates under supervised status within service 102. Clinician 103, named Compact Corridor, holds primary-speciali-16 specialization, has completed training, lacks safeguarding awareness, and operates under unsupervised status within service 103.

**Table `medicines`**

| id | medicine_id | medicine_name | medicine_type | prescription_status | storage_condition | clinical_need_justification | clinician_id |
|---|---|---|---|---|---|---|---|
| 100 | 1437596 | Adaptive Series | licensed | active | adaptive-storage-29 | compact-clinical-14 | 100 |
| 101 | 4793466 | Primary Assessment | unlicensed | discontinued | distributed-storage-30 | composite-clinical-15 | 101 |
| 102 | gd_taxc_2121 | Composite Survey D | licensed | pending | baseline-storage-31 | primary-clinical-16 | 102 |
| 103 | 575213 | Compact Corridor | unlicensed | active | pilot-storage-32 | adaptive-clinical-17 | 103 |

Medicines records track pharmaceutical resources within the clinical ecosystem. Each medicine carries an identifier, name, type (licensed or unlicensed), prescription status (active, discontinued, or pending), storage condition, and clinical need justification. Medicine 100, named Adaptive Series, is licensed with an active prescription status, requires adaptive-storage-29 conditions, and is justified by compact-clinical-14 clinical need, assigned to clinician 100. Medicine 101, named Primary Assessment, is unlicensed with a discontinued prescription status, requires distributed-storage-30 conditions, and is justified by composite-clinical-15 clinical need, assigned to clinician 101. Medicine 102, named Composite Survey D, is licensed with a pending prescription status, requires baseline-storage-31 conditions, and is justified by primary-clinical-16 clinical need, assigned to clinician 102. Medicine 103, named Compact Corridor, is unlicensed with an active prescription status, requires pilot-storage-32 conditions, and is justified by adaptive-clinical-17 clinical need, assigned to clinician 103.

**Table `regulatory_requirements`**

| id | requirement_id | requirement_category | requirement_description | legal_basis | compliance_status | clinical_service_id | finding_id |
|---|---|---|---|---|---|---|---|
| 1000 | 778568 | safeguarding | Extended Model | primary-legal-52 | met | 100 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
| 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control | Pilot Cluster A | adaptive-legal-53 | not_met | 101 | 4793483 |
| 1002 | 99901 | fire_safety | Baseline Review | distributed-legal-54 | in_progress | 102 | 6564384 |
| 1003 | 5917277 | recruitment | Distributed Initiative | baseline-legal-55 | met | 103 | 8928500 |

Regulatory requirements establish the standards against which clinical services are measured. Each requirement defines a specific criterion that must be met, and findings are linked to these requirements to indicate which standards are satisfied or violated. The regulatory_findings table references regulatory_requirement_id to connect each finding to its governing standard, creating a traceable chain from inspection observation to regulatory obligation.

**Table `events_findings`**

| inspection_event_id | finding_id |
|---|---|
| 100 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |
| 100 | 4793483 |
| 101 | 4793483 |
| 101 | 6564384 |
| 102 | 6564384 |
| 102 | 8928500 |
| 103 | 8928500 |
| 103 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 |

The events_findings junction table links inspection events to the regulatory findings they produced, enabling the reconstruction of which findings emerged from which inspections. This relationship is fundamental to understanding the provenance of each finding and ensuring that the audit trail remains complete and verifiable.

**Table `services_clinicians`**

| clinical_service_id | clinician_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The services_clinicians junction table establishes the assignment of clinicians to clinical services, supporting the many-to-many relationship between these entities. A single clinician may work across multiple services, and a service may employ clinicians from various specializations.

**Table `services_patients`**

| clinical_service_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The services_patients junction table records the relationship between patients and clinical services, capturing which patients receive care at which locations. This relationship supports the tracking of patient flow across the service network.

**Table `patients_clinicians`**

| patient_id | clinician_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The patients_clinicians junction table links individual patients to the clinicians who provide their care, enabling the tracking of care relationships and the identification of clinician-patient pairings that may require monitoring or review.

**Table `clinicians_medicines`**

| clinician_id | medicine_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The clinicians_medicines junction table connects clinicians to the medicines they prescribe or manage, supporting the tracking of medication responsibilities and the identification of prescribing patterns across specializations.

**Table `clinicians_patients`**

| clinician_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The clinicians_patients junction table records direct care relationships between clinicians and patients, providing a granular view of the care delivery network that complements the broader service-level relationships.

**Table `medicines_patients`**

| medicine_id | patient_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The medicines_patients junction table links medicines to the patients who receive them, enabling the tracking of medication distribution and the identification of patients who may require medication monitoring or review.

## Inspection and Finding Correlation

The relationship between inspection events and regulatory findings forms the core of the compliance monitoring system. The view v_inspection_event_clinical_service joins inspection events to their associated clinical services, answering the question of which service was evaluated and what overall ratings were assigned. Row 100 shows that clinical service 100 received an announced inspection on 2025-12-03 with uniformly positive ratings across all five domains, while row 101 shows that service 101 received an unannounced inspection with uniformly negative ratings.

**View `v_inspection_event_clinical_service`**

```sql
CREATE VIEW v_inspection_event_clinical_service AS
SELECT a.inspection_event_id, a.inspection_date, a.inspection_type, a.regulatory_basis, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM inspection_events a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| inspection_event_id | inspection_date | inspection_type | regulatory_basis | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 100 | 2025-12-03T23:09:00 | announced | distributed-regulato-78 | 100 | 1996925 | composite-service-81 |
| 101 | 2022-05-14T06:26:00 | unannounced | baseline-regulato-79 | 101 | 3990164 | primary-service-82 |
| 102 | 2023-10-25T13:43:00 | comprehensive | pilot-regulato-80 | 102 | 5844258 | adaptive-service-83 |
| 103 | 2024-03-09T20:00:00 | announced | extended-regulato-81 | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view v_inspection_event_regulatory_finding_detail connects inspection events to the specific findings they generated, providing a granular view of how broad inspection assessments translate into detailed regulatory observations. This join enables auditors to trace from a high-level inspection rating down to the specific finding categories and their compliance statuses.

**View `v_inspection_event_regulatory_finding_detail`**

```sql
CREATE VIEW v_inspection_event_regulatory_finding_detail AS
SELECT a.inspection_event_id, a.inspection_date, a.inspection_type, b.finding_id AS finding_finding_id, b.finding_category AS finding_finding_category, b.finding_status AS finding_finding_status
FROM inspection_events a
  JOIN events_findings j ON j.inspection_event_id = a.inspection_event_id
  JOIN regulatory_findings b ON b.finding_id = j.finding_id;
```

| inspection_event_id | inspection_date | inspection_type | finding_finding_id | finding_finding_category | finding_finding_status |
|---|---|---|---|---|---|
| 100 | 2025-12-03T23:09:00 | announced | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |
| 100 | 2025-12-03T23:09:00 | announced | 4793483 | effective | non_compliant |
| 101 | 2022-05-14T06:26:00 | unannounced | 4793483 | effective | non_compliant |
| 101 | 2022-05-14T06:26:00 | unannounced | 6564384 | caring | requires_improvement |
| 102 | 2023-10-25T13:43:00 | comprehensive | 6564384 | caring | requires_improvement |
| 102 | 2023-10-25T13:43:00 | comprehensive | 8928500 | responsive | compliant |
| 103 | 2024-03-09T20:00:00 | announced | 8928500 | responsive | compliant |
| 103 | 2024-03-09T20:00:00 | announced | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |

## Clinical Service Operations

Clinical services operate through the coordinated efforts of clinicians and the delivery of care to patients. The view v_clinical_service_clinician_detail joins clinical services to their assigned clinicians, answering which professionals work at each service location and what their qualifications look like. Row 100 shows that service 100 employs clinician 100 (Adaptive Series, legacy-speciali-13 specialization, supervised, without completed training), while row 101 shows that service 101 employs clinician 101 (Primary Assessment, compact-speciali-14 specialization, unsupervised, with completed training).

**View `v_clinical_service_clinician_detail`**

```sql
CREATE VIEW v_clinical_service_clinician_detail AS
SELECT a.id, a.service_id, a.service_type, b.id AS clinician_id, b.clinician_id AS clinician_clinician_id, b.clinician_name AS clinician_clinician_name
FROM clinical_services a
  JOIN services_clinicians j ON j.clinical_service_id = a.id
  JOIN clinicians b ON b.id = j.clinician_id;
```

| id | service_id | service_type | clinician_id | clinician_clinician_id | clinician_clinician_name |
|---|---|---|---|---|---|
| 100 | 1996925 | composite-service-81 | 100 | 325439 | Adaptive Series |
| 100 | 1996925 | composite-service-81 | 101 | 2986233 | Primary Assessment |
| 101 | 3990164 | primary-service-82 | 101 | 2986233 | Primary Assessment |
| 101 | 3990164 | primary-service-82 | 102 | 168567 | Composite Survey D |
| 102 | 5844258 | adaptive-service-83 | 102 | 168567 | Composite Survey D |
| 102 | 5844258 | adaptive-service-83 | 103 | 884366 | Compact Corridor |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 103 | 884366 | Compact Corridor |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 100 | 325439 | Adaptive Series |

The view v_clinical_service_patient_detail joins clinical services to their patients, revealing the patient populations served by each location. Row 100 shows that service 100 serves patient 1 (aged 27, male, positive feedback, screened risk), while row 101 shows that service 101 serves patient 2 (aged 38, female, neutral feedback, not_screened risk).

**View `v_clinical_service_patient_detail`**

```sql
CREATE VIEW v_clinical_service_patient_detail AS
SELECT a.id, a.service_id, a.service_type, b.id AS patient_id, b.patient_id AS patient_patient_id, b.patient_age AS patient_patient_age
FROM clinical_services a
  JOIN services_patients j ON j.clinical_service_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | service_id | service_type | patient_id | patient_patient_id | patient_patient_age |
|---|---|---|---|---|---|
| 100 | 1996925 | composite-service-81 | 1 | 8387541 | 27 |
| 100 | 1996925 | composite-service-81 | 2 | 10207142 | 38 |
| 101 | 3990164 | primary-service-82 | 2 | 10207142 | 38 |
| 101 | 3990164 | primary-service-82 | 3 | 7119782 | 49 |
| 102 | 5844258 | adaptive-service-83 | 3 | 7119782 | 49 |
| 102 | 5844258 | adaptive-service-83 | 4 | gd_acc_160003 | 60 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 4 | gd_acc_160003 | 60 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 | 1 | 8387541 | 27 |

The view v_patient_clinical_service provides the reverse perspective, showing each patient's associated clinical service and enabling the tracking of patient service assignments across the network.

**View `v_patient_clinical_service`**

```sql
CREATE VIEW v_patient_clinical_service AS
SELECT a.id, a.patient_id, a.patient_age, a.patient_gender, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM patients a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| id | patient_id | patient_age | patient_gender | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 27 | male | 100 | 1996925 | composite-service-81 |
| 2 | 10207142 | 38 | female | 101 | 3990164 | primary-service-82 |
| 3 | 7119782 | 49 | other | 102 | 5844258 | adaptive-service-83 |
| 4 | gd_acc_160003 | 60 | male | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

## Regulatory Compliance Tracking

Regulatory findings are the operational output of the inspection process, and their relationship to clinical services, inspections, and regulatory requirements forms a comprehensive compliance picture. The view v_regulatory_finding_clinical_service joins findings to their associated clinical services, answering which service each finding pertains to and what the finding's category and status are. Row 1 shows finding dbea2f30-8fcb-11eb-924d-9cd76263cbd0 (safe, compliant, Primary Framework A) associated with clinical service 100, while row 2 shows finding 4793483 (effective, non_compliant, Composite Protocol) associated with clinical service 101.

**View `v_regulatory_finding_clinical_service`**

```sql
CREATE VIEW v_regulatory_finding_clinical_service AS
SELECT a.finding_id, a.finding_category, a.finding_status, a.finding_description, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM regulatory_findings a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| finding_id | finding_category | finding_status | finding_description | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 100 | 1996925 | composite-service-81 |
| 4793483 | effective | non_compliant | Composite Protocol | 101 | 3990164 | primary-service-82 |
| 6564384 | caring | requires_improvement | Compact Programme | 102 | 5844258 | adaptive-service-83 |
| 8928500 | responsive | compliant | Legacy Standard D | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view v_regulatory_finding_inspection_event connects findings back to their originating inspection events, enabling the reconstruction of the full audit trail from inspection to finding. This relationship is critical for understanding the temporal and causal chain of regulatory assessment.

**View `v_regulatory_finding_inspection_event`**

```sql
CREATE VIEW v_regulatory_finding_inspection_event AS
SELECT a.finding_id, a.finding_category, a.finding_status, a.finding_description, b.inspection_event_id AS event_inspection_event_id, b.inspection_date AS event_inspection_date, b.inspection_type AS event_inspection_type
FROM regulatory_findings a JOIN inspection_events b ON a.inspection_event_id = b.inspection_event_id;
```

| finding_id | finding_category | finding_status | finding_description | event_inspection_event_id | event_inspection_date | event_inspection_type |
|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 100 | 2025-12-03T23:09:00 | announced |
| 4793483 | effective | non_compliant | Composite Protocol | 101 | 2022-05-14T06:26:00 | unannounced |
| 6564384 | caring | requires_improvement | Compact Programme | 102 | 2023-10-25T13:43:00 | comprehensive |
| 8928500 | responsive | compliant | Legacy Standard D | 103 | 2024-03-09T20:00:00 | announced |

The view v_regulatory_finding_regulatory_requirement links findings to the specific regulatory requirements they address, answering which standards are met or violated by each finding. This join enables compliance officers to identify which regulatory requirements are generating the most non-compliant findings and prioritize remediation efforts accordingly.

**View `v_regulatory_finding_regulatory_requirement`**

```sql
CREATE VIEW v_regulatory_finding_regulatory_requirement AS
SELECT a.finding_id, a.finding_category, a.finding_status, a.finding_description, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_category AS requirement_requirement_category
FROM regulatory_findings a JOIN regulatory_requirements b ON a.regulatory_requirement_id = b.id;
```

| finding_id | finding_category | finding_status | finding_description | requirement_id | requirement_requirement_id | requirement_requirement_category |
|---|---|---|---|---|---|---|
| dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant | Primary Framework A | 1000 | 778568 | safeguarding |
| 4793483 | effective | non_compliant | Composite Protocol | 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control |
| 6564384 | caring | requires_improvement | Compact Programme | 1002 | 99901 | fire_safety |
| 8928500 | responsive | compliant | Legacy Standard D | 1003 | 5917277 | recruitment |

The view v_patient_regulatory_finding connects patients to the regulatory findings that affect their care, enabling the identification of patients who may be impacted by compliance issues at their service location.

**View `v_patient_regulatory_finding`**

```sql
CREATE VIEW v_patient_regulatory_finding AS
SELECT a.id, a.patient_id, a.patient_age, a.patient_gender, b.finding_id AS finding_finding_id, b.finding_category AS finding_finding_category, b.finding_status AS finding_finding_status
FROM patients a JOIN regulatory_findings b ON a.finding_id = b.finding_id;
```

| id | patient_id | patient_age | patient_gender | finding_finding_id | finding_finding_category | finding_finding_status |
|---|---|---|---|---|---|---|
| 1 | 8387541 | 27 | male | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |
| 2 | 10207142 | 38 | female | 4793483 | effective | non_compliant |
| 3 | 7119782 | 49 | other | 6564384 | caring | requires_improvement |
| 4 | gd_acc_160003 | 60 | male | 8928500 | responsive | compliant |

The view v_regulatory_requirement_clinical_service shows the relationship between regulatory requirements and clinical services, answering which services are subject to which requirements and providing a framework for understanding the scope of regulatory obligations.

**View `v_regulatory_requirement_clinical_service`**

```sql
CREATE VIEW v_regulatory_requirement_clinical_service AS
SELECT a.id, a.requirement_id, a.requirement_category, a.requirement_description, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM regulatory_requirements a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| id | requirement_id | requirement_category | requirement_description | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 1000 | 778568 | safeguarding | Extended Model | 100 | 1996925 | composite-service-81 |
| 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control | Pilot Cluster A | 101 | 3990164 | primary-service-82 |
| 1002 | 99901 | fire_safety | Baseline Review | 102 | 5844258 | adaptive-service-83 |
| 1003 | 5917277 | recruitment | Distributed Initiative | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view v_regulatory_requirement_regulatory_finding provides the reverse perspective on the requirement-finding relationship, showing which findings relate to each regulatory requirement and enabling the aggregation of compliance data at the requirement level.

**View `v_regulatory_requirement_regulatory_finding`**

```sql
CREATE VIEW v_regulatory_requirement_regulatory_finding AS
SELECT a.id, a.requirement_id, a.requirement_category, a.requirement_description, b.finding_id AS finding_finding_id, b.finding_category AS finding_finding_category, b.finding_status AS finding_finding_status
FROM regulatory_requirements a JOIN regulatory_findings b ON a.finding_id = b.finding_id;
```

| id | requirement_id | requirement_category | requirement_description | finding_finding_id | finding_finding_category | finding_finding_status |
|---|---|---|---|---|---|---|
| 1000 | 778568 | safeguarding | Extended Model | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | safe | compliant |
| 1001 | lu_tax_code_template_b_VB-EC-0 | infection_control | Pilot Cluster A | 4793483 | effective | non_compliant |
| 1002 | 99901 | fire_safety | Baseline Review | 6564384 | caring | requires_improvement |
| 1003 | 5917277 | recruitment | Distributed Initiative | 8928500 | responsive | compliant |

## Clinician and Medicine Management

Clinicians are the professional core of clinical service delivery, and their qualifications, supervision status, and medication responsibilities are tracked through interconnected records. The view v_clinician_clinical_service joins clinicians to their assigned clinical services, answering which service each clinician works at and what the service's operational status is. Row 100 shows clinician 100 (Adaptive Series, supervised, training not completed) working at service 100 (active, composite-service-81), while row 101 shows clinician 101 (Primary Assessment, unsupervised, training completed) working at service 101 (suspended, primary-service-82).

**View `v_clinician_clinical_service`**

```sql
CREATE VIEW v_clinician_clinical_service AS
SELECT a.id, a.clinician_id, a.clinician_name, a.specialization, b.id AS service_id, b.service_id AS service_service_id, b.service_type AS service_service_type
FROM clinicians a JOIN clinical_services b ON a.clinical_service_id = b.id;
```

| id | clinician_id | clinician_name | specialization | service_id | service_service_id | service_service_type |
|---|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | legacy-speciali-13 | 100 | 1996925 | composite-service-81 |
| 101 | 2986233 | Primary Assessment | compact-speciali-14 | 101 | 3990164 | primary-service-82 |
| 102 | 168567 | Composite Survey D | composite-speciali-15 | 102 | 5844258 | adaptive-service-83 |
| 103 | 884366 | Compact Corridor | primary-speciali-16 | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | distributed-service-84 |

The view v_clinician_medicine_detail joins clinicians to the medicines they manage, answering which clinician is responsible for which medications and what the prescription and storage characteristics are. Row 100 shows clinician 100 managing medicine 100 (Adaptive Series, licensed, active prescription, adaptive-storage-29), while row 101 shows clinician 101 managing medicine 101 (Primary Assessment, unlicensed, discontinued prescription, distributed-storage-30).

**View `v_clinician_medicine_detail`**

```sql
CREATE VIEW v_clinician_medicine_detail AS
SELECT a.id, a.clinician_id, a.clinician_name, b.id AS medicine_id, b.medicine_id AS medicine_medicine_id, b.medicine_name AS medicine_medicine_name
FROM clinicians a
  JOIN clinicians_medicines j ON j.clinician_id = a.id
  JOIN medicines b ON b.id = j.medicine_id;
```

| id | clinician_id | clinician_name | medicine_id | medicine_medicine_id | medicine_medicine_name |
|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | 100 | 1437596 | Adaptive Series |
| 100 | 325439 | Adaptive Series | 101 | 4793466 | Primary Assessment |
| 101 | 2986233 | Primary Assessment | 101 | 4793466 | Primary Assessment |
| 101 | 2986233 | Primary Assessment | 102 | gd_taxc_2121 | Composite Survey D |
| 102 | 168567 | Composite Survey D | 102 | gd_taxc_2121 | Composite Survey D |
| 102 | 168567 | Composite Survey D | 103 | 575213 | Compact Corridor |
| 103 | 884366 | Compact Corridor | 103 | 575213 | Compact Corridor |
| 103 | 884366 | Compact Corridor | 100 | 1437596 | Adaptive Series |

The view v_clinician_patient_detail joins clinicians to their patients, answering which clinician provides care to which patient and what the patient's demographic and risk characteristics are. This relationship is essential for tracking care continuity and identifying clinician-patient pairings that may require additional oversight.

**View `v_clinician_patient_detail`**

```sql
CREATE VIEW v_clinician_patient_detail AS
SELECT a.id, a.clinician_id, a.clinician_name, b.id AS patient_id, b.patient_id AS patient_patient_id, b.patient_age AS patient_patient_age
FROM clinicians a
  JOIN clinicians_patients j ON j.clinician_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | clinician_id | clinician_name | patient_id | patient_patient_id | patient_patient_age |
|---|---|---|---|---|---|
| 100 | 325439 | Adaptive Series | 1 | 8387541 | 27 |
| 100 | 325439 | Adaptive Series | 2 | 10207142 | 38 |
| 101 | 2986233 | Primary Assessment | 2 | 10207142 | 38 |
| 101 | 2986233 | Primary Assessment | 3 | 7119782 | 49 |
| 102 | 168567 | Composite Survey D | 3 | 7119782 | 49 |
| 102 | 168567 | Composite Survey D | 4 | gd_acc_160003 | 60 |
| 103 | 884366 | Compact Corridor | 4 | gd_acc_160003 | 60 |
| 103 | 884366 | Compact Corridor | 1 | 8387541 | 27 |

The view v_medicine_clinician provides the reverse perspective on the clinician-medicine relationship, showing which clinician manages each medicine and enabling the aggregation of medication responsibilities at the medicine level.

**View `v_medicine_clinician`**

```sql
CREATE VIEW v_medicine_clinician AS
SELECT a.id, a.medicine_id, a.medicine_name, a.medicine_type, b.id AS clinician_id, b.clinician_id AS clinician_clinician_id, b.clinician_name AS clinician_clinician_name
FROM medicines a JOIN clinicians b ON a.clinician_id = b.id;
```

| id | medicine_id | medicine_name | medicine_type | clinician_id | clinician_clinician_id | clinician_clinician_name |
|---|---|---|---|---|---|---|
| 100 | 1437596 | Adaptive Series | licensed | 100 | 325439 | Adaptive Series |
| 101 | 4793466 | Primary Assessment | unlicensed | 101 | 2986233 | Primary Assessment |
| 102 | gd_taxc_2121 | Composite Survey D | licensed | 102 | 168567 | Composite Survey D |
| 103 | 575213 | Compact Corridor | unlicensed | 103 | 884366 | Compact Corridor |

## Patient-Care Relationships

The patient dimension of the regulatory ecosystem connects individuals to clinicians, medicines, and clinical services, forming a comprehensive picture of care delivery. The view v_clinician_patient_detail, already described above, links clinicians to their patients and reveals the care relationships that underpin service delivery.

The view v_medicine_patient_detail joins medicines to the patients who receive them, answering which patient receives which medicine and what the medicine's characteristics are. This relationship enables the tracking of medication distribution and the identification of patients who may require medication monitoring.

**View `v_medicine_patient_detail`**

```sql
CREATE VIEW v_medicine_patient_detail AS
SELECT a.id, a.medicine_id, a.medicine_name, b.id AS patient_id, b.patient_id AS patient_patient_id, b.patient_age AS patient_patient_age
FROM medicines a
  JOIN medicines_patients j ON j.medicine_id = a.id
  JOIN patients b ON b.id = j.patient_id;
```

| id | medicine_id | medicine_name | patient_id | patient_patient_id | patient_patient_age |
|---|---|---|---|---|---|
| 100 | 1437596 | Adaptive Series | 1 | 8387541 | 27 |
| 100 | 1437596 | Adaptive Series | 2 | 10207142 | 38 |
| 101 | 4793466 | Primary Assessment | 2 | 10207142 | 38 |
| 101 | 4793466 | Primary Assessment | 3 | 7119782 | 49 |
| 102 | gd_taxc_2121 | Composite Survey D | 3 | 7119782 | 49 |
| 102 | gd_taxc_2121 | Composite Survey D | 4 | gd_acc_160003 | 60 |
| 103 | 575213 | Compact Corridor | 4 | gd_acc_160003 | 60 |
| 103 | 575213 | Compact Corridor | 1 | 8387541 | 27 |

The view v_patient_clinician_detail joins patients to their clinicians, answering which clinician provides care to each patient and what the clinician's qualifications and supervision status are. This join is essential for understanding the care delivery chain from patient through clinician to clinical service.

**View `v_patient_clinician_detail`**

```sql
CREATE VIEW v_patient_clinician_detail AS
SELECT a.id, a.patient_id, a.patient_age, b.id AS clinician_id, b.clinician_id AS clinician_clinician_id, b.clinician_name AS clinician_clinician_name
FROM patients a
  JOIN patients_clinicians j ON j.patient_id = a.id
  JOIN clinicians b ON b.id = j.clinician_id;
```

| id | patient_id | patient_age | clinician_id | clinician_clinician_id | clinician_clinician_name |
|---|---|---|---|---|---|
| 1 | 8387541 | 27 | 100 | 325439 | Adaptive Series |
| 1 | 8387541 | 27 | 101 | 2986233 | Primary Assessment |
| 2 | 10207142 | 38 | 101 | 2986233 | Primary Assessment |
| 2 | 10207142 | 38 | 102 | 168567 | Composite Survey D |
| 3 | 7119782 | 49 | 102 | 168567 | Composite Survey D |
| 3 | 7119782 | 49 | 103 | 884366 | Compact Corridor |
| 4 | gd_acc_160003 | 60 | 103 | 884366 | Compact Corridor |
| 4 | gd_acc_160003 | 60 | 100 | 325439 | Adaptive Series |

## Synthesis

The regulatory compliance ecosystem for healthcare delivery operates as an interconnected system of inspections, findings, services, clinicians, patients, and medicines. Inspection events generate regulatory findings that are linked to specific clinical services and regulatory requirements, creating a traceable audit trail from assessment to obligation. Clinical services employ clinicians who deliver care to patients and manage medicines, with each relationship captured through dedicated junction tables that support flexible querying and analysis. The views derived from these base tables answer specific operational questions—linking inspections to services, findings to requirements, clinicians to patients, and medicines to prescribers—enabling compliance officers, service managers, and regulators to monitor performance, identify areas requiring remediation, and ensure that the standards of care are consistently met across the entire delivery network.