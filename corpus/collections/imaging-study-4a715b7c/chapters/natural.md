## Imaging Operations Across Hospital Campuses

Medical imaging departments operate at the intersection of clinical workflow, institutional infrastructure, and technological capability. A single imaging study—whether a radiograph, CT scan, or MRI—does not exist in isolation. It is performed at a specific hospital campus, interpreted by a radiologist whose credentials and availability shape the diagnostic pathway, and may require post-processing software to extract clinically actionable information. Thoracic procedures, ranging from minimally invasive interventions to surgical protocols, further complicate the operational landscape by introducing temporal constraints and resource dependencies. Understanding how these elements interlock requires examining the records that capture each decision point, from the moment a study is ordered through the final radiologist's sign-off. The following sections describe the entities that populate this operational ecosystem and the analytical views that reveal their relationships.

**Table `imaging_studies`**

| id | study_identifier | modality | study_date | body_region | status | contrast_used | campus_code | radiologist_id | post_processing_software_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | pilot-body-26 | pending | true | 6969438 | 1000 | 100 |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | extended-body-27 | in_progress | false | 9736889 | 1001 | 101 |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | integrated-body-28 | complete | true | 727050 | 1002 | 102 |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | seasonal-body-29 | archived | false | 89008 | 1003 | 103 |

Imaging studies form the central operational unit in any radiology department. Each study carries a unique identifier such as STU-2431 or STU-2440, a modality designation, and a timestamp that anchors it to a specific moment in the clinical calendar. The modality field distinguishes between radiography, CT, and MRI—each with distinct resource requirements and turnaround expectations. Study dates span multiple years in the operational record, from September 2022 through April 2025, reflecting a longitudinal dataset that captures evolving practice patterns. The body_region column uses coded descriptors like pilot-body-26 and extended-body-27, which map to standardized anatomical categories used for billing and quality tracking. Status values—pending, in_progress, complete, and archived—provide a real-time pulse on study throughput. Contrast administration, recorded as a boolean, signals additional procedural steps and potential safety considerations. Every study is tied to a specific campus through the campus_code field and assigned to a radiologist via radiologist_id, establishing the two primary axes of operational accountability.

**Table `radiologists`**

| id | physician_identifier | full_name | certification_body | specialization | employment_status | bilingual | campus_code | thoracic_procedure_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | integrated-certific-58 | legacy-speciali-13 | full_time | false | 6969438 | 100 |
| 1001 | PHY-2101 | Account Name | seasonal-certific-59 | compact-speciali-14 | part_time | true | 9736889 | 101 |
| 1002 | PHY-2103 | Saipan International Airport | regional-certific-60 | composite-speciali-15 | fellowship_trained | false | 727050 | 102 |
| 1003 | PHY-2105 | Norma Fisher | legacy-certific-61 | primary-speciali-16 | full_time | true | 89008 | 103 |

Radiologists are the human infrastructure through which imaging studies achieve clinical utility. Their records capture not only professional identifiers like PHY-2099 and PHY-2105 but also the institutional context of their practice. The full_name field contains entries ranging from Theodore Mcgrath to Saipan International Airport, reflecting the fictional nomenclature of this operational dataset. Certification bodies—integrated-certific-58, seasonal-certific-59, and others—indicate the credentialing pathways through which each physician attained their qualifications. Specialization codes such as legacy-speciali-13 and compact-speciali-14 differentiate clinical focus areas, while employment_status distinguishes full_time practitioners from part_time and fellowship_trained clinicians. The bilingual flag, when set to true, signals language capabilities that may affect patient communication and report accessibility. Each radiologist is anchored to a campus_code and associated with a thoracic_procedure_id, embedding them within the broader procedural and geographic framework of the organization.

**Table `hospital_campuses`**

| campus_code | campus_name | bed_capacity | trauma_level | location | imaging_study_id | radiologist_id | thoracic_procedure_id |
|---|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | extended-location-99 | 1 | 1000 | 100 |
| 9736889 | Extended Survey | 27 | 31 | integrated-location-100 | 2 | 1001 | 101 |
| 727050 | Pilot Corridor | 31 | 39 | seasonal-location-101 | 3 | 1002 | 102 |
| 89008 | Baseline Series D | 35 | 47 | regional-location-102 | 4 | 1003 | 103 |

