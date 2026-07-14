Research governance in higher education institutions operates through a layered architecture of committees, executives, doctoral schools, colleges, and laboratories. Each organizational unit carries distinct attributes—identifiers, dates, statuses, and departmental codes—that together form a coherent model of academic administration. The relational schema captures this model by normalizing entities into base tables, linking them through foreign keys and junction tables, and then reconstructing domain facts through materialized views.

## Base Tables and Entity Types

The domain centers on five principal entity types: research committees, research executives, doctoral schools, doctoral colleges, and research laboratories. Each entity type materializes as a base table with a primary key, domain-specific attributes, and foreign-key columns that bind the entity to its organizational context.

**Table `ResearchCommittee`**

| committeeId | committeeIdentifier | establishedDate | governanceStatus | executiveDepartmentCode | laboratoryId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|
| 1 | COM-2451 | 2024-03-27 | active | 605962 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | COM-2455 | 2025-08-11 | dissolved | 10449510 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | COM-2459 | 2022-01-22 | pending | 2002007020080 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | COM-2463 | 2023-06-06 | active | drafting-skills | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `ResearchCommittee` table stores governance bodies responsible for overseeing research activities. Each committee is identified by a surrogate key `committeeId` and a business identifier `committeeIdentifier` such as `COM-2451`. The `establishedDate` column records when the committee was constituted, while `governanceStatus` tracks its current state—values like `active`, `dissolved`, and `pending` distinguish operational committees from those in transition. The `executiveDepartmentCode` column links the committee to an executive department, and `laboratoryId` binds it to a specific research laboratory. Audit columns `createdAt` and `updatedAt` record lifecycle timestamps. For instance, committee `COM-2451` (row 1) is active, established on 2024-03-27, and associated with department `605962` and laboratory `1`.

**Table `ResearchExecutive`**

| executiveIdentifier | fullLegalName | appointmentDate | departmentCode | committeeId | laboratoryId |
|---|---|---|---|---|---|
| EXE-2107 | Integrated Framework A | 2022-05-03 | 605962 | 1 | 1 |
| EXE-2112 | Extended Protocol | 2023-10-14 | 10449510 | 2 | 2 |
| EXE-2117 | Pilot Programme | 2024-03-25 | 2002007020080 | 3 | 3 |
| EXE-2122 | Baseline Standard D | 2025-08-09 | drafting-skills | 4 | 4 |

Research executives represent the individuals or programs that execute governance mandates. The `ResearchExecutive` table uses `executiveIdentifier` as its primary key—values like `EXE-2107` and `EXE-2112`—and stores the executive's `fullLegalName`, `appointmentDate`, and `departmentCode`. Two foreign-key columns, `committeeId` and `laboratoryId`, establish the executive's dual affiliation: each executive serves under a specific research committee and operates within a particular laboratory. The name `Integrated Framework A` (row 1) corresponds to executive `EXE-2107`, appointed on 2022-05-03, linked to committee `1` and laboratory `1`.

**Table `DoctoralSchool`**

| id | schoolCode | schoolName | academicFocus | memberLaboratoryCount | jurisdictionalScope | executiveDepartmentCode | collegeId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Susan Wagner | regional-academic-48 | 2 | seasonal-jurisdic-89 | 605962 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Rebecca Stark | legacy-academic-49 | 4 | regional-jurisdic-90 | 10449510 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 974942 | Stephanie Lawrence | compact-academic-50 | 8 | legacy-jurisdic-91 | 2002007020080 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | akk | Cheryl Bradley | composite-academic-51 | 51 | compact-jurisdic-92 | drafting-skills | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Doctoral schools are academic units that supervise doctoral candidates and coordinate with research laboratories. The `DoctoralSchool` table uses `id` as its surrogate primary key and stores `schoolCode` (a business identifier such as `lu_tax_code_template_m35` or `2763c598-9bac-11eb-a8a2-19ed5c03f8d3`), `schoolName` (e.g., `Susan Wagner`, `Rebecca Stark`), `academicFocus` (values like `regional-academic-48`, `legacy-academic-49`), `memberLaboratoryCount` (an integer indicating how many laboratories are affiliated with the school), and `jurisdictionalScope` (e.g., `seasonal-jurisdic-89`). The `executiveDepartmentCode` column links the school to an executive department, while `collegeId` is a foreign key referencing the `DoctoralCollege` table. Audit columns `createdAt` and `updatedAt` track modifications. School `Susan Wagner` (row 1) has an academic focus of `regional-academic-48`, reports to department `605962`, and belongs to college `1`.

**Table `DoctoralCollege`**

