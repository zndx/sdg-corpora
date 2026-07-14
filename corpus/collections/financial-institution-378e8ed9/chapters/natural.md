## Financial Compliance and Risk Oversight

The modern financial services landscape demands rigorous oversight mechanisms to detect, document, and remediate irregularities across institutional operations. At the core of this ecosystem sits a structured framework linking financial institutions to their compliance investigations, identified deficiencies, operational divisions, high-risk client relationships, and the suspicious activity reports that trigger regulatory scrutiny. Each component records discrete facts about entities and their interactions, forming an auditable chain from initial discovery through remediation. The data model captures this chain with precision, ensuring that every finding can be traced to its originating institution, the division responsible for oversight, the client relationship involved, and the regulatory filing that formalized the concern.

**Table `financial_institutions`**

| financial_institution_id | institution_id | legal_name | headquarters_city | headquarters_country | charter_type | fed_member_status | regulatory_status | has_subsidiary_financial_institution_id | compliance_investigation_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Adaptive Model | seasonal-headquar-83 | regional-headquar-42 | state-chartered | false | active | 1 | 100 |
| 2 | 8189481 | Primary Cluster | regional-headquar-84 | legacy-headquar-43 | federal | true | sanctioned | 2 | 101 |
| 3 | 1437604 | Composite Review D | legacy-headquar-85 | compact-headquar-44 | foreign | false | under_investigation | 3 | 102 |
| 4 | 884346 | Compact Initiative | compact-headquar-86 | composite-headquar-45 | state-chartered | true | active | 4 | 103 |

Financial institutions form the foundational layer of the compliance framework. Each record identifies a distinct legal entity through a unique `financial_institution_id` and an external `institution_id`, such as 9424913 for Adaptive Model or 8189481 for Primary Cluster. The `legal_name` field carries the organization's registered designation, while `headquarters_city` and `headquarters_country` anchor the entity geographically using coded identifiers like seasonal-headquar-83 and regional-headquar-42. Charter classification distinguishes between state-chartered, federal, and foreign entities, and the `fed_member_status` boolean indicates Federal Reserve membership. The `regulatory_status` column tracks the institution's standing as active, sanctioned, or under_investigation. A self-referencing `has_subsidiary_financial_institution_id` enables the representation of corporate hierarchies, where institution 1 references subsidiary 1, institution 2 references 2, and so forth. The `compliance_investigation_id` field links each institution to its most recent compliance investigation, establishing the primary investigative thread.

**Table `compliance_investigations`**

| id | investigation_id | initiation_date | status | issuing_authority | finding_severity | penalty_amount | financial_institution_id | compliance_investigation_id | deficiency_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | extended-issuing-33 | minor | 2,604 | 1 | 100 | 13910633 |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | integrated-issuing-34 | moderate | 442.51 | 2 | 101 | 8387527 |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | seasonal-issuing-35 | severe | 1,997 | 3 | 102 | 9474 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | regional-issuing-36 | systemic | 3,813 | 4 | 103 | client-focus |

Compliance investigations represent the formal regulatory response to identified concerns. Each investigation carries a globally unique `id` that may take the form of a UUID such as ChIJCbVGx_tt5kcRJYrXOupoDgA, a numeric identifier like 8843769, or a shortened string like 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3. The `investigation_id` provides an additional external reference, while `initiation_date` records when the investigation commenced, ranging from 2022-05-20 for investigation 101 to 2025-12-09 for investigation 100. The `status` field tracks progress through stages including pending, active, completed, and sanctioned. The `issuing_authority` identifies the regulatory body responsible, with coded values such as extended-issuing-33 and integrated-issuing-34. Finding severity is categorized as minor, moderate, severe, or systemic, directly influencing the `penalty_amount` assessed, which ranges from 442.51 for investigation 101 to 3,813 for investigation 103. The `financial_institution_id` ties each investigation to its target institution, while `compliance_investigation_id` and `deficiency_id` create cross-references to related investigations and identified deficiencies.

**Table `compliance_deficiencies`**