Hospital campuses provide the physical and administrative container for all imaging operations. The campus_code serves as the primary key linking studies, radiologists, and procedures to their home institutions. Campus names such as Integrated Assessment A, Extended Survey, Pilot Corridor, and Baseline Series D distinguish individual facilities within a multi-site health system. Bed capacity figures—23, 27, 31, and 35—offer a rough proxy for institutional scale and patient volume. Trauma levels, ranging from 23 to 47 in this dataset, indicate the acuity of cases each campus is equipped to handle, which in turn influences the types of imaging studies and thoracic procedures performed on-site. Location codes like extended-location-99 and integrated-location-100 provide geographic or administrative descriptors used for routing and logistics. Each campus record also carries references to its imaging_study_id, radiologist_id, and thoracic_procedure_id, reflecting the operational entities that define its daily activity.

**Table `thoracic_procedures`**

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | invasiveness_level | status | radiologist_id | campus_code | imaging_study_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | minimally_invasive | scheduled | 1000 | 6969438 | 1 |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | non_invasive | completed | 1001 | 9736889 | 2 |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | surgical | cancelled | 1002 | 727050 | 3 |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | minimally_invasive | scheduled | 1003 | 89008 | 4 |

Thoracic procedures represent the procedural dimension of the imaging ecosystem, encompassing interventions that may be guided by imaging or that generate imaging studies as part of their workflow. Procedure codes such as 3990183 and 10782181 serve as standardized identifiers for billing and quality reporting, while procedure names like Integrated Protocol A and Extended Programme describe the clinical intent. Procedure dates—ranging from May 2022 to August 2025—establish the temporal sequence of interventions. Invasiveness_level categorizes procedures along a spectrum from non_invasive through minimally_invasive to surgical, a classification that directly influences resource allocation, staffing requirements, and recovery protocols. Status values of scheduled, completed, and cancelled reflect the dynamic nature of procedural planning, where cancellations may result from patient factors, equipment availability, or scheduling conflicts. Each procedure is linked to a radiologist_id and campus_code, ensuring procedural accountability and geographic traceability.

**Table `post_processing_softwares`**

| post_processing_software_id | software_name | version | vendor | license_status | imaging_study_id |
|---|---|---|---|---|---|
| 100 | Primary Review A | seasonal-version-71 | Feedback Ratings | active | 1 |
| 101 | Composite Initiative | regional-version-72 | Abbott Laboratories | expired | 2 |
| 102 | Compact Model | legacy-version-73 | American Express | trial | 3 |
| 103 | Legacy Cluster D | compact-version-74 | Whatsapp Inc. | active | 4 |

Post-processing software represents the technological layer that transforms raw imaging data into diagnostic information. Software identifiers such as 100 and 103 correspond to products like Primary Review A and Legacy Cluster D, each with version designations like seasonal-version-71 and compact-version-74. Vendor names including Feedback Ratings, Abbott Laboratories, American Express, and Whatsapp Inc. identify the commercial entities responsible for software development and support. License_status—active, expired, or trial—determines whether a given software instance is operational, requires renewal, or is being evaluated. Each software record is associated with an imaging_study_id, indicating which studies have been processed through that particular tool. This linkage is critical for quality assurance, as it enables retrospective analysis of software performance and its impact on diagnostic accuracy.

**Table `radiologists_studies`**

| radiologist_id | imaging_study_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The radiologists_studies table captures the many-to-many relationships between physicians and the studies they interpret. Unlike the direct assignment seen in the imaging_studies table, this junction table allows a single radiologist to be associated with multiple studies and a single study to be reviewed by multiple radiologists. The record for radiologist 1000 spans studies 1 and 2, demonstrating how a single physician may handle multiple modalities or campus assignments. Similarly, radiologist 1003 is linked to both study 4 and study 1, suggesting cross-campus or cross-shift responsibilities. This relational structure reflects real-world radiology practice, where coverage arrangements, subspecialty consultations, and second-read protocols create complex assignment patterns that cannot be captured by a single foreign key.

