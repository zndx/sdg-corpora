## The Architecture of Global Environmental Governance

International environmental governance operates as a layered system of commitments, institutions, and instruments through which states coordinate responses to transboundary ecological challenges. At the operational level, this system is recorded as a network of conferences that produce declarations and action plans, institutions that administer agreements, and policy instruments that states deploy to meet their obligations. Each element carries measurable attributes—dates of adoption, scopes of jurisdiction, sectors of application—that allow practitioners to trace how a commitment made at a conference in one year becomes a binding instrument in a specific national economy years later. The records below capture this chain of authority and implementation.

**Table `international_environmental_conferences`**

| id | conference_id | start_date | end_date | host_city | host_country | declaration_title | action_plan_title | total_recommendations | has_n_g_o_forum | environmental_declaration_id | action_plan_id | international_environmental_institution_id | international_environmental_conference_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-host-83 | composite-host-21 | Composite Review | Regional Cluster | 8 | true | 1000 | 1 | 1 | 1000 |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-host-84 | primary-host-22 | Compact Initiative A | Seasonal Review D | 43 | false | 1001 | 2 | 2 | 1001 |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-host-85 | adaptive-host-23 | Legacy Model | Integrated Initiative | 1 | true | 1002 | 3 | 3 | 1002 |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-host-86 | distributed-host-24 | Regional Cluster | Extended Model | 55 | false | 1003 | 4 | 4 | 1003 |

International environmental conferences serve as the primary convening mechanism. Each conference is identified by a unique conference identifier and anchored to a specific host city and country. The 2022 conference held in seasonal-host-83 (host country: composite-host-21) produced eight recommendations and featured an NGO forum, while the 2025 gathering in compact-host-86 (distributed-host-24) generated fifty-five recommendations without an NGO component. The total recommendations field quantifies the output intensity of each gathering, ranging from a single recommendation at the 2024 legacy-host-85 conference to fifty-five at the 2025 compact-host-86 event. The boolean has_n_g_o_forum flag distinguishes conferences that opened formal civil society participation from those that did not.

**Table `environmental_declarations`**

| id | declaration_id | title | adoption_date | total_principles | issuing_conference | international_environmental_conference_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | 10966231 | Compact Initiative | 2025-08-12T07:09:00 | 9 | composite-issuing-45 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 1996917 | Legacy Model | 2022-01-23T14:26:00 | 1 | primary-issuing-46 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 557 | Regional Cluster A | 2023-06-07T21:43:00 | 8 | adaptive-issuing-47 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | default_chart_a_tax_code_26 | Seasonal Review | 2024-11-18T04:00:00 | 4 | distributed-issuing-48 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Declarations are the formal policy statements issued at or in connection with conferences. The Compact Initiative declaration (id 1000), adopted on 2025-08-12, contains nine principles and was issued by composite-issuing-45 in connection with conference 1000. By contrast, the Legacy Model declaration (id 1001), adopted on 2022-01-23, contains only a single principle and traces back to primary-issuing-46 and conference 1001. The total_principles field provides a direct measure of a declaration's substantive scope. Each declaration carries creation and update timestamps that record its legislative lifecycle.

**Table `action_plans`**

| id | plan_id | title | total_recommendations | adoption_date | international_environmental_conference_id |
|---|---|---|---|---|---|
| 1 | 505977 | Compact Initiative | 8 | 2025-08-12T07:09:00 | 1000 |
| 2 | 727038 | Legacy Model | 43 | 2022-01-23T14:26:00 | 1001 |
| 3 | 937726 | Regional Cluster A | 1 | 2023-06-07T21:43:00 | 1002 |
| 4 | 1290 | Seasonal Review | 55 | 2024-11-18T04:00:00 | 1003 |

