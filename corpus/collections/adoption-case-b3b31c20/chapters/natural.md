The adult adoption process operates within a structured framework of legal jurisdictions, petitioners, and adoptees, each tracked through interconnected records that capture the full lifecycle of a case from filing through resolution. Practitioners managing these proceedings rely on a coherent set of data entities to maintain accurate records, coordinate communications, and ensure compliance with jurisdictional requirements. The system organizes adoption cases around four core tables—adoption_cases, adoption_petitioners, adult_adoptees, and contact_informations—supplemented by jurisdictional metadata and a cross-reference table linking contacts to cases.

**Table `adoption_cases`**

| case_id | filing_date | status | jurisdiction | case_notes | petitioner_contact_person | nlf_rep | adoption_petitioner_social_security_number | adult_adoptee_id |
|---|---|---|---|---|---|---|---|---|
| 39800622 | 2023-02-09 | pending | regional-jurisdic-30 | compact-case-98 | Brandon Long | baseline-nlf-85 | SOC-2466 | 1 |
| 4891 | 2024-07-20 | under_review | legacy-jurisdic-31 | composite-case-99 | Stephanie Lawrence | pilot-nlf-86 | SOC-2467 | 2 |
| 17374813 | 2025-12-04 | approved | compact-jurisdic-32 | primary-case-100 | Mary Alvarez | extended-nlf-87 | SOC-2468 | 3 |
| state_uk_9 | 2022-05-15 | denied | composite-jurisdic-33 | adaptive-case-101 | Theodore Mcgrath | integrated-nlf-88 | SOC-2469 | 4 |

Each adoption case carries a unique case identifier, a filing date, and a status reflecting its current position in the legal pipeline. The status field distinguishes between four states: pending, under_review, approved, and denied. Case identifiers follow two naming conventions. Numeric identifiers such as 39800622 and 17374813 appear alongside alphanumeric identifiers like state_uk_9, suggesting the system accommodates cases originating from different intake channels. The case_notes column provides a secondary classification label—compact-case-98, composite-case-99, primary-case-100, and adaptive-case-101—that aligns with the jurisdiction type. The petitioner_contact_person field records the individual handling the case on behalf of the petitioner, while the nlf_rep column tracks the non-lawful-filing representative designation, ranging from baseline-nlf-85 through integrated-nlf-88. The adoption_petitioner_social_security_number and adult_adoptee_id columns serve as the primary foreign keys connecting the case record to the petitioner and adoptee entities respectively.

**Table `adoption_petitioners`**

| full_name | date_of_birth | social_security_number | street_address | city | state | zip_code | phone_number | email_address | date_moved_to_nevada | relationship_to_adoptee | duration_of_acquaintance | adult_adoptee_id | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | PHO-2092 | primary-email-70 | 2023-02-12 | seasonal-relation-65 | compact-duration-44 | 1 | 1000 |
| Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | PHO-2093 | adaptive-email-71 | 2024-07-23 | regional-relation-66 | composite-duration-45 | 2 | 1001 |
| Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | PHO-2094 | distributed-email-72 | 2025-12-07 | legacy-relation-67 | primary-duration-46 | 3 | 1002 |
| Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | PHO-2095 | baseline-email-73 | 2022-05-18 | compact-relation-68 | adaptive-duration-47 | 4 | 1003 |

The adoption_petitioners table stores the personal and contact details of individuals seeking to adopt. Each petitioner record includes a full_name, date_of_birth, social_security_number, and a complete street address broken into street_address, city, state, and zip_code fields. Phone and email contact information is captured separately, along with date_moved_to_nevada, which documents when the petitioner established residency in the relevant jurisdiction. The relationship_to_adoptee and duration_of_acquaintance columns describe the nature and length of the relationship between petitioner and adoptee, using coded values such as seasonal-relation-65 and compact-duration-44. The adult_adoptee_id and jurisdiction_id columns link each petitioner to their corresponding adoptee and governing jurisdiction.

**Table `adult_adoptees`**