**View `imaging_study_hospital_campus_view`**

```sql
CREATE VIEW imaging_study_hospital_campus_view AS
SELECT a.id, a.study_identifier, a.modality, a.study_date, b.campus_code AS campus_campus_code, b.campus_name AS campus_campus_name, b.bed_capacity AS campus_bed_capacity
FROM imaging_studies a JOIN hospital_campuses b ON a.campus_code = b.campus_code;
```

| id | study_identifier | modality | study_date | campus_campus_code | campus_campus_name | campus_bed_capacity |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | 6969438 | Integrated Assessment A | 23 |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | 9736889 | Extended Survey | 27 |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | 727050 | Pilot Corridor | 31 |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | 89008 | Baseline Series D | 35 |

The imaging_study_hospital_campus_view answers the question of which campus is responsible for each imaging study, joining the study record with its home institution's full profile. A row linking study STU-2431 to campus Integrated Assessment A reveals not only the geographic location but also the bed capacity of 23 and trauma level of 23, information that contextualizes the study's clinical setting. Another row connecting STU-2437 to Pilot Corridor, with its 31 beds and trauma level of 39, illustrates how higher-acuity campuses may handle more complex imaging cases. This view is essential for capacity planning, as it enables administrators to correlate study volume with institutional resources and trauma designation.

**View `imaging_study_radiologist_view`**

```sql
CREATE VIEW imaging_study_radiologist_view AS
SELECT a.id, a.study_identifier, a.modality, a.study_date, b.id AS radiologist_id, b.physician_identifier AS radiologist_physician_identifier, b.full_name AS radiologist_full_name
FROM imaging_studies a JOIN radiologists b ON a.radiologist_id = b.id;
```

| id | study_identifier | modality | study_date | radiologist_id | radiologist_physician_identifier | radiologist_full_name |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | 1000 | PHY-2099 | Theodore Mcgrath |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | 1001 | PHY-2101 | Account Name |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | 1002 | PHY-2103 | Saipan International Airport |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | 1003 | PHY-2105 | Norma Fisher |

This view maps each imaging study to the radiologist assigned to interpret it, combining study metadata with physician credentials. The row for STU-2434, interpreted by Account Name (PHY-2101), reveals a part_time radiologist with bilingual capability and a seasonal certification, information that may influence scheduling and coverage decisions. The row for STU-2437, assigned to Saipan International Airport (PHY-2103), shows a fellowship_trained specialist with a regional certification, suggesting a higher level of subspecialty expertise for that particular MRI study. This view supports workload balancing and credentialing audits by presenting the full professional profile alongside each study assignment.

**View `imaging_study_post_processing_software_view`**

```sql
CREATE VIEW imaging_study_post_processing_software_view AS
SELECT a.id, a.study_identifier, a.modality, a.study_date, b.post_processing_software_id AS software_post_processing_software_id, b.software_name AS software_software_name, b.version AS software_version
FROM imaging_studies a JOIN post_processing_softwares b ON a.post_processing_software_id = b.post_processing_software_id;
```

| id | study_identifier | modality | study_date | software_post_processing_software_id | software_software_name | software_version |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | radiography | 2024-11-08T10:06:00 | 100 | Primary Review A | seasonal-version-71 |
| 2 | STU-2434 | CT | 2025-04-19T17:23:00 | 101 | Composite Initiative | regional-version-72 |
| 3 | STU-2437 | MRI | 2022-09-03T00:40:00 | 102 | Compact Model | legacy-version-73 |
| 4 | STU-2440 | radiography | 2023-02-14T07:57:00 | 103 | Legacy Cluster D | compact-version-74 |