Action plans translate the principles of declarations into operational recommendations. The Compact Initiative action plan (plan_id 505977) contains eight recommendations and was adopted on 2025-08-12, aligning with the Compact Initiative declaration. The Seasonal Review action plan (plan_id 1290) contains fifty-five recommendations—the largest in the dataset—and was adopted on 2024-11-18. Each action plan is linked to a specific conference through the international_environmental_conference_id field, establishing the provenance of its recommendations.

**Table `international_environmental_institutions`**

| id | institution_id | name | headquarters_city | headquarters_country | establishment_date | status | international_environmental_conference_id | multilateral_environmental_agreement_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-headquar-83 | regional-headquar-42 | 2024-07-11T06:18:00 | active | 1000 | 1000 |
| 2 | 8189481 | Pilot Initiative A | regional-headquar-84 | legacy-headquar-43 | 2025-12-22T13:35:00 | defunct | 1001 | 1001 |
| 3 | 1437604 | Baseline Model | legacy-headquar-85 | compact-headquar-44 | 2022-05-06T20:52:00 | merged | 1002 | 1002 |
| 4 | 884346 | Distributed Cluster | compact-headquar-86 | composite-headquar-45 | 2023-10-17T03:09:00 | active | 1003 | 1003 |

International environmental institutions are the administrative bodies that oversee the implementation of agreements and coordinate conference activities. The Extended Review institution (institution_id 9424913), headquartered in seasonal-headquar-83 (regional-headquar-42), was established on 2024-07-11 and holds active status. The Pilot Initiative A institution (institution_id 8189481), headquartered in regional-headquar-84 (legacy-headquar-43), was established on 2025-12-22 but carries defunct status, indicating it has been dissolved or absorbed. The Baseline Model institution (institution_id 1437604) carries merged status, suggesting it was consolidated into another body. Status values—active, defunct, and merged—provide a snapshot of institutional vitality across the governance architecture.

**Table `multilateral_environmental_agreements`**

| multilateral_environmental_agreement_id | agreement_id | title | entry_into_force_date | status | scope | environmental_declaration_id | international_environmental_institution_id |
|---|---|---|---|---|---|---|---|
| 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative | 2022-05-16T04:00:00 | ratified | transboundary | 1000 | 1 |
| 1001 | 4716391 | Legacy Model | 2023-10-27T11:17:00 | pending | global | 1001 | 2 |
| 1002 | 3001009030180 | Regional Cluster A | 2024-03-11T18:34:00 | withdrawn | regional | 1002 | 3 |
| 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review | 2025-08-22T01:51:00 | ratified | transboundary | 1003 | 4 |

Multilateral environmental agreements represent the binding commitments that states enter into, often emerging from conference deliberations and declarations. The Compact Initiative agreement (agreement_id 348c2b52-8fcc-11eb-924d-9cd76263cbd0) entered into force on 2022-05-16, carries ratified status, and operates at a transboundary scope. The Legacy Model agreement (agreement_id 4716391) entered into force on 2023-10-27 but remains pending ratification and operates at a global scope. The Regional Cluster A agreement (agreement_id 3001009030180) entered into force on 2024-03-11 but has been withdrawn. Scope values—transboundary, global, and regional—define the geographic reach of each agreement's obligations.

**Table `environmental_policy_instruments`**

| instrument_id | name | type | implementation_date | target_sector | multilateral_environmental_agreement_id | state_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 6926365 | Extended Review | regulation | 2024-11-14T10:06:00 | industrial | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| account_pymes_691 | Pilot Initiative A | market_incentive | 2025-04-25T17:23:00 | agricultural | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 726063 | Baseline Model | institutional_pressure | 2022-09-09T00:40:00 | energy | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 23256422 | Distributed Cluster | financial_assistance | 2023-02-20T07:57:00 | waste | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Environmental policy instruments are the concrete mechanisms through which states implement their multilateral obligations. The Extended Review instrument (instrument_id 6926365) is a regulation targeting the industrial sector, implemented on 2024-11-14, and linked to multilateral environmental agreement 1000 and state 1. The Pilot Initiative A instrument (instrument_id account_pymes_691) is a market_incentive targeting the agricultural sector, implemented on 2025-04-25, and linked to agreement 1001 and state 2. Instrument types—regulation, market_incentive, institutional_pressure, and financial_assistance—represent the spectrum of policy tools available to states.