| id | collegeIdentifier | collegeName | geographicRegion | constituentSchoolCount |
|---|---|---|---|---|
| 1 | COL-2090 | Juan Mitchell | pilot-geograph-14 | 6 |
| 2 | COL-2093 | Stephanie Sutton | extended-geograph-15 | 44 |
| 3 | COL-2096 | Ernest Hemingway | integrated-geograph-16 | 57 |
| 4 | COL-2099 | Ernest Hemingway | seasonal-geograph-17 | 19 |

Doctoral colleges sit above doctoral schools in the organizational hierarchy. The `DoctoralCollege` table uses `id` as its primary key and stores `collegeIdentifier` (e.g., `COL-2090`), `collegeName` (e.g., `Juan Mitchell`, `Stephanie Sutton`, `Ernest Hemingway`), `geographicRegion` (e.g., `pilot-geograph-14`, `extended-geograph-15`), and `constituentSchoolCount` (an integer indicating how many doctoral schools the college contains). College `COL-2090` (row 1) covers the `pilot-geograph-14` region and contains six constituent schools.

**Table `ResearchLaboratory`**

| laboratoryId | laboratoryIdentifier | laboratoryName | researchDomain | operationalStatus | schoolId | executiveDepartmentCode |
|---|---|---|---|---|---|---|
| 1 | LAB-2075 | Baseline Initiative D | compact-research-92 | active | 1 | 605962 |
| 2 | LAB-2080 | Distributed Model | composite-research-93 | inactive | 2 | 10449510 |
| 3 | LAB-2085 | Adaptive Cluster | primary-research-94 | merging | 3 | 2002007020080 |
| 4 | LAB-2090 | Primary Review A | adaptive-research-95 | active | 4 | drafting-skills |

Research laboratories are the operational units where research is conducted. The `ResearchLaboratory` table uses `laboratoryId` as its primary key and stores `laboratoryIdentifier` (e.g., `LAB-2075`), `laboratoryName` (e.g., `Baseline Initiative D`, `Distributed Model`, `Adaptive Cluster`), `researchDomain` (e.g., `compact-research-92`, `composite-research-93`), and `operationalStatus` (values such as `active`, `inactive`, `merging`). The `schoolId` column is a foreign key referencing `DoctoralSchool`, establishing which doctoral school the laboratory belongs to. The `executiveDepartmentCode` column links the laboratory to an executive department. Laboratory `LAB-2075` (row 1), named `Baseline Initiative D`, operates in the `compact-research-92` domain, has `active` status, and is affiliated with school `1`.

## Junction Tables and Many-to-Many Relationships

Two junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys.

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

The `DoctoralSchoolResearchLaboratory` table resolves the many-to-many relationship between doctoral schools and research laboratories. It contains two columns, `schoolId` and `laboratoryId`, both serving as foreign keys. Each row asserts that a particular school is affiliated with a particular laboratory. The data shows that school `1` is affiliated with laboratories `1` and `2`; school `2` with laboratories `2` and `3`; school `3` with laboratories `3` and `4`; and school `4` with laboratories `4` and `1`. This cross-affiliation pattern means that laboratories can serve multiple schools and schools can host multiple laboratories.

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

The `DoctoralCollegeDoctoralSchool` table resolves the many-to-many relationship between doctoral colleges and doctoral schools. It contains `collegeId` and `schoolId` as foreign keys. Although the sample data does not display rows for this table explicitly, its existence indicates that a doctoral school may belong to multiple colleges and a college may contain multiple schools. This structure supports organizational flexibility where academic units can participate in overlapping governance structures.

## Foreign-Key Relationships and Cardinality

The foreign-key topology of the schema reveals a clear hierarchy. The `ResearchExecutive` table references both `ResearchCommittee` (via `committeeId`) and `ResearchLaboratory` (via `laboratoryId`), creating a bridge between governance bodies and operational units. Each executive is assigned to exactly one committee and one laboratory, enforcing a many-to-one cardinality on both sides. The `DoctoralSchool` table references `DoctoralCollege` (via `collegeId`), meaning each school belongs to one college, while a college can contain many schools. The `ResearchLaboratory` table references `DoctoralSchool` (via `schoolId`), meaning each laboratory belongs to one school, while a school can host many laboratories. The `ResearchCommittee` table also contains a `laboratoryId` column, linking each committee to a primary laboratory.

## Views as Reconstructed Domain Facts

Materialized views join normalized tables to reconstruct domain facts that answer specific analytical questions. Each view corresponds to a particular relationship or analytical perspective within the governance model.

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

The `research_committee_research_executive_view` joins `ResearchCommittee` with `ResearchExecutive` on `committeeId`. This view answers the question: "Which executives serve under which committees?" Each row combines committee metadata (identifier, status, establishment date) with executive details (name, appointment date). For example, the view would show that executive `EXE-2107` (Integrated Framework A) serves under committee `COM-2451`, which has `active` governance status. This join reconstructs the governance assignment fact that is split across two tables.

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