The imaging_study_post_processing_software_view links each study to the software used in its post-processing pipeline, enabling traceability from raw data to diagnostic output. The row for STU-2431, processed with Primary Review A (version seasonal-version-71) from vendor Feedback Ratings under an active license, demonstrates a fully operational software stack. In contrast, the row for STU-2434, associated with Composite Initiative (version regional-version-72) from Abbott Laboratories under an expired license, flags a potential compliance issue that requires immediate attention. This view is indispensable for software lifecycle management and regulatory compliance reporting.

**View `radiologist_hospital_campus_view`**

```sql
CREATE VIEW radiologist_hospital_campus_view AS
SELECT a.id, a.physician_identifier, a.full_name, a.certification_body, b.campus_code AS campus_campus_code, b.campus_name AS campus_campus_name, b.bed_capacity AS campus_bed_capacity
FROM radiologists a JOIN hospital_campuses b ON a.campus_code = b.campus_code;
```

| id | physician_identifier | full_name | certification_body | campus_campus_code | campus_campus_name | campus_bed_capacity |
|---|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | integrated-certific-58 | 6969438 | Integrated Assessment A | 23 |
| 1001 | PHY-2101 | Account Name | seasonal-certific-59 | 9736889 | Extended Survey | 27 |
| 1002 | PHY-2103 | Saipan International Airport | regional-certific-60 | 727050 | Pilot Corridor | 31 |
| 1003 | PHY-2105 | Norma Fisher | legacy-certific-61 | 89008 | Baseline Series D | 35 |

This view reveals the institutional home of each radiologist, combining physician credentials with campus infrastructure data. The row for Theodore Mcgrath (PHY-2099) at campus 6969438, with 23 beds and trauma level 23, establishes the operational context for his full_time, non-bilingual practice. The row for Norma Fisher (PHY-2105) at campus 89008, with 35 beds and trauma level 47, places a bilingual full_time radiologist at the largest and highest-acuity campus in the dataset. This view supports staffing analysis by correlating physician attributes—such as bilingual capability and employment status—with the demands of their assigned campus.

**View `radiologist_imaging_study_detail_view`**

```sql
CREATE VIEW radiologist_imaging_study_detail_view AS
SELECT a.id, a.physician_identifier, a.full_name, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM radiologists a
  JOIN radiologists_studies j ON j.radiologist_id = a.id
  JOIN imaging_studies b ON b.id = j.imaging_study_id;
```

| id | physician_identifier | full_name | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | 1 | STU-2431 | radiography |
| 1000 | PHY-2099 | Theodore Mcgrath | 2 | STU-2434 | CT |
| 1001 | PHY-2101 | Account Name | 2 | STU-2434 | CT |
| 1001 | PHY-2101 | Account Name | 3 | STU-2437 | MRI |
| 1002 | PHY-2103 | Saipan International Airport | 3 | STU-2437 | MRI |
| 1002 | PHY-2103 | Saipan International Airport | 4 | STU-2440 | radiography |
| 1003 | PHY-2105 | Norma Fisher | 4 | STU-2440 | radiography |
| 1003 | PHY-2105 | Norma Fisher | 1 | STU-2431 | radiography |

The radiologist_imaging_study_detail_view provides a comprehensive record of each radiologist's study assignments, merging physician, study, and institutional data into a single analytical row. A row linking radiologist 1000 to study STU-2431 on a radiography modality, performed at campus 6969438, presents a complete picture of the assignment including study status (pending), contrast usage (true), and the radiologist's full_name and certification. This view is particularly valuable for performance reviews and workload distribution, as it consolidates all relevant attributes into a single record that can be filtered, sorted, and aggregated.

**View `radiologist_thoracic_procedure_view`**

```sql
CREATE VIEW radiologist_thoracic_procedure_view AS
SELECT a.id, a.physician_identifier, a.full_name, a.certification_body, b.thoracic_procedure_id AS procedure_thoracic_procedure_id, b.procedure_code AS procedure_procedure_code, b.procedure_name AS procedure_procedure_name
FROM radiologists a JOIN thoracic_procedures b ON a.thoracic_procedure_id = b.thoracic_procedure_id;
```