| deficiency_id | category | description | discovery_date | remediation_status | compliance_investigation_id | banking_division_id | client_id |
|---|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | open | 100 | 1 | Erin Olson |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | in_progress | 101 | 2 | Jorge Sullivan |
| 9474 | reporting | Baseline Series | 2022-01-18 | closed | 102 | 3 | Kimberly Maynard |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | open | 103 | 4 | Michelle Kelley |

Compliance deficiencies document the specific control failures or regulatory gaps discovered during investigations. The `deficiency_id` serves as the primary key, accepting both numeric identifiers like 13910633 and 8387527 and descriptive strings such as client-focus. The `category` field classifies the nature of the deficiency into risk_management, monitoring, reporting, or resource_allocation. A `description` provides contextual detail, with entries like Extended Survey, Pilot Corridor A, Baseline Series, and Distributed Assessment. The `discovery_date` marks when the deficiency was identified, spanning from 2022-01-18 for deficiency 9474 to 2025-08-07 for deficiency 8387527. Remediation progress is tracked through `remediation_status` values of open, in_progress, or closed, with deficiency 9474 having achieved closure while 13910633 and client-focus remain open. Each deficiency references its originating `compliance_investigation_id`, the `banking_division_id` responsible for oversight, and the `client_id` whose activities contributed to the finding.

**Table `banking_divisions`**

| id | division_code | division_name | oversight_level | compliance_officer_id | financial_institution_id | client_id | deficiency_id |
|---|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | 1 | Erin Olson | 13910633 |
| 2 | 113 | Compact Programme A | enhanced | 9246325 | 2 | Jorge Sullivan | 8387527 |
| 3 | 1250220 | Legacy Standard | lax | 195343 | 3 | Kimberly Maynard | 9474 |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | 7441148 | 4 | Michelle Kelley | client-focus |

Banking divisions represent the operational units within financial institutions that manage client relationships and regulatory compliance. Each division is identified by a numeric `id` or a UUID such as 5f923cfa-8fcd-11eb-924d-9cd76263cbd0. The `division_code` provides a short alphanumeric identifier, while `division_name` carries the full designation, including Composite Protocol, Compact Programme A, Legacy Standard, and Regional Framework. The `oversight_level` indicates the intensity of supervisory control applied, with values of standard, enhanced, and lax. A `compliance_officer_id` assigns responsibility to a specific officer, using either UUID format like c8a7d91b-e587-45b4-bae6-0c0a51b6241b or numeric identifiers such as 9246325 and 195343. The `financial_institution_id` links the division to its parent institution, while `client_id` and `deficiency_id` associate the division with specific client relationships and identified compliance gaps.

**Table `high_risk_clients`**

| client_id | client_type | risk_rating | jurisdiction | relationship_status | financial_institution_id | banking_division_id | suspicious_activity_report_sar_id |
|---|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | active | 1 | 1 | 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | closed | 2 | 2 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | flagged | 3 | 3 | 7441159 |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | active | 4 | 4 | 2106716 |

High-risk clients represent the individuals and entities subject to enhanced scrutiny due to their political exposure, business structure, or jurisdictional risk. The `client_id` serves as the primary identifier, using names such as Erin Olson, Jorge Sullivan, Kimberly Maynard, and Michelle Kelley. The `client_type` classifies the relationship as politically_exposed_person, business_entity, or foreign_government. A numeric `risk_rating` quantifies the assessed risk level, ranging from 15 for Erin Olson to 36 for Michelle Kelley. The `jurisdiction` field records the applicable regulatory environment using coded values like regional-jurisdic-30 and legacy-jurisdic-31. The `relationship_status` tracks the current state of the client relationship as active, closed, or flagged. Each client record links to their `financial_institution_id`, `banking_division_id`, and an associated `suspicious_activity_report_sar_id`, creating a direct path from client profile to regulatory filing.

**Table `suspicious_activity_reports`**

| sar_id | filing_date | status | triggering_transaction_id | flagging_specialist_id | client_id | banking_division_id | deficiency_id |
|---|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | state_uk_25 | Erin Olson | 1 | 13910633 |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | 3355771 | Jorge Sullivan | 2 | 8387527 |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | gd_acc_760000 | Kimberly Maynard | 3 | 9474 |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | 3158158 | Michelle Kelley | 4 | client-focus |

