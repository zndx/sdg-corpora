## The Architecture of Academic Research Programs

Academic research programs operate as interconnected ecosystems where degree requirements, specialized concentrations, professional competencies, and research activities converge to produce measurable outcomes. Each program establishes a framework defined by credit-hour requirements, enrollment modes, and operational status, while simultaneously mapping the competencies that graduates must demonstrate and the professional roles they will assume. Research activities serve as the operational engine, applying statistical methods within defined study designs to generate evidence that validates both the competencies taught and the roles prepared. This chapter documents the structural relationships among these components, drawing on recorded program data to illustrate how institutions organize, assess, and report their academic research enterprise.

## Core Program Records

Academic programs form the foundational layer of the research enterprise. Each program carries a unique identifier, a program code, and a degree level designation that together establish its academic identity. Programs specify the total credit hours required for completion, the maximum advanced-standing credits accepted, and whether enrollment operates on a full-time or part-time basis. The effective date marks when the program structure became operative, while the status field tracks its current administrative state—active, pending, or archived.

**Table `academic_programs`**

| academic_program_id | program_code | degree_level | concentration | total_credit_hours_required | max_advanced_standing_credits | enrollment_mode | effective_date | status | concentration_id | professional_role_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | distributed-concentr-54 | 0 | 13 | full-time | 2023-02-14 | active | 1000 | 100 |
| 2 | 1186082 | adaptive-degree-23 | baseline-concentr-55 | 28 | 23 | part-time | 2024-07-25 | pending | 1001 | 101 |
| 3 | 3990187 | distributed-degree-24 | pilot-concentr-56 | 8 | 33 | full-time | 2025-12-09 | archived | 1002 | 102 |
| 4 | flexible-thinking | baseline-degree-25 | extended-concentr-57 | 14 | 43 | part-time | 2022-05-20 | active | 1003 | 103 |

The program records reveal a spectrum of operational configurations. Program code 191 operates as a primary-degree offering with a full-time enrollment mode and active status, requiring zero credit hours in the current record while accepting up to thirteen advanced-standing credits. Program 1186082, designated adaptive-degree-23, runs part-time with a pending status and mandates twenty-eight credit hours alongside a maximum of twenty-three advanced-standing credits. The distributed-degree-24 program (code 3990187) maintains full-time enrollment and active status but carries only eight required credit hours and thirty-three advanced-standing credits. The flexible-thinking program, operating under baseline-degree-25, runs part-time with fourteen required credit hours and forty-three advanced-standing credits, reflecting a more permissive transfer policy.

## Concentrations and Methodological Focus

Concentrations represent the specialized domains within which academic programs develop expertise. Each concentration carries a descriptive name, a focus area classification, and a methodology type that signals the analytical approach emphasized. The is_core flag distinguishes mandatory concentrations from elective ones, while the academic_program_id anchors the concentration to its parent program.

**Table `concentrations`**

| id | concentration_name | focus_area | methodology_type | is_core | academic_program_id | statistical_method_id |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Corridor | pilot-focus-20 | primary-methodol-22 | false | 1 | 100 |
| 1001 | Primary Series | extended-focus-21 | adaptive-methodol-23 | true | 2 | 101 |
| 1002 | Composite Assessment D | integrated-focus-22 | distributed-methodol-24 | false | 3 | 102 |
| 1003 | Compact Survey | seasonal-focus-23 | baseline-methodol-25 | true | 4 | 103 |

The concentration records demonstrate how focus areas map to methodological traditions. The Adaptive Corridor concentration (id 1000) operates as a pilot-focus-20 track using primary-methodol-22 methodology and is marked as non-core, suggesting it serves as an exploratory or supplementary offering within its parent program. The Primary Series concentration (id 1001) carries an extended-focus-21 designation with adaptive-methodol-23 methodology and is designated as core, indicating it forms a required element of its program structure. The Composite Assessment D concentration (id 1002) employs integrated-focus-22 methodology and is non-core, while the Compact Survey concentration (id 1003) uses seasonal-focus-23 methodology and holds core status, reflecting its essential role in the program curriculum.

## Competency Frameworks

Competencies define the measurable skills and knowledge that participants must demonstrate. Each competency record includes a unique identifier, a title, and a description that clarifies the expected performance. Proficiency levels range from novice through proficient to expert, providing a graduated assessment scale. Assessment types—written, oral, graphical, and practical—specify the modality through which competency is evaluated.

**Table `competencies`**