| id | full_name | date_of_birth | social_security_number | street_address | city | state | zip_code | phone_number | email_address | date_moved_to_nevada | birth_city_state | preferred_post_adoption_name | birth_mother_name | birth_father_name | adoption_petitioner_social_security_number | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | PHO-2092 | primary-email-70 | 2023-02-12 | integrated-birth-16 | Extended Corridor | Composite Programme | Extended Review | SOC-2466 | 1000 |
| 2 | Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | PHO-2093 | adaptive-email-71 | 2024-07-23 | seasonal-birth-17 | Pilot Series A | Compact Standard A | Pilot Initiative A | SOC-2467 | 1001 |
| 3 | Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | PHO-2094 | distributed-email-72 | 2025-12-07 | regional-birth-18 | Baseline Assessment | Legacy Framework | Baseline Model | SOC-2468 | 1002 |
| 4 | Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | PHO-2095 | baseline-email-73 | 2022-05-18 | legacy-birth-19 | Distributed Survey | Regional Protocol | Distributed Cluster | SOC-2469 | 1003 |

Adult adoptees are recorded in a parallel table that mirrors much of the petitioner's personal data structure. The adult_adoptees table captures the adoptee's full_name, date_of_birth, social_security_number, and residential address, along with phone_number, email_address, and date_moved_to_nevada. Additional fields specific to the adoption context include birth_city_state, preferred_post_adoption_name, birth_mother_name, and birth_father_name. These birth-related fields provide genealogical context that may be relevant for legal documentation and post-adoption correspondence. The adoption_petitioner_social_security_number and jurisdiction_id columns establish the foreign-key relationships to the petitioner and jurisdiction tables.

**Table `contact_informations`**

| contact_information_id | contact_person | street_address | cell_phone | city | state | zip_code | alternate_phone | email |
|---|---|---|---|---|---|---|---|---|
| 1 | Alyssa Chung | composite-street-15 | distributed-cell-72 | integrated-city-34 | distributed-state-84 | 69434 | integrated-alternat-58 | seasonal-email-11 |
| 2 | Brianna Mejia | primary-street-16 | baseline-cell-73 | seasonal-city-35 | baseline-state-85 | 13589 | seasonal-alternat-59 | regional-email-12 |
| 3 | Eric Schultz | adaptive-street-17 | pilot-cell-74 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-alternat-60 | legacy-email-13 |
| 4 | Peter Montgomery | distributed-street-18 | extended-cell-75 | legacy-city-37 | extended-state-87 | 1250214 | legacy-alternat-61 | compact-email-14 |

Contact information is maintained in a dedicated table that separates communication details from the personal records of petitioners and adoptees. Each contact record carries a contact_information_id, a contact_person name, and a full address with street_address, city, state, and zip_code. The cell_phone and alternate_phone fields provide multiple phone numbers, while the email field captures the primary email address. This separation allows a single contact record to be associated with multiple cases, supporting scenarios where a contact person coordinates communications across several adoption proceedings.

**Table `jurisdictions`**

| jurisdiction_id | state_code | state_name | court_system |
|---|---|---|---|
| 1000 | 17788643 | Composite Protocol | primary-court-34 |
| 1001 | 8350031 | Compact Programme A | adaptive-court-35 |
| 1002 | 790483 | Legacy Standard | distributed-court-36 |
| 1003 | 8387549 | Regional Framework | baseline-court-37 |

The jurisdictions table defines the legal authorities under which adoption cases are processed. Each jurisdiction is identified by a jurisdiction_id, a state_code, a state_name, and a court_system designation. The state_name values—Composite Protocol, Compact Programme A, Legacy Standard, and Regional Framework—represent the distinct jurisdictional entities. The court_system column specifies the court responsible for adjudicating cases within each jurisdiction, with values such as primary-court-34 and adaptive-court-35.

**Table `informations_cases`**

| contact_information_id | case_id |
|---|---|
| 1 | 39800622 |
| 1 | 4891 |
| 2 | 4891 |
| 2 | 17374813 |
| 3 | 17374813 |
| 3 | state_uk_9 |
| 4 | state_uk_9 |
| 4 | 39800622 |

The informations_cases table serves as a many-to-many bridge between contact records and adoption cases. Each row links a contact_information_id to a case_id, enabling multiple contacts to be associated with a single case and a single contact to serve multiple cases. For example, contact record 1 (Alyssa Chung) is linked to both case 39800622 and case 4891, while contact record 4 (Peter Montgomery) appears in both case state_uk_9 and case 39800622. This structure supports flexible communication routing where different contacts may be responsible for different phases or aspects of the same adoption proceeding.