Suspicious activity reports formalize the regulatory notification process when unusual transactions or behaviors are detected. Each report is identified by a `sar_id`, typically in UUID format such as 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 or as a numeric identifier like 7441159. The `filing_date` records when the report was submitted, ranging from 2022-05-15 for report 2106716 to 2025-12-04 for report 7441159. The `status` field indicates the current disposition as filed, rejected, suppressed, or pending_review. The `triggering_transaction_id` identifies the specific transaction that prompted the filing, with values including gd_acc_260002, ain, 194ce604-8fba-11eb-924d-9cd76263cbd0, and 505996. The `flagging_specialist_id` attributes the report to the individual who identified the suspicious activity, using identifiers such as state_uk_25, 3355771, gd_acc_760000, and 3158158. Each SAR references the `client_id` involved, the `banking_division_id` responsible for the relationship, and the `deficiency_id` that contextualizes the finding.

### Institutional Self-Reference and Investigation Linkage

**View `vw_financial_institution_financial_institution`**

```sql
CREATE VIEW vw_financial_institution_financial_institution AS
SELECT a.financial_institution_id, a.institution_id, a.legal_name, a.headquarters_city, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM financial_institutions a JOIN financial_institutions b ON a.has_subsidiary_financial_institution_id = b.financial_institution_id;
```

| financial_institution_id | institution_id | legal_name | headquarters_city | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Adaptive Model | seasonal-headquar-83 | 1 | 9424913 | Adaptive Model |
| 2 | 8189481 | Primary Cluster | regional-headquar-84 | 2 | 8189481 | Primary Cluster |
| 3 | 1437604 | Composite Review D | legacy-headquar-85 | 3 | 1437604 | Composite Review D |
| 4 | 884346 | Compact Initiative | compact-headquar-86 | 4 | 884346 | Compact Initiative |

This view returns each financial institution alongside its own complete record, effectively providing a self-referencing snapshot that includes subsidiary relationships. The query answers the question of which institutions operate as both parent and subsidiary within the same portfolio. For instance, institution 1 (Adaptive Model) appears with `has_subsidiary_financial_institution_id` equal to 1, indicating a self-referential or circular subsidiary structure that warrants review. Institution 2 (Primary Cluster) similarly references itself, while institutions 3 and 4 follow the same pattern. This self-referencing pattern may indicate data consolidation artifacts or genuinely complex corporate structures where an institution holds a stake in itself through subsidiary arrangements.

**View `vw_financial_institution_compliance_investigation`**

```sql
CREATE VIEW vw_financial_institution_compliance_investigation AS
SELECT a.financial_institution_id, a.institution_id, a.legal_name, a.headquarters_city, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.initiation_date AS investigation_initiation_date
FROM financial_institutions a JOIN compliance_investigations b ON a.compliance_investigation_id = b.id;
```

| financial_institution_id | institution_id | legal_name | headquarters_city | investigation_id | investigation_investigation_id | investigation_initiation_date |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Adaptive Model | seasonal-headquar-83 | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 |
| 2 | 8189481 | Primary Cluster | regional-headquar-84 | 101 | 8843769 | 2022-05-20T18:14:00 |
| 3 | 1437604 | Composite Review D | legacy-headquar-85 | 102 | 974942 | 2023-10-04T01:31:00 |
| 4 | 884346 | Compact Initiative | compact-headquar-86 | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 |

This join connects financial institutions to their associated compliance investigations, answering which institution each investigation targets and what the current status of both entities is. The joined result reveals that Adaptive Model (institution 1) is linked to investigation 100, which carries a pending status and a minor severity finding with a penalty of 2,604. Primary Cluster (institution 2) connects to investigation 101, classified as active with moderate severity and a penalty of 442.51. Composite Review D (institution 3) is associated with investigation 102, which has been completed with a severe finding and a penalty of 1,997. Compact Initiative (institution 4) links to investigation 103, marked as sanctioned with systemic severity and the highest penalty of 3,813. This view enables compliance officers to assess the relationship between an institution's regulatory status and the severity of its most recent investigation.

### Investigation-Centric Relationships

**View `vw_compliance_investigation_financial_institution`**

