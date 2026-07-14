## The Architecture of Academic Research Governance

Research institutions operate as layered ecosystems where committees, executives, doctoral schools, colleges, and laboratories intersect under shared administrative frameworks. Each entity carries its own identifiers, dates, and status flags, yet all are bound together by departmental codes and cross-referential links that define who reports to whom, which laboratories serve which doctoral programs, and how colleges aggregate their constituent schools. Understanding this architecture requires reading the records not as isolated rows but as a connected graph of authority, affiliation, and operational status.

**Table `ResearchCommittee`**

| committeeId | committeeIdentifier | establishedDate | governanceStatus | executiveDepartmentCode | laboratoryId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|
| 1 | COM-2451 | 2024-03-27 | active | 605962 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | COM-2455 | 2025-08-11 | dissolved | 10449510 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | COM-2459 | 2022-01-22 | pending | 2002007020080 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | COM-2463 | 2023-06-06 | active | drafting-skills | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Research committees form the top tier of governance oversight. Each committee carries a unique identifier such as COM-2451 or COM-2463, an established date, and a governance status that can be active, dissolved, or pending. The committee at identifier COM-2451 was established on 2024-03-27 and remains active under executive department code 605962, while COM-2455, established later on 2025-08-11, has already reached a dissolved state. The department code field serves as the primary bridge to other entities: every committee references an executive department, and that same department code appears on the executives, doctoral schools, and laboratories that fall under its purview. The laboratoryId column on the committee table indicates which laboratory the committee is primarily associated with, creating a direct line from governance body to research facility.

**Table `ResearchExecutive`**

| executiveIdentifier | fullLegalName | appointmentDate | departmentCode | committeeId | laboratoryId |
|---|---|---|---|---|---|
| EXE-2107 | Integrated Framework A | 2022-05-03 | 605962 | 1 | 1 |
| EXE-2112 | Extended Protocol | 2023-10-14 | 10449510 | 2 | 2 |
| EXE-2117 | Pilot Programme | 2024-03-25 | 2002007020080 | 3 | 3 |
| EXE-2122 | Baseline Standard D | 2025-08-09 | drafting-skills | 4 | 4 |

Research executives are the individuals or named frameworks that execute the operational mandate of a committee. Each executive record carries an identifier like EXE-2107, a full legal name such as Integrated Framework A, an appointment date, and a department code that must match the department code of the committee it serves. The executive at EXE-2107 was appointed on 2022-05-03 and is linked to committee 1 (COM-2451) under department code 605962, operating within laboratory 1. The appointment dates span a range from 2022 through 2025, reflecting the ongoing turnover and renewal of executive leadership. The laboratoryId on the executive record indicates the facility where the executive's duties are primarily carried out, and this laboratory reference is consistent with the laboratoryId found on the corresponding committee record.

**Table `DoctoralSchool`**

| id | schoolCode | schoolName | academicFocus | memberLaboratoryCount | jurisdictionalScope | executiveDepartmentCode | collegeId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Susan Wagner | regional-academic-48 | 2 | seasonal-jurisdic-89 | 605962 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark | legacy-academic-49 | 4 | regional-jurisdic-90 | 10449510 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 974942 | Stephanie Lawrence | compact-academic-50 | 8 | legacy-jurisdic-91 | 2002007020080 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | akk | Cheryl Bradley | composite-academic-51 | 51 | compact-jurisdic-92 | drafting-skills | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Doctoral schools represent the academic units responsible for supervising doctoral candidates and coordinating research training. Each school has a schoolCode, a schoolName such as Susan Wagner or Rebecca Stark, an academicFocus field describing its pedagogical orientation, and a memberLaboratoryCount indicating how many laboratories are affiliated with the school. The jurisdictionalScope field captures the geographic or administrative reach of the school, with values ranging from seasonal-jurisdic-89 to compact-jurisdic-92. The executiveDepartmentCode on the school links it to the same departmental hierarchy used by committees and executives, while the collegeId column connects the school to its parent doctoral college. School 1, named Susan Wagner, has two member laboratories and falls under college 1, while school 4, named Cheryl Bradley, has 51 member laboratories and is governed by college 4.