The following views synthesize these base tables into joined result sets that answer specific operational questions.

**View `adoption_case_adoption_petitioner_view`**

```sql
CREATE VIEW adoption_case_adoption_petitioner_view AS
SELECT a.case_id, a.filing_date, a.status, a.jurisdiction, b.full_name AS petitioner_full_name, b.date_of_birth AS petitioner_date_of_birth, b.social_security_number AS petitioner_social_security_number
FROM adoption_cases a JOIN adoption_petitioners b ON a.adoption_petitioner_social_security_number = b.social_security_number;
```

| case_id | filing_date | status | jurisdiction | petitioner_full_name | petitioner_date_of_birth | petitioner_social_security_number |
|---|---|---|---|---|---|---|
| 39800622 | 2023-02-09 | pending | regional-jurisdic-30 | Theodore Mcgrath | 2025-04-02 | SOC-2466 |
| 4891 | 2024-07-20 | under_review | legacy-jurisdic-31 | Account Name | 2022-09-13 | SOC-2467 |
| 17374813 | 2025-12-04 | approved | compact-jurisdic-32 | Saipan International Airport | 2023-02-24 | SOC-2468 |
| state_uk_9 | 2022-05-15 | denied | composite-jurisdic-33 | Norma Fisher | 2024-07-08 | SOC-2469 |

This view joins adoption_cases with adoption_petitioners to present each case alongside its petitioner's full profile. The resulting record set answers the question: who is petitioning for each adoption case, and what are their qualifications and contact details? A representative row shows case 39800622, filed on 2023-02-09 with status pending, linked to petitioner Theodore Mcgrath, whose date of birth is 2025-04-02 and whose relationship to the adoptee is coded as seasonal-relation-65. The petitioner's address is composite-street-15 in integrated-city-34, and their email is primary-email-70. This joined view enables case managers to verify petitioner eligibility and reach out for additional documentation without switching between tables.

**View `adoption_case_adult_adoptee_view`**

```sql
CREATE VIEW adoption_case_adult_adoptee_view AS
SELECT a.case_id, a.filing_date, a.status, a.jurisdiction, b.id AS adoptee_id, b.full_name AS adoptee_full_name, b.date_of_birth AS adoptee_date_of_birth
FROM adoption_cases a JOIN adult_adoptees b ON a.adult_adoptee_id = b.id;
```

| case_id | filing_date | status | jurisdiction | adoptee_id | adoptee_full_name | adoptee_date_of_birth |
|---|---|---|---|---|---|---|
| 39800622 | 2023-02-09 | pending | regional-jurisdic-30 | 1 | Theodore Mcgrath | 2025-04-02 |
| 4891 | 2024-07-20 | under_review | legacy-jurisdic-31 | 2 | Account Name | 2022-09-13 |
| 17374813 | 2025-12-04 | approved | compact-jurisdic-32 | 3 | Saipan International Airport | 2023-02-24 |
| state_uk_9 | 2022-05-15 | denied | composite-jurisdic-33 | 4 | Norma Fisher | 2024-07-08 |

By joining adoption_cases with adult_adoptees, this view answers the question: who is the adult adoptee in each case, and what are their personal and birth-related details? A sample row pairs case 4891, filed on 2024-07-20 with status under_review, with adoptee Account Name, whose preferred_post_adoption_name is Pilot Series A and whose birth_city_state is seasonal-birth-17. The adoptee's birth_mother_name is Compact Standard A and birth_father_name is Pilot Initiative A. The case's petitioner_contact_person is Stephanie Lawrence, and the nlf_rep is pilot-nlf-86. This view is particularly useful for preparing birth record amendments and post-adoption name change documentation.

**View `adoption_petitioner_adult_adoptee_view`**

```sql
CREATE VIEW adoption_petitioner_adult_adoptee_view AS
SELECT a.full_name, a.date_of_birth, a.social_security_number, a.street_address, b.id AS adoptee_id, b.full_name AS adoptee_full_name, b.date_of_birth AS adoptee_date_of_birth
FROM adoption_petitioners a JOIN adult_adoptees b ON a.adult_adoptee_id = b.id;
```

| full_name | date_of_birth | social_security_number | street_address | adoptee_id | adoptee_full_name | adoptee_date_of_birth |
|---|---|---|---|---|---|---|
| Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | 1 | Theodore Mcgrath | 2025-04-02 |
| Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | 2 | Account Name | 2022-09-13 |
| Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | 3 | Saipan International Airport | 2023-02-24 |
| Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | 4 | Norma Fisher | 2024-07-08 |