```sql
CREATE VIEW vw_compliance_investigation_financial_institution AS
SELECT a.id, a.investigation_id, a.initiation_date, a.status, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM compliance_investigations a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | investigation_id | initiation_date | status | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | 1 | 9424913 | Adaptive Model |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | 2 | 8189481 | Primary Cluster |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | 3 | 1437604 | Composite Review D |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | 4 | 884346 | Compact Initiative |

This view reverses the perspective, presenting each compliance investigation alongside its target financial institution. The result answers the question of which institutions are under active regulatory scrutiny and how their charter types and regulatory statuses correlate with investigation outcomes. Investigation 100 targets Adaptive Model, a state-chartered, active institution with a minor finding. Investigation 101 targets Primary Cluster, a federal, sanctioned entity with a moderate finding. Investigation 102 targets Composite Review D, a foreign, under_investigation institution with a severe finding. Investigation 103 targets Compact Initiative, a state-chartered, active institution with a systemic finding. The reversal highlights that regulatory status alone does not predict investigation severity, as Compact Initiative remains active despite its systemic-level finding.

**View `vw_compliance_investigation_compliance_investigation`**

```sql
CREATE VIEW vw_compliance_investigation_compliance_investigation AS
SELECT a.id, a.investigation_id, a.initiation_date, a.status, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.initiation_date AS investigation_initiation_date
FROM compliance_investigations a JOIN compliance_investigations b ON a.compliance_investigation_id = b.id;
```

| id | investigation_id | initiation_date | status | investigation_id | investigation_investigation_id | investigation_initiation_date |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | 101 | 8843769 | 2022-05-20T18:14:00 |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | 102 | 974942 | 2023-10-04T01:31:00 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 |

This self-referencing view on compliance investigations returns each investigation alongside its own complete record, potentially revealing duplicate entries or self-referential investigation links. The query answers whether any investigation references itself through the `compliance_investigation_id` field. Investigation 100 references itself with `compliance_investigation_id` equal to 100, as do investigations 101, 102, and 103. This pattern suggests that the `compliance_investigation_id` field may serve as a self-referential pointer within the same investigation record, possibly indicating a consolidated investigation framework where each investigation is its own parent reference.

**View `vw_compliance_investigation_compliance_deficiency`**

```sql
CREATE VIEW vw_compliance_investigation_compliance_deficiency AS
SELECT a.id, a.investigation_id, a.initiation_date, a.status, b.deficiency_id AS deficiency_deficiency_id, b.category AS deficiency_category, b.description AS deficiency_description
FROM compliance_investigations a JOIN compliance_deficiencies b ON a.deficiency_id = b.deficiency_id;
```

| id | investigation_id | initiation_date | status | deficiency_deficiency_id | deficiency_category | deficiency_description |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | 13910633 | risk_management | Extended Survey |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | 8387527 | monitoring | Pilot Corridor A |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | 9474 | reporting | Baseline Series |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | client-focus | resource_allocation | Distributed Assessment |

This join links compliance investigations to their associated compliance deficiencies, answering which specific control failures each investigation uncovered. The result shows that investigation 100 identified deficiency 13910633, a risk_management category deficiency described as Extended Survey, discovered on 2024-03-23 and currently open. Investigation 101 identified deficiency 8387527, a monitoring category deficiency described as Pilot Corridor A, discovered on 2025-08-07 and in_progress. Investigation 102 identified deficiency 9474, a reporting category deficiency described as Baseline Series, discovered on 2022-01-18 and closed. Investigation 103 identified deficiency client-focus, a resource_allocation category deficiency described as Distributed Assessment, discovered on 2023-06-02 and open. This view enables investigators to trace from a regulatory finding to the specific operational gap that triggered it.

### Deficiency-Centric Relationships

**View `vw_compliance_deficiency_compliance_investigation`**

```sql
CREATE VIEW vw_compliance_deficiency_compliance_investigation AS
SELECT a.deficiency_id, a.category, a.description, a.discovery_date, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.initiation_date AS investigation_initiation_date
FROM compliance_deficiencies a JOIN compliance_investigations b ON a.compliance_investigation_id = b.id;
```

| deficiency_id | category | description | discovery_date | investigation_id | investigation_investigation_id | investigation_initiation_date |
|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | 101 | 8843769 | 2022-05-20T18:14:00 |
| 9474 | reporting | Baseline Series | 2022-01-18 | 102 | 974942 | 2023-10-04T01:31:00 |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 |

This view presents each compliance deficiency alongside its originating investigation, answering which investigation led to the discovery of each control failure. The joined result confirms that deficiency 13910633 originated from investigation 100, which carries a pending status and minor severity. Deficiency 8387527 traces to investigation 101, an active investigation with moderate severity. Deficiency 9474 stems from investigation 102, a completed investigation with severe severity. Deficiency client-focus originates from investigation 103, a sanctioned investigation with systemic severity. This perspective is valuable for auditors who need to verify that each deficiency has a documented investigative basis and to assess whether the investigation's severity rating aligns with the deficiency's remediation status.

**View `vw_compliance_deficiency_banking_division`**

```sql
CREATE VIEW vw_compliance_deficiency_banking_division AS
SELECT a.deficiency_id, a.category, a.description, a.discovery_date, b.id AS division_id, b.division_code AS division_division_code, b.division_name AS division_division_name
FROM compliance_deficiencies a JOIN banking_divisions b ON a.banking_division_id = b.id;
```

| deficiency_id | category | description | discovery_date | division_id | division_division_code | division_division_name |
|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | 1 | 103191 | Composite Protocol |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | 2 | 113 | Compact Programme A |
| 9474 | reporting | Baseline Series | 2022-01-18 | 3 | 1250220 | Legacy Standard |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

This join connects compliance deficiencies to the banking divisions responsible for their remediation, answering which division oversees each identified gap. The result shows that deficiency 13910633 falls under banking division 1 (Composite Protocol), which applies standard oversight and is managed by compliance officer c8a7d91b-e587-45b4-bae6-0c0a51b6241b. Deficiency 8387527 is overseen by banking division 2 (Compact Programme A), which applies enhanced oversight and is managed by compliance officer 9246325. Deficiency 9474 is assigned to banking division 3 (Legacy Standard), which applies lax oversight and is managed by compliance officer 195343. Deficiency client-focus falls under banking division 4 (Regional Framework), which applies standard oversight and is managed by compliance officer 7441148. This view enables management to assess whether oversight levels are appropriately calibrated to deficiency severity.

**View `vw_compliance_deficiency_high_risk_client`**

```sql
CREATE VIEW vw_compliance_deficiency_high_risk_client AS
SELECT a.deficiency_id, a.category, a.description, a.discovery_date, b.client_id AS client_client_id, b.client_type AS client_client_type, b.risk_rating AS client_risk_rating
FROM compliance_deficiencies a JOIN high_risk_clients b ON a.client_id = b.client_id;
```

| deficiency_id | category | description | discovery_date | client_client_id | client_client_type | client_risk_rating |
|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | Erin Olson | politically_exposed_person | 15 |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | Jorge Sullivan | business_entity | 22 |
| 9474 | reporting | Baseline Series | 2022-01-18 | Kimberly Maynard | foreign_government | 29 |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | Michelle Kelley | politically_exposed_person | 36 |

This join links compliance deficiencies to the high-risk clients whose activities contributed to each finding, answering which client relationship is associated with each control failure. The result reveals that deficiency 13910633 is associated with client Erin Olson, a politically_exposed_person with a risk rating of 15 and active relationship status. Deficiency 8387527 is linked to client Jorge Sullivan, a business_entity with a risk rating of 22 and closed relationship status. Deficiency 9474 connects to client Kimberly Maynard, a foreign_government with a risk rating of 29 and flagged relationship status. Deficiency client-focus is associated with client Michelle Kelley, a politically_exposed_person with a risk rating of 36 and active relationship status. This view is critical for risk managers who need to evaluate whether client risk ratings correlate with the categories and remediation status of associated deficiencies.

### Division-Centric Relationships

**View `vw_banking_division_financial_institution`**

```sql
CREATE VIEW vw_banking_division_financial_institution AS
SELECT a.id, a.division_code, a.division_name, a.oversight_level, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM banking_divisions a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | division_code | division_name | oversight_level | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | 1 | 9424913 | Adaptive Model |
| 2 | 113 | Compact Programme A | enhanced | 2 | 8189481 | Primary Cluster |
| 3 | 1250220 | Legacy Standard | lax | 3 | 1437604 | Composite Review D |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | 4 | 884346 | Compact Initiative |