**Table `DoctoralCollege`**

| id | collegeIdentifier | collegeName | geographicRegion | constituentSchoolCount |
|---|---|---|---|---|
| 1 | COL-2090 | Juan Mitchell | pilot-geograph-14 | 6 |
| 2 | COL-2093 | Stephanie Sutton | extended-geograph-15 | 44 |
| 3 | COL-2096 | Ernest Hemingway | integrated-geograph-16 | 57 |
| 4 | COL-2099 | Ernest Hemingway | seasonal-geograph-17 | 19 |

Doctoral colleges sit above doctoral schools in the organizational hierarchy, aggregating multiple schools under a single administrative umbrella. Each college carries an identifier such as COL-2090, a collegeName like Juan Mitchell or Ernest Hemingway, a geographicRegion describing its territorial scope, and a constituentSchoolCount that quantifies how many schools it contains. The college at COL-2093, named Stephanie Sutton, covers the extended-geograph-15 region and encompasses 44 schools, making it the largest in the dataset. In contrast, COL-2090, named Juan Mitchell, covers pilot-geograph-14 and contains only 6 schools. The geographic regions themselves follow a naming convention that suggests different levels of integration, from pilot and seasonal to extended and integrated.

**Table `ResearchLaboratory`**

| laboratoryId | laboratoryIdentifier | laboratoryName | researchDomain | operationalStatus | schoolId | executiveDepartmentCode |
|---|---|---|---|---|---|---|
| 1 | LAB-2075 | Baseline Initiative D | compact-research-92 | active | 1 | 605962 |
| 2 | LAB-2080 | Distributed Model | composite-research-93 | inactive | 2 | 10449510 |
| 3 | LAB-2085 | Adaptive Cluster | primary-research-94 | merging | 3 | 2002007020080 |
| 4 | LAB-2090 | Primary Review A | adaptive-research-95 | active | 4 | drafting-skills |

Research laboratories are the operational units where actual research takes place. Each laboratory has a laboratoryId, a laboratoryIdentifier such as LAB-2075, a laboratoryName like Baseline Initiative D or Adaptive Cluster, a researchDomain describing its scientific focus, and an operationalStatus that can be active, inactive, or merging. Laboratory 1, identified as LAB-2075 and named Baseline Initiative D, operates in the compact-research-92 domain and maintains active status. Laboratory 3, Adaptive Cluster, is in the primary-research-94 domain and has a status of merging, suggesting an ongoing organizational transition. The schoolId column on the laboratory record indicates the doctoral school with which the laboratory is primarily affiliated, and the executiveDepartmentCode again ties the laboratory into the shared departmental hierarchy.

**Table `DoctoralSchoolResearchLaboratory`**

| schoolId | laboratoryId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The DoctoralSchoolResearchLaboratory table is the junction that explicitly maps the many-to-many relationship between doctoral schools and research laboratories. It contains pairs of schoolId and laboratoryId that define which laboratories are affiliated with which schools. School 1 is affiliated with laboratories 1 and 2, school 2 with laboratories 2 and 3, school 3 with laboratories 3 and 4, and school 4 with laboratories 4 and 1. This creates a cyclic pattern of affiliation where each laboratory serves two schools and each school hosts two laboratories. The memberLaboratoryCount on the DoctoralSchool table (ranging from 2 for school 1 to 51 for school 4) suggests that this junction table may represent a primary or canonical set of affiliations, while the count field captures a broader or historical total.

**Table `DoctoralCollegeDoctoralSchool`**