This view directly links adoption_petitioners with adult_adoptees, answering the question: which petitioner is associated with which adoptee, and how do their personal records compare? The joined result reveals that petitioner Theodore Mcgrath (social_security_number SOC-2466) is linked to adoptee Theodore Mcgrath (also SOC-2466), indicating the petitioner and adoptee share the same social security number in this record. The relationship_to_adoptee is seasonal-relation-65, and the duration_of_acquaintance is compact-duration-44. Another row shows petitioner Account Name linked to adoptee Account Name, both with social_security_number SOC-2467, with a regional-relation-66 relationship and composite-duration-45 duration. This view supports verification of the petitioner-adoptee relationship and helps identify any data inconsistencies between the two records.

**View `adoption_petitioner_jurisdiction_view`**

```sql
CREATE VIEW adoption_petitioner_jurisdiction_view AS
SELECT a.full_name, a.date_of_birth, a.social_security_number, a.street_address, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.state_code AS jurisdiction_state_code, b.state_name AS jurisdiction_state_name
FROM adoption_petitioners a JOIN jurisdictions b ON a.jurisdiction_id = b.jurisdiction_id;
```

| full_name | date_of_birth | social_security_number | street_address | jurisdiction_jurisdiction_id | jurisdiction_state_code | jurisdiction_state_name |
|---|---|---|---|---|---|---|
| Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | 1000 | 17788643 | Composite Protocol |
| Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | 1001 | 8350031 | Compact Programme A |
| Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | 1002 | 790483 | Legacy Standard |
| Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | 1003 | 8387549 | Regional Framework |

Joining adoption_petitioners with jurisdictions, this view answers the question: which jurisdiction governs each petitioner's case, and what are the jurisdictional characteristics? A representative row shows petitioner Theodore Mcgrath (jurisdiction_id 1000) falling under the Composite Protocol state, with state_code 17788643 and court_system primary-court-34. Another row links petitioner Norma Fisher (jurisdiction_id 1003) to the Regional Framework state, with state_code 8387549 and court_system baseline-court-37. This view is essential for determining applicable filing requirements, court procedures, and jurisdiction-specific regulations.

**View `adult_adoptee_adoption_petitioner_view`**

```sql
CREATE VIEW adult_adoptee_adoption_petitioner_view AS
SELECT a.id, a.full_name, a.date_of_birth, a.social_security_number, b.full_name AS petitioner_full_name, b.date_of_birth AS petitioner_date_of_birth, b.social_security_number AS petitioner_social_security_number
FROM adult_adoptees a JOIN adoption_petitioners b ON a.adoption_petitioner_social_security_number = b.social_security_number;
```

| id | full_name | date_of_birth | social_security_number | petitioner_full_name | petitioner_date_of_birth | petitioner_social_security_number |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 2025-04-02 | SOC-2466 | Theodore Mcgrath | 2025-04-02 | SOC-2466 |
| 2 | Account Name | 2022-09-13 | SOC-2467 | Account Name | 2022-09-13 | SOC-2467 |
| 3 | Saipan International Airport | 2023-02-24 | SOC-2468 | Saipan International Airport | 2023-02-24 | SOC-2468 |
| 4 | Norma Fisher | 2024-07-08 | SOC-2469 | Norma Fisher | 2024-07-08 | SOC-2469 |

This view mirrors the petitioner-adoptee relationship from the adoptee's perspective, joining adult_adoptees with adoption_petitioners. It answers the question: from the adoptee's side, who is their petitioner, and what are the relationship details? A sample row shows adoptee Theodore Mcgrath (id 1) linked to petitioner Theodore Mcgrath, with the adoptee's preferred_post_adoption_name as Extended Corridor and birth_mother_name as Composite Programme. The petitioner's relationship_to_adoptee is seasonal-relation-65, and the duration_of_acquaintance is compact-duration-44. The jurisdiction_id 1000 appears on both sides, confirming the case falls under the Composite Protocol jurisdiction. This view is useful for adoptee-facing communications and for cross-referencing relationship documentation.

**View `adult_adoptee_jurisdiction_view`**

