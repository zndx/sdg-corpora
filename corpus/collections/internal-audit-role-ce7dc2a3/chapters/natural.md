## The Architecture of Public Service Governance

Public service organisations operate within a complex ecosystem of oversight mechanisms, each layer designed to ensure accountability, compliance, and operational integrity. At the foundation of this ecosystem are internal audit roles—structured positions that define the scope, authority, and compliance posture of audit functions within and across organisations. These roles do not exist in isolation; they are embedded within public service organisations, aligned to specific audit standards, coordinated by audit committees, and governed by overarching frameworks that set performance expectations and risk assessment cadences. Understanding how these entities interlock is essential for practitioners who design, evaluate, or reform governance structures. The records below capture a snapshot of this ecosystem, revealing patterns of compliance, maturity, and organisational alignment that inform strategic decision-making.

**Table `internal_audit_roles`**

| internal_audit_role_id | role_identifier | role_title | standard_compliance_status | contracting_organisation | shared_service_flag | last_review_date | performance_rating | public_service_organisation_id | governance_framework_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | PSIAS_2017_Compliant | Litton Industries | false | 2022-09-03T08:24:00 | 15.95 | 1 | 1000 |
| 2 | ROL-2016 | Adaptive Framework D | Non_Compliant | Wikimedia Foundation Inc. | true | 2023-02-14T15:41:00 | 18.90 | 2 | 1001 |
| 3 | ROL-2020 | Primary Protocol | Under_Review | Singapore General Hospital | false | 2024-07-25T22:58:00 | 21.85 | 3 | 1002 |
| 4 | ROL-2024 | Composite Programme | PSIAS_2017_Compliant | National Institute of Standards and Technology | true | 2025-12-09T05:15:00 | 24.80 | 4 | 1003 |

The `internal_audit_roles` table establishes the primary units of audit authority. Each row represents a distinct role, identified by a role identifier such as `ROL-2012` or `ROL-2024`, and assigned a descriptive title like "Distributed Standard" or "Composite Programme." The `standard_compliance_status` column tracks whether the role adheres to the PSIAS 2017 framework, with values ranging from `PSIAS_2017_Compliant` to `Non_Compliant` and `Under_Review`. The `contracting_organisation` field names the entity responsible for the role—Litton Industries, Wikimedia Foundation Inc., Singapore General Hospital, and the National Institute of Standards and Technology appear in the current dataset. The `shared_service_flag` indicates whether the role operates as a shared service, a designation held by roles `ROL-2016` and `ROL-2024`. Performance is quantified through `performance_rating`, which spans from 15.95 to 24.80 across the four records, and each role is last reviewed on dates ranging from September 2022 to December 2025. Critically, every internal audit role carries a `public_service_organisation_id` and a `governance_framework_id`, anchoring it to the broader organisational and governance context.

**Table `public_service_organisations`**

| id | organisation_id | organisation_name | jurisdiction | establishment_date | service_type | annual_budget | governance_maturity_level | internal_audit_role_id | audit_standard_id | committee_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Austria Card | Viet Children's Aegis | regional-jurisdic-30 | 2024-07-11 | composite-service-81 | 44,248 | 47 | 1 | 1 | PHR-98 |
| 2 | American International Group | Switch Card Services Ltd. | legacy-jurisdic-31 | 2025-12-22 | primary-service-82 | 76,784 | 56 | 2 | 2 | L785 |
| 3 | GitHub Inc. | Virgin Group | compact-jurisdic-32 | 2022-05-06 | adaptive-service-83 | 41,373 | 65 | 3 | 3 | 7119774 |
| 4 | Staples Inc. | Whirlpool Corporation | composite-jurisdic-33 | 2023-10-17 | distributed-service-84 | 175,434 | 74 | 4 | 4 | 1186094 |