| collegeId | schoolId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The DoctoralCollegeDoctoralSchool table provides the explicit mapping between doctoral colleges and their constituent schools. While the DoctoralSchool table contains a collegeId column that references the parent college, this junction table makes the relationship explicit and supports cases where a school might belong to multiple colleges or where the relationship carries additional metadata. The constituentSchoolCount on the DoctoralCollege table (ranging from 6 for COL-2090 to 57 for COL-2096) reflects the size of each college's portfolio.

## Governance Relationships and Cross-Referential Views

The views in this system answer specific operational questions by joining base tables along their foreign-key relationships. Each view materializes a particular slice of the governance graph, making it possible to query the relationships that matter for reporting, auditing, and coordination.

**View `research_committee_research_executive_view`**

```sql
CREATE VIEW research_committee_research_executive_view AS
SELECT a.committeeId, a.committeeIdentifier, a.establishedDate, a.governanceStatus, b.executiveIdentifier AS executive_executiveIdentifier, b.fullLegalName AS executive_fullLegalName, b.appointmentDate AS executive_appointmentDate
FROM ResearchCommittee a JOIN ResearchExecutive b ON a.executiveDepartmentCode = b.departmentCode;
```

| committeeId | committeeIdentifier | establishedDate | governanceStatus | executive_executiveIdentifier | executive_fullLegalName | executive_appointmentDate |
|---|---|---|---|---|---|---|
| 1 | COM-2451 | 2024-03-27 | active | EXE-2107 | Integrated Framework A | 2022-05-03 |
| 2 | COM-2455 | 2025-08-11 | dissolved | EXE-2112 | Extended Protocol | 2023-10-14 |
| 3 | COM-2459 | 2022-01-22 | pending | EXE-2117 | Pilot Programme | 2024-03-25 |
| 4 | COM-2463 | 2023-06-06 | active | EXE-2122 | Baseline Standard D | 2025-08-09 |

This view joins ResearchCommittee with ResearchExecutive on the shared department code and the committeeId foreign key, answering the question of which executive serves which committee and under what departmental authority. The joined result shows that executive EXE-2107 (Integrated Framework A) serves committee COM-2451 under department code 605962, while executive EXE-2122 (Baseline Standard D) serves committee COM-2463 under department code drafting-skills. The view preserves the governance status of the committee alongside the appointment date of the executive, enabling queries that identify active committees with their current executive leadership or, conversely, dissolved committees whose executives may still be in transition.

**View `research_committee_research_laboratory_view`**

```sql
CREATE VIEW research_committee_research_laboratory_view AS
SELECT a.committeeId, a.committeeIdentifier, a.establishedDate, a.governanceStatus, b.laboratoryId AS laboratory_laboratoryId, b.laboratoryIdentifier AS laboratory_laboratoryIdentifier, b.laboratoryName AS laboratory_laboratoryName
FROM ResearchCommittee a JOIN ResearchLaboratory b ON a.laboratoryId = b.laboratoryId;
```

| committeeId | committeeIdentifier | establishedDate | governanceStatus | laboratory_laboratoryId | laboratory_laboratoryIdentifier | laboratory_laboratoryName |
|---|---|---|---|---|---|---|
| 1 | COM-2451 | 2024-03-27 | active | 1 | LAB-2075 | Baseline Initiative D |
| 2 | COM-2455 | 2025-08-11 | dissolved | 2 | LAB-2080 | Distributed Model |
| 3 | COM-2459 | 2022-01-22 | pending | 3 | LAB-2085 | Adaptive Cluster |
| 4 | COM-2463 | 2023-06-06 | active | 4 | LAB-2090 | Primary Review A |

By joining ResearchCommittee with ResearchLaboratory on the laboratoryId foreign key, this view reveals which laboratory each committee is associated with and what research domain that laboratory operates in. Committee COM-2451 is linked to laboratory LAB-2075 (Baseline Initiative D), which operates in the compact-research-92 domain and maintains active status. Committee COM-2459, which is in pending status, is associated with laboratory LAB-2085 (Adaptive Cluster), a laboratory whose operational status is merging. This view is particularly useful for auditing whether committees are properly aligned with laboratories that are operationally viable, or whether a pending committee is tied to a laboratory undergoing organizational change.