```sql
CREATE VIEW adult_adoptee_jurisdiction_view AS
SELECT a.id, a.full_name, a.date_of_birth, a.social_security_number, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.state_code AS jurisdiction_state_code, b.state_name AS jurisdiction_state_name
FROM adult_adoptees a JOIN jurisdictions b ON a.jurisdiction_id = b.jurisdiction_id;
```

| id | full_name | date_of_birth | social_security_number | jurisdiction_jurisdiction_id | jurisdiction_state_code | jurisdiction_state_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 2025-04-02 | SOC-2466 | 1000 | 17788643 | Composite Protocol |
| 2 | Account Name | 2022-09-13 | SOC-2467 | 1001 | 8350031 | Compact Programme A |
| 3 | Saipan International Airport | 2023-02-24 | SOC-2468 | 1002 | 790483 | Legacy Standard |
| 4 | Norma Fisher | 2024-07-08 | SOC-2469 | 1003 | 8387549 | Regional Framework |

By joining adult_adoptees with jurisdictions, this view answers the question: which jurisdiction governs each adoptee's case, and what are the jurisdictional details? A representative row shows adoptee Account Name (id 2) with jurisdiction_id 1001, corresponding to the Compact Programme A state with state_code 8350031 and court_system adaptive-court-35. Another row links adoptee Norma Fisher (id 4) to jurisdiction_id 1003, the Regional Framework state with state_code 8387549 and court_system baseline-court-37. This view supports jurisdictional compliance checks and helps ensure that adoptee records are processed under the correct legal authority.

**View `contact_information_adoption_case_detail_view`**

```sql
CREATE VIEW contact_information_adoption_case_detail_view AS
SELECT a.contact_information_id, a.contact_person, a.street_address, b.case_id AS case_case_id, b.filing_date AS case_filing_date, b.status AS case_status
FROM contact_informations a
  JOIN informations_cases j ON j.contact_information_id = a.contact_information_id
  JOIN adoption_cases b ON b.case_id = j.case_id;
```

| contact_information_id | contact_person | street_address | case_case_id | case_filing_date | case_status |
|---|---|---|---|---|---|
| 1 | Alyssa Chung | composite-street-15 | 39800622 | 2023-02-09 | pending |
| 1 | Alyssa Chung | composite-street-15 | 4891 | 2024-07-20 | under_review |
| 2 | Brianna Mejia | primary-street-16 | 4891 | 2024-07-20 | under_review |
| 2 | Brianna Mejia | primary-street-16 | 17374813 | 2025-12-04 | approved |
| 3 | Eric Schultz | adaptive-street-17 | 17374813 | 2025-12-04 | approved |
| 3 | Eric Schultz | adaptive-street-17 | state_uk_9 | 2022-05-15 | denied |
| 4 | Peter Montgomery | distributed-street-18 | state_uk_9 | 2022-05-15 | denied |
| 4 | Peter Montgomery | distributed-street-18 | 39800622 | 2023-02-09 | pending |

This view joins contact_informations with adoption_cases through the informations_cases bridge table, answering the question: which contact persons are associated with each adoption case, and what are their full contact details? A sample row shows contact person Alyssa Chung (contact_information_id 1), located at composite-street-15 in integrated-city-34, with cell_phone distributed-cell-72 and email seasonal-email-11, linked to case 39800622 (status pending, filed 2023-02-09). Another row links contact person Peter Montgomery (contact_information_id 4), at distributed-street-18 in legacy-city-37, with cell_phone extended-cell-75 and email compact-email-14, to case state_uk_9 (status denied, filed 2022-05-15). This view is critical for coordinating communications, sending notices, and managing the contact network surrounding each adoption proceeding.

The adult adoption data model establishes a clear separation between the legal case record, the personal profiles of petitioners and adoptees, the contact network, and the jurisdictional framework. Foreign keys in adoption_cases link to both adoption_petitioners and adult_adoptees, creating a central hub for case management. The informations_cases bridge table provides flexible many-to-many relationships between contacts and cases, allowing practitioners to assign multiple contacts to a single case or reuse contacts across proceedings. The jurisdictional tables ensure that each case is anchored to the correct legal authority, with jurisdiction_id appearing consistently across petitioners, adoptees, and cases. Together, these entities form a coherent operational record that supports the full lifecycle of an adult adoption proceeding, from initial filing through final disposition.