| id | competency_i_d | competency_title | competency_description | proficiency_level | assessment_type | academic_program_id | professional_role_id | research_activity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | novice | written | 1 | 100 | 1 |
| 2 | COM-2725 | Primary Protocol | Composite Series | proficient | oral | 2 | 101 | 2 |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | expert | graphical | 3 | 102 | 3 |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | novice | practical | 4 | 103 | 4 |

The competency records illustrate a structured progression of skill development. Competency COM-2721, titled Adaptive Framework and described as Primary Corridor A, targets novice-level proficiency and is assessed through written evaluation. Competency COM-2725, the Primary Protocol (Composite Series), requires proficient-level performance assessed orally. The Composite Programme D (Compact Assessment), identified as COM-2729, demands expert-level mastery evaluated graphically. Finally, COM-2733, the Compact Standard (Legacy Survey D), returns to novice-level expectations assessed through practical demonstration. This variation in proficiency targets and assessment modalities reflects the differentiated nature of competency evaluation across the program structure.

## Professional Role Definitions

Professional roles articulate the positions that program participants prepare to occupy. Each role carries a name, a category classification, and a primary responsibility designation. The academic_program_id links the role to its training program, while the research_activity_id connects it to the operational research context.

**Table `professional_roles`**

| id | role_name | role_category | primary_responsibility | academic_program_id | research_activity_id |
|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | pilot-primary-26 | 1 | 1 |
| 101 | Integrated Standard | Collaborator | extended-primary-27 | 2 | 2 |
| 102 | Extended Framework D | Educator | integrated-primary-28 | 3 | 3 |
| 103 | Pilot Protocol | Researcher | seasonal-primary-29 | 4 | 4 |

The professional role records reveal a structured taxonomy of positions. The Seasonal Programme role (id 100) falls under the Researcher category with pilot-primary-26 as its primary responsibility, operating within academic program 1 and research activity 1. The Integrated Standard role (id 101) is classified as a Collaborator with extended-primary-27 responsibilities, tied to program 2 and research activity 2. The Extended Framework D role (id 102) designates an Educator position with integrated-primary-28 responsibilities, linked to program 3 and research activity 3. The Pilot Protocol role (id 103) returns to the Researcher category with seasonal-primary-29 responsibilities, associated with program 4 and research activity 4.

## Research Activity Management

Research activities constitute the operational execution layer where theoretical frameworks meet empirical investigation. Each activity carries a unique identifier, an activity type classification, and a study design specification. Data sources identify where evidence originates, while start and end dates establish the temporal boundaries. The status field tracks progression through planned, ongoing, completed, and published stages.

**Table `research_activities`**

| id | activity_i_d | activity_type | study_design | data_source | start_date | end_date | status | statistical_method_id | competency_id | professional_role_id | involves_collaborator_professional_role_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | pilot-data-38 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 100 | 1 | 100 | 100 |
| 2 | ACT-2464 | methodological | distributed-study-12 | extended-data-39 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 101 | 2 | 101 | 101 |
| 3 | ACT-2468 | application | baseline-study-13 | integrated-data-40 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 102 | 3 | 102 | 102 |
| 4 | ACT-2472 | dissemination | pilot-study-14 | seasonal-data-41 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | published | 103 | 4 | 103 | 103 |

The research activity records demonstrate a full lifecycle of investigation. Activity ACT-2460, classified as foundational research with adaptive-study-11 design, draws from pilot-data-38 and spans from September 5, 2022, to September 1, 2022, currently holding planned status. Activity ACT-2464, a methodological investigation using distributed-study-12 design, sources extended-data-39 and runs from February 16, 2023, to February 12, 2023, with ongoing status. Activity ACT-2468, an application-focused study employing baseline-study-13 design, utilizes integrated-data-40 and covers July 27, 2024, to July 23, 2024, marked as completed. Activity ACT-2472, a dissemination study with pilot-study-14 design, draws from seasonal-data-41 and spans December 11, 2025, to December 7, 2025, carrying published status.

## Statistical Method Catalog

Statistical methods provide the analytical toolkit applied within research activities. Each method carries an identifier, a name, and a category classification that indicates its analytical purpose—study design, data analysis, inference, or quantification. Complexity levels quantify the methodological sophistication, while the is_standardized flag distinguishes established methods from custom approaches.

**Table `statistical_methods`**

| statistical_method_id | method_i_d | method_name | method_category | complexity_level | is_standardized | concentration_id | research_activity_id | professional_role_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 37 | false | 1000 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | MET-2521 | Baseline Survey | data_analysis | 45 | true | 1001 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | MET-2526 | Distributed Corridor A | inference | 53 | false | 1002 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | MET-2531 | Adaptive Series | quantification | 61 | true | 1003 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The statistical method records span a range of analytical capabilities. Method MET-2516, Pilot Assessment, serves study design purposes with a complexity level of 37 and is not standardized. Method MET-2521, Baseline Survey, supports data analysis with complexity level 45 and carries standardized status. Method MET-2526, Distributed Corridor A, enables inference with complexity level 53 and is non-standardized. Method MET-2531, Adaptive Series, performs quantification with complexity level 61 and is standardized. The complexity progression from 37 to 61 across these methods reflects increasing analytical sophistication.

## Cross-Reference Tables

The programs_competencies and roles_competencies tables establish the associative links between academic programs and required competencies, and between professional roles and expected competencies, respectively. These cross-reference tables enable the mapping of competency requirements to both educational offerings and career outcomes, ensuring that each program trains participants in the skills necessary for their designated professional roles.

## Program-Concentration Relationships

The v_academic_program_concentration view resolves the relationship between academic programs and their associated concentrations, answering the question of which specialized focus areas belong to which degree programs.

**View `v_academic_program_concentration`**

```sql
CREATE VIEW v_academic_program_concentration AS
SELECT a.academic_program_id, a.program_code, a.degree_level, a.concentration, b.id AS concentration_id, b.concentration_name AS concentration_concentration_name, b.focus_area AS concentration_focus_area
FROM academic_programs a JOIN concentrations b ON a.concentration_id = b.id;
```

| academic_program_id | program_code | degree_level | concentration | concentration_id | concentration_concentration_name | concentration_focus_area |
|---|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | distributed-concentr-54 | 1000 | Adaptive Corridor | pilot-focus-20 |
| 2 | 1186082 | adaptive-degree-23 | baseline-concentr-55 | 1001 | Primary Series | extended-focus-21 |
| 3 | 3990187 | distributed-degree-24 | pilot-concentr-56 | 1002 | Composite Assessment D | integrated-focus-22 |
| 4 | flexible-thinking | baseline-degree-25 | extended-concentr-57 | 1003 | Compact Survey | seasonal-focus-23 |

Reading the joined results, program code 191 (primary-degree-22) maps to the Adaptive Corridor concentration (id 1000), establishing a full-time, active program with a non-core pilot-focus-20 track. Program 1186082 (adaptive-degree-23) connects to the Primary Series concentration (id 1001), forming a part-time, pending program anchored by a core extended-focus-21 concentration. The distributed-degree-24 program (code 3990187) pairs with Composite Assessment D (id 1002), a full-time, active program with a non-core integrated-focus-22 track. The flexible-thinking program (baseline-degree-25) links to Compact Survey (id 1003), a part-time, active program built around a core seasonal-focus-23 concentration.

## Program Competency Detail

The v_academic_program_competency_detail view joins academic programs with their associated competencies, revealing which skills each program requires participants to master.

**View `v_academic_program_competency_detail`**

```sql
CREATE VIEW v_academic_program_competency_detail AS
SELECT a.academic_program_id, a.program_code, a.degree_level, b.id AS competency_id, b.competency_i_d AS competency_competency_i_d, b.competency_title AS competency_competency_title
FROM academic_programs a
  JOIN programs_competencies j ON j.academic_program_id = a.academic_program_id
  JOIN competencies b ON b.id = j.competency_id;
```

| academic_program_id | program_code | degree_level | competency_id | competency_competency_i_d | competency_competency_title |
|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | 1 | COM-2721 | Adaptive Framework |
| 1 | 191 | primary-degree-22 | 2 | COM-2725 | Primary Protocol |
| 2 | 1186082 | adaptive-degree-23 | 2 | COM-2725 | Primary Protocol |
| 2 | 1186082 | adaptive-degree-23 | 3 | COM-2729 | Composite Programme D |
| 3 | 3990187 | distributed-degree-24 | 3 | COM-2729 | Composite Programme D |
| 3 | 3990187 | distributed-degree-24 | 4 | COM-2733 | Compact Standard |
| 4 | flexible-thinking | baseline-degree-25 | 4 | COM-2733 | Compact Standard |
| 4 | flexible-thinking | baseline-degree-25 | 1 | COM-2721 | Adaptive Framework |

In the joined output, program code 191 (primary-degree-22) aligns with competency COM-2721 (Adaptive Framework), a novice-level written assessment. Program 1186082 (adaptive-degree-23) connects to COM-2725 (Primary Protocol), requiring proficient-level oral assessment. Program 3990187 (distributed-degree-24) maps to COM-2729 (Composite Programme D), an expert-level graphical assessment. The flexible-thinking program (baseline-degree-25) associates with COM-2733 (Compact Standard), a novice-level practical assessment. This mapping demonstrates how programs calibrate competency expectations to their operational profiles.

## Program-Role Alignment

The v_academic_program_professional_role view connects academic programs to the professional roles they prepare participants for, clarifying the career pathways embedded in each program design.

**View `v_academic_program_professional_role`**

```sql
CREATE VIEW v_academic_program_professional_role AS
SELECT a.academic_program_id, a.program_code, a.degree_level, a.concentration, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM academic_programs a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| academic_program_id | program_code | degree_level | concentration | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | distributed-concentr-54 | 100 | Seasonal Programme | Researcher |
| 2 | 1186082 | adaptive-degree-23 | baseline-concentr-55 | 101 | Integrated Standard | Collaborator |
| 3 | 3990187 | distributed-degree-24 | pilot-concentr-56 | 102 | Extended Framework D | Educator |
| 4 | flexible-thinking | baseline-degree-25 | extended-concentr-57 | 103 | Pilot Protocol | Researcher |

The joined records show program code 191 (primary-degree-22) preparing participants for the Seasonal Programme role (id 100), a Researcher position. Program 1186082 (adaptive-degree-23) targets the Integrated Standard role (id 101), a Collaborator position. Program 3990187 (distributed-degree-24) leads to the Extended Framework D role (id 102), an Educator position. The flexible-thinking program (baseline-degree-25) prepares participants for the Pilot Protocol role (id 103), another Researcher position. This alignment ensures that program curricula are purposefully oriented toward specific professional outcomes.

## Concentration-Program Association

The v_concentration_academic_program view presents concentrations from the concentration side, showing which academic programs host each focus area.

**View `v_concentration_academic_program`**

```sql
CREATE VIEW v_concentration_academic_program AS
SELECT a.id, a.concentration_name, a.focus_area, a.methodology_type, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.degree_level AS program_degree_level
FROM concentrations a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | concentration_name | focus_area | methodology_type | program_academic_program_id | program_program_code | program_degree_level |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Corridor | pilot-focus-20 | primary-methodol-22 | 1 | 191 | primary-degree-22 |
| 1001 | Primary Series | extended-focus-21 | adaptive-methodol-23 | 2 | 1186082 | adaptive-degree-23 |
| 1002 | Composite Assessment D | integrated-focus-22 | distributed-methodol-24 | 3 | 3990187 | distributed-degree-24 |
| 1003 | Compact Survey | seasonal-focus-23 | baseline-methodol-25 | 4 | flexible-thinking | baseline-degree-25 |

The Adaptive Corridor concentration (id 1000) resides within program code 191 (primary-degree-22), a full-time active program. The Primary Series concentration (id 1001) is hosted by program 1186082 (adaptive-degree-23), a part-time pending program. The Composite Assessment D concentration (id 1002) belongs to program 3990187 (distributed-degree-24), a full-time active program. The Compact Survey concentration (id 1003) is embedded in the flexible-thinking program (baseline-degree-25), a part-time active program. This perspective confirms the one-to-one concentration-to-program mapping evident in the base data.

## Concentration-Method Association

The v_concentration_statistical_method view links concentrations to the statistical methods they employ, revealing the analytical foundations of each focus area.

**View `v_concentration_statistical_method`**

```sql
CREATE VIEW v_concentration_statistical_method AS
SELECT a.id, a.concentration_name, a.focus_area, a.methodology_type, b.statistical_method_id AS method_statistical_method_id, b.method_i_d AS method_method_i_d, b.method_name AS method_method_name
FROM concentrations a JOIN statistical_methods b ON a.statistical_method_id = b.statistical_method_id;
```

| id | concentration_name | focus_area | methodology_type | method_statistical_method_id | method_method_i_d | method_method_name |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Corridor | pilot-focus-20 | primary-methodol-22 | 100 | MET-2516 | Pilot Assessment |
| 1001 | Primary Series | extended-focus-21 | adaptive-methodol-23 | 101 | MET-2521 | Baseline Survey |
| 1002 | Composite Assessment D | integrated-focus-22 | distributed-methodol-24 | 102 | MET-2526 | Distributed Corridor A |
| 1003 | Compact Survey | seasonal-focus-23 | baseline-methodol-25 | 103 | MET-2531 | Adaptive Series |

The Adaptive Corridor concentration (id 1000) utilizes the Pilot Assessment method (MET-2516), a non-standardized study design tool with complexity level 37. The Primary Series concentration (id 1001) applies the Baseline Survey method (MET-2521), a standardized data analysis tool at complexity level 45. The Composite Assessment D concentration (id 1002) employs Distributed Corridor A (MET-2526), a non-standardized inference method at complexity level 53. The Compact Survey concentration (id 1003) uses Adaptive Series (MET-2531), a standardized quantification method at complexity level 61. This association demonstrates how methodological sophistication increases across the concentration portfolio.

## Competency-Program Association

The v_competency_academic_program view presents competencies from the competency side, showing which programs require each skill.

**View `v_competency_academic_program`**

```sql
CREATE VIEW v_competency_academic_program AS
SELECT a.id, a.competency_i_d, a.competency_title, a.competency_description, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.degree_level AS program_degree_level
FROM competencies a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | competency_i_d | competency_title | competency_description | program_academic_program_id | program_program_code | program_degree_level |
|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | 1 | 191 | primary-degree-22 |
| 2 | COM-2725 | Primary Protocol | Composite Series | 2 | 1186082 | adaptive-degree-23 |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | 3 | 3990187 | distributed-degree-24 |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | 4 | flexible-thinking | baseline-degree-25 |

Competency COM-2721 (Adaptive Framework) is required by program code 191 (primary-degree-22), a full-time active program. COM-2725 (Primary Protocol) is required by program 1186082 (adaptive-degree-23), a part-time pending program. COM-2729 (Composite Programme D) is required by program 3990187 (distributed-degree-24), a full-time active program. COM-2733 (Compact Standard) is required by the flexible-thinking program (baseline-degree-25), a part-time active program. Each competency is uniquely assigned to a single program, establishing a clear competency-to-program correspondence.

## Competency-Role Association

The v_competency_professional_role view connects competencies to the professional roles that require them, bridging educational outcomes with career expectations.

**View `v_competency_professional_role`**

```sql
CREATE VIEW v_competency_professional_role AS
SELECT a.id, a.competency_i_d, a.competency_title, a.competency_description, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM competencies a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| id | competency_i_d | competency_title | competency_description | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | 100 | Seasonal Programme | Researcher |
| 2 | COM-2725 | Primary Protocol | Composite Series | 101 | Integrated Standard | Collaborator |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | 102 | Extended Framework D | Educator |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | 103 | Pilot Protocol | Researcher |

The joined results show COM-2721 (Adaptive Framework) supporting the Seasonal Programme role (id 100), a Researcher position. COM-2725 (Primary Protocol) supports the Integrated Standard role (id 101), a Collaborator position. COM-2729 (Composite Programme D) supports the Extended Framework D role (id 102), an Educator position. COM-2733 (Compact Standard) supports the Pilot Protocol role (id 103), a Researcher position. This linkage ensures that competency development is directly relevant to professional role performance.

## Competency-Research Association

The v_competency_research_activity view links competencies to the research activities in which they are applied, grounding skill development in empirical investigation.

**View `v_competency_research_activity`**

```sql
CREATE VIEW v_competency_research_activity AS
SELECT a.id, a.competency_i_d, a.competency_title, a.competency_description, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM competencies a JOIN research_activities b ON a.research_activity_id = b.id;
```

| id | competency_i_d | competency_title | competency_description | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | 1 | ACT-2460 | foundational |
| 2 | COM-2725 | Primary Protocol | Composite Series | 2 | ACT-2464 | methodological |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | 3 | ACT-2468 | application |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | 4 | ACT-2472 | dissemination |

COM-2721 (Adaptive Framework) is applied within activity ACT-2460, a foundational study with adaptive-study-11 design currently in planned status. COM-2725 (Primary Protocol) is applied within ACT-2464, a methodological study with distributed-study-12 design currently ongoing. COM-2729 (Composite Programme D) is applied within ACT-2468, an application study with baseline-study-13 design that is completed. COM-2733 (Compact Standard) is applied within ACT-2472, a dissemination study with pilot-study-14 design that is published. This association demonstrates how competencies are exercised across the full research lifecycle.

## Role-Program Association

The v_professional_role_academic_program view presents professional roles from the role side, showing which programs train participants for each position.

**View `v_professional_role_academic_program`**

```sql
CREATE VIEW v_professional_role_academic_program AS
SELECT a.id, a.role_name, a.role_category, a.primary_responsibility, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.degree_level AS program_degree_level
FROM professional_roles a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | role_name | role_category | primary_responsibility | program_academic_program_id | program_program_code | program_degree_level |
|---|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | pilot-primary-26 | 1 | 191 | primary-degree-22 |
| 101 | Integrated Standard | Collaborator | extended-primary-27 | 2 | 1186082 | adaptive-degree-23 |
| 102 | Extended Framework D | Educator | integrated-primary-28 | 3 | 3990187 | distributed-degree-24 |
| 103 | Pilot Protocol | Researcher | seasonal-primary-29 | 4 | flexible-thinking | baseline-degree-25 |

The Seasonal Programme role (id 100) is trained by program code 191 (primary-degree-22), a full-time active program. The Integrated Standard role (id 101) is trained by program 1186082 (adaptive-degree-23), a part-time pending program. The Extended Framework D role (id 102) is trained by program 3990187 (distributed-degree-24), a full-time active program. The Pilot Protocol role (id 103) is trained by the flexible-thinking program (baseline-degree-25), a part-time active program. This perspective confirms the systematic alignment between program offerings and role preparation.

## Role Competency Detail

The v_professional_role_competency_detail view joins professional roles with the competencies they require, providing a detailed competency profile for each position.

**View `v_professional_role_competency_detail`**

```sql
CREATE VIEW v_professional_role_competency_detail AS
SELECT a.id, a.role_name, a.role_category, b.id AS competency_id, b.competency_i_d AS competency_competency_i_d, b.competency_title AS competency_competency_title
FROM professional_roles a
  JOIN roles_competencies j ON j.professional_role_id = a.id
  JOIN competencies b ON b.id = j.competency_id;
```

| id | role_name | role_category | competency_id | competency_competency_i_d | competency_competency_title |
|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | 1 | COM-2721 | Adaptive Framework |
| 100 | Seasonal Programme | Researcher | 2 | COM-2725 | Primary Protocol |
| 101 | Integrated Standard | Collaborator | 2 | COM-2725 | Primary Protocol |
| 101 | Integrated Standard | Collaborator | 3 | COM-2729 | Composite Programme D |
| 102 | Extended Framework D | Educator | 3 | COM-2729 | Composite Programme D |
| 102 | Extended Framework D | Educator | 4 | COM-2733 | Compact Standard |
| 103 | Pilot Protocol | Researcher | 4 | COM-2733 | Compact Standard |
| 103 | Pilot Protocol | Researcher | 1 | COM-2721 | Adaptive Framework |

The Seasonal Programme role (id 100) requires COM-2721 (Adaptive Framework), a novice-level written assessment. The Integrated Standard role (id 101) requires COM-2725 (Primary Protocol), a proficient-level oral assessment. The Extended Framework D role (id 102) requires COM-2729 (Composite Programme D), an expert-level graphical assessment. The Pilot Protocol role (id 103) requires COM-2733 (Compact Standard), a novice-level practical assessment. This detailed mapping ensures that role expectations are explicitly tied to measurable competency outcomes.

## Role-Research Association

The v_professional_role_research_activity view connects professional roles to the research activities they conduct, clarifying the operational responsibilities of each position.

**View `v_professional_role_research_activity`**

```sql
CREATE VIEW v_professional_role_research_activity AS
SELECT a.id, a.role_name, a.role_category, a.primary_responsibility, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM professional_roles a JOIN research_activities b ON a.research_activity_id = b.id;
```

| id | role_name | role_category | primary_responsibility | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | pilot-primary-26 | 1 | ACT-2460 | foundational |
| 101 | Integrated Standard | Collaborator | extended-primary-27 | 2 | ACT-2464 | methodological |
| 102 | Extended Framework D | Educator | integrated-primary-28 | 3 | ACT-2468 | application |
| 103 | Pilot Protocol | Researcher | seasonal-primary-29 | 4 | ACT-2472 | dissemination |

The Seasonal Programme role (id 100) conducts activity ACT-2460, a foundational study in planned status. The Integrated Standard role (id 101) conducts ACT-2464, a methodological study that is ongoing. The Extended Framework D role (id 102) conducts ACT-2468, an application study that is completed. The Pilot Protocol role (id 103) conducts ACT-2472, a dissemination study that is published. This association demonstrates how professional roles are distributed across the research activity portfolio.

## Research-Method Association

The v_research_activity_statistical_method view links research activities to the statistical methods they employ, revealing the analytical approaches underlying each investigation.

**View `v_research_activity_statistical_method`**

```sql
CREATE VIEW v_research_activity_statistical_method AS
SELECT a.id, a.activity_i_d, a.activity_type, a.study_design, b.statistical_method_id AS method_statistical_method_id, b.method_i_d AS method_method_i_d, b.method_name AS method_method_name
FROM research_activities a JOIN statistical_methods b ON a.statistical_method_id = b.statistical_method_id;
```

| id | activity_i_d | activity_type | study_design | method_statistical_method_id | method_method_i_d | method_method_name |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | 100 | MET-2516 | Pilot Assessment |
| 2 | ACT-2464 | methodological | distributed-study-12 | 101 | MET-2521 | Baseline Survey |
| 3 | ACT-2468 | application | baseline-study-13 | 102 | MET-2526 | Distributed Corridor A |
| 4 | ACT-2472 | dissemination | pilot-study-14 | 103 | MET-2531 | Adaptive Series |

Activity ACT-2460 (foundational) employs the Pilot Assessment method (MET-2516), a non-standardized study design tool at complexity level 37. Activity ACT-2464 (methodological) employs the Baseline Survey method (MET-2521), a standardized data analysis tool at complexity level 45. Activity ACT-2468 (application) employs Distributed Corridor A (MET-2526), a non-standardized inference method at complexity level 53. Activity ACT-2472 (dissemination) employs Adaptive Series (MET-2531), a standardized quantification method at complexity level 61. This mapping shows how research activities select methods appropriate to their analytical needs and complexity requirements.

## Research Competency Association

The v_research_activity_competency view connects research activities to the competencies they exercise, grounding empirical investigation in skill demonstration.

**View `v_research_activity_competency`**

```sql
CREATE VIEW v_research_activity_competency AS
SELECT a.id, a.activity_i_d, a.activity_type, a.study_design, b.id AS competency_id, b.competency_i_d AS competency_competency_i_d, b.competency_title AS competency_competency_title
FROM research_activities a JOIN competencies b ON a.competency_id = b.id;
```

| id | activity_i_d | activity_type | study_design | competency_id | competency_competency_i_d | competency_competency_title |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | 1 | COM-2721 | Adaptive Framework |
| 2 | ACT-2464 | methodological | distributed-study-12 | 2 | COM-2725 | Primary Protocol |
| 3 | ACT-2468 | application | baseline-study-13 | 3 | COM-2729 | Composite Programme D |
| 4 | ACT-2472 | dissemination | pilot-study-14 | 4 | COM-2733 | Compact Standard |

Activity ACT-2460 (foundational) exercises COM-2721 (Adaptive Framework), a novice-level written assessment. Activity ACT-2464 (methodological) exercises COM-2725 (Primary Protocol), a proficient-level oral assessment. Activity ACT-2468 (application) exercises COM-2729 (Composite Programme D), an expert-level graphical assessment. Activity ACT-2472 (dissemination) exercises COM-2733 (Compact Standard), a novice-level practical assessment. This linkage ensures that research activities serve as both evidence-generating exercises and competency validation opportunities.

## Research-Role Association

The v_research_activity_professional_role view presents research activities from the activity side, showing which professional roles conduct each investigation.

**View `v_research_activity_professional_role`**

```sql
CREATE VIEW v_research_activity_professional_role AS
SELECT a.id, a.activity_i_d, a.activity_type, a.study_design, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM research_activities a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| id | activity_i_d | activity_type | study_design | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | 100 | Seasonal Programme | Researcher |
| 2 | ACT-2464 | methodological | distributed-study-12 | 101 | Integrated Standard | Collaborator |
| 3 | ACT-2468 | application | baseline-study-13 | 102 | Extended Framework D | Educator |
| 4 | ACT-2472 | dissemination | pilot-study-14 | 103 | Pilot Protocol | Researcher |

Activity ACT-2460 (foundational) is conducted by the Seasonal Programme role (id 100), a Researcher position. Activity ACT-2464 (methodological) is conducted by the Integrated Standard role (id 101), a Collaborator position. Activity ACT-2468 (application) is conducted by the Extended Framework D role (id 102), an Educator position. Activity ACT-2472 (dissemination) is conducted by the Pilot Protocol role (id 103), a Researcher position. This perspective confirms that each research activity is assigned to a specific professional role, establishing clear accountability for research execution.

## Method-Concentration Association

The v_statistical_method_concentration view presents statistical methods from the method side, showing which concentrations employ each analytical tool.

**View `v_statistical_method_concentration`**

```sql
CREATE VIEW v_statistical_method_concentration AS
SELECT a.statistical_method_id, a.method_i_d, a.method_name, a.method_category, b.id AS concentration_id, b.concentration_name AS concentration_concentration_name, b.focus_area AS concentration_focus_area
FROM statistical_methods a JOIN concentrations b ON a.concentration_id = b.id;
```

| statistical_method_id | method_i_d | method_name | method_category | concentration_id | concentration_concentration_name | concentration_focus_area |
|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 1000 | Adaptive Corridor | pilot-focus-20 |
| 101 | MET-2521 | Baseline Survey | data_analysis | 1001 | Primary Series | extended-focus-21 |
| 102 | MET-2526 | Distributed Corridor A | inference | 1002 | Composite Assessment D | integrated-focus-22 |
| 103 | MET-2531 | Adaptive Series | quantification | 1003 | Compact Survey | seasonal-focus-23 |

The Pilot Assessment method (MET-2516) is employed by the Adaptive Corridor concentration (id 1000), a non-core pilot-focus-20 track. The Baseline Survey method (MET-2521) is employed by the Primary Series concentration (id 1001), a core extended-focus-21 track. The Distributed Corridor A method (MET-2526) is employed by the Composite Assessment D concentration (id 1002), a non-core integrated-focus-22 track. The Adaptive Series method (MET-2531) is employed by the Compact Survey concentration (id 1003), a core seasonal-focus-23 track. This association confirms the systematic pairing of methodological tools with concentration focus areas.

## Method-Research Association

The v_statistical_method_research_activity view links statistical methods to the research activities that apply them, providing a methodological audit trail for each investigation.

**View `v_statistical_method_research_activity`**

```sql
CREATE VIEW v_statistical_method_research_activity AS
SELECT a.statistical_method_id, a.method_i_d, a.method_name, a.method_category, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM statistical_methods a JOIN research_activities b ON a.research_activity_id = b.id;
```

| statistical_method_id | method_i_d | method_name | method_category | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 1 | ACT-2460 | foundational |
| 101 | MET-2521 | Baseline Survey | data_analysis | 2 | ACT-2464 | methodological |
| 102 | MET-2526 | Distributed Corridor A | inference | 3 | ACT-2468 | application |
| 103 | MET-2531 | Adaptive Series | quantification | 4 | ACT-2472 | dissemination |

The Pilot Assessment method (MET-2516) is applied in activity ACT-2460, a foundational study in planned status. The Baseline Survey method (MET-2521) is applied in ACT-2464, a methodological study that is ongoing. The Distributed Corridor A method (MET-2526) is applied in ACT-2468, an application study that is completed. The Adaptive Series method (MET-2531) is applied in ACT-2472, a dissemination study that is published. This view enables methodological traceability from analytical tool through research execution.

## Method-Role Association

The v_statistical_method_professional_role view connects statistical methods to the professional roles that use them, clarifying the analytical capabilities expected of each position.

**View `v_statistical_method_professional_role`**

```sql
CREATE VIEW v_statistical_method_professional_role AS
SELECT a.statistical_method_id, a.method_i_d, a.method_name, a.method_category, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM statistical_methods a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| statistical_method_id | method_i_d | method_name | method_category | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 100 | Seasonal Programme | Researcher |
| 101 | MET-2521 | Baseline Survey | data_analysis | 101 | Integrated Standard | Collaborator |
| 102 | MET-2526 | Distributed Corridor A | inference | 102 | Extended Framework D | Educator |
| 103 | MET-2531 | Adaptive Series | quantification | 103 | Pilot Protocol | Researcher |

The Pilot Assessment method (MET-2516) is used by the Seasonal Programme role (id 100), a Researcher position. The Baseline Survey method (MET-2521) is used by the Integrated Standard role (id 101), a Collaborator position. The Distributed Corridor A method (MET-2526) is used by the Extended Framework D role (id 102), an Educator position. The Adaptive Series method (MET-2531) is used by the Pilot Protocol role (id 103), a Researcher position. This association ensures that professional roles are equipped with the analytical methods necessary for their research responsibilities.

## Synthesis

The academic research program architecture described here integrates six core entity types—programs, concentrations, competencies, professional roles, research activities, and statistical methods—through a network of associative relationships. Each program anchors a concentration, defines required competencies, prepares participants for specific professional roles, and conducts research activities that apply statistical methods. The cross-reference tables between programs and competencies, and between roles and competencies, ensure that educational outcomes align with career expectations. The views provide multiple perspectives on these relationships, enabling stakeholders to query the system from the standpoint of any entity and trace its connections throughout the architecture. This interconnected structure supports systematic planning, assessment, and reporting across the entire academic research enterprise.

## Data appendix

**Table `programs_competencies`**

| academic_program_id | competency_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `roles_competencies`**

| professional_role_id | competency_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