**View `research_executive_research_committee_view`**

```sql
CREATE VIEW research_executive_research_committee_view AS
SELECT a.executiveIdentifier, a.fullLegalName, a.appointmentDate, a.departmentCode, b.committeeId AS committee_committeeId, b.committeeIdentifier AS committee_committeeIdentifier, b.establishedDate AS committee_establishedDate
FROM ResearchExecutive a JOIN ResearchCommittee b ON a.committeeId = b.committeeId;
```

| executiveIdentifier | fullLegalName | appointmentDate | departmentCode | committee_committeeId | committee_committeeIdentifier | committee_establishedDate |
|---|---|---|---|---|---|---|
| EXE-2107 | Integrated Framework A | 2022-05-03 | 605962 | 1 | COM-2451 | 2024-03-27 |
| EXE-2112 | Extended Protocol | 2023-10-14 | 10449510 | 2 | COM-2455 | 2025-08-11 |
| EXE-2117 | Pilot Programme | 2024-03-25 | 2002007020080 | 3 | COM-2459 | 2022-01-22 |
| EXE-2122 | Baseline Standard D | 2025-08-09 | drafting-skills | 4 | COM-2463 | 2023-06-06 |

This view reverses the perspective of the first view, joining ResearchExecutive with ResearchCommittee to answer the question of which committee an executive serves and what the governance status of that committee is. Executive EXE-2112 (Extended Protocol), appointed on 2023-10-14, serves committee COM-2455, which has a governance status of dissolved. This view is essential for compliance reporting, as it surfaces executives who may be serving on committees that are no longer active, flagging potential gaps in executive coverage or the need for reassignment.

**View `research_executive_research_laboratory_view`**

```sql
CREATE VIEW research_executive_research_laboratory_view AS
SELECT a.executiveIdentifier, a.fullLegalName, a.appointmentDate, a.departmentCode, b.laboratoryId AS laboratory_laboratoryId, b.laboratoryIdentifier AS laboratory_laboratoryIdentifier, b.laboratoryName AS laboratory_laboratoryName
FROM ResearchExecutive a JOIN ResearchLaboratory b ON a.laboratoryId = b.laboratoryId;
```

| executiveIdentifier | fullLegalName | appointmentDate | departmentCode | laboratory_laboratoryId | laboratory_laboratoryIdentifier | laboratory_laboratoryName |
|---|---|---|---|---|---|---|
| EXE-2107 | Integrated Framework A | 2022-05-03 | 605962 | 1 | LAB-2075 | Baseline Initiative D |
| EXE-2112 | Extended Protocol | 2023-10-14 | 10449510 | 2 | LAB-2080 | Distributed Model |
| EXE-2117 | Pilot Programme | 2024-03-25 | 2002007020080 | 3 | LAB-2085 | Adaptive Cluster |
| EXE-2122 | Baseline Standard D | 2025-08-09 | drafting-skills | 4 | LAB-2090 | Primary Review A |

Joining ResearchExecutive with ResearchLaboratory on the laboratoryId foreign key, this view answers the question of which laboratory an executive operates within and what the operational status of that laboratory is. Executive EXE-2117 (Pilot Programme), appointed on 2024-03-25, operates within laboratory LAB-2085 (Adaptive Cluster), which has an operational status of merging. The view combines the executive's appointment date and department code with the laboratory's research domain and operational status, providing a complete picture of the executive's operational environment.

**View `doctoral_school_research_executive_view`**

```sql
CREATE VIEW doctoral_school_research_executive_view AS
SELECT a.id, a.schoolCode, a.schoolName, a.academicFocus, b.executiveIdentifier AS executive_executiveIdentifier, b.fullLegalName AS executive_fullLegalName, b.appointmentDate AS executive_appointmentDate
FROM DoctoralSchool a JOIN ResearchExecutive b ON a.executiveDepartmentCode = b.departmentCode;
```