**Table `states`**

| id | state_code | name | development_status | primary_environmental_concern | instrument_id | multilateral_environmental_agreement_id | financial_assistance_id |
|---|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | industrial_pollution | 6926365 | 1000 | 100 |
| 2 | 8350031 | Pilot Initiative A | developing | natural_resource_usage | account_pymes_691 | 1001 | 101 |
| 3 | 790483 | Baseline Model | industrialized | economic_development | 726063 | 1002 | 102 |
| 4 | 8387549 | Distributed Cluster | developing | industrial_pollution | 23256422 | 1003 | 103 |

States are the sovereign entities that ratify agreements, deploy policy instruments, and receive financial assistance. Each state record carries a unique state identifier and a name that identifies the jurisdiction.

**Table `financial_assistances`**

| financial_assistance_id | assistance_id | amount | currency | disbursement_date | purpose | state_id | received_by_state_id | instrument_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 | seasonal-currency-71 | 2024-03-25T14:30:00 | pollution_control | 1 | 1 | 6926365 |
| 101 | Deskripsi | 25.47 | regional-currency-72 | 2025-08-09T21:47:00 | sustainable_development | 2 | 2 | account_pymes_691 |
| 102 | 332 | 19.72 | legacy-currency-73 | 2022-01-20T04:04:00 | capacity_building | 3 | 3 | 726063 |
| 103 | 325447 | 12.74 | compact-currency-74 | 2023-06-04T11:21:00 | pollution_control | 4 | 4 | 23256422 |

Financial assistances represent the funding mechanisms through which resources are allocated to support environmental policy implementation. Each financial assistance record links to a specific state and policy instrument, documenting the flow of resources from international funding mechanisms to national implementation programs.

### Conference-Declaration Relationships

**View `international_environmental_conference_environmental_declaration_view`**

```sql
CREATE VIEW international_environmental_conference_environmental_declaration_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.title AS declaration_title
FROM international_environmental_conferences a JOIN environmental_declarations b ON a.environmental_declaration_id = b.id;
```

| id | conference_id | start_date | end_date | declaration_id | declaration_declaration_id | declaration_title |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 10966231 | Compact Initiative |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 1996917 | Legacy Model |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 557 | Regional Cluster A |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | default_chart_a_tax_code_26 | Seasonal Review |

This view joins conference records with their associated declarations, answering the question of which declarations emerged from which conferences. Row 1000 demonstrates this linkage: conference 10966213 (seasonal-host-83, composite-host-21) produced the Compact Initiative declaration, which contains nine principles. Row 1001 shows conference 505978 (regional-host-84, primary-host-22) producing the Legacy Model declaration with a single principle. The join confirms that each conference in the dataset is associated with exactly one declaration, establishing a one-to-one correspondence between convening events and their formal policy statements.

### Conference-Action Plan Relationships

**View `international_environmental_conference_action_plan_view`**

```sql
CREATE VIEW international_environmental_conference_action_plan_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS plan_id, b.plan_id AS plan_plan_id, b.title AS plan_title
FROM international_environmental_conferences a JOIN action_plans b ON a.action_plan_id = b.id;
```

| id | conference_id | start_date | end_date | plan_id | plan_plan_id | plan_title |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 505977 | Compact Initiative |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 727038 | Legacy Model |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 937726 | Regional Cluster A |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 1290 | Seasonal Review |

This view connects conferences to their action plans, revealing the operational output of each gathering. Row 1000 links conference 10966213 to the Compact Initiative action plan (plan_id 505977) with eight recommendations. Row 1003 links conference 4793480 (compact-host-86) to the Seasonal Review action plan (plan_id 1290) with fifty-five recommendations. The total_recommendations field in the action plan provides a quantitative measure of each conference's operational output, with values ranging from one to fifty-five across the dataset.