Public service organisations form the operational backbone of the governance ecosystem. The `public_service_organisations` table records each organisation's identity through both an `organisation_id` (e.g., "Austria Card," "American International Group") and an `organisation_name` (e.g., "Viet Children's Aegis," "Switch Card Services Ltd."). Jurisdictional scope is captured in the `jurisdiction` column, with values such as `regional-jurisdic-30` and `legacy-jurisdic-31` denoting the geographic or administrative boundaries under which each organisation operates. The `establishment_date` marks when the organisation was founded, while `service_type` categorises its operational focus—composite, primary, adaptive, or distributed services. Annual budgets range from 41,373 to 175,434, and the `governance_maturity_level` provides a numeric indicator of organisational governance sophistication, spanning from 47 to 74. Each organisation record references an `internal_audit_role_id`, an `audit_standard_id`, and a `committee_id`, establishing direct foreign-key links to the other core entities in the system.

**Table `audit_standards`**

| id | standard_id | standard_name | issuing_body | effective_date | revision_number | compliance_level | public_service_organisation_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | baseline-issuing-13 | 2023-02-14 | 24 | Mandatory | 1 | 2025-01-01 00:14:00 |
| 2 | 9125617 | Legacy Protocol | pilot-issuing-14 | 2024-07-25 | 32 | Recommended | 2 | 2025-02-06 03:14:00 |
| 3 | 338526 | Regional Programme A | extended-issuing-15 | 2025-12-09 | 40 | Best_Practice | 3 | 2025-03-11 06:14:00 |
| 4 | 3717623 | Seasonal Standard | integrated-issuing-16 | 2022-05-20 | 48 | Mandatory | 4 | 2025-04-16 09:14:00 |

Audit standards define the compliance expectations and regulatory baselines that public service organisations must meet. The `audit_standards` table stores each standard's unique `standard_id`, a human-readable `standard_name` such as "Compact Framework" or "Seasonal Standard," and the `issuing_body` responsible for its publication. The `effective_date` indicates when the standard came into force, while `revision_number` tracks its version history, with values from 24 to 48 in the current dataset. The `compliance_level` column classifies each standard as `Mandatory`, `Recommended`, or `Best_Practice`, directly influencing how organisations allocate resources toward adherence. Each standard is associated with a `public_service_organisation_id`, ensuring that compliance obligations are traceable to the specific entity responsible for implementation.

**Table `audit_committees`**

| committee_id | committee_name | establishment_date | meeting_frequency | member_count | independence_level | internal_audit_role_id | public_service_organisation_id |
|---|---|---|---|---|---|---|---|
| PHR-98 | Composite Cluster | 2024-07-11 | Monthly | 4 | Fully_Independent | 1 | 1 |
| L785 | Compact Review A | 2025-12-22 | Quarterly | 17 | Partially_Independent | 2 | 2 |
| 7119774 | Legacy Initiative | 2022-05-06 | Annually | 9 | Not_Independent | 3 | 3 |
| 1186094 | Regional Model | 2023-10-17 | Monthly | 0 | Fully_Independent | 4 | 4 |

Audit committees serve as the governance bodies that oversee audit activities, review findings, and ensure independence. The `audit_committees` table records each committee's `committee_id` (e.g., `PHR-98`, `L785`), its `committee_name` such as "Composite Cluster" or "Compact Review A," and its `establishment_date`. The `meeting_frequency` column captures how often the committee convenes—Monthly, Quarterly, or Annually—while `member_count` indicates the number of participants, ranging from 0 to 17. The `independence_level` is a critical governance metric, with values of `Fully_Independent`, `Partially_Independent`, or `Not_Independent` reflecting the committee's structural autonomy from management. Each committee record links to an `internal_audit_role_id` and a `public_service_organisation_id`, creating a bridge between the oversight body and the audit function it supervises.

**Table `governance_frameworks`**

| governance_framework_id | framework_id | framework_name | version | last_updated | compliance_score | risk_assessment_frequency | internal_audit_role_id | public_service_organisation_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | seasonal-version-71 | 2023-06-17T17:27:00 | 21.95 | Annual | 1 | 1 |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | regional-version-72 | 2024-11-01T00:44:00 | 24.90 | Biannual | 2 | 2 |
| 1002 | 8843756 | Composite Assessment D | legacy-version-73 | 2025-04-12T07:01:00 | 27.85 | Quarterly | 3 | 3 |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | compact-version-74 | 2022-09-23T14:18:00 | 30.80 | Annual | 4 | 4 |