| id | schoolCode | schoolName | academicFocus | executive_executiveIdentifier | executive_fullLegalName | executive_appointmentDate |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Susan Wagner | regional-academic-48 | EXE-2107 | Integrated Framework A | 2022-05-03 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark | legacy-academic-49 | EXE-2112 | Extended Protocol | 2023-10-14 |
| 3 | 974942 | Stephanie Lawrence | compact-academic-50 | EXE-2117 | Pilot Programme | 2024-03-25 |
| 4 | akk | Cheryl Bradley | composite-academic-51 | EXE-2122 | Baseline Standard D | 2025-08-09 |

This view joins DoctoralSchool with ResearchExecutive through the shared executiveDepartmentCode, answering the question of which executives operate under the same departmental authority as a given doctoral school. School 1 (Susan Wagner), with academic focus regional-academic-48 and jurisdictional scope seasonal-jurisdic-89, shares department code 605962 with executive EXE-2107 (Integrated Framework A), who was appointed on 2022-05-03. The view enables queries that identify all executives operating under the same departmental umbrella as a doctoral school, which is critical for understanding the administrative alignment between academic units and executive leadership.

**View `doctoral_school_research_laboratory_detail_view`**

```sql
CREATE VIEW doctoral_school_research_laboratory_detail_view AS
SELECT a.id, a.schoolCode, a.schoolName, b.laboratoryId AS laboratory_laboratoryId, b.laboratoryIdentifier AS laboratory_laboratoryIdentifier, b.laboratoryName AS laboratory_laboratoryName
FROM DoctoralSchool a
  JOIN DoctoralSchoolResearchLaboratory j ON j.schoolId = a.id
  JOIN ResearchLaboratory b ON b.laboratoryId = j.laboratoryId;
```

| id | schoolCode | schoolName | laboratory_laboratoryId | laboratory_laboratoryIdentifier | laboratory_laboratoryName |
|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Susan Wagner | 1 | LAB-2075 | Baseline Initiative D |
| 1 | lu_tax_code_template_m35 | Susan Wagner | 2 | LAB-2080 | Distributed Model |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark | 2 | LAB-2080 | Distributed Model |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark | 3 | LAB-2085 | Adaptive Cluster |
| 3 | 974942 | Stephanie Lawrence | 3 | LAB-2085 | Adaptive Cluster |
| 3 | 974942 | Stephanie Lawrence | 4 | LAB-2090 | Primary Review A |
| 4 | akk | Cheryl Bradley | 4 | LAB-2090 | Primary Review A |
| 4 | akk | Cheryl Bradley | 1 | LAB-2075 | Baseline Initiative D |

By joining DoctoralSchool with ResearchLaboratory through the DoctoralSchoolResearchLaboratory junction table, this view answers the question of which laboratories are affiliated with a given doctoral school and what the operational characteristics of those laboratories are. School 1 (Susan Wagner) is affiliated with laboratory 1 (LAB-2075, Baseline Initiative D, active status) and laboratory 2 (LAB-2080, Distributed Model, inactive status). The view reveals that a single doctoral school can host laboratories with divergent operational statuses, which has implications for resource allocation and risk management. School 4 (Cheryl Bradley), with 51 member laboratories, is affiliated with laboratory 4 (LAB-2090, Primary Review A, active) and laboratory 1 (LAB-2075, Baseline Initiative D, active), suggesting a concentration of active research capacity.

**View `doctoral_school_doctoral_college_view`**

```sql
CREATE VIEW doctoral_school_doctoral_college_view AS
SELECT a.id, a.schoolCode, a.schoolName, a.academicFocus, b.id AS college_id, b.collegeIdentifier AS college_collegeIdentifier, b.collegeName AS college_collegeName
FROM DoctoralSchool a JOIN DoctoralCollege b ON a.collegeId = b.id;
```