### Conference-Institution Relationships

**View `international_environmental_conference_international_environmental_institution_view`**

```sql
CREATE VIEW international_environmental_conference_international_environmental_institution_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM international_environmental_conferences a JOIN international_environmental_institutions b ON a.international_environmental_institution_id = b.id;
```

| id | conference_id | start_date | end_date | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 9424913 | Extended Review |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 8189481 | Pilot Initiative A |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 1437604 | Baseline Model |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 884346 | Distributed Cluster |

This view maps which institutions are associated with which conferences, answering the question of administrative oversight. Row 1000 shows conference 10966213 associated with the Extended Review institution (institution_id 9424913), headquartered in seasonal-headquar-83. Row 1001 links conference 505978 to the Pilot Initiative A institution (institution_id 8189481), which carries defunct status. The presence of institution_id in the conference record indicates that each conference operates under the administrative umbrella of a specific institution.

### Conference Self-Reference

**View `international_environmental_conference_international_environmental_conference_view`**

```sql
CREATE VIEW international_environmental_conference_international_environmental_conference_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM international_environmental_conferences a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | conference_id | start_date | end_date | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view presents the conference record enriched with its own metadata, providing a consolidated reference for each convening event. Row 1000 shows conference 10966213 held in seasonal-host-83 (composite-host-21) from 2022-09-01 to 2022-09-05, producing eight recommendations with an NGO forum, associated with declaration 1000, action plan 1, and institution 1. This consolidated view serves as the primary lookup for conference-level information.

### Declaration-Conference Relationships

**View `environmental_declaration_international_environmental_conference_view`**

```sql
CREATE VIEW environmental_declaration_international_environmental_conference_view AS
SELECT a.id, a.declaration_id, a.title, a.adoption_date, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM environmental_declarations a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | declaration_id | title | adoption_date | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1000 | 10966231 | Compact Initiative | 2025-08-12T07:09:00 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 1001 | 1996917 | Legacy Model | 2022-01-23T14:26:00 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 1002 | 557 | Regional Cluster A | 2023-06-07T21:43:00 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 1003 | default_chart_a_tax_code_26 | Seasonal Review | 2024-11-18T04:00:00 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view reverses the perspective, starting from declarations and tracing back to their originating conferences. Row 1000 shows the Compact Initiative declaration (9 principles, adopted 2025-08-12) originating from conference 10966213 in seasonal-host-83. Row 1002 shows the Regional Cluster A declaration (8 principles, adopted 2023-06-07) originating from conference 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 in legacy-host-85. This perspective is useful for practitioners who begin with a declaration and need to identify the convening event that produced it.

### Action Plan-Conference Relationships

**View `action_plan_international_environmental_conference_view`**

```sql
CREATE VIEW action_plan_international_environmental_conference_view AS
SELECT a.id, a.plan_id, a.title, a.total_recommendations, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM action_plans a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | plan_id | title | total_recommendations | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1 | 505977 | Compact Initiative | 8 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 2 | 727038 | Legacy Model | 43 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 3 | 937726 | Regional Cluster A | 1 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 4 | 1290 | Seasonal Review | 55 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view traces action plans back to their originating conferences. Row 1 shows the Compact Initiative action plan (8 recommendations, adopted 2025-08-12) originating from conference 10966213. Row 4 shows the Seasonal Review action plan (55 recommendations, adopted 2024-11-18) originating from conference 4793480. The adoption_date in the action plan often aligns with the conference dates, confirming that action plans are produced as direct outputs of the convening event.

### Institution-Conference Relationships

**View `international_environmental_institution_international_environmental_conference_view`**

```sql
CREATE VIEW international_environmental_institution_international_environmental_conference_view AS
SELECT a.id, a.institution_id, a.name, a.headquarters_city, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM international_environmental_institutions a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | institution_id | name | headquarters_city | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-headquar-83 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 2 | 8189481 | Pilot Initiative A | regional-headquar-84 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 3 | 1437604 | Baseline Model | legacy-headquar-85 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 4 | 884346 | Distributed Cluster | compact-headquar-86 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view links institutions to the conferences they administer. Row 1 shows the Extended Review institution (established 2024-07-11, active status) administering conference 10966213. Row 2 shows the Pilot Initiative A institution (established 2025-12-22, defunct status) administering conference 505978. The establishment_date of the institution relative to the conference date provides context for whether the institution was pre-existing or created in connection with the conference.

### Institution-Agreement Relationships

**View `international_environmental_institution_multilateral_environmental_agreement_view`**

```sql
CREATE VIEW international_environmental_institution_multilateral_environmental_agreement_view AS
SELECT a.id, a.institution_id, a.name, a.headquarters_city, b.multilateral_environmental_agreement_id AS agreement_multilateral_environmental_agreement_id, b.agreement_id AS agreement_agreement_id, b.title AS agreement_title
FROM international_environmental_institutions a JOIN multilateral_environmental_agreements b ON a.multilateral_environmental_agreement_id = b.multilateral_environmental_agreement_id;
```

| id | institution_id | name | headquarters_city | agreement_multilateral_environmental_agreement_id | agreement_agreement_id | agreement_title |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-headquar-83 | 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative |
| 2 | 8189481 | Pilot Initiative A | regional-headquar-84 | 1001 | 4716391 | Legacy Model |
| 3 | 1437604 | Baseline Model | legacy-headquar-85 | 1002 | 3001009030180 | Regional Cluster A |
| 4 | 884346 | Distributed Cluster | compact-headquar-86 | 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view reveals which institutions oversee which multilateral agreements. Row 1 shows the Extended Review institution overseeing the Compact Initiative agreement (agreement_id 348c2b52-8fcc-11eb-924d-9cd76263cbd0), which entered into force on 2022-05-16 with transboundary scope. Row 4 shows the Distributed Cluster institution overseeing the Seasonal Review agreement (agreement_id d9d925ce-8fcc-11eb-924d-9cd76263cbd0), which entered into force on 2025-08-22 with transboundary scope. This linkage establishes the administrative chain from institution to agreement to implementation.

### Agreement-Declaration Relationships

**View `multilateral_environmental_agreement_environmental_declaration_view`**

```sql
CREATE VIEW multilateral_environmental_agreement_environmental_declaration_view AS
SELECT a.multilateral_environmental_agreement_id, a.agreement_id, a.title, a.entry_into_force_date, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.title AS declaration_title
FROM multilateral_environmental_agreements a JOIN environmental_declarations b ON a.environmental_declaration_id = b.id;
```

| multilateral_environmental_agreement_id | agreement_id | title | entry_into_force_date | declaration_id | declaration_declaration_id | declaration_title |
|---|---|---|---|---|---|---|
| 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative | 2022-05-16T04:00:00 | 1000 | 10966231 | Compact Initiative |
| 1001 | 4716391 | Legacy Model | 2023-10-27T11:17:00 | 1001 | 1996917 | Legacy Model |
| 1002 | 3001009030180 | Regional Cluster A | 2024-03-11T18:34:00 | 1002 | 557 | Regional Cluster A |
| 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review | 2025-08-22T01:51:00 | 1003 | default_chart_a_tax_code_26 | Seasonal Review |

This view connects multilateral agreements to the declarations from which they derive. Row 1000 shows the Compact Initiative agreement (ratified, transboundary) deriving from the Compact Initiative declaration (9 principles). Row 1003 shows the Seasonal Review agreement (ratified, transboundary) deriving from the Seasonal Review declaration (4 principles). The agreement_id in the declaration record and the environmental_declaration_id in the agreement record establish the lineage from policy statement to binding commitment.

### Agreement-Institution Relationships

**View `multilateral_environmental_agreement_international_environmental_institution_view`**

```sql
CREATE VIEW multilateral_environmental_agreement_international_environmental_institution_view AS
SELECT a.multilateral_environmental_agreement_id, a.agreement_id, a.title, a.entry_into_force_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM multilateral_environmental_agreements a JOIN international_environmental_institutions b ON a.international_environmental_institution_id = b.id;
```

| multilateral_environmental_agreement_id | agreement_id | title | entry_into_force_date | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative | 2022-05-16T04:00:00 | 1 | 9424913 | Extended Review |
| 1001 | 4716391 | Legacy Model | 2023-10-27T11:17:00 | 2 | 8189481 | Pilot Initiative A |
| 1002 | 3001009030180 | Regional Cluster A | 2024-03-11T18:34:00 | 3 | 1437604 | Baseline Model |
| 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review | 2025-08-22T01:51:00 | 4 | 884346 | Distributed Cluster |

This view shows which institutions administer which agreements. Row 1000 shows the Compact Initiative agreement administered by institution 9424913 (Extended Review). Row 1001 shows the Legacy Model agreement administered by institution 8189481 (Pilot Initiative A, defunct). The multilateral_environmental_agreement_id in the institution record and the international_environmental_institution_id in the agreement record create a bidirectional reference that allows practitioners to trace administrative responsibility from either direction.

### Instrument-Agreement Relationships

**View `environmental_policy_instrument_multilateral_environmental_agreement_view`**

```sql
CREATE VIEW environmental_policy_instrument_multilateral_environmental_agreement_view AS
SELECT a.instrument_id, a.name, a.type, a.implementation_date, b.multilateral_environmental_agreement_id AS agreement_multilateral_environmental_agreement_id, b.agreement_id AS agreement_agreement_id, b.title AS agreement_title
FROM environmental_policy_instruments a JOIN multilateral_environmental_agreements b ON a.multilateral_environmental_agreement_id = b.multilateral_environmental_agreement_id;
```

| instrument_id | name | type | implementation_date | agreement_multilateral_environmental_agreement_id | agreement_agreement_id | agreement_title |
|---|---|---|---|---|---|---|
| 6926365 | Extended Review | regulation | 2024-11-14T10:06:00 | 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative |
| account_pymes_691 | Pilot Initiative A | market_incentive | 2025-04-25T17:23:00 | 1001 | 4716391 | Legacy Model |
| 726063 | Baseline Model | institutional_pressure | 2022-09-09T00:40:00 | 1002 | 3001009030180 | Regional Cluster A |
| 23256422 | Distributed Cluster | financial_assistance | 2023-02-20T07:57:00 | 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view links policy instruments to the multilateral agreements they implement. Row 1 shows the Extended Review instrument (regulation, industrial sector) implementing agreement 1000 (Compact Initiative). Row 2 shows the Pilot Initiative A instrument (market_incentive, agricultural sector) implementing agreement 1001 (Legacy Model). The multilateral_environmental_agreement_id in the instrument record establishes the legal basis for each policy instrument.

### Instrument-State Relationships

**View `environmental_policy_instrument_state_view`**

```sql
CREATE VIEW environmental_policy_instrument_state_view AS
SELECT a.instrument_id, a.name, a.type, a.implementation_date, b.id AS state_id, b.state_code AS state_state_code, b.name AS state_name
FROM environmental_policy_instruments a JOIN states b ON a.state_id = b.id;
```

| instrument_id | name | type | implementation_date | state_id | state_state_code | state_name |
|---|---|---|---|---|---|---|
| 6926365 | Extended Review | regulation | 2024-11-14T10:06:00 | 1 | 17788643 | Extended Review |
| account_pymes_691 | Pilot Initiative A | market_incentive | 2025-04-25T17:23:00 | 2 | 8350031 | Pilot Initiative A |
| 726063 | Baseline Model | institutional_pressure | 2022-09-09T00:40:00 | 3 | 790483 | Baseline Model |
| 23256422 | Distributed Cluster | financial_assistance | 2023-02-20T07:57:00 | 4 | 8387549 | Distributed Cluster |

This view connects policy instruments to the states that deploy them. Row 1 shows the Extended Review instrument deployed by state 1. Row 2 shows the Pilot Initiative A instrument deployed by state 2. The state_id in the instrument record identifies the jurisdiction responsible for implementation, enabling practitioners to track which states are active in implementing which agreements.

### State-Instrument Relationships

**View `state_environmental_policy_instrument_view`**

```sql
CREATE VIEW state_environmental_policy_instrument_view AS
SELECT a.id, a.state_code, a.name, a.development_status, b.instrument_id AS instrument_instrument_id, b.name AS instrument_name, b.type AS instrument_type
FROM states a JOIN environmental_policy_instruments b ON a.instrument_id = b.instrument_id;
```

| id | state_code | name | development_status | instrument_instrument_id | instrument_name | instrument_type |
|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | 6926365 | Extended Review | regulation |
| 2 | 8350031 | Pilot Initiative A | developing | account_pymes_691 | Pilot Initiative A | market_incentive |
| 3 | 790483 | Baseline Model | industrialized | 726063 | Baseline Model | institutional_pressure |
| 4 | 8387549 | Distributed Cluster | developing | 23256422 | Distributed Cluster | financial_assistance |

This view reverses the perspective, starting from states and listing the instruments they have deployed. Row 1 shows state 1 deploying the Extended Review instrument (regulation, industrial sector, implemented 2024-11-14). Row 4 shows state 4 deploying the Distributed Cluster instrument (financial_assistance, waste sector, implemented 2023-02-20). This perspective is useful for assessing a state's overall policy portfolio and the diversity of instruments it employs.

### State-Agreement Relationships

**View `state_multilateral_environmental_agreement_view`**

```sql
CREATE VIEW state_multilateral_environmental_agreement_view AS
SELECT a.id, a.state_code, a.name, a.development_status, b.multilateral_environmental_agreement_id AS agreement_multilateral_environmental_agreement_id, b.agreement_id AS agreement_agreement_id, b.title AS agreement_title
FROM states a JOIN multilateral_environmental_agreements b ON a.multilateral_environmental_agreement_id = b.multilateral_environmental_agreement_id;
```

| id | state_code | name | development_status | agreement_multilateral_environmental_agreement_id | agreement_agreement_id | agreement_title |
|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative |
| 2 | 8350031 | Pilot Initiative A | developing | 1001 | 4716391 | Legacy Model |
| 3 | 790483 | Baseline Model | industrialized | 1002 | 3001009030180 | Regional Cluster A |
| 4 | 8387549 | Distributed Cluster | developing | 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view links states to the multilateral agreements they have ratified or participate in. Row 1 shows state 1 associated with agreement 1000 (Compact Initiative, ratified, transboundary). Row 4 shows state 4 associated with agreement 1003 (Seasonal Review, ratified, transboundary). The agreement_id in the state record establishes the international commitments that constrain or guide a state's domestic policy choices.

### State-Financial Assistance Relationships

**View `state_financial_assistance_view`**

```sql
CREATE VIEW state_financial_assistance_view AS
SELECT a.id, a.state_code, a.name, a.development_status, b.financial_assistance_id AS assistance_financial_assistance_id, b.assistance_id AS assistance_assistance_id, b.amount AS assistance_amount
FROM states a JOIN financial_assistances b ON a.financial_assistance_id = b.financial_assistance_id;
```

| id | state_code | name | development_status | assistance_financial_assistance_id | assistance_assistance_id | assistance_amount |
|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 |
| 2 | 8350031 | Pilot Initiative A | developing | 101 | Deskripsi | 25.47 |
| 3 | 790483 | Baseline Model | industrialized | 102 | 332 | 19.72 |
| 4 | 8387549 | Distributed Cluster | developing | 103 | 325447 | 12.74 |