| id | physician_identifier | full_name | certification_body | procedure_thoracic_procedure_id | procedure_procedure_code | procedure_procedure_name |
|---|---|---|---|---|---|---|
| 1000 | PHY-2099 | Theodore Mcgrath | integrated-certific-58 | 100 | 3990183 | Integrated Protocol A |
| 1001 | PHY-2101 | Account Name | seasonal-certific-59 | 101 | 10782181 | Extended Programme |
| 1002 | PHY-2103 | Saipan International Airport | regional-certific-60 | 102 | account_pymes_663 | Pilot Standard |
| 1003 | PHY-2105 | Norma Fisher | legacy-certific-61 | 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |

This view connects radiologists to the thoracic procedures they are associated with, combining physician credentials with procedural metadata. The row for Theodore Mcgrath (PHY-2099) and procedure Integrated Protocol A (code 3990183), classified as minimally_invasive and scheduled, illustrates a planned intervention requiring radiology support. The row for Account Name (PHY-2101) and procedure Extended Programme (code 10782181), classified as non_invasive and completed, demonstrates a finished procedure with full documentation. This view supports procedural scheduling and radiologist availability planning by presenting the temporal and clinical status of each associated procedure.

**View `hospital_campus_imaging_study_view`**

```sql
CREATE VIEW hospital_campus_imaging_study_view AS
SELECT a.campus_code, a.campus_name, a.bed_capacity, a.trauma_level, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM hospital_campuses a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| campus_code | campus_name | bed_capacity | trauma_level | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | 1 | STU-2431 | radiography |
| 9736889 | Extended Survey | 27 | 31 | 2 | STU-2434 | CT |
| 727050 | Pilot Corridor | 31 | 39 | 3 | STU-2437 | MRI |
| 89008 | Baseline Series D | 35 | 47 | 4 | STU-2440 | radiography |

The hospital_campus_imaging_study_view inverts the perspective to show all studies associated with a given campus, providing an institutional view of imaging volume and modality distribution. The row for campus Integrated Assessment A (campus_code 6969438) and study STU-2431, a radiography performed on 2024-11-08 with contrast, reveals the type and characteristics of studies handled at that facility. The row for campus Pilot Corridor (campus_code 727050) and study STU-2437, an MRI from 2022-09-03, illustrates how different campuses may specialize in different modalities based on their equipment and staffing. This view is essential for capital planning, as it helps administrators identify which campuses have the highest imaging volumes and may require additional equipment or staff.

**View `hospital_campus_radiologist_view`**

```sql
CREATE VIEW hospital_campus_radiologist_view AS
SELECT a.campus_code, a.campus_name, a.bed_capacity, a.trauma_level, b.id AS radiologist_id, b.physician_identifier AS radiologist_physician_identifier, b.full_name AS radiologist_full_name
FROM hospital_campuses a JOIN radiologists b ON a.radiologist_id = b.id;
```

| campus_code | campus_name | bed_capacity | trauma_level | radiologist_id | radiologist_physician_identifier | radiologist_full_name |
|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | 1000 | PHY-2099 | Theodore Mcgrath |
| 9736889 | Extended Survey | 27 | 31 | 1001 | PHY-2101 | Account Name |
| 727050 | Pilot Corridor | 31 | 39 | 1002 | PHY-2103 | Saipan International Airport |
| 89008 | Baseline Series D | 35 | 47 | 1003 | PHY-2105 | Norma Fisher |

This view presents the radiologist roster for each campus, combining institutional data with physician credentials and employment details. The row for campus Extended Survey (campus_code 9736889) and radiologist Account Name (PHY-2101) shows a part_time, bilingual physician with a seasonal certification, information that may influence scheduling flexibility and patient communication capabilities. The row for campus Baseline Series D (campus_code 89008) and radiologist Norma Fisher (PHY-2105) presents a full_time, bilingual physician with a legacy certification, suggesting a stable and experienced presence at that campus. This view supports workforce planning by revealing the composition of each campus's radiology team.

**View `hospital_campus_thoracic_procedure_view`**

```sql
CREATE VIEW hospital_campus_thoracic_procedure_view AS
SELECT a.campus_code, a.campus_name, a.bed_capacity, a.trauma_level, b.thoracic_procedure_id AS procedure_thoracic_procedure_id, b.procedure_code AS procedure_procedure_code, b.procedure_name AS procedure_procedure_name
FROM hospital_campuses a JOIN thoracic_procedures b ON a.thoracic_procedure_id = b.thoracic_procedure_id;
```

| campus_code | campus_name | bed_capacity | trauma_level | procedure_thoracic_procedure_id | procedure_procedure_code | procedure_procedure_name |
|---|---|---|---|---|---|---|
| 6969438 | Integrated Assessment A | 23 | 23 | 100 | 3990183 | Integrated Protocol A |
| 9736889 | Extended Survey | 27 | 31 | 101 | 10782181 | Extended Programme |
| 727050 | Pilot Corridor | 31 | 39 | 102 | account_pymes_663 | Pilot Standard |
| 89008 | Baseline Series D | 35 | 47 | 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D |

The hospital_campus_thoracic_procedure_view links each campus to its associated thoracic procedures, providing an institutional view of procedural volume and complexity. The row for campus Integrated Assessment A (campus_code 6969438) and procedure Integrated Protocol A (code 3990183), classified as minimally_invasive and scheduled, indicates an upcoming intervention at that facility. The row for campus Pilot Corridor (campus_code 727050) and procedure Pilot Standard (code account_pymes_663), classified as surgical and cancelled, reveals a cancelled surgical procedure, which may prompt investigation into the reasons for cancellation. This view is valuable for procedural capacity planning and quality improvement initiatives.

**View `thoracic_procedure_radiologist_view`**

```sql
CREATE VIEW thoracic_procedure_radiologist_view AS
SELECT a.thoracic_procedure_id, a.procedure_code, a.procedure_name, a.procedure_date, b.id AS radiologist_id, b.physician_identifier AS radiologist_physician_identifier, b.full_name AS radiologist_full_name
FROM thoracic_procedures a JOIN radiologists b ON a.radiologist_id = b.id;
```

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | radiologist_id | radiologist_physician_identifier | radiologist_full_name |
|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | 1000 | PHY-2099 | Theodore Mcgrath |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | 1001 | PHY-2101 | Account Name |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | 1002 | PHY-2103 | Saipan International Airport |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | 1003 | PHY-2105 | Norma Fisher |

This view connects thoracic procedures to the radiologists involved, combining procedural metadata with physician credentials. The row for procedure Integrated Protocol A (code 3990183) and radiologist Theodore Mcgrath (PHY-2099), a full_time physician with a legacy certification, establishes the professional responsible for the procedure's radiology component. The row for procedure Baseline Framework D (code 1c87986a-8fcd-11eb-924d-9cd76263cbd0) and radiologist Norma Fisher (PHY-2105), a bilingual full_time physician, demonstrates how procedural assignments may consider language capabilities and availability. This view supports procedural scheduling and radiologist workload management.

**View `thoracic_procedure_hospital_campus_view`**

```sql
CREATE VIEW thoracic_procedure_hospital_campus_view AS
SELECT a.thoracic_procedure_id, a.procedure_code, a.procedure_name, a.procedure_date, b.campus_code AS campus_campus_code, b.campus_name AS campus_campus_name, b.bed_capacity AS campus_bed_capacity
FROM thoracic_procedures a JOIN hospital_campuses b ON a.campus_code = b.campus_code;
```

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | campus_campus_code | campus_campus_name | campus_bed_capacity |
|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | 6969438 | Integrated Assessment A | 23 |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | 9736889 | Extended Survey | 27 |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | 727050 | Pilot Corridor | 31 |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | 89008 | Baseline Series D | 35 |

The thoracic_procedure_hospital_campus_view reveals the institutional setting for each thoracic procedure, combining procedural details with campus infrastructure data. The row for procedure Extended Programme (code 10782181) at campus Extended Survey (campus_code 9736889), with 27 beds and trauma level 31, places a completed non_invasive procedure within its institutional context. The row for procedure Pilot Standard (code account_pymes_663) at campus Pilot Corridor (campus_code 727050), with 31 beds and trauma level 39, situates a cancelled surgical procedure at a higher-acuity facility. This view is essential for understanding how institutional resources and trauma designation influence procedural planning and outcomes.

**View `thoracic_procedure_imaging_study_view`**

```sql
CREATE VIEW thoracic_procedure_imaging_study_view AS
SELECT a.thoracic_procedure_id, a.procedure_code, a.procedure_name, a.procedure_date, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM thoracic_procedures a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| thoracic_procedure_id | procedure_code | procedure_name | procedure_date | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|---|
| 100 | 3990183 | Integrated Protocol A | 2022-05-19T04:48:00 | 1 | STU-2431 | radiography |
| 101 | 10782181 | Extended Programme | 2023-10-03T11:05:00 | 2 | STU-2434 | CT |
| 102 | account_pymes_663 | Pilot Standard | 2024-03-14T18:22:00 | 3 | STU-2437 | MRI |
| 103 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Framework D | 2025-08-25T01:39:00 | 4 | STU-2440 | radiography |