| id | schoolCode | schoolName | academicFocus | college_id | college_collegeIdentifier | college_collegeName |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Susan Wagner | regional-academic-48 | 1 | COL-2090 | Juan Mitchell |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark | legacy-academic-49 | 2 | COL-2093 | Stephanie Sutton |
| 3 | 974942 | Stephanie Lawrence | compact-academic-50 | 3 | COL-2096 | Ernest Hemingway |
| 4 | akk | Cheryl Bradley | composite-academic-51 | 4 | COL-2099 | Ernest Hemingway |

This view joins DoctoralSchool with DoctoralCollege through the collegeId foreign key, answering the question of which college a doctoral school belongs to and what the geographic and structural characteristics of that college are. School 1 (Susan Wagner) belongs to college COL-2090 (Juan Mitchell), which covers the pilot-geograph-14 region and contains 6 constituent schools. School 3 (Stephanie Lawrence) belongs to college COL-2096 (Ernest Hemingway), which covers the integrated-geograph-16 region and contains 57 constituent schools. The view enables queries that identify schools within colleges of a particular geographic region or size class, supporting strategic planning at the college level.

**View `doctoral_college_doctoral_school_detail_view`**

```sql
CREATE VIEW doctoral_college_doctoral_school_detail_view AS
SELECT a.id, a.collegeIdentifier, a.collegeName, b.id AS school_id, b.schoolCode AS school_schoolCode, b.schoolName AS school_schoolName
FROM DoctoralCollege a
  JOIN DoctoralCollegeDoctoralSchool j ON j.collegeId = a.id
  JOIN DoctoralSchool b ON b.id = j.schoolId;
```

| id | collegeIdentifier | collegeName | school_id | school_schoolCode | school_schoolName |
|---|---|---|---|---|---|
| 1 | COL-2090 | Juan Mitchell | 1 | lu_tax_code_template_m35 | Susan Wagner |
| 1 | COL-2090 | Juan Mitchell | 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark |
| 2 | COL-2093 | Stephanie Sutton | 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark |
| 2 | COL-2093 | Stephanie Sutton | 3 | 974942 | Stephanie Lawrence |
| 3 | COL-2096 | Ernest Hemingway | 3 | 974942 | Stephanie Lawrence |
| 3 | COL-2096 | Ernest Hemingway | 4 | akk | Cheryl Bradley |
| 4 | COL-2099 | Ernest Hemingway | 4 | akk | Cheryl Bradley |
| 4 | COL-2099 | Ernest Hemingway | 1 | lu_tax_code_template_m35 | Susan Wagner |

Reversing the perspective of the previous view, this join answers the question of which doctoral schools belong to a given college and what their academic and operational characteristics are. College COL-2093 (Stephanie Sutton), covering extended-geograph-15 with 44 constituent schools, includes school 2 (Rebecca Stark), which has an academic focus of legacy-academic-49 and a jurisdictional scope of regional-jurisdic-90. College COL-2099 (Ernest Hemingway), covering seasonal-geograph-17 with 19 constituent schools, includes school 4 (Cheryl Bradley), which has 51 member laboratories and an academic focus of composite-academic-51. This view is essential for college-level reporting, as it surfaces the full roster of schools under a college's jurisdiction along with their key attributes.

**View `research_laboratory_doctoral_school_view`**

```sql
CREATE VIEW research_laboratory_doctoral_school_view AS
SELECT a.laboratoryId, a.laboratoryIdentifier, a.laboratoryName, a.researchDomain, b.id AS school_id, b.schoolCode AS school_schoolCode, b.schoolName AS school_schoolName
FROM ResearchLaboratory a JOIN DoctoralSchool b ON a.schoolId = b.id;
```