This join connects banking divisions to their parent financial institutions, answering which institution each division serves and how institutional characteristics relate to divisional oversight. The result shows that banking division 1 (Composite Protocol) serves financial institution 1 (Adaptive Model), a state-chartered, active institution. Banking division 2 (Compact Programme A) serves financial institution 2 (Primary Cluster), a federal, sanctioned institution. Banking division 3 (Legacy Standard) serves financial institution 3 (Composite Review D), a foreign, under_investigation institution. Banking division 4 (Regional Framework) serves financial institution 4 (Compact Initiative), a state-chartered, active institution. This view enables institutional leadership to assess whether divisional oversight levels (standard, enhanced, lax) are appropriately matched to their parent institution's regulatory standing.

**View `vw_banking_division_high_risk_client`**

```sql
CREATE VIEW vw_banking_division_high_risk_client AS
SELECT a.id, a.division_code, a.division_name, a.oversight_level, b.client_id AS client_client_id, b.client_type AS client_client_type, b.risk_rating AS client_risk_rating
FROM banking_divisions a JOIN high_risk_clients b ON a.client_id = b.client_id;
```

| id | division_code | division_name | oversight_level | client_client_id | client_client_type | client_risk_rating |
|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | Erin Olson | politically_exposed_person | 15 |
| 2 | 113 | Compact Programme A | enhanced | Jorge Sullivan | business_entity | 22 |
| 3 | 1250220 | Legacy Standard | lax | Kimberly Maynard | foreign_government | 29 |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | Michelle Kelley | politically_exposed_person | 36 |