This view links thoracic procedures to their associated imaging studies, providing a procedural-to-diagnostic traceability chain. The row for procedure Integrated Protocol A (code 3990183) and study STU-2431, a radiography with contrast performed on 2024-11-08, demonstrates how a scheduled procedure may be accompanied by a diagnostic imaging study. The row for procedure Extended Programme (code 10782181) and study STU-2434, a CT scan without contrast performed on 2025-04-19, illustrates the imaging modality selected for a completed non_invasive procedure. This view supports clinical documentation and quality assurance by ensuring that every procedure has a corresponding imaging record.

**View `post_processing_software_imaging_study_view`**

```sql
CREATE VIEW post_processing_software_imaging_study_view AS
SELECT a.post_processing_software_id, a.software_name, a.version, a.vendor, b.id AS study_id, b.study_identifier AS study_study_identifier, b.modality AS study_modality
FROM post_processing_softwares a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| post_processing_software_id | software_name | version | vendor | study_id | study_study_identifier | study_modality |
|---|---|---|---|---|---|---|
| 100 | Primary Review A | seasonal-version-71 | Feedback Ratings | 1 | STU-2431 | radiography |
| 101 | Composite Initiative | regional-version-72 | Abbott Laboratories | 2 | STU-2434 | CT |
| 102 | Compact Model | legacy-version-73 | American Express | 3 | STU-2437 | MRI |
| 103 | Legacy Cluster D | compact-version-74 | Whatsapp Inc. | 4 | STU-2440 | radiography |

The post_processing_software_imaging_study_view presents the software stack used for each imaging study, combining software metadata with study characteristics. The row for software Primary Review A (version seasonal-version-71, vendor Feedback Ratings, active license) and study STU-2431, a radiography with contrast, shows a fully licensed software instance supporting a contrast-enhanced study. The row for software Compact Model (version legacy-version-73, vendor American Express, trial license) and study STU-2437, an MRI, reveals a trial-licensed software instance, which may require renewal to maintain uninterrupted processing capabilities. This view is critical for software asset management, license compliance, and ensuring that all studies are processed with properly licensed tools.

## Synthesis

The operational ecosystem of medical imaging across hospital campuses is defined by the interlocking relationships between studies, radiologists, institutions, procedures, and software. No single entity operates in isolation: a radiography study at campus 6969438 is simultaneously a radiologist's assignment, a campus's volume metric, and a software processing target. The junction table radiologists_studies captures the complexity of real-world assignments, where physicians may handle multiple studies and studies may receive multiple interpretations. The analytical views presented here transform these relational structures into actionable intelligence, enabling administrators to plan capacity, ensure compliance, balance workloads, and trace clinical decisions from order to report. Understanding these relationships is not merely an exercise in data organization; it is a prerequisite for optimizing the delivery of imaging services in a multi-campus health system.