| laboratoryId | laboratoryIdentifier | laboratoryName | researchDomain | school_id | school_schoolCode | school_schoolName |
|---|---|---|---|---|---|---|
| 1 | LAB-2075 | Baseline Initiative D | compact-research-92 | 1 | lu_tax_code_template_m35 | Susan Wagner |
| 2 | LAB-2080 | Distributed Model | composite-research-93 | 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark |
| 3 | LAB-2085 | Adaptive Cluster | primary-research-94 | 3 | 974942 | Stephanie Lawrence |
| 4 | LAB-2090 | Primary Review A | adaptive-research-95 | 4 | akk | Cheryl Bradley |

This view joins ResearchLaboratory with DoctoralSchool through the schoolId foreign key, answering the question of which doctoral school a laboratory is primarily affiliated with and what the school's characteristics are. Laboratory 1 (LAB-2075, Baseline Initiative D, active status) is affiliated with school 1 (Susan Wagner), which has an academic focus of regional-academic-48 and a jurisdictional scope of seasonal-jurisdic-89. Laboratory 3 (LAB-2085, Adaptive Cluster, merging status) is affiliated with school 3 (Stephanie Lawrence), which has an academic focus of compact-academic-50 and a jurisdictional scope of legacy-jurisdic-91. The view is useful for understanding the academic context in which a laboratory operates and for identifying laboratories that may need additional academic support if their affiliated school has a limited jurisdictional scope.

**View `research_laboratory_research_executive_view`**

```sql
CREATE VIEW research_laboratory_research_executive_view AS
SELECT a.laboratoryId, a.laboratoryIdentifier, a.laboratoryName, a.researchDomain, b.executiveIdentifier AS executive_executiveIdentifier, b.fullLegalName AS executive_fullLegalName, b.appointmentDate AS executive_appointmentDate
FROM ResearchLaboratory a JOIN ResearchExecutive b ON a.executiveDepartmentCode = b.departmentCode;
```

| laboratoryId | laboratoryIdentifier | laboratoryName | researchDomain | executive_executiveIdentifier | executive_fullLegalName | executive_appointmentDate |
|---|---|---|---|---|---|---|
| 1 | LAB-2075 | Baseline Initiative D | compact-research-92 | EXE-2107 | Integrated Framework A | 2022-05-03 |
| 2 | LAB-2080 | Distributed Model | composite-research-93 | EXE-2112 | Extended Protocol | 2023-10-14 |
| 3 | LAB-2085 | Adaptive Cluster | primary-research-94 | EXE-2117 | Pilot Programme | 2024-03-25 |
| 4 | LAB-2090 | Primary Review A | adaptive-research-95 | EXE-2122 | Baseline Standard D | 2025-08-09 |

By joining ResearchLaboratory with ResearchExecutive on the laboratoryId foreign key, this view answers the question of which executive operates within a given laboratory and what the laboratory's operational status is. Laboratory 1 (LAB-2075, Baseline Initiative D, active) is served by executive EXE-2107 (Integrated Framework A), appointed on 2022-05-03. Laboratory 3 (LAB-2085, Adaptive Cluster, merging) is served by executive EXE-2117 (Pilot Programme), appointed on 2024-03-25. The view combines the laboratory's research domain and operational status with the executive's appointment date and department code, providing a complete picture of the executive-laboratory relationship. This is particularly valuable for identifying laboratories with merging or inactive status that may require executive attention or reassignment.

## Synthesis

The research governance ecosystem described by these tables and views is a tightly interlocked system of authority and affiliation. Committees govern through executives, who operate within laboratories and under shared departmental codes. Doctoral schools aggregate laboratories into academic programs and are themselves aggregated into colleges that span geographic regions. The junction tables—DoctoralSchoolResearchLaboratory and DoctoralCollegeDoctoralSchool—make explicit the many-to-many relationships that the foreign keys alone cannot fully express. The views materialize the operational questions that matter most: which executive serves which committee, which laboratory serves which school, and which college contains which school. Together, they form a complete record of the institutional architecture, where every identifier, date, and status flag has a role in maintaining the integrity of the research enterprise.