Governance frameworks provide the strategic architecture within which all audit and compliance activities operate. The `governance_frameworks` table stores each framework's `governance_framework_id`, a `framework_id` that may take the form of a UUID or a template code, and a `framework_name` such as "Adaptive Corridor" or "Compact Survey." The `version` column tracks the framework iteration, while `last_updated` records the most recent modification timestamp. The `compliance_score` offers a quantitative measure of framework effectiveness, ranging from 21.95 to 30.80 in the current data. The `risk_assessment_frequency` specifies how often risk evaluations occur—Annual, Biannual, or Quarterly. Each framework is tied to an `internal_audit_role_id` and a `public_service_organisation_id`, ensuring that governance expectations are aligned with both the audit function and the host organisation.

The relationships between these entities become most visible through the joined views, which answer specific operational questions by combining data across tables.

**View `v_internal_audit_role_public_service_organisation`**

```sql
CREATE VIEW v_internal_audit_role_public_service_organisation AS
SELECT a.internal_audit_role_id, a.role_identifier, a.role_title, a.standard_compliance_status, b.id AS organisation_id, b.organisation_id AS organisation_organisation_id, b.organisation_name AS organisation_organisation_name
FROM internal_audit_roles a JOIN public_service_organisations b ON a.public_service_organisation_id = b.id;
```

| internal_audit_role_id | role_identifier | role_title | standard_compliance_status | organisation_id | organisation_organisation_id | organisation_organisation_name |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | PSIAS_2017_Compliant | 1 | Austria Card | Viet Children's Aegis |
| 2 | ROL-2016 | Adaptive Framework D | Non_Compliant | 2 | American International Group | Switch Card Services Ltd. |
| 3 | ROL-2020 | Primary Protocol | Under_Review | 3 | GitHub Inc. | Virgin Group |
| 4 | ROL-2024 | Composite Programme | PSIAS_2017_Compliant | 4 | Staples Inc. | Whirlpool Corporation |

The view `v_internal_audit_role_public_service_organisation` answers the question: which internal audit role is assigned to which public service organisation, and what is the compliance posture of that role? By joining `internal_audit_roles` to `public_service_organisations` on the organisation identifier, the view surfaces the role identifier, title, and compliance status alongside the organisation's internal ID and name. For example, the first row shows that role `ROL-2012` ("Distributed Standard"), which holds a `PSIAS_2017_Compliant` status, is assigned to the organisation identified as "Austria Card" (officially "Viet Children's Aegis"). The second row reveals that role `ROL-2016` ("Adaptive Framework D"), marked `Non_Compliant`, is linked to "American International Group" (operating as "Switch Card Services Ltd."). This view enables practitioners to quickly assess whether compliance gaps in audit roles correlate with specific organisational assignments.

**View `v_internal_audit_role_governance_framework`**

```sql
CREATE VIEW v_internal_audit_role_governance_framework AS
SELECT a.internal_audit_role_id, a.role_identifier, a.role_title, a.standard_compliance_status, b.governance_framework_id AS framework_governance_framework_id, b.framework_id AS framework_framework_id, b.framework_name AS framework_framework_name
FROM internal_audit_roles a JOIN governance_frameworks b ON a.governance_framework_id = b.governance_framework_id;
```

| internal_audit_role_id | role_identifier | role_title | standard_compliance_status | framework_governance_framework_id | framework_framework_id | framework_framework_name |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | PSIAS_2017_Compliant | 1000 | lu_tax_code_template_m11 | Adaptive Corridor |
| 2 | ROL-2016 | Adaptive Framework D | Non_Compliant | 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series |
| 3 | ROL-2020 | Primary Protocol | Under_Review | 1002 | 8843756 | Composite Assessment D |
| 4 | ROL-2024 | Composite Programme | PSIAS_2017_Compliant | 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey |

The view `v_internal_audit_role_governance_framework` addresses the question: how do internal audit roles map to the governance frameworks that define their operating parameters? This join connects `internal_audit_roles` to `governance_frameworks`, exposing the role's identifier, title, and compliance status alongside the framework's name, version, compliance score, and risk assessment frequency. A practitioner consulting this view can determine, for instance, whether a role rated at 15.95 performance (ROL-2012) operates under a framework with a compliance score of 21.95 and an Annual risk assessment cadence. This alignment data is essential for evaluating whether governance frameworks provide adequate structure for the audit roles they oversee.

**View `v_public_service_organisation_internal_audit_role`**

```sql
CREATE VIEW v_public_service_organisation_internal_audit_role AS
SELECT a.id, a.organisation_id, a.organisation_name, a.jurisdiction, b.internal_audit_role_id AS role_internal_audit_role_id, b.role_identifier AS role_role_identifier, b.role_title AS role_role_title
FROM public_service_organisations a JOIN internal_audit_roles b ON a.internal_audit_role_id = b.internal_audit_role_id;
```

| id | organisation_id | organisation_name | jurisdiction | role_internal_audit_role_id | role_role_identifier | role_role_title |
|---|---|---|---|---|---|---|
| 1 | Austria Card | Viet Children's Aegis | regional-jurisdic-30 | 1 | ROL-2012 | Distributed Standard |
| 2 | American International Group | Switch Card Services Ltd. | legacy-jurisdic-31 | 2 | ROL-2016 | Adaptive Framework D |
| 3 | GitHub Inc. | Virgin Group | compact-jurisdic-32 | 3 | ROL-2020 | Primary Protocol |
| 4 | Staples Inc. | Whirlpool Corporation | composite-jurisdic-33 | 4 | ROL-2024 | Composite Programme |

The view `v_public_service_organisation_internal_audit_role` inverts the perspective of the first view, answering: for each public service organisation, what is the associated internal audit role and its defining characteristics? By joining from `public_service_organisations` to `internal_audit_roles`, the view presents the organisation's ID, name, jurisdiction, service type, and governance maturity level alongside the role's identifier, title, compliance status, and performance rating. The first row shows that organisation "Austria Card" (jurisdiction `regional-jurisdic-30`, service type `composite-service-81`, governance maturity level 47) is paired with role `ROL-2012` ("Distributed Standard"), which carries a `PSIAS_2017_Compliant` status and a performance rating of 15.95. This view supports organisational audits by placing the audit role's attributes in the context of the organisation's operational profile.

**View `v_public_service_organisation_audit_standard`**

```sql
CREATE VIEW v_public_service_organisation_audit_standard AS
SELECT a.id, a.organisation_id, a.organisation_name, a.jurisdiction, b.id AS standard_id, b.standard_id AS standard_standard_id, b.standard_name AS standard_standard_name
FROM public_service_organisations a JOIN audit_standards b ON a.audit_standard_id = b.id;
```

| id | organisation_id | organisation_name | jurisdiction | standard_id | standard_standard_id | standard_standard_name |
|---|---|---|---|---|---|---|
| 1 | Austria Card | Viet Children's Aegis | regional-jurisdic-30 | 1 | 7119764 | Compact Framework |
| 2 | American International Group | Switch Card Services Ltd. | legacy-jurisdic-31 | 2 | 9125617 | Legacy Protocol |
| 3 | GitHub Inc. | Virgin Group | compact-jurisdic-32 | 3 | 338526 | Regional Programme A |
| 4 | Staples Inc. | Whirlpool Corporation | composite-jurisdic-33 | 4 | 3717623 | Seasonal Standard |

The view `v_public_service_organisation_audit_standard` answers: which audit standard applies to each public service organisation, and what are the standard's compliance requirements? The join between `public_service_organisations` and `audit_standards` reveals the organisation's identity and governance maturity alongside the standard's name, issuing body, effective date, revision number, and compliance level. For example, the first row indicates that "Austria Card" (governance maturity level 47) is subject to the "Compact Framework" (`standard_id` 7119764), issued by `baseline-issuing-13`, with a `Mandatory` compliance level and revision number 24. The fourth row shows that "Whirlpool Corporation" (governance maturity level 74) follows the "Seasonal Standard" (`standard_id` 3717623), also `Mandatory`, but with a higher revision number of 48. This view is critical for compliance officers who need to verify that each organisation is operating under the correct standard and revision.

**View `v_public_service_organisation_audit_committee`**

```sql
CREATE VIEW v_public_service_organisation_audit_committee AS
SELECT a.id, a.organisation_id, a.organisation_name, a.jurisdiction, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name, b.establishment_date AS committee_establishment_date
FROM public_service_organisations a JOIN audit_committees b ON a.committee_id = b.committee_id;
```

| id | organisation_id | organisation_name | jurisdiction | committee_committee_id | committee_committee_name | committee_establishment_date |
|---|---|---|---|---|---|---|
| 1 | Austria Card | Viet Children's Aegis | regional-jurisdic-30 | PHR-98 | Composite Cluster | 2024-07-11 |
| 2 | American International Group | Switch Card Services Ltd. | legacy-jurisdic-31 | L785 | Compact Review A | 2025-12-22 |
| 3 | GitHub Inc. | Virgin Group | compact-jurisdic-32 | 7119774 | Legacy Initiative | 2022-05-06 |
| 4 | Staples Inc. | Whirlpool Corporation | composite-jurisdic-33 | 1186094 | Regional Model | 2023-10-17 |

The view `v_public_service_organisation_audit_committee` addresses the question: which audit committee oversees each public service organisation, and what are the committee's structural characteristics? By joining `public_service_organisations` to `audit_committees`, the view presents the organisation's details alongside the committee's name, establishment date, meeting frequency, member count, and independence level. The first row shows that "Austria Card" is overseen by the "Composite Cluster" committee (`PHR-98`), established on 2024-07-11, meeting Monthly with 4 members at a `Fully_Independent` level. In contrast, the third row reveals that "Virgin Group" (operated by GitHub Inc.) is overseen by the "Legacy Initiative" committee (`7119774`), which meets Annually with 9 members but is classified as `Not_Independent`. This view enables governance reviewers to assess whether committee independence levels are appropriate for the organisations they supervise.

**View `v_audit_standard_public_service_organisation`**

```sql
CREATE VIEW v_audit_standard_public_service_organisation AS
SELECT a.id, a.standard_id, a.standard_name, a.issuing_body, b.id AS organisation_id, b.organisation_id AS organisation_organisation_id, b.organisation_name AS organisation_organisation_name
FROM audit_standards a JOIN public_service_organisations b ON a.public_service_organisation_id = b.id;
```

| id | standard_id | standard_name | issuing_body | organisation_id | organisation_organisation_id | organisation_organisation_name |
|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | baseline-issuing-13 | 1 | Austria Card | Viet Children's Aegis |
| 2 | 9125617 | Legacy Protocol | pilot-issuing-14 | 2 | American International Group | Switch Card Services Ltd. |
| 3 | 338526 | Regional Programme A | extended-issuing-15 | 3 | GitHub Inc. | Virgin Group |
| 4 | 3717623 | Seasonal Standard | integrated-issuing-16 | 4 | Staples Inc. | Whirlpool Corporation |

The view `v_audit_standard_public_service_organisation` inverts the previous standard view, answering: for each audit standard, which public service organisation is subject to it, and how mature is that organisation's governance? The join from `audit_standards` to `public_service_organisations` surfaces the standard's name, issuing body, effective date, revision number, and compliance level alongside the organisation's ID, name, jurisdiction, service type, and governance maturity level. The second row shows that the "Legacy Protocol" (`standard_id` 9125617), issued by `pilot-issuing-14` with a `Recommended` compliance level, applies to "American International Group" (jurisdiction `legacy-jurisdic-31`, service type `primary-service-82`, governance maturity level 56). This perspective is useful for standard-issuing bodies that need to understand the organisational diversity of their regulated entities.

**View `v_audit_committee_internal_audit_role`**

```sql
CREATE VIEW v_audit_committee_internal_audit_role AS
SELECT a.committee_id, a.committee_name, a.establishment_date, a.meeting_frequency, b.internal_audit_role_id AS role_internal_audit_role_id, b.role_identifier AS role_role_identifier, b.role_title AS role_role_title
FROM audit_committees a JOIN internal_audit_roles b ON a.internal_audit_role_id = b.internal_audit_role_id;
```

| committee_id | committee_name | establishment_date | meeting_frequency | role_internal_audit_role_id | role_role_identifier | role_role_title |
|---|---|---|---|---|---|---|
| PHR-98 | Composite Cluster | 2024-07-11 | Monthly | 1 | ROL-2012 | Distributed Standard |
| L785 | Compact Review A | 2025-12-22 | Quarterly | 2 | ROL-2016 | Adaptive Framework D |
| 7119774 | Legacy Initiative | 2022-05-06 | Annually | 3 | ROL-2020 | Primary Protocol |
| 1186094 | Regional Model | 2023-10-17 | Monthly | 4 | ROL-2024 | Composite Programme |

The view `v_audit_committee_internal_audit_role` answers: which internal audit role does each audit committee oversee, and what is the role's compliance and performance profile? The join between `audit_committees` and `internal_audit_roles` presents the committee's name, meeting frequency, member count, and independence level alongside the role's identifier, title, compliance status, contracting organisation, and performance rating. The first row shows that the "Composite Cluster" committee (`PHR-98`), which meets Monthly with 4 members at a `Fully_Independent` level, oversees role `ROL-2012` ("Distributed Standard"), a `PSIAS_2017_Compliant` role contracted to Litton Industries with a performance rating of 15.95. The third row reveals that the "Legacy Initiative" committee (`7119774`), classified as `Not_Independent`, oversees role `ROL-2020` ("Primary Protocol"), which is `Under_Review` and contracted to Singapore General Hospital with a performance rating of 21.85. This view is essential for evaluating whether committee independence correlates with audit role compliance.

**View `v_audit_committee_public_service_organisation`**

```sql
CREATE VIEW v_audit_committee_public_service_organisation AS
SELECT a.committee_id, a.committee_name, a.establishment_date, a.meeting_frequency, b.id AS organisation_id, b.organisation_id AS organisation_organisation_id, b.organisation_name AS organisation_organisation_name
FROM audit_committees a JOIN public_service_organisations b ON a.public_service_organisation_id = b.id;
```

| committee_id | committee_name | establishment_date | meeting_frequency | organisation_id | organisation_organisation_id | organisation_organisation_name |
|---|---|---|---|---|---|---|
| PHR-98 | Composite Cluster | 2024-07-11 | Monthly | 1 | Austria Card | Viet Children's Aegis |
| L785 | Compact Review A | 2025-12-22 | Quarterly | 2 | American International Group | Switch Card Services Ltd. |
| 7119774 | Legacy Initiative | 2022-05-06 | Annually | 3 | GitHub Inc. | Virgin Group |
| 1186094 | Regional Model | 2023-10-17 | Monthly | 4 | Staples Inc. | Whirlpool Corporation |

The view `v_audit_committee_public_service_organisation` addresses the question: which public service organisation does each audit committee oversee, and what are the organisation's operational and governance characteristics? By joining `audit_committees` to `public_service_organisations`, the view presents the committee's details alongside the organisation's ID, name, jurisdiction, service type, annual budget, and governance maturity level. The second row shows that the "Compact Review A" committee (`L785`), meeting Quarterly with 17 members at a `Partially_Independent` level, oversees "American International Group" (jurisdiction `legacy-jurisdic-31`, service type `primary-service-82`, annual budget 76,784, governance maturity level 56). The fourth row reveals that the "Regional Model" committee (`1186094`), meeting Monthly with 0 members at a `Fully_Independent` level, oversees "Whirlpool Corporation" (jurisdiction `composite-jurisdic-33`, service type `distributed-service-84`, annual budget 175,434, governance maturity level 74). This view supports resource allocation decisions by linking committee capacity to organisational scale and complexity.

**View `v_governance_framework_internal_audit_role`**

```sql
CREATE VIEW v_governance_framework_internal_audit_role AS
SELECT a.governance_framework_id, a.framework_id, a.framework_name, a.version, b.internal_audit_role_id AS role_internal_audit_role_id, b.role_identifier AS role_role_identifier, b.role_title AS role_role_title
FROM governance_frameworks a JOIN internal_audit_roles b ON a.internal_audit_role_id = b.internal_audit_role_id;
```

| governance_framework_id | framework_id | framework_name | version | role_internal_audit_role_id | role_role_identifier | role_role_title |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | seasonal-version-71 | 1 | ROL-2012 | Distributed Standard |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | regional-version-72 | 2 | ROL-2016 | Adaptive Framework D |
| 1002 | 8843756 | Composite Assessment D | legacy-version-73 | 3 | ROL-2020 | Primary Protocol |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | compact-version-74 | 4 | ROL-2024 | Composite Programme |

The view `v_governance_framework_internal_audit_role` answers: which internal audit role operates under each governance framework, and how does the framework's compliance score and risk assessment frequency align with the role's performance? The join from `governance_frameworks` to `internal_audit_roles` surfaces the framework's name, version, compliance score, and risk assessment frequency alongside the role's identifier, title, compliance status, contracting organisation, and performance rating. The first row shows that the "Adaptive Corridor" framework (`governance_framework_id` 1000), with a compliance score of 21.95 and Annual risk assessment frequency, governs role `ROL-2012` ("Distributed Standard"), a `PSIAS_2017_Compliant` role with a performance rating of 15.95. The fourth row reveals that the "Compact Survey" framework (`governance_framework_id` 1003), with a higher compliance score of 30.80 and Annual risk assessment frequency, governs role `ROL-2024` ("Composite Programme"), also `PSIAS_2017_Compliant` but with a higher performance rating of 24.80. This view helps practitioners evaluate whether framework design supports audit role effectiveness.

**View `v_governance_framework_public_service_organisation`**

```sql
CREATE VIEW v_governance_framework_public_service_organisation AS
SELECT a.governance_framework_id, a.framework_id, a.framework_name, a.version, b.id AS organisation_id, b.organisation_id AS organisation_organisation_id, b.organisation_name AS organisation_organisation_name
FROM governance_frameworks a JOIN public_service_organisations b ON a.public_service_organisation_id = b.id;
```

| governance_framework_id | framework_id | framework_name | version | organisation_id | organisation_organisation_id | organisation_organisation_name |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | seasonal-version-71 | 1 | Austria Card | Viet Children's Aegis |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | regional-version-72 | 2 | American International Group | Switch Card Services Ltd. |
| 1002 | 8843756 | Composite Assessment D | legacy-version-73 | 3 | GitHub Inc. | Virgin Group |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | compact-version-74 | 4 | Staples Inc. | Whirlpool Corporation |

The view `v_governance_framework_public_service_organisation` addresses the question: which public service organisation operates under each governance framework, and how do the framework's compliance score and risk assessment frequency relate to the organisation's governance maturity? By joining `governance_frameworks` to `public_service_organisations`, the view presents the framework's name, version, compliance score, and risk assessment frequency alongside the organisation's ID, name, jurisdiction, service type, annual budget, and governance maturity level. The first row shows that the "Adaptive Corridor" framework (compliance score 21.95, Annual risk assessment) governs "Austria Card" (jurisdiction `regional-jurisdic-30`, service type `composite-service-81`, annual budget 44,248, governance maturity level 47). The fourth row reveals that the "Compact Survey" framework (compliance score 30.80, Annual risk assessment) governs "Whirlpool Corporation" (jurisdiction `composite-jurisdic-33`, service type `distributed-service-84`, annual budget 175,434, governance maturity level 74). This view enables strategic planners to assess whether governance frameworks are appropriately calibrated to the maturity and scale of the organisations they oversee.

## Synthesis

The five base tables and ten joined views together form a comprehensive record of how public service organisations structure their audit and governance functions. Internal audit roles provide the operational units of authority, each with a defined compliance status and performance rating. Public service organisations anchor these roles within specific jurisdictions, service types, and maturity levels. Audit standards set the compliance baselines, ranging from Mandatory to Best_Practice, while audit committees provide the oversight mechanism, with independence levels that vary from Fully to Not Independent. Governance frameworks tie everything together, establishing compliance scores and risk assessment frequencies that shape the operating environment. The joined views make these relationships explicit, allowing practitioners to trace a single audit role through its organisational assignment, its governing standard, its supervising committee, and its framework context. This interconnected structure supports both granular compliance checks and strategic governance reviews, ensuring that every layer of the ecosystem can be examined in isolation or in concert with the others.