This join links banking divisions to the high-risk clients they manage, answering which client each division is responsible for and what risk profile falls under their purview. The result reveals that banking division 1 manages client Erin Olson, a politically_exposed_person with risk rating 15. Banking division 2 manages client Jorge Sullivan, a business_entity with risk rating 22. Banking division 3 manages client Kimberly Maynard, a foreign_government with risk rating 29. Banking division 4 manages client Michelle Kelley, a politically_exposed_person with risk rating 36. This view supports resource allocation decisions by showing the distribution of risk ratings across divisions and whether enhanced oversight divisions correspond to higher-risk client portfolios.

**View `vw_banking_division_compliance_deficiency`**

```sql
CREATE VIEW vw_banking_division_compliance_deficiency AS
SELECT a.id, a.division_code, a.division_name, a.oversight_level, b.deficiency_id AS deficiency_deficiency_id, b.category AS deficiency_category, b.description AS deficiency_description
FROM banking_divisions a JOIN compliance_deficiencies b ON a.deficiency_id = b.deficiency_id;
```

| id | division_code | division_name | oversight_level | deficiency_deficiency_id | deficiency_category | deficiency_description |
|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | 13910633 | risk_management | Extended Survey |
| 2 | 113 | Compact Programme A | enhanced | 8387527 | monitoring | Pilot Corridor A |
| 3 | 1250220 | Legacy Standard | lax | 9474 | reporting | Baseline Series |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | client-focus | resource_allocation | Distributed Assessment |

This join connects banking divisions to the compliance deficiencies they are responsible for remediating, answering which gaps each division must address. The result shows that banking division 1 is responsible for deficiency 13910633 (risk_management, open status). Banking division 2 handles deficiency 8387527 (monitoring, in_progress status). Banking division 3 manages deficiency 9474 (reporting, closed status). Banking division 4 oversees deficiency client-focus (resource_allocation, open status). This view is essential for compliance officers who need to track remediation progress by division and ensure that open deficiencies receive appropriate attention.

### Client-Centric Relationships

**View `vw_high_risk_client_financial_institution`**

```sql
CREATE VIEW vw_high_risk_client_financial_institution AS
SELECT a.client_id, a.client_type, a.risk_rating, a.jurisdiction, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM high_risk_clients a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| client_id | client_type | risk_rating | jurisdiction | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | 1 | 9424913 | Adaptive Model |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | 2 | 8189481 | Primary Cluster |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | 3 | 1437604 | Composite Review D |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | 4 | 884346 | Compact Initiative |

This join links high-risk clients to their parent financial institutions, answering which institution each client relationship belongs to and how institutional characteristics contextualize the client's risk profile. The result shows that Erin Olson (risk rating 15, politically_exposed_person) is associated with financial institution 1 (Adaptive Model, state-chartered, active). Jorge Sullivan (risk rating 22, business_entity) is linked to financial institution 2 (Primary Cluster, federal, sanctioned). Kimberly Maynard (risk rating 29, foreign_government) connects to financial institution 3 (Composite Review D, foreign, under_investigation). Michelle Kelley (risk rating 36, politically_exposed_person) is associated with financial institution 4 (Compact Initiative, state-chartered, active). This view enables risk committees to evaluate whether client risk ratings are consistent with the regulatory environment of their sponsoring institutions.

**View `vw_high_risk_client_banking_division`**

```sql
CREATE VIEW vw_high_risk_client_banking_division AS
SELECT a.client_id, a.client_type, a.risk_rating, a.jurisdiction, b.id AS division_id, b.division_code AS division_division_code, b.division_name AS division_division_name
FROM high_risk_clients a JOIN banking_divisions b ON a.banking_division_id = b.id;
```

| client_id | client_type | risk_rating | jurisdiction | division_id | division_division_code | division_division_name |
|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | 1 | 103191 | Composite Protocol |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | 2 | 113 | Compact Programme A |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | 3 | 1250220 | Legacy Standard |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

This join connects high-risk clients to the banking divisions that manage their relationships, answering which division is responsible for each client and what oversight level is applied. The result reveals that Erin Olson is managed by banking division 1 (Composite Protocol, standard oversight). Jorge Sullivan is managed by banking division 2 (Compact Programme A, enhanced oversight). Kimberly Maynard is managed by banking division 3 (Legacy Standard, lax oversight). Michelle Kelley is managed by banking division 4 (Regional Framework, standard oversight). This view supports governance reviews by showing whether the assigned oversight level aligns with the client's risk rating, particularly noting that Kimberly Maynard's elevated risk rating of 29 falls under lax oversight.

**View `vw_high_risk_client_suspicious_activity_report`**

```sql
CREATE VIEW vw_high_risk_client_suspicious_activity_report AS
SELECT a.client_id, a.client_type, a.risk_rating, a.jurisdiction, b.sar_id AS report_sar_id, b.filing_date AS report_filing_date, b.status AS report_status
FROM high_risk_clients a JOIN suspicious_activity_reports b ON a.suspicious_activity_report_sar_id = b.sar_id;
```

| client_id | client_type | risk_rating | jurisdiction | report_sar_id | report_filing_date | report_status |
|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | 7441159 | 2025-12-04T03:49:00 | suppressed |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | 2106716 | 2022-05-15T10:06:00 | pending_review |

This join links high-risk clients to their associated suspicious activity reports, answering which regulatory filings each client relationship has generated. The result shows that Erin Olson has SAR 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0, filed on 2023-02-09 with status filed. Jorge Sullivan has SAR b75be5bc-8fcd-11eb-924d-9cd76263cbd0, filed on 2024-07-20 with status rejected. Kimberly Maynard has SAR 7441159, filed on 2025-12-04 with status suppressed. Michelle Kelley has SAR 2106716, filed on 2022-05-15 with status pending_review. This view is critical for compliance teams assessing the filing history of high-risk clients and identifying patterns in SAR dispositions.

### Suspicious Activity Report Relationships

**View `vw_suspicious_activity_report_high_risk_client`**

```sql
CREATE VIEW vw_suspicious_activity_report_high_risk_client AS
SELECT a.sar_id, a.filing_date, a.status, a.triggering_transaction_id, b.client_id AS client_client_id, b.client_type AS client_client_type, b.risk_rating AS client_risk_rating
FROM suspicious_activity_reports a JOIN high_risk_clients b ON a.client_id = b.client_id;
```

| sar_id | filing_date | status | triggering_transaction_id | client_client_id | client_client_type | client_risk_rating |
|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | Erin Olson | politically_exposed_person | 15 |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | Jorge Sullivan | business_entity | 22 |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | Kimberly Maynard | foreign_government | 29 |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | Michelle Kelley | politically_exposed_person | 36 |

This view presents each suspicious activity report alongside its associated high-risk client, answering which client triggered each filing and what the client's risk profile was at the time of reporting. The joined result confirms that SAR 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 was triggered by Erin Olson, a politically_exposed_person with risk rating 15 and active relationship status. SAR b75be5bc-8fcd-11eb-924d-9cd76263cbd0 was triggered by Jorge Sullivan, a business_entity with risk rating 22 and closed relationship status. SAR 7441159 was triggered by Kimberly Maynard, a foreign_government with risk rating 29 and flagged relationship status. SAR 2106716 was triggered by Michelle Kelley, a politically_exposed_person with risk rating 36 and active relationship status. This perspective helps analysts evaluate whether the risk rating of the triggering client correlates with the SAR's filing status.

**View `vw_suspicious_activity_report_banking_division`**

```sql
CREATE VIEW vw_suspicious_activity_report_banking_division AS
SELECT a.sar_id, a.filing_date, a.status, a.triggering_transaction_id, b.id AS division_id, b.division_code AS division_division_code, b.division_name AS division_division_name
FROM suspicious_activity_reports a JOIN banking_divisions b ON a.banking_division_id = b.id;
```

| sar_id | filing_date | status | triggering_transaction_id | division_id | division_division_code | division_division_name |
|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | 1 | 103191 | Composite Protocol |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | 2 | 113 | Compact Programme A |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | 3 | 1250220 | Legacy Standard |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

This join connects suspicious activity reports to the banking divisions responsible for the relationships that generated them, answering which division filed each report and what oversight level was in place. The result shows that SAR 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 was filed by banking division 1 (Composite Protocol, standard oversight). SAR b75be5bc-8fcd-11eb-924d-9cd76263cbd0 was filed by banking division 2 (Compact Programme A, enhanced oversight). SAR 7441159 was filed by banking division 3 (Legacy Standard, lax oversight). SAR 2106716 was filed by banking division 4 (Regional Framework, standard oversight). This view supports divisional performance reviews by correlating filing outcomes with the oversight level applied by each division.

**View `vw_suspicious_activity_report_compliance_deficiency`**

```sql
CREATE VIEW vw_suspicious_activity_report_compliance_deficiency AS
SELECT a.sar_id, a.filing_date, a.status, a.triggering_transaction_id, b.deficiency_id AS deficiency_deficiency_id, b.category AS deficiency_category, b.description AS deficiency_description
FROM suspicious_activity_reports a JOIN compliance_deficiencies b ON a.deficiency_id = b.deficiency_id;
```

| sar_id | filing_date | status | triggering_transaction_id | deficiency_deficiency_id | deficiency_category | deficiency_description |
|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | 13910633 | risk_management | Extended Survey |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | 8387527 | monitoring | Pilot Corridor A |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | 9474 | reporting | Baseline Series |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | client-focus | resource_allocation | Distributed Assessment |

This join links suspicious activity reports to the compliance deficiencies that contextualize each filing, answering which control failure each SAR relates to and what the remediation status of that deficiency is. The result reveals that SAR 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 relates to deficiency 13910633 (risk_management, open status). SAR b75be5bc-8fcd-11eb-924d-9cd76263cbd0 relates to deficiency 8387527 (monitoring, in_progress status). SAR 7441159 relates to deficiency 9474 (reporting, closed status). SAR 2106716 relates to deficiency client-focus (resource_allocation, open status). This final view completes the investigative chain, connecting the regulatory filing back to the specific operational gap it exposed and enabling a full audit trail from transaction through deficiency to remediation.

### Synthesis

The compliance data model presents a tightly interwoven ecosystem where every finding, investigation, and filing can be traced through multiple relational pathways. Financial institutions anchor the structure, each linked to a compliance investigation that identifies specific deficiencies within banking divisions managing high-risk client relationships. Suspicious activity reports formalize the regulatory notification process, connecting client behavior to the operational gaps that enabled it. The cross-referential design ensures that no finding exists in isolation: a deficiency traces to its investigation, its division, its client, and its SAR, while each SAR can be traced back through the same chain. This interconnected architecture supports comprehensive auditability, enabling regulators, compliance officers, and risk managers to navigate from any single record to the full context of the finding it represents.