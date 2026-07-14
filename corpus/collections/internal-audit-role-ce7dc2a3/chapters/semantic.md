## Ontology-Grounded Relational Modelling of Public Service Audit Governance

The domain under examination concerns the governance architecture of public service organisations, specifically how internal audit roles, audit standards, audit committees, and governance frameworks interlock to form a compliance ecosystem. Each organisation—such as Viet Children's Aegis, a regional-jurisdic-30 entity with an annual budget of 44,244, or Switch Card Services Ltd., a legacy-jurisdic-31 organisation operating under primary-service-82—maintains a structured portfolio of audit artefacts. The relational schema captures these artefacts as five normalised base tables, linked by foreign keys that encode cardinality-bounded relationships, and materialises analytical views that reconstruct domain facts through controlled joins. The following sections describe the entity types, their attributes, the foreign-key topology, and the view-level reconstructions that answer concrete governance questions.

### Internal Audit Roles

**Table `internal_audit_roles`**

| internal_audit_role_id | role_identifier | role_title | standard_compliance_status | contracting_organisation | shared_service_flag | last_review_date | performance_rating | public_service_organisation_id | governance_framework_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | PSIAS_2017_Compliant | Litton Industries | false | 2022-09-03T08:24:00 | 15.95 | 1 | 1000 |
| 2 | ROL-2016 | Adaptive Framework D | Non_Compliant | Wikimedia Foundation Inc. | true | 2023-02-14T15:41:00 | 18.90 | 2 | 1001 |
| 3 | ROL-2020 | Primary Protocol | Under_Review | Singapore General Hospital | false | 2024-07-25T22:58:00 | 21.85 | 3 | 1002 |
| 4 | ROL-2024 | Composite Programme | PSIAS_2017_Compliant | National Institute of Standards and Technology | true | 2025-12-09T05:15:00 | 24.80 | 4 | 1003 |

The `internal_audit_roles` table is the central entity in the audit governance ontology. Each row represents a distinct audit role, identified by a surrogate key `internal_audit_role_id` (values 1 through 4) and a human-readable `role_identifier` such as `ROL-2012` or `ROL-2024`. The `role_title` column carries descriptive labels like "Distributed Standard" or "Composite Programme," while `standard_compliance_status` records the compliance posture—`PSIAS_2017_Compliant`, `Non_Compliant`, or `Under_Review`. The `contracting_organisation` column names the entity that commissioned the role (Litton Industries, Wikimedia Foundation Inc., Singapore General Hospital, National Institute of Standards and Technology), and `shared_service_flag` is a boolean indicating whether the role is shared across multiple organisations. Temporal and quality metadata are captured in `last_review_date` (e.g., `2022-09-03T08:24:00`) and `performance_rating` (a continuous measure ranging from 15.95 to 24.80). Two foreign keys anchor the role to the broader ontology: `public_service_organisation_id` references `public_service_organisations.id`, and `governance_framework_id` references `governance_frameworks.governance_framework_id`. These links enforce that every audit role belongs to exactly one public service organisation and one governance framework, establishing a many-to-one cardinality from roles to both parent entities.

### Public Service Organisations

**Table `public_service_organisations`**

| id | organisation_id | organisation_name | jurisdiction | establishment_date | service_type | annual_budget | governance_maturity_level | internal_audit_role_id | audit_standard_id | committee_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Austria Card | Viet Children's Aegis | regional-jurisdic-30 | 2024-07-11 | composite-service-81 | 44,248 | 47 | 1 | 1 | PHR-98 |
| 2 | American International Group | Switch Card Services Ltd. | legacy-jurisdic-31 | 2025-12-22 | primary-service-82 | 76,784 | 56 | 2 | 2 | L785 |
| 3 | GitHub Inc. | Virgin Group | compact-jurisdic-32 | 2022-05-06 | adaptive-service-83 | 41,373 | 65 | 3 | 3 | 7119774 |
| 4 | Staples Inc. | Whirlpool Corporation | composite-jurisdic-33 | 2023-10-17 | distributed-service-84 | 175,434 | 74 | 4 | 4 | 1186094 |

The `public_service_organisations` table models the organisational entities themselves. Each row is identified by a surrogate `id` (1–4) and carries a business-level `organisation_id` (e.g., `Austria Card`, `American International Group`) alongside a display `organisation_name` (e.g., `Viet Children's Aegis`, `Switch Card Services Ltd.`). The `jurisdiction` column encodes the regulatory scope—`regional-jurisdic-30`, `legacy-jurisdic-31`, `compact-jurisdic-32`, `composite-jurisdic-33`—while `establishment_date` records when the organisation was founded. The `service_type` column (values like `composite-service-81`, `primary-service-82`) classifies the nature of services delivered. Financial and maturity metadata include `annual_budget` (ranging from 41,373 to 175,434) and `governance_maturity_level` (47 to 74). Three foreign keys connect the organisation to its audit artefacts: `internal_audit_role_id` references `internal_audit_roles.internal_audit_role_id`, `audit_standard_id` references `audit_standards.id`, and `committee_id` references `audit_committees.committee_id`. Each organisation thus holds exactly one internal audit role, one audit standard, and one audit committee, enforcing a one-to-one cardinality from organisation to each artefact type.

### Audit Standards

**Table `audit_standards`**

| id | standard_id | standard_name | issuing_body | effective_date | revision_number | compliance_level | public_service_organisation_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | baseline-issuing-13 | 2023-02-14 | 24 | Mandatory | 1 | 2025-01-01 00:14:00 |
| 2 | 9125617 | Legacy Protocol | pilot-issuing-14 | 2024-07-25 | 32 | Recommended | 2 | 2025-02-06 03:14:00 |
| 3 | 338526 | Regional Programme A | extended-issuing-15 | 2025-12-09 | 40 | Best_Practice | 3 | 2025-03-11 06:14:00 |
| 4 | 3717623 | Seasonal Standard | integrated-issuing-16 | 2022-05-20 | 48 | Mandatory | 4 | 2025-04-16 09:14:00 |

The `audit_standards` table captures the normative frameworks against which audit activities are evaluated. Each standard is identified by a surrogate `id` (1–4) and a business `standard_id` (e.g., `7119764`, `9125617`). The `standard_name` column carries human-readable labels such as "Compact Framework" or "Legacy Protocol," while `issuing_body` names the authority (e.g., `baseline-issuing-13`, `pilot-issuing-14`). The `effective_date` and `revision_number` columns (values 24 through 48) track the standard's lifecycle. The `compliance_level` column classifies the standard's mandatory nature—`Mandatory`, `Recommended`, or `Best_Practice`. A foreign key `public_service_organisation_id` references `public_service_organisations.id`, establishing that each standard is associated with exactly one public service organisation. This many-to-one relationship means multiple standards could theoretically be linked to the same organisation, though the current data shows a one-to-one mapping.

### Audit Committees

**Table `audit_committees`**

| committee_id | committee_name | establishment_date | meeting_frequency | member_count | independence_level | internal_audit_role_id | public_service_organisation_id |
|---|---|---|---|---|---|---|---|
| PHR-98 | Composite Cluster | 2024-07-11 | Monthly | 4 | Fully_Independent | 1 | 1 |
| L785 | Compact Review A | 2025-12-22 | Quarterly | 17 | Partially_Independent | 2 | 2 |
| 7119774 | Legacy Initiative | 2022-05-06 | Annually | 9 | Not_Independent | 3 | 3 |
| 1186094 | Regional Model | 2023-10-17 | Monthly | 0 | Fully_Independent | 4 | 4 |

The `audit_committees` table models the governance bodies responsible for overseeing audit activities. Each committee is identified by a composite `committee_id` (e.g., `PHR-98`, `L785`, `7119774`, `1186094`) and carries a descriptive `committee_name` such as "Composite Cluster" or "Compact Review A." The `establishment_date` records when the committee was formed, while `meeting_frequency` (values `Monthly`, `Quarterly`, `Annually`) captures its operational cadence. The `member_count` column (0 to 17) indicates committee size, and `independence_level` classifies the committee's autonomy—`Fully_Independent`, `Partially_Independent`, or `Not_Independent`. Two foreign keys anchor the committee to the ontology: `internal_audit_role_id` references `internal_audit_roles.internal_audit_role_id`, and `public_service_organisation_id` references `public_service_organisations.id`. These links enforce that each committee is associated with exactly one audit role and one organisation, forming a many-to-one relationship from committees to both parent entities.

### Governance Frameworks

**Table `governance_frameworks`**

| governance_framework_id | framework_id | framework_name | version | last_updated | compliance_score | risk_assessment_frequency | internal_audit_role_id | public_service_organisation_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | seasonal-version-71 | 2023-06-17T17:27:00 | 21.95 | Annual | 1 | 1 |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | regional-version-72 | 2024-11-01T00:44:00 | 24.90 | Biannual | 2 | 2 |
| 1002 | 8843756 | Composite Assessment D | legacy-version-73 | 2025-04-12T07:01:00 | 27.85 | Quarterly | 3 | 3 |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | compact-version-74 | 2022-09-23T14:18:00 | 30.80 | Annual | 4 | 4 |

The `governance_frameworks` table represents the overarching governance structures within which audit activities operate. Each framework is identified by a surrogate `governance_framework_id` (1000–1003) and a business `framework_id` (e.g., `lu_tax_code_template_m11`, `228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3`). The `framework_name` column carries labels such as "Adaptive Corridor" or "Primary Series," while `version` encodes the framework version (e.g., `seasonal-version-71`, `regional-version-72`). The `last_updated` timestamp (e.g., `2023-06-17T17:27:00`) tracks the most recent revision. The `compliance_score` column (21.95 to 30.80) provides a quantitative measure of framework compliance, and `risk_assessment_frequency` (values `Annual`, `Biannual`, `Quarterly`) captures how often risk assessments are conducted. Two foreign keys link the framework to the ontology: `internal_audit_role_id` references `internal_audit_roles.internal_audit_role_id`, and `public_service_organisation_id` references `public_service_organisations.id`. As with audit committees, these enforce a many-to-one relationship from frameworks to both audit roles and organisations.

### View: Internal Audit Role to Public Service Organisation

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

The view `v_internal_audit_role_public_service_organisation` reconstructs the relationship between an internal audit role and its parent public service organisation by joining `internal_audit_roles` on `public_service_organisation_id = public_service_organisations.id`. The result columns include the role's `internal_audit_role_id`, `role_identifier`, `role_title`, and `standard_compliance_status`, alongside the organisation's `id`, `organisation_id`, and `organisation_name`. This view answers the question: "Which public service organisation hosts a given internal audit role, and what is that role's compliance status?" For example, the row with `role_identifier` `ROL-2012` and `role_title` "Distributed Standard" shows that the role is `PSIAS_2017_Compliant` and is hosted by the organisation with `organisation_id` `Austria Card` and `organisation_name` `Viet Children's Aegis`. Similarly, `ROL-2016` ("Adaptive Framework D") is `Non_Compliant` and belongs to `American International Group` (displayed as `Switch Card Services Ltd.`). The view effectively denormalises the foreign-key link into a single flat row per role, enabling straightforward reporting on role–organisation pairings.

### View: Internal Audit Role to Governance Framework

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

The view `v_internal_audit_role_governance_framework` joins `internal_audit_roles` with `governance_frameworks` on `internal_audit_roles.governance_framework_id = governance_frameworks.governance_framework_id`. It exposes the role's identifying and compliance attributes alongside the framework's `governance_framework_id`, `framework_id`, `framework_name`, `version`, `last_updated`, `compliance_score`, and `risk_assessment_frequency`. This view answers: "Which governance framework governs a given internal audit role, and what is the framework's compliance posture?" The row for `ROL-2012` ("Distributed Standard") links to framework `lu_tax_code_template_m11` ("Adaptive Corridor", version `seasonal-version-71`), which has a `compliance_score` of 21.95 and an `Annual` risk assessment frequency. The row for `ROL-2024` ("Composite Programme") links to framework `ChIJm7V_gxFu5kcRAbqaOJHQUy0` ("Compact Survey", version `compact-version-74`), with a higher `compliance_score` of 30.80 and the same `Annual` assessment cadence. By flattening the role-to-framework link, this view supports comparative analysis of how different frameworks correlate with role compliance outcomes.

### View: Public Service Organisation to Internal Audit Role

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

The view `v_public_service_organisation_internal_audit_role` performs the inverse join of the first view, connecting `public_service_organisations` to `internal_audit_roles` via `public_service_organisations.internal_audit_role_id = internal_audit_roles.internal_audit_role_id`. It presents the organisation's `id`, `organisation_id`, `organisation_name`, `jurisdiction`, `establishment_date`, `service_type`, `annual_budget`, and `governance_maturity_level` alongside the role's `internal_audit_role_id`, `role_identifier`, `role_title`, `standard_compliance_status`, `contracting_organisation`, `shared_service_flag`, `last_review_date`, and `performance_rating`. This view answers: "What internal audit role does a given public service organisation maintain, and what are the role's operational characteristics?" For instance, the organisation with `organisation_id` `Austria Card` (`Viet Children's Aegis`, jurisdiction `regional-jurisdic-30`, budget 44,248, maturity level 47) maintains role `ROL-2012` ("Distributed Standard"), which is `PSIAS_2017_Compliant`, contracted to `Litton Industries`, not shared (`shared_service_flag = false`), last reviewed on `2022-09-03T08:24:00`, with a `performance_rating` of 15.95. The view enables organisational-level reporting that surfaces the full audit role profile alongside organisational metadata.

### View: Public Service Organisation to Audit Standard

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

The view `v_public_service_organisation_audit_standard` joins `public_service_organisations` with `audit_standards` on `public_service_organisations.audit_standard_id = audit_standards.id`. It exposes the organisation's core attributes alongside the standard's `standard_id`, `standard_name`, `issuing_body`, `effective_date`, `revision_number`, `compliance_level`, and `created_at`. This view answers: "Which audit standard applies to a given public service organisation, and what is the standard's regulatory classification?" The organisation `Viet Children's Aegis` (`Austria Card`) is governed by standard `7119764` ("Compact Framework", issued by `baseline-issuing-13`, effective `2023-02-14`, revision 24, classified as `Mandatory`). In contrast, `Switch Card Services Ltd.` (`American International Group`) follows standard `9125617` ("Legacy Protocol", issued by `pilot-issuing-14`, effective `2024-07-25`, revision 32, classified as `Recommended`). The view supports compliance reporting by surfacing the mandatory versus recommended nature of each organisation's governing standard alongside the organisation's own budget and maturity profile.

### View: Public Service Organisation to Audit Committee

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

The view `v_public_service_organisation_audit_committee` joins `public_service_organisations` with `audit_committees` on `public_service_organisations.committee_id = audit_committees.committee_id`. It presents the organisation's attributes alongside the committee's `committee_id`, `committee_name`, `establishment_date`, `meeting_frequency`, `member_count`, `independence_level`, `internal_audit_role_id`, and `public_service_organisation_id`. This view answers: "Which audit committee oversees a given public service organisation, and what is the committee's operational profile?" The organisation `Viet Children's Aegis` is overseen by committee `PHR-98` ("Composite Cluster"), established `2024-07-11`, meeting `Monthly`, with 4 members at `Fully_Independent` status. By contrast, `Virgin Group` (`GitHub Inc.`) is overseen by committee `7119774` ("Legacy Initiative"), established `2022-05-06`, meeting `Annually`, with 9 members classified as `Not_Independent`. The view enables governance oversight reporting, correlating committee independence levels with organisational maturity and budget metrics.

### View: Audit Standard to Public Service Organisation

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

The view `v_audit_standard_public_service_organisation` performs the inverse join of the previous view, connecting `audit_standards` to `public_service_organisations` via `audit_standards.public_service_organisation_id = public_service_organisations.id`. It presents the standard's `id`, `standard_id`, `standard_name`, `issuing_body`, `effective_date`, `revision_number`, `compliance_level`, and `created_at` alongside the organisation's `id`, `organisation_id`, `organisation_name`, `jurisdiction`, `establishment_date`, `service_type`, `annual_budget`, and `governance_maturity_level`. This view answers: "Which public service organisations are subject to a given audit standard, and what are their operational characteristics?" The standard `7119764` ("Compact Framework", `Mandatory`, issued by `baseline-issuing-13`) applies to `Viet Children's Aegis` (`Austria Card`), a regional-jurisdic-30 entity with budget 44,248 and governance maturity level 47. The standard `338526` ("Regional Programme A", `Best_Practice`, issued by `extended-issuing-15`) applies to `Virgin Group` (`GitHub Inc.`), a compact-jurisdic-32 entity with budget 41,373 and maturity level 65. This perspective is useful for standards bodies seeking to understand the reach and organisational diversity of their issued standards.

### View: Audit Committee to Internal Audit Role

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

The view `v_audit_committee_internal_audit_role` joins `audit_committees` with `internal_audit_roles` on `audit_committees.internal_audit_role_id = internal_audit_roles.internal_audit_role_id`. It exposes the committee's `committee_id`, `committee_name`, `establishment_date`, `meeting_frequency`, `member_count`, and `independence_level` alongside the role's `internal_audit_role_id`, `role_identifier`, `role_title`, `standard_compliance_status`, `contracting_organisation`, `shared_service_flag`, `last_review_date`, and `performance_rating`. This view answers: "Which internal audit role is overseen by a given audit committee, and what is the role's compliance and performance profile?" Committee `PHR-98` ("Composite Cluster", `Fully_Independent`, 4 members, `Monthly` meetings) oversees role `ROL-2012` ("Distributed Standard", `PSIAS_2017_Compliant`, contracted to `Litton Industries`, performance rating 15.95). Committee `L785` ("Compact Review A", `Partially_Independent`, 17 members, `Quarterly` meetings) oversees role `ROL-2016` ("Adaptive Framework D", `Non_Compliant`, contracted to `Wikimedia Foundation Inc.`, performance rating 18.90). The view supports governance analysis by correlating committee independence and size with the compliance status and performance ratings of the roles they oversee.

### View: Audit Committee to Public Service Organisation

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

The view `v_audit_committee_public_service_organisation` joins `audit_committees` with `public_service_organisations` on `audit_committees.public_service_organisation_id = public_service_organisations.id`. It presents the committee's attributes alongside the organisation's `id`, `organisation_id`, `organisation_name`, `jurisdiction`, `establishment_date`, `service_type`, `annual_budget`, and `governance_maturity_level`. This view answers: "Which public service organisation is overseen by a given audit committee, and what are the organisation's operational characteristics?" Committee `PHR-98` ("Composite Cluster", `Fully_Independent`) oversees `Viet Children's Aegis` (`Austria Card`), a regional-jurisdic-30 entity with budget 44,248 and maturity level 47. Committee `1186094` ("Regional Model", `Fully_Independent`, 0 members, `Monthly` meetings) oversees `Whirlpool Corporation` (`Staples Inc.`), a composite-jurisdic-33 entity with budget 175,434 and maturity level 74. The view enables oversight reporting that correlates committee characteristics with organisational scale and maturity.

### View: Governance Framework to Internal Audit Role

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

The view `v_governance_framework_internal_audit_role` joins `governance_frameworks` with `internal_audit_roles` on `governance_frameworks.governance_framework_id = internal_audit_roles.governance_framework_id`. It exposes the framework's `governance_framework_id`, `framework_id`, `framework_name`, `version`, `last_updated`, `compliance_score`, and `risk_assessment_frequency` alongside the role's `internal_audit_role_id`, `role_identifier`, `role_title`, `standard_compliance_status`, `contracting_organisation`, `shared_service_flag`, `last_review_date`, and `performance_rating`. This view answers: "Which internal audit role operates under a given governance framework, and what is the framework's compliance posture?" Framework `lu_tax_code_template_m11` ("Adaptive Corridor", version `seasonal-version-71`, compliance score 21.95, `Annual` risk assessment) governs role `ROL-2012` ("Distributed Standard", `PSIAS_2017_Compliant`, performance rating 15.95). Framework `8843756` ("Composite Assessment D", version `legacy-version-73`, compliance score 27.85, `Quarterly` risk assessment) governs role `ROL-2020` ("Primary Protocol", `Under_Review`, performance rating 21.85). The view supports framework-level analysis, revealing how different risk assessment frequencies and compliance scores correlate with the compliance status and performance of the roles they govern.

### View: Governance Framework to Public Service Organisation

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

The view `v_governance_framework_public_service_organisation` joins `governance_frameworks` with `public_service_organisations` on `governance_frameworks.public_service_organisation_id = public_service_organisations.id`. It presents the framework's attributes alongside the organisation's `id`, `organisation_id`, `organisation_name`, `jurisdiction`, `establishment_date`, `service_type`, `annual_budget`, and `governance_maturity_level`. This view answers: "Which public service organisation operates under a given governance framework, and what are the organisation's characteristics?" Framework `lu_tax_code_template_m11` ("Adaptive Corridor", compliance score 21.95) governs `Viet Children's Aegis` (`Austria Card`), a regional-jurisdic-30 entity with budget 44,248 and maturity level 47. Framework `ChIJm7V_gxFu5kcRAbqaOJHQUy0` ("Compact Survey", compliance score 30.80) governs `Whirlpool Corporation` (`Staples Inc.`), a composite-jurisdic-33 entity with budget 175,434 and maturity level 74. The view enables strategic reporting that correlates framework compliance scores with organisational maturity and budget, supporting resource allocation and governance improvement decisions.

### Synthesis

The relational schema for public service audit governance is built on five normalised base tables that capture the core entity types—internal audit roles, public service organisations, audit standards, audit committees, and governance frameworks—each with its own surrogate key and a set of domain-specific attributes. Foreign keys enforce cardinality-bounded relationships: each audit role belongs to exactly one organisation and one framework; each organisation holds exactly one role, one standard, and one committee; each committee and framework links back to one role and one organisation. The ten materialised views reconstruct domain facts by joining these tables along their foreign-key edges, denormalising the relationships into flat result sets that answer concrete governance questions—from "which standard applies to this organisation?" to "how does committee independence correlate with role performance?"—using the concrete identifiers, names, and values that populate the underlying tables.