The `research_committee_research_laboratory_view` joins `ResearchCommittee` with `ResearchLaboratory` on `laboratoryId`. This view answers: "Which laboratories are overseen by which committees?" It combines committee attributes with laboratory attributes, revealing the operational scope of each committee. Committee `COM-2451` (row 1) oversees laboratory `LAB-2075` (Baseline Initiative D), which operates in the `compact-research-92` domain with `active` status.

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

The `research_executive_research_committee_view` joins `ResearchExecutive` with `ResearchCommittee` on `committeeId`. This is the inverse perspective of the first view: it answers "Under which committee does each executive operate?" From the executive's vantage point, the view shows that `EXE-2107` (Integrated Framework A) is appointed under committee `COM-2451`, which was established on 2024-03-27 and holds `active` status. The view is useful for executive-level reporting and accountability tracing.

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

The `research_executive_research_laboratory_view` joins `ResearchExecutive` with `ResearchLaboratory` on `laboratoryId`. This view answers: "In which laboratory does each executive operate?" It combines executive appointment data with laboratory operational data. Executive `EXE-2107` (Integrated Framework A) operates within laboratory `LAB-2075` (Baseline Initiative D), which has `active` operational status and belongs to the `compact-research-92` research domain.

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

The `doctoral_school_research_executive_view` joins `DoctoralSchool` with `ResearchExecutive` via the `executiveDepartmentCode` column. This view answers: "Which executives are associated with which doctoral schools through shared departmental codes?" The join key is not a direct foreign key but a shared attribute—`executiveDepartmentCode` appears in both tables. School `Susan Wagner` (row 1) has department code `605962`, which matches the department code of executive `EXE-2107` (Integrated Framework A). This view reveals cross-organizational alignment between academic units and executive programs.

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

The `doctoral_school_research_laboratory_detail_view` joins `DoctoralSchool` with `ResearchLaboratory` on `schoolId`. This view answers: "Which laboratories belong to which doctoral schools?" It is the direct foreign-key join that reconstructs the school-to-laboratory relationship. School `Susan Wagner` (row 1) hosts laboratory `LAB-2075` (Baseline Initiative D), which operates in the `compact-research-92` domain. The view provides a detailed operational picture of each school's research infrastructure.

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

The `doctoral_school_doctoral_college_view` joins `DoctoralSchool` with `DoctoralCollege` on `collegeId`. This view answers: "Which college does each doctoral school belong to?" It reconstructs the hierarchical relationship between schools and their parent colleges. School `Susan Wagner` (row 1) belongs to college `COL-2090` (Juan Mitchell), which covers the `pilot-geograph-14` geographic region and contains six constituent schools.

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

The `doctoral_college_doctoral_school_detail_view` joins `DoctoralCollege` with `DoctoralSchool` on `collegeId`. This is the inverse perspective: it answers "Which schools are contained within each college?" From the college's vantage point, college `COL-2090` (Juan Mitchell) contains school `Susan Wagner`, which has an academic focus of `regional-academic-48` and a jurisdictional scope of `seasonal-jurisdic-89`. This view is useful for college-level aggregation and reporting.

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

The `research_laboratory_doctoral_school_view` joins `ResearchLaboratory` with `DoctoralSchool` on `schoolId`. This view answers: "Which doctoral school does each research laboratory belong to?" It reconstructs the laboratory-to-school relationship from the laboratory's perspective. Laboratory `LAB-2075` (Baseline Initiative D) belongs to school `Susan Wagner`, which has an academic focus of `regional-academic-48` and reports to department `605962`.

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

The `research_laboratory_research_executive_view` joins `ResearchLaboratory` with `ResearchExecutive` on `laboratoryId`. This view answers: "Which executives operate within each research laboratory?" It combines laboratory operational data with executive appointment data. Laboratory `LAB-2075` (Baseline Initiative D) hosts executive `EXE-2107` (Integrated Framework A), who was appointed on 2022-05-03 and serves under committee `COM-2451`.

## Synthesis

The schema models a multi-layered research governance domain through seven base tables and ten materialized views. Five entity tables—`ResearchCommittee`, `ResearchExecutive`, `DoctoralSchool`, `DoctoralCollege`, and `ResearchLaboratory`—capture the core organizational units with their identifying attributes, status indicators, and departmental codes. Two junction tables—`DoctoralSchoolResearchLaboratory` and `DoctoralCollegeDoctoralSchool`—resolve many-to-many relationships that arise when academic units participate in overlapping affiliations. Foreign keys bind the hierarchy: executives serve under committees and within laboratories; schools belong to colleges and host laboratories; committees oversee laboratories. The ten views reconstruct domain facts by joining these normalized tables along their foreign-key relationships or shared departmental codes, each view answering a specific analytical question about the governance structure. The result is a schema that is both normalized for data integrity and richly queryable through its view layer.