This view connects states to the financial assistance they receive. Row 1 shows state 1 receiving financial assistance linked to instrument 6926365 (Extended Review). Row 4 shows state 4 receiving financial assistance linked to instrument 23256422 (Distributed Cluster). This linkage documents the flow of international funding to national implementation programs.

### Financial Assistance-State Relationships

**View `financial_assistance_state_view`**

```sql
CREATE VIEW financial_assistance_state_view AS
SELECT a.financial_assistance_id, a.assistance_id, a.amount, a.currency, b.id AS state_id, b.state_code AS state_state_code, b.name AS state_name
FROM financial_assistances a JOIN states b ON a.state_id = b.id;
```

| financial_assistance_id | assistance_id | amount | currency | state_id | state_state_code | state_name |
|---|---|---|---|---|---|---|
| 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 | seasonal-currency-71 | 1 | 17788643 | Extended Review |
| 101 | Deskripsi | 25.47 | regional-currency-72 | 2 | 8350031 | Pilot Initiative A |
| 102 | 332 | 19.72 | legacy-currency-73 | 3 | 790483 | Baseline Model |
| 103 | 325447 | 12.74 | compact-currency-74 | 4 | 8387549 | Distributed Cluster |

This view reverses the perspective, starting from financial assistance records and identifying the recipient states. Row 1 shows financial assistance directed to state 1 for the Extended Review instrument. Row 4 shows financial assistance directed to state 4 for the Distributed Cluster instrument. This perspective is useful for tracking the allocation of international environmental funding across jurisdictions.

### Financial Assistance-Instrument Relationships

**View `financial_assistance_environmental_policy_instrument_view`**

```sql
CREATE VIEW financial_assistance_environmental_policy_instrument_view AS
SELECT a.financial_assistance_id, a.assistance_id, a.amount, a.currency, b.instrument_id AS instrument_instrument_id, b.name AS instrument_name, b.type AS instrument_type
FROM financial_assistances a JOIN environmental_policy_instruments b ON a.instrument_id = b.instrument_id;
```

| financial_assistance_id | assistance_id | amount | currency | instrument_instrument_id | instrument_name | instrument_type |
|---|---|---|---|---|---|---|
| 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 | seasonal-currency-71 | 6926365 | Extended Review | regulation |
| 101 | Deskripsi | 25.47 | regional-currency-72 | account_pymes_691 | Pilot Initiative A | market_incentive |
| 102 | 332 | 19.72 | legacy-currency-73 | 726063 | Baseline Model | institutional_pressure |
| 103 | 325447 | 12.74 | compact-currency-74 | 23256422 | Distributed Cluster | financial_assistance |

This view links financial assistance to the specific policy instruments it supports. Row 1 shows financial assistance supporting instrument 6926365 (Extended Review, regulation, industrial sector). Row 4 shows financial assistance supporting instrument 23256422 (Distributed Cluster, financial_assistance type, waste sector). The instrument_id in the financial assistance record establishes which policy mechanism the funding is intended to sustain.

### Synthesis

The international environmental governance system documented here operates as an integrated chain: conferences convene to produce declarations and action plans; institutions administer multilateral agreements that emerge from those declarations; states implement policy instruments to fulfill their agreement obligations; and financial assistance flows from international mechanisms to support national implementation. Each link in this chain is recorded with precise identifiers, dates, and attributes that allow practitioners to trace the full lifecycle of an environmental commitment—from its adoption at a conference in seasonal-host-83 to its implementation as a regulation in the industrial sector of state 1, supported by financial assistance and overseen by the Extended Review institution. The dataset captures not only the static structure of this system but also its temporal evolution, with establishment dates, adoption dates, entry-into-force dates, and implementation dates providing a chronological framework for understanding how international environmental governance develops and matures over time.