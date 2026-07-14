The governance data model captures the organizational architecture of a multi-unit enterprise where oversight committees, regulatory domains, individual members, and business units interact through a web of formalized relationships. At its core, the model distinguishes five entity types—governance committees, governance domains, governance members, business units, and governance policies—plus a junction table that resolves the many-to-many association between committees and members. Each entity is persisted in its own base table, and a collection of materialized views joins these tables to answer the analytical questions that domain stakeholders actually ask: which domain does a committee serve, which members belong to which unit, and which policies apply to which business unit. The following sections walk through the conceptual model, the normalization decisions that produced the relational schema, and the view definitions that reconstruct domain facts from the normalized tables.

## Entity Types and Base Tables

The foundation of the model consists of six base tables. The `governance_committees` table stores the oversight bodies themselves. Each row carries a surrogate primary key `id`, a human-readable `committee_name` such as "Composite Cluster" or "Regional Model", an `establishment_date` like `2024-07-11`, a `primary_objective` field (e.g., "primary-primary-58"), a boolean `is_cross_functional` flag, a `reporting_frequency` value such as "integrated-reportin-64", and a foreign key `governance_domain_id` that links the committee to its parent domain.

**Table `governance_committees`**

| id | committee_name | establishment_date | primary_objective | is_cross_functional | reporting_frequency | governance_domain_id |
|---|---|---|---|---|---|---|
| 1 | Composite Cluster | 2024-07-11 | primary-primary-58 | true | integrated-reportin-64 | 1 |
| 2 | Compact Review A | 2025-12-22 | adaptive-primary-59 | false | seasonal-reportin-65 | 2 |
| 3 | Legacy Initiative | 2022-05-06 | distributed-primary-60 | true | regional-reportin-66 | 3 |
| 4 | Regional Model | 2023-10-17 | baseline-primary-61 | false | legacy-reportin-67 | 4 |

The `governance_domains` table defines the regulatory or operational domains under which committees operate. Its primary key is `governance_domain_id`, and it stores a `domain_name` (e.g., "Regional Protocol"), a `domain_code` like `4716398`, a `regulatory_basis` such as "distributed-regulato-78", a boolean `is_mandatory` flag, and two foreign keys: `governance_committee_id` pointing back to a committee, and `unit_i_d` pointing to a business unit. The domain table thus sits at the intersection of committee oversight and business-unit accountability.

**Table `governance_domains`**

| governance_domain_id | domain_name | domain_code | regulatory_basis | is_mandatory | governance_committee_id | unit_i_d |
|---|---|---|---|---|---|---|
| 1 | Regional Protocol | 4716398 | distributed-regulato-78 | true | 1 | UNI-2698 |
| 2 | Seasonal Programme D | 605967 | baseline-regulato-79 | false | 2 | UNI-2702 |
| 3 | Integrated Standard | 16375765 | pilot-regulato-80 | true | 3 | UNI-2706 |
| 4 | Extended Framework | 0471948470 | extended-regulato-81 | false | 4 | UNI-2710 |

The `governance_members` table records individual people who participate in governance activities. Its surrogate key is `id`, and it stores a `member_i_d` identifier (e.g., "MEM-2021"), a `role_title` such as "Distributed Standard", a boolean `is_external` flag, a `certification_type` like "distributed-certific-96", an `appointment_date` such as `2022-05-03`, and two foreign keys: `governance_committee_id` and `unit_i_d`. A member is thus associated with both a committee and a business unit.

**Table `governance_members`**

| id | member_i_d | role_title | is_external | certification_type | appointment_date | governance_committee_id | unit_i_d |
|---|---|---|---|---|---|---|---|
| 100 | MEM-2021 | Distributed Standard | true | distributed-certific-96 | 2022-05-03 | 1 | UNI-2698 |
| 101 | MEM-2023 | Adaptive Framework D | false | baseline-certific-97 | 2023-10-14 | 2 | UNI-2702 |
| 102 | MEM-2025 | Primary Protocol | true | pilot-certific-98 | 2024-03-25 | 3 | UNI-2706 |
| 103 | MEM-2027 | Composite Programme | false | extended-certific-99 | 2025-08-09 | 4 | UNI-2710 |

The `business_units` table captures the organizational units of the enterprise. Its primary key is `unit_i_d` (e.g., "UNI-2698"), and it stores a `unit_name` such as "Compact Series", a `unit_type` like "composite-unit-45", a boolean `is_subsidiary` flag, a `last_audit_date` such as `2023-10-23`, and two foreign keys: `governance_member_id` and `governance_committee_id`. The business unit table therefore links each unit to a specific member and committee, completing the triangle of member–committee–unit accountability.

**Table `business_units`**

| unit_i_d | unit_name | unit_type | is_subsidiary | last_audit_date | governance_member_id | governance_committee_id |
|---|---|---|---|---|---|---|
| UNI-2698 | Compact Series | composite-unit-45 | false | 2023-10-23 | 100 | 1 |
| UNI-2702 | Legacy Assessment | primary-unit-46 | true | 2024-03-07 | 101 | 2 |
| UNI-2706 | Regional Survey A | adaptive-unit-47 | false | 2025-08-18 | 102 | 3 |
| UNI-2710 | Seasonal Corridor | distributed-unit-48 | true | 2022-01-02 | 103 | 4 |

The `governance_policies` table stores the policies that govern compliance within the enterprise. Its surrogate key is `id`, and it stores a `policy_i_d` identifier (e.g., "POL-2680"), a `policy_title` such as "Baseline Initiative D", an `effective_date` like `2023-02-14`, an `issuing_authority` field (e.g., "extended-issuing-33"), a `compliance_status` value such as "compact-complian-56", and two foreign keys: `unit_i_d` pointing to the business unit to which the policy applies, and `governance_domain_id` linking the policy to its regulatory domain.

**Table `governance_policies`**

| id | policy_i_d | policy_title | effective_date | issuing_authority | compliance_status | unit_i_d | governance_domain_id |
|---|---|---|---|---|---|---|---|
| 1 | POL-2680 | Baseline Initiative D | 2023-02-14 | extended-issuing-33 | compact-complian-56 | UNI-2698 | 1 |
| 2 | POL-2685 | Distributed Model | 2024-07-25 | integrated-issuing-34 | composite-complian-57 | UNI-2702 | 2 |
| 3 | POL-2690 | Adaptive Cluster | 2025-12-09 | seasonal-issuing-35 | primary-complian-58 | UNI-2706 | 3 |
| 4 | POL-2695 | Primary Review A | 2022-05-20 | regional-issuing-36 | adaptive-complian-59 | UNI-2710 | 4 |

Finally, the `committees_members` table is a junction (associative) table that resolves the many-to-many relationship between committees and members. It has no surrogate key of its own; instead, the composite of `governance_committee_id` and `governance_member_id` serves as the primary key. Each row asserts that a particular member participates in a particular committee. For example, member `100` participates in both committee `1` and committee `4`, while member `101` participates in committees `1` and `2`. This table is the only one that does not appear as a source in any view definition; it exists purely to enforce the cardinality-bounded many-to-many relationship at the schema level.

**Table `committees_members`**

| governance_committee_id | governance_member_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Foreign-Key Relationships and Normalization

The foreign-key topology of the model can be described as a set of directed edges from child tables to parent tables. The `governance_committees` table references `governance_domains` through `governance_domain_id`, establishing that each committee belongs to exactly one domain. The `governance_domains` table, in turn, references `governance_committees` through `governance_committee_id` and `business_units` through `unit_i_d`, creating a bidirectional linkage between domains and committees and anchoring each domain to a specific business unit. The `governance_members` table references both `governance_committees` (via `governance_committee_id`) and `business_units` (via `unit_i_d`), meaning each member is assigned to one committee and one unit. The `business_units` table references `governance_members` (via `governance_member_id`) and `governance_committees` (via `governance_committee_id`), completing the triangle. The `governance_policies` table references `business_units` (via `unit_i_d`) and `governance_domains` (via `governance_domain_id`), tying each policy to both a business unit and a regulatory domain.

This design normalizes the data into fifth normal form with respect to the observed relationships: each fact—committee membership, domain assignment, policy applicability—is stored in exactly one place, and the junction table `committees_members` is the sole mechanism for expressing the many-to-many association between committees and members. The foreign keys enforce referential integrity, ensuring that a committee cannot reference a non-existent domain, a member cannot be assigned to a non-existent committee, and a policy cannot apply to a non-existent business unit.

## Views: Reconstructing Domain Facts

The materialized views join the base tables to answer the specific analytical questions that governance stakeholders need. Each view is described below with its purpose and a concrete example drawn from the data.

### Committee-to-Domain Views

The view `vw_governance_committee_governance_domain` joins `governance_committees` to `governance_domains` on the `governance_domain_id` foreign key, producing a row for each committee that includes the committee's name, establishment date, and the domain it serves. For example, the "Composite Cluster" committee (id `1`) is joined to the "Regional Protocol" domain (domain_id `1`), answering the question: which regulatory domain does this committee oversee?

**View `vw_governance_committee_governance_domain`**

```sql
CREATE VIEW vw_governance_committee_governance_domain AS
SELECT a.id, a.committee_name, a.establishment_date, a.primary_objective, b.governance_domain_id AS domain_governance_domain_id, b.domain_name AS domain_domain_name, b.domain_code AS domain_domain_code
FROM governance_committees a JOIN governance_domains b ON a.governance_domain_id = b.governance_domain_id;
```

| id | committee_name | establishment_date | primary_objective | domain_governance_domain_id | domain_domain_name | domain_domain_code |
|---|---|---|---|---|---|---|
| 1 | Composite Cluster | 2024-07-11 | primary-primary-58 | 1 | Regional Protocol | 4716398 |
| 2 | Compact Review A | 2025-12-22 | adaptive-primary-59 | 2 | Seasonal Programme D | 605967 |
| 3 | Legacy Initiative | 2022-05-06 | distributed-primary-60 | 3 | Integrated Standard | 16375765 |
| 4 | Regional Model | 2023-10-17 | baseline-primary-61 | 4 | Extended Framework | 0471948470 |

The view `vw_governance_domain_governance_committee` performs the inverse join, starting from `governance_domains` and joining to `governance_committees` via `governance_committee_id`. It answers the complementary question: which committee is responsible for this domain? The "Regional Protocol" domain (domain_id `1`) is linked to committee `1`, the "Compact Review A" committee, demonstrating the bidirectional nature of the domain–committee relationship.

**View `vw_governance_domain_governance_committee`**

```sql
CREATE VIEW vw_governance_domain_governance_committee AS
SELECT a.governance_domain_id, a.domain_name, a.domain_code, a.regulatory_basis, b.id AS committee_id, b.committee_name AS committee_committee_name, b.establishment_date AS committee_establishment_date
FROM governance_domains a JOIN governance_committees b ON a.governance_committee_id = b.id;
```

| governance_domain_id | domain_name | domain_code | regulatory_basis | committee_id | committee_committee_name | committee_establishment_date |
|---|---|---|---|---|---|---|
| 1 | Regional Protocol | 4716398 | distributed-regulato-78 | 1 | Composite Cluster | 2024-07-11 |
| 2 | Seasonal Programme D | 605967 | baseline-regulato-79 | 2 | Compact Review A | 2025-12-22 |
| 3 | Integrated Standard | 16375765 | pilot-regulato-80 | 3 | Legacy Initiative | 2022-05-06 |
| 4 | Extended Framework | 0471948470 | extended-regulato-81 | 4 | Regional Model | 2023-10-17 |

### Committee-to-Member Views

The view `vw_governance_committee_governance_member_detail` joins `governance_committees` to `governance_members` through the `committees_members` junction table, using `governance_committee_id` as the join key. It produces a detailed row for each committee–member pairing, including the member's role title, external status, and certification type. For instance, committee `1` ("Composite Cluster") is joined to member `100` ("MEM-2021", role "Distributed Standard", external `true`, certified "distributed-certific-96") and also to member `101` ("MEM-2023", role "Adaptive Framework D", external `false`, certified "baseline-certific-97"), revealing that committee `1` has two members with different external statuses and certifications.

**View `vw_governance_committee_governance_member_detail`**

```sql
CREATE VIEW vw_governance_committee_governance_member_detail AS
SELECT a.id, a.committee_name, a.establishment_date, b.id AS member_id, b.member_i_d AS member_member_i_d, b.role_title AS member_role_title
FROM governance_committees a
  JOIN committees_members j ON j.governance_committee_id = a.id
  JOIN governance_members b ON b.id = j.governance_member_id;
```

| id | committee_name | establishment_date | member_id | member_member_i_d | member_role_title |
|---|---|---|---|---|---|
| 1 | Composite Cluster | 2024-07-11 | 100 | MEM-2021 | Distributed Standard |
| 1 | Composite Cluster | 2024-07-11 | 101 | MEM-2023 | Adaptive Framework D |
| 2 | Compact Review A | 2025-12-22 | 101 | MEM-2023 | Adaptive Framework D |
| 2 | Compact Review A | 2025-12-22 | 102 | MEM-2025 | Primary Protocol |
| 3 | Legacy Initiative | 2022-05-06 | 102 | MEM-2025 | Primary Protocol |
| 3 | Legacy Initiative | 2022-05-06 | 103 | MEM-2027 | Composite Programme |
| 4 | Regional Model | 2023-10-17 | 103 | MEM-2027 | Composite Programme |
| 4 | Regional Model | 2023-10-17 | 100 | MEM-2021 | Distributed Standard |

The view `vw_governance_member_governance_committee` performs the inverse join, starting from `governance_members` and joining to `governance_committees` via `governance_committee_id`. It answers the question: which committees does this member belong to? Member `100` appears in the output for committee `1` and committee `4`, confirming the many-to-many relationship captured by the `committees_members` junction table.

**View `vw_governance_member_governance_committee`**

```sql
CREATE VIEW vw_governance_member_governance_committee AS
SELECT a.id, a.member_i_d, a.role_title, a.is_external, b.id AS committee_id, b.committee_name AS committee_committee_name, b.establishment_date AS committee_establishment_date
FROM governance_members a JOIN governance_committees b ON a.governance_committee_id = b.id;
```

| id | member_i_d | role_title | is_external | committee_id | committee_committee_name | committee_establishment_date |
|---|---|---|---|---|---|---|
| 100 | MEM-2021 | Distributed Standard | true | 1 | Composite Cluster | 2024-07-11 |
| 101 | MEM-2023 | Adaptive Framework D | false | 2 | Compact Review A | 2025-12-22 |
| 102 | MEM-2025 | Primary Protocol | true | 3 | Legacy Initiative | 2022-05-06 |
| 103 | MEM-2027 | Composite Programme | false | 4 | Regional Model | 2023-10-17 |

### Domain-to-Business-Unit Views

The view `vw_governance_domain_business_unit` joins `governance_domains` to `business_units` on the `unit_i_d` foreign key. It answers the question: which business unit is associated with this domain? The "Regional Protocol" domain (domain_id `1`) is linked to business unit "UNI-2698" ("Compact Series"), while the "Seasonal Programme D" domain (domain_id `2`) is linked to "UNI-2702" ("Legacy Assessment"), showing a one-to-one domain-to-unit mapping in the current data.

**View `vw_governance_domain_business_unit`**

```sql
CREATE VIEW vw_governance_domain_business_unit AS
SELECT a.governance_domain_id, a.domain_name, a.domain_code, a.regulatory_basis, b.unit_i_d AS unit_unit_i_d, b.unit_name AS unit_unit_name, b.unit_type AS unit_unit_type
FROM governance_domains a JOIN business_units b ON a.unit_i_d = b.unit_i_d;
```

| governance_domain_id | domain_name | domain_code | regulatory_basis | unit_unit_i_d | unit_unit_name | unit_unit_type |
|---|---|---|---|---|---|---|
| 1 | Regional Protocol | 4716398 | distributed-regulato-78 | UNI-2698 | Compact Series | composite-unit-45 |
| 2 | Seasonal Programme D | 605967 | baseline-regulato-79 | UNI-2702 | Legacy Assessment | primary-unit-46 |
| 3 | Integrated Standard | 16375765 | pilot-regulato-80 | UNI-2706 | Regional Survey A | adaptive-unit-47 |
| 4 | Extended Framework | 0471948470 | extended-regulato-81 | UNI-2710 | Seasonal Corridor | distributed-unit-48 |

### Member-to-Business-Unit Views

The view `vw_governance_member_business_unit` joins `governance_members` to `business_units` via the `unit_i_d` foreign key. It answers the question: which business unit is this member assigned to? Member `100` ("MEM-2021") is linked to unit "UNI-2698" ("Compact Series"), and member `101` ("MEM-2023") is linked to unit "UNI-2702" ("Legacy Assessment"), establishing the member–unit assignment.

**View `vw_governance_member_business_unit`**

```sql
CREATE VIEW vw_governance_member_business_unit AS
SELECT a.id, a.member_i_d, a.role_title, a.is_external, b.unit_i_d AS unit_unit_i_d, b.unit_name AS unit_unit_name, b.unit_type AS unit_unit_type
FROM governance_members a JOIN business_units b ON a.unit_i_d = b.unit_i_d;
```

| id | member_i_d | role_title | is_external | unit_unit_i_d | unit_unit_name | unit_unit_type |
|---|---|---|---|---|---|---|
| 100 | MEM-2021 | Distributed Standard | true | UNI-2698 | Compact Series | composite-unit-45 |
| 101 | MEM-2023 | Adaptive Framework D | false | UNI-2702 | Legacy Assessment | primary-unit-46 |
| 102 | MEM-2025 | Primary Protocol | true | UNI-2706 | Regional Survey A | adaptive-unit-47 |
| 103 | MEM-2027 | Composite Programme | false | UNI-2710 | Seasonal Corridor | distributed-unit-48 |

The view `vw_business_unit_governance_member` performs the inverse join, starting from `business_units` and joining to `governance_members` via `governance_member_id`. It answers the question: which member is assigned to this business unit? Unit "UNI-2698" ("Compact Series") is linked to member `100`, and unit "UNI-2702" ("Legacy Assessment") is linked to member `101`, confirming the bidirectional member–unit relationship.

**View `vw_business_unit_governance_member`**

```sql
CREATE VIEW vw_business_unit_governance_member AS
SELECT a.unit_i_d, a.unit_name, a.unit_type, a.is_subsidiary, b.id AS member_id, b.member_i_d AS member_member_i_d, b.role_title AS member_role_title
FROM business_units a JOIN governance_members b ON a.governance_member_id = b.id;
```

| unit_i_d | unit_name | unit_type | is_subsidiary | member_id | member_member_i_d | member_role_title |
|---|---|---|---|---|---|---|
| UNI-2698 | Compact Series | composite-unit-45 | false | 100 | MEM-2021 | Distributed Standard |
| UNI-2702 | Legacy Assessment | primary-unit-46 | true | 101 | MEM-2023 | Adaptive Framework D |
| UNI-2706 | Regional Survey A | adaptive-unit-47 | false | 102 | MEM-2025 | Primary Protocol |
| UNI-2710 | Seasonal Corridor | distributed-unit-48 | true | 103 | MEM-2027 | Composite Programme |

### Business-Unit-to-Committee Views

The view `vw_business_unit_governance_committee` joins `business_units` to `governance_committees` via the `governance_committee_id` foreign key. It answers the question: which committee oversees this business unit? Unit "UNI-2698" ("Compact Series") is linked to committee `1`, unit "UNI-2702" ("Legacy Assessment") is linked to committee `2`, and so on, providing a clear mapping from business units to their overseeing committees.

**View `vw_business_unit_governance_committee`**

```sql
CREATE VIEW vw_business_unit_governance_committee AS
SELECT a.unit_i_d, a.unit_name, a.unit_type, a.is_subsidiary, b.id AS committee_id, b.committee_name AS committee_committee_name, b.establishment_date AS committee_establishment_date
FROM business_units a JOIN governance_committees b ON a.governance_committee_id = b.id;
```

| unit_i_d | unit_name | unit_type | is_subsidiary | committee_id | committee_committee_name | committee_establishment_date |
|---|---|---|---|---|---|---|
| UNI-2698 | Compact Series | composite-unit-45 | false | 1 | Composite Cluster | 2024-07-11 |
| UNI-2702 | Legacy Assessment | primary-unit-46 | true | 2 | Compact Review A | 2025-12-22 |
| UNI-2706 | Regional Survey A | adaptive-unit-47 | false | 3 | Legacy Initiative | 2022-05-06 |
| UNI-2710 | Seasonal Corridor | distributed-unit-48 | true | 4 | Regional Model | 2023-10-17 |

### Policy-to-Business-Unit and Policy-to-Domain Views

The view `vw_governance_policy_business_unit` joins `governance_policies` to `business_units` on the `unit_i_d` foreign key. It answers the question: which business unit is subject to this policy? Policy "POL-2680" ("Baseline Initiative D") is linked to unit "UNI-2698" ("Compact Series"), and policy "POL-2685" ("Distributed Model") is linked to unit "UNI-2702" ("Legacy Assessment"), showing the policy-to-unit applicability.

**View `vw_governance_policy_business_unit`**

```sql
CREATE VIEW vw_governance_policy_business_unit AS
SELECT a.id, a.policy_i_d, a.policy_title, a.effective_date, b.unit_i_d AS unit_unit_i_d, b.unit_name AS unit_unit_name, b.unit_type AS unit_unit_type
FROM governance_policies a JOIN business_units b ON a.unit_i_d = b.unit_i_d;
```

| id | policy_i_d | policy_title | effective_date | unit_unit_i_d | unit_unit_name | unit_unit_type |
|---|---|---|---|---|---|---|
| 1 | POL-2680 | Baseline Initiative D | 2023-02-14 | UNI-2698 | Compact Series | composite-unit-45 |
| 2 | POL-2685 | Distributed Model | 2024-07-25 | UNI-2702 | Legacy Assessment | primary-unit-46 |
| 3 | POL-2690 | Adaptive Cluster | 2025-12-09 | UNI-2706 | Regional Survey A | adaptive-unit-47 |
| 4 | POL-2695 | Primary Review A | 2022-05-20 | UNI-2710 | Seasonal Corridor | distributed-unit-48 |

The view `vw_governance_policy_governance_domain` joins `governance_policies` to `governance_domains` via the `governance_domain_id` foreign key. It answers the question: which regulatory domain does this policy belong to? Policy "POL-2680" ("Baseline Initiative D") is linked to domain `1` ("Regional Protocol"), and policy "POL-2685" ("Distributed Model") is linked to domain `2` ("Seasonal Programme D"), establishing the policy-to-domain hierarchy.

**View `vw_governance_policy_governance_domain`**

```sql
CREATE VIEW vw_governance_policy_governance_domain AS
SELECT a.id, a.policy_i_d, a.policy_title, a.effective_date, b.governance_domain_id AS domain_governance_domain_id, b.domain_name AS domain_domain_name, b.domain_code AS domain_domain_code
FROM governance_policies a JOIN governance_domains b ON a.governance_domain_id = b.governance_domain_id;
```

| id | policy_i_d | policy_title | effective_date | domain_governance_domain_id | domain_domain_name | domain_domain_code |
|---|---|---|---|---|---|---|
| 1 | POL-2680 | Baseline Initiative D | 2023-02-14 | 1 | Regional Protocol | 4716398 |
| 2 | POL-2685 | Distributed Model | 2024-07-25 | 2 | Seasonal Programme D | 605967 |
| 3 | POL-2690 | Adaptive Cluster | 2025-12-09 | 3 | Integrated Standard | 16375765 |
| 4 | POL-2695 | Primary Review A | 2022-05-20 | 4 | Extended Framework | 0471948470 |

## Synthesis

The governance data model is a normalized relational schema that captures five entity types and their interrelationships through a network of foreign keys and a single junction table. The base tables store atomic facts about committees, domains, members, business units, and policies, while the `committees_members` junction table resolves the many-to-many association between committees and members. The ten materialized views join these base tables to reconstruct the domain facts that stakeholders need: committee–domain assignments, committee–member memberships, domain–unit associations, member–unit assignments, unit–committee oversight relationships, and policy applicability to both business units and regulatory domains. Each view answers a specific analytical question, and together they provide a comprehensive materialized view of the governance landscape. The model is designed for read-heavy analytical workloads, with the views pre-joining the normalized tables to avoid repeated join computation at query time.