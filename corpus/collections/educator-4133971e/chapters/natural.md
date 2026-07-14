## The Educator Registry

**Table `educators`**

| id | educator_id | first_name | last_name | years_of_experience | specialization | membership_status | chapter_id | program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8387540 | Stephanie Collins | Paul Allen | 7 | legacy-speciali-13 | active | 1000 | 1 |
| 2 | 575219 | Janice Johnston | Heather Beasley | 10 | compact-speciali-14 | inactive | 1001 | 2 |
| 3 | 3001009030060 | Upal Saha | Audrey Taylor | 13 | composite-speciali-15 | probationary | 1002 | 3 |
| 4 | 195358 | Katherine Snyder | Susan Wagner | 16 | primary-speciali-16 | active | 1003 | 4 |

The educator registry serves as the central personnel ledger for a distributed network of teaching organizations. Each record captures a practitioner's identity, tenure, and operational standing. Stephanie Collins (educator ID 8387540) brings seven years of experience and holds active membership, specializing under the legacy-speciali-13 designation. Janice Johnston (575219) has accumulated a decade of experience but currently sits in inactive status, carrying the compact-speciali-14 specialization. Upal Saha (3001009030060) is the most senior practitioner on file at thirteen years, yet remains on probationary standing within the composite-speciali-15 track. Katherine Snyder (195358) rounds out the cohort with sixteen years of experience and active membership under primary-speciali-16. The registry also cross-references each educator to a chapter and a program, anchoring personnel to organizational structures.

## Chapter Organizations

**Table `chapters`**

| id | chapter_id | chapter_name | location | founding_date | current_members | program_id |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | extended-location-99 | 2023-06-24 | 29 | 1 |
| 1001 | 8350033 | Regional Review | integrated-location-100 | 2024-11-08 | 35 | 2 |
| 1002 | 325441 | Seasonal Initiative | seasonal-location-101 | 2025-04-19 | 41 | 3 |
| 1003 | 2839520 | Integrated Model A | regional-location-102 | 2022-09-03 | 47 | 4 |

Chapters function as the geographic or thematic units through which educators operate. The Legacy Cluster D (chapter ID 1000) was founded on June 24, 2023, and currently maintains twenty-nine members at its extended-location-99 site. Regional Review (1001), established more recently on November 8, 2024, has grown to thirty-five members at integrated-location-100. Seasonal Initiative (1002), launched April 19, 2025, reports forty-one members at seasonal-location-101. Integrated Model A (1003) is the oldest chapter, founded September 3, 2022, and commands the largest membership at forty-seven individuals stationed at regional-location-102. Each chapter is linked to a program, creating a structural bridge between local operations and broader organizational initiatives.

## Program Frameworks

**Table `programs`**

| id | program_id | program_title | duration | status | target_audience | chapter_id |
|---|---|---|---|---|---|---|
| 1 | 103176 | Legacy Review D | 4.20 | planned | student teachers | 1000 |
| 2 | 2986219 | Regional Initiative | 8.40 | ongoing | teaching interns | 1001 |
| 3 | 1186079 | Seasonal Model | 12.60 | completed | first year teachers | 1002 |
| 4 | 1562855 | Integrated Cluster A | 16.80 | cancelled | second year teachers | 1003 |

Programs define the structured learning pathways available to educators and their target audiences. The Legacy Review D (program ID 103176) is a planned initiative with a duration of 4.20 units, aimed at student teachers, and is associated with chapter 1000. Regional Initiative (2986219), currently ongoing, spans 8.40 duration units and targets teaching interns within chapter 1001. Seasonal Model (1186079) has already been completed over a 12.60-unit period for first year teachers under chapter 1002. Integrated Cluster A (1562855), running for 16.80 duration units, is designated for second year teachers at chapter 1003 but carries a cancelled status. The varying statuses—planned, ongoing, completed, cancelled—reflect the lifecycle stages of these educational offerings.

## Specialization Taxonomy

**Table `specializations`**

| specialization_id | specialization_name | description |
|---|---|---|
| 1000 | Seasonal Initiative | Extended Survey |
| 1001 | Integrated Model | Pilot Corridor A |
| 1002 | Extended Cluster D | Baseline Series |
| 1003 | Pilot Review | Distributed Assessment |

The specialization taxonomy provides a structured vocabulary for categorizing educator expertise. Seasonal Initiative (specialization ID 1000) is described as an Extended Survey, while Integrated Model (1001) corresponds to Pilot Corridor A. Extended Cluster D (1002) maps to the Baseline Series, and Pilot Review (1003) aligns with Distributed Assessment. These identifiers form the backbone of the specialization codes referenced in the educator registry, where practitioners are tagged with codes such as legacy-speciali-13 or primary-speciali-16, indicating their alignment with one of the four specialization tracks.

## Chapter-Educator Affiliations

**Table `chapters_educators`**

| chapter_id | educator_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The chapter-educator affiliation table establishes which educators are members of which chapters. Educator 1 (Stephanie Collins) holds membership in both chapter 1000 (Legacy Cluster D) and chapter 1003 (Integrated Model A), reflecting a cross-chapter presence. Educator 2 (Janice Johnston) is affiliated with chapters 1000 and 1001, while Educator 3 (Upal Saha) spans chapters 1001 and 1002. Educator 4 (Katherine Snyder) is a member of chapters 1002 and 1003. This pattern reveals a deliberate overlap strategy: each educator participates in two adjacent chapters, creating a chain of connectivity from chapter 1000 through 1003. The affiliations ensure that knowledge and practice flow across organizational boundaries rather than remaining siloed.

## Program-Educator Assignments

**Table `programs_educators`**

| program_id | educator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Program-educator assignments link practitioners to the specific learning initiatives they support or participate in. Educator 1 is assigned to programs 1 (Legacy Review D) and 4 (Integrated Cluster A). Educator 2 participates in programs 1 and 2 (Regional Initiative). Educator 3 is engaged with programs 2 and 3 (Seasonal Model). Educator 4 holds assignments in programs 3 and 4. The assignment pattern mirrors the chapter affiliation structure, with each educator connected to two programs that correspond to their chapter memberships. This dual-assignment model ensures that educators maintain engagement across multiple program lifecycles simultaneously.

## Specialization-Educator Mappings

**Table `specializations_educators`**

| specialization_id | educator_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The specialization-educator mapping table formalizes the relationship between practitioners and their designated specialization tracks. Each educator is associated with one or more specialization identifiers, which correspond to the codes found in the educator registry. The specialization taxonomy provides four distinct categories—Extended Survey, Pilot Corridor A, Baseline Series, and Distributed Assessment—each representing a different pedagogical focus area. The mappings ensure that every educator's specialization code can be traced back to a formalized description, supporting consistent reporting and resource allocation across the network.

## View: Educator-Chapter Relationships

**View `v_educator_chapter`**

```sql
CREATE VIEW v_educator_chapter AS
SELECT a.id, a.educator_id, a.first_name, a.last_name, b.id AS chapter_id, b.chapter_id AS chapter_chapter_id, b.chapter_name AS chapter_chapter_name
FROM educators a JOIN chapters b ON a.chapter_id = b.id;
```

| id | educator_id | first_name | last_name | chapter_id | chapter_chapter_id | chapter_chapter_name |
|---|---|---|---|---|---|---|
| 1 | 8387540 | Stephanie Collins | Paul Allen | 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D |
| 2 | 575219 | Janice Johnston | Heather Beasley | 1001 | 8350033 | Regional Review |
| 3 | 3001009030060 | Upal Saha | Audrey Taylor | 1002 | 325441 | Seasonal Initiative |
| 4 | 195358 | Katherine Snyder | Susan Wagner | 1003 | 2839520 | Integrated Model A |

The educator-chapter view answers the question of which chapters each educator belongs to, joining personnel records with chapter metadata. A row for educator 8387540 (Stephanie Collins) would show her active membership status, seven years of experience, and her affiliation with chapter 1000 (Legacy Cluster D) at extended-location-99. Another row for educator 195358 (Katherine Snyder) would reveal her sixteen years of experience, active status, and membership in chapter 1003 (Integrated Model A) at regional-location-102. This view enables administrators to assess chapter composition by educator seniority and specialization, supporting staffing decisions and resource distribution.

## View: Educator-Program Relationships

**View `v_educator_program`**

```sql
CREATE VIEW v_educator_program AS
SELECT a.id, a.educator_id, a.first_name, a.last_name, b.id AS program_id, b.program_id AS program_program_id, b.program_title AS program_program_title
FROM educators a JOIN programs b ON a.program_id = b.id;
```

| id | educator_id | first_name | last_name | program_id | program_program_id | program_program_title |
|---|---|---|---|---|---|---|
| 1 | 8387540 | Stephanie Collins | Paul Allen | 1 | 103176 | Legacy Review D |
| 2 | 575219 | Janice Johnston | Heather Beasley | 2 | 2986219 | Regional Initiative |
| 3 | 3001009030060 | Upal Saha | Audrey Taylor | 3 | 1186079 | Seasonal Model |
| 4 | 195358 | Katherine Snyder | Susan Wagner | 4 | 1562855 | Integrated Cluster A |

The educator-program view reveals which programs each educator is assigned to, combining personnel data with program details. For educator 575219 (Janice Johnston), the view would display her inactive status, ten years of experience, compact-speciali-14 specialization, and her assignments to program 1 (Legacy Review D, planned status, 4.20 duration) and program 2 (Regional Initiative, ongoing status, 8.40 duration). Educator 3001009030060 (Upal Saha) would appear with probationary status, thirteen years of experience, and assignments to program 2 (Regional Initiative) and program 3 (Seasonal Model, completed status, 12.60 duration). This view is essential for tracking program participation rates and identifying educators who may need reassignment based on their current standing.

## View: Chapter-Program Alignment

**View `v_chapter_program`**

```sql
CREATE VIEW v_chapter_program AS
SELECT a.id, a.chapter_id, a.chapter_name, a.location, b.id AS program_id, b.program_id AS program_program_id, b.program_title AS program_program_title
FROM chapters a JOIN programs b ON a.program_id = b.id;
```

| id | chapter_id | chapter_name | location | program_id | program_program_id | program_program_title |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | extended-location-99 | 1 | 103176 | Legacy Review D |
| 1001 | 8350033 | Regional Review | integrated-location-100 | 2 | 2986219 | Regional Initiative |
| 1002 | 325441 | Seasonal Initiative | seasonal-location-101 | 3 | 1186079 | Seasonal Model |
| 1003 | 2839520 | Integrated Model A | regional-location-102 | 4 | 1562855 | Integrated Cluster A |

The chapter-program view clarifies the structural pairing between chapters and their associated programs. Chapter 1000 (Legacy Cluster D, founded 2023-06-24, 29 members) is aligned with program 103176 (Legacy Review D, planned status, targeting student teachers, 4.20 duration). Chapter 1001 (Regional Review, founded 2024-11-08, 35 members) pairs with program 2986219 (Regional Initiative, ongoing, teaching interns, 8.40 duration). Chapter 1002 (Seasonal Initiative, founded 2025-04-19, 41 members) connects to program 1186079 (Seasonal Model, completed, first year teachers, 12.60 duration). Chapter 1003 (Integrated Model A, founded 2022-09-03, 47 members) is linked to program 1562855 (Integrated Cluster A, cancelled, second year teachers, 16.80 duration). This view supports strategic planning by showing whether chapter membership sizes are proportionate to their program scope and whether program statuses align with chapter maturity.

## View: Chapter-Educator Detail

**View `v_chapter_educator_detail`**

```sql
CREATE VIEW v_chapter_educator_detail AS
SELECT a.id, a.chapter_id, a.chapter_name, b.id AS educator_id, b.educator_id AS educator_educator_id, b.first_name AS educator_first_name
FROM chapters a
  JOIN chapters_educators j ON j.chapter_id = a.id
  JOIN educators b ON b.id = j.educator_id;
```

| id | chapter_id | chapter_name | educator_id | educator_educator_id | educator_first_name |
|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | 1 | 8387540 | Stephanie Collins |
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | 2 | 575219 | Janice Johnston |
| 1001 | 8350033 | Regional Review | 2 | 575219 | Janice Johnston |
| 1001 | 8350033 | Regional Review | 3 | 3001009030060 | Upal Saha |
| 1002 | 325441 | Seasonal Initiative | 3 | 3001009030060 | Upal Saha |
| 1002 | 325441 | Seasonal Initiative | 4 | 195358 | Katherine Snyder |
| 1003 | 2839520 | Integrated Model A | 4 | 195358 | Katherine Snyder |
| 1003 | 2839520 | Integrated Model A | 1 | 8387540 | Stephanie Collins |

The chapter-educator detail view provides a granular look at the personnel within each chapter, joining chapter information with educator records. A row for chapter 1000 (Legacy Cluster D) would show educator 8387540 (Stephanie Collins, active, 7 years experience, legacy-speciali-13) and educator 575219 (Janice Johnston, inactive, 10 years experience, compact-speciali-14). Chapter 1003 (Integrated Model A) would display educator 195358 (Katherine Snyder, active, 16 years experience, primary-speciali-16) alongside educator 8387540 (Stephanie Collins). This view is particularly useful for identifying chapters with inactive or probationary members, enabling targeted outreach and re-engagement efforts. The detail also reveals cross-chapter educators who appear in multiple rows, highlighting individuals who serve as bridges between organizational units.

## View: Program-Chapter Relationships

**View `v_program_chapter`**

```sql
CREATE VIEW v_program_chapter AS
SELECT a.id, a.program_id, a.program_title, a.duration, b.id AS chapter_id, b.chapter_id AS chapter_chapter_id, b.chapter_name AS chapter_chapter_name
FROM programs a JOIN chapters b ON a.chapter_id = b.id;
```

| id | program_id | program_title | duration | chapter_id | chapter_chapter_id | chapter_chapter_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Legacy Review D | 4.20 | 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D |
| 2 | 2986219 | Regional Initiative | 8.40 | 1001 | 8350033 | Regional Review |
| 3 | 1186079 | Seasonal Model | 12.60 | 1002 | 325441 | Seasonal Initiative |
| 4 | 1562855 | Integrated Cluster A | 16.80 | 1003 | 2839520 | Integrated Model A |

The program-chapter view presents the reverse perspective of the chapter-program alignment, organizing by program and listing its associated chapter. Program 103176 (Legacy Review D, planned, 4.20 duration, student teachers) is linked to chapter 1000 (Legacy Cluster D, 29 members, extended-location-99). Program 2986219 (Regional Initiative, ongoing, 8.40 duration, teaching interns) connects to chapter 1001 (Regional Review, 35 members, integrated-location-100). Program 1186079 (Seasonal Model, completed, 12.60 duration, first year teachers) maps to chapter 1002 (Seasonal Initiative, 41 members, seasonal-location-101). Program 1562855 (Integrated Cluster A, cancelled, 16.80 duration, second year teachers) is associated with chapter 1003 (Integrated Model A, 47 members, regional-location-102). This view supports program managers in understanding the reach of their initiatives and comparing chapter sizes across programs.

## View: Program-Educator Detail

**View `v_program_educator_detail`**

```sql
CREATE VIEW v_program_educator_detail AS
SELECT a.id, a.program_id, a.program_title, b.id AS educator_id, b.educator_id AS educator_educator_id, b.first_name AS educator_first_name
FROM programs a
  JOIN programs_educators j ON j.program_id = a.id
  JOIN educators b ON b.id = j.educator_id;
```

| id | program_id | program_title | educator_id | educator_educator_id | educator_first_name |
|---|---|---|---|---|---|
| 1 | 103176 | Legacy Review D | 1 | 8387540 | Stephanie Collins |
| 1 | 103176 | Legacy Review D | 2 | 575219 | Janice Johnston |
| 2 | 2986219 | Regional Initiative | 2 | 575219 | Janice Johnston |
| 2 | 2986219 | Regional Initiative | 3 | 3001009030060 | Upal Saha |
| 3 | 1186079 | Seasonal Model | 3 | 3001009030060 | Upal Saha |
| 3 | 1186079 | Seasonal Model | 4 | 195358 | Katherine Snyder |
| 4 | 1562855 | Integrated Cluster A | 4 | 195358 | Katherine Snyder |
| 4 | 1562855 | Integrated Cluster A | 1 | 8387540 | Stephanie Collins |

The program-educator detail view combines program information with the educators assigned to it, answering which practitioners are engaged in each initiative. For program 103176 (Legacy Review D, planned, student teachers), the view would list educator 8387540 (Stephanie Collins, active, 7 years, legacy-speciali-13) and educator 575219 (Janice Johnston, inactive, 10 years, compact-speciali-14). Program 2986219 (Regional Initiative, ongoing, teaching interns) would show educator 575219 (Janice Johnston) and educator 3001009030060 (Upal Saha, probationary, 13 years, composite-speciali-15). Program 1186079 (Seasonal Model, completed, first year teachers) includes educator 3001009030060 (Upal Saha) and educator 195358 (Katherine Snyder, active, 16 years, primary-speciali-16). Program 1562855 (Integrated Cluster A, cancelled, second year teachers) lists educator 195358 (Katherine Snyder) and educator 8387540 (Stephanie Collins). This view is critical for evaluating whether program assignments match educator experience levels and specialization areas.

## View: Specialization-Educator Detail

**View `v_specialization_educator_detail`**

```sql
CREATE VIEW v_specialization_educator_detail AS
SELECT a.specialization_id, a.specialization_name, a.description, b.id AS educator_id, b.educator_id AS educator_educator_id, b.first_name AS educator_first_name
FROM specializations a
  JOIN specializations_educators j ON j.specialization_id = a.specialization_id
  JOIN educators b ON b.id = j.educator_id;
```

| specialization_id | specialization_name | description | educator_id | educator_educator_id | educator_first_name |
|---|---|---|---|---|---|
| 1000 | Seasonal Initiative | Extended Survey | 1 | 8387540 | Stephanie Collins |
| 1000 | Seasonal Initiative | Extended Survey | 2 | 575219 | Janice Johnston |
| 1001 | Integrated Model | Pilot Corridor A | 2 | 575219 | Janice Johnston |
| 1001 | Integrated Model | Pilot Corridor A | 3 | 3001009030060 | Upal Saha |
| 1002 | Extended Cluster D | Baseline Series | 3 | 3001009030060 | Upal Saha |
| 1002 | Extended Cluster D | Baseline Series | 4 | 195358 | Katherine Snyder |
| 1003 | Pilot Review | Distributed Assessment | 4 | 195358 | Katherine Snyder |
| 1003 | Pilot Review | Distributed Assessment | 1 | 8387540 | Stephanie Collins |

The specialization-educator detail view ties educators to their specialization categories, providing a comprehensive picture of expertise distribution across the network. Educator 8387540 (Stephanie Collins, active, 7 years experience) would be linked to specialization 1000 (Seasonal Initiative, Extended Survey) or the specialization code legacy-speciali-13. Educator 575219 (Janice Johnston, inactive, 10 years) would map to specialization 1001 (Integrated Model, Pilot Corridor A) or compact-speciali-14. Educator 3001009030060 (Upal Saha, probationary, 13 years) corresponds to specialization 1002 (Extended Cluster D, Baseline Series) or composite-speciali-15. Educator 195358 (Katherine Snyder, active, 16 years) aligns with specialization 1003 (Pilot Review, Distributed Assessment) or primary-speciali-16. This view enables administrators to audit specialization coverage, identify gaps in expertise, and ensure that each specialization track has adequate practitioner representation.

## Synthesis

The educator ecosystem described by these records forms a tightly interwoven network of personnel, chapters, programs, and specializations. Each educator participates in two chapters and two programs, creating overlapping circles of responsibility that prevent isolation and encourage knowledge transfer. The specialization taxonomy provides a standardized vocabulary for categorizing expertise, while the varying membership statuses—active, inactive, probationary—reflect the dynamic nature of practitioner engagement. Chapter sizes range from twenty-nine to forty-seven members, and program durations span from 4.20 to 16.80 units, indicating a diverse portfolio of initiatives tailored to different audience segments. The views derived from these tables serve as analytical lenses, each answering a distinct operational question about the relationships between people, organizations, and learning pathways. Together, they form the informational backbone of a distributed educational network that values cross-pollination, structured specialization, and continuous program evaluation.