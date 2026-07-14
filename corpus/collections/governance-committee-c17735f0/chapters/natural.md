# Governance Architecture and Cross-Functional Oversight

Organizational governance operates at the intersection of structured committees, defined domains, accountable members, and the business units they oversee. Within this framework, every decision flows through established channels: committees are chartered with specific objectives, members bring certified expertise, domains set the regulatory boundaries, and policies enforce compliance across business units. The records that follow document how these elements interlock to produce a coherent oversight mechanism.

## Governance Committees and Their Domains

**Table `governance_committees`**

| id | committee_name | establishment_date | primary_objective | is_cross_functional | reporting_frequency | governance_domain_id |
|---|---|---|---|---|---|---|
| 1 | Composite Cluster | 2024-07-11 | primary-primary-58 | true | integrated-reportin-64 | 1 |
| 2 | Compact Review A | 2025-12-22 | adaptive-primary-59 | false | seasonal-reportin-65 | 2 |
| 3 | Legacy Initiative | 2022-05-06 | distributed-primary-60 | true | regional-reportin-66 | 3 |
| 4 | Regional Model | 2023-10-17 | baseline-primary-61 | false | legacy-reportin-67 | 4 |

The governance_committees table records the formal bodies responsible for oversight. Each committee carries a unique identifier, a descriptive name, and a charter date that anchors its authority in time. The Composite Cluster (id 1), established on 2024-07-11, pursues the objective labeled primary-primary-58 and operates as a cross-functional body with an integrated-reportin-64 reporting cadence. Its counterpart, Compact Review A (id 2), was formed more recently on 2025-12-22 with an adaptive-primary-59 mandate and follows a seasonal-reportin-65 rhythm. Legacy Initiative (id 3), dating back to 2022-05-06, represents the oldest body in the registry and maintains a distributed-primary-60 objective alongside regional-reportin-66 frequency. Regional Model (id 4), established on 2023-10-17, rounds out the set with a baseline-primary-61 objective and legacy-reportin-67 cadence.

The is_cross_functional flag distinguishes committees that draw membership from multiple organizational silos. Composite Cluster and Legacy Initiative both carry this designation, while Compact Review A and Regional Model operate within narrower boundaries. Every committee is assigned to a governance domain through the governance_domain_id column, establishing the regulatory context within which the committee operates.

**Table `governance_domains`**

| governance_domain_id | domain_name | domain_code | regulatory_basis | is_mandatory | governance_committee_id | unit_i_d |
|---|---|---|---|---|---|---|
| 1 | Regional Protocol | 4716398 | distributed-regulato-78 | true | 1 | UNI-2698 |
| 2 | Seasonal Programme D | 605967 | baseline-regulato-79 | false | 2 | UNI-2702 |
| 3 | Integrated Standard | 16375765 | pilot-regulato-80 | true | 3 | UNI-2706 |
| 4 | Extended Framework | 0471948470 | extended-regulato-81 | false | 4 | UNI-2710 |

Governance domains define the regulatory and operational boundaries that committees serve. The Regional Protocol (domain_id 1, code 4716398) carries a distributed-regulato-78 basis and is marked as mandatory, meaning compliance is non-negotiable. Seasonal Programme D (domain_id 2, code 605967) operates under a baseline-regulato-79 framework and is not mandatory, allowing for more flexible interpretation. Integrated Standard (domain_id 3, code 16375765) mirrors Regional Protocol in its mandatory status and draws on a pilot-regulato-80 basis. Extended Framework (domain_id 4, code 0471948470) is the least restrictive, with an extended-regulato-81 basis and optional compliance.

Each domain references a governance_committee_id, creating a direct link between the regulatory framework and the committee charged with enforcing it. The unit_i_d column ties each domain to a specific business unit, grounding abstract regulatory concepts in operational reality.

## Membership and Cross-Functional Assignment

**Table `governance_members`**

| id | member_i_d | role_title | is_external | certification_type | appointment_date | governance_committee_id | unit_i_d |
|---|---|---|---|---|---|---|---|
| 100 | MEM-2021 | Distributed Standard | true | distributed-certific-96 | 2022-05-03 | 1 | UNI-2698 |
| 101 | MEM-2023 | Adaptive Framework D | false | baseline-certific-97 | 2023-10-14 | 2 | UNI-2702 |
| 102 | MEM-2025 | Primary Protocol | true | pilot-certific-98 | 2024-03-25 | 3 | UNI-2706 |
| 103 | MEM-2027 | Composite Programme | false | extended-certific-99 | 2025-08-09 | 4 | UNI-2710 |

The governance_members table catalogs the individuals who staff the oversight process. Member MEM-2021 (id 100), holding the title Distributed Standard, is an external appointee with a distributed-certific-96 certification, first appointed on 2022-05-03. MEM-2023 (id 101), titled Adaptive Framework D, is an internal member with baseline-certific-97 credentials and an appointment date of 2023-10-14. MEM-2025 (id 102), Primary Protocol, is another external appointee carrying pilot-certific-98 certification since 2024-03-25. MEM-2027 (id 103), Composite Programme, is an internal member with extended-certific-99 certification, appointed most recently on 2025-08-09.

The is_external flag distinguishes outside consultants and subject-matter experts from internal organizational staff. Certification_type records the specific credential or qualification that validates each member's authority to participate in governance decisions. Every member is assigned to a governance_committee_id and a unit_i_d, anchoring their role in both the committee structure and the business unit they serve.

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

The committees_members table resolves the many-to-many relationship between committees and members. Committee 1 (Composite Cluster) includes members 100 and 101, combining an external appointee with an internal one. Committee 2 (Compact Review A) spans members 101 and 102, pairing an internal member with an external one. Committee 3 (Legacy Initiative) covers members 102 and 103, while Committee 4 (Regional Model) includes members 103 and 100. This cross-pollination ensures that no committee operates in isolation and that expertise flows across organizational boundaries.

## Business Units and Policy Enforcement

**Table `business_units`**

| unit_i_d | unit_name | unit_type | is_subsidiary | last_audit_date | governance_member_id | governance_committee_id |
|---|---|---|---|---|---|---|
| UNI-2698 | Compact Series | composite-unit-45 | false | 2023-10-23 | 100 | 1 |
| UNI-2702 | Legacy Assessment | primary-unit-46 | true | 2024-03-07 | 101 | 2 |
| UNI-2706 | Regional Survey A | adaptive-unit-47 | false | 2025-08-18 | 102 | 3 |
| UNI-2710 | Seasonal Corridor | distributed-unit-48 | true | 2022-01-02 | 103 | 4 |

Business units represent the operational entities subject to governance oversight. Compact Series (unit_i_d UNI-2698) is classified as a composite-unit-45 and is not a subsidiary, with its last audit conducted on 2023-10-23. Legacy Assessment (UNI-2702) is a primary-unit-46 and operates as a subsidiary, last audited on 2024-03-07. Regional Survey A (UNI-2706) is an adaptive-unit-47 and non-subsidiary, with a recent audit date of 2025-08-18. Seasonal Corridor (UNI-2710) is a distributed-unit-48 and subsidiary, last audited on 2022-01-02.

Each business unit is linked to a governance_member_id and a governance_committee_id, establishing the chain of accountability from operational unit through member to committee. The is_subsidiary flag distinguishes parent-level operations from subsidiary entities, which may carry different compliance requirements.

**Table `governance_policies`**

| id | policy_i_d | policy_title | effective_date | issuing_authority | compliance_status | unit_i_d | governance_domain_id |
|---|---|---|---|---|---|---|---|
| 1 | POL-2680 | Baseline Initiative D | 2023-02-14 | extended-issuing-33 | compact-complian-56 | UNI-2698 | 1 |
| 2 | POL-2685 | Distributed Model | 2024-07-25 | integrated-issuing-34 | composite-complian-57 | UNI-2702 | 2 |
| 3 | POL-2690 | Adaptive Cluster | 2025-12-09 | seasonal-issuing-35 | primary-complian-58 | UNI-2706 | 3 |
| 4 | POL-2695 | Primary Review A | 2022-05-20 | regional-issuing-36 | adaptive-complian-59 | UNI-2710 | 4 |

Governance policies are the instruments through which regulatory requirements are formalized and enforced. Policy POL-2680 (id 1), titled Baseline Initiative D, took effect on 2023-02-14 under the issuing authority extended-issuing-33 and carries a compact-complian-56 status. Policy POL-2685 (id 2), Distributed Model, became effective on 2024-07-25 with integrated-issuing-34 as the authority and composite-complian-57 status. Policy POL-2690 (id 3), Adaptive Cluster, was issued on 2025-12-09 by seasonal-issuing-35 and holds primary-complian-58 status. Policy POL-2695 (id 4), Primary Review A, dates to 2022-05-20, was issued by regional-issuing-36, and carries adaptive-complian-59 status.

Every policy is tied to a specific business unit (unit_i_d) and a governance domain (governance_domain_id), ensuring that regulatory requirements are both operationally grounded and contextually appropriate.

## Cross-Functional Oversight Views

The following views synthesize the base tables into actionable perspectives, each answering a specific governance question.

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

This view joins governance_committees with governance_domains to reveal which regulatory domain each committee serves. The Composite Cluster (id 1) oversees the Regional Protocol domain (domain_id 1), a mandatory framework with code 4716398. Compact Review A (id 2) serves Seasonal Programme D (domain_id 2), which is non-mandatory with code 605967. Legacy Initiative (id 3) is paired with Integrated Standard (domain_id 3), a mandatory domain under pilot-regulato-80. Regional Model (id 4) covers Extended Framework (domain_id 4), an optional domain with code 0471948470. This pairing clarifies the regulatory scope of each committee at a glance.

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

By linking committees to their members, this view exposes the staffing composition of each oversight body. Committee 1 (Composite Cluster) includes member MEM-2021 (id 100), an external appointee titled Distributed Standard, and member MEM-2023 (id 101), an internal member with title Adaptive Framework D. Committee 2 (Compact Review A) spans MEM-2023 (id 101) and MEM-2025 (id 102), the latter being an external Primary Protocol specialist. Committee 3 (Legacy Initiative) covers MEM-2025 (id 102) and MEM-2027 (id 103), while Committee 4 (Regional Model) includes MEM-2027 (id 103) and MEM-2021 (id 100). The view makes it immediately apparent that every committee combines at least one external and one internal member, a structural feature that mitigates groupthink and ensures independent oversight.

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

This view inverts the committee-to-domain relationship, presenting each domain alongside the committee responsible for its enforcement. Regional Protocol (domain_id 1) is overseen by Composite Cluster (committee_id 1), a cross-functional body with integrated-reportin-64 cadence. Seasonal Programme D (domain_id 2) falls under Compact Review A (committee_id 2), which operates on a seasonal-reportin-65 schedule. Integrated Standard (domain_id 3) is managed by Legacy Initiative (committee_id 3), a cross-functional committee with regional-reportin-66 frequency. Extended Framework (domain_id 4) is the responsibility of Regional Model (committee_id 4), which follows a legacy-reportin-67 rhythm. This perspective is particularly useful for auditors who need to trace a regulatory requirement back to the committee charged with its enforcement.

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

This join connects governance domains to the business units they govern through the unit_i_d column. Regional Protocol (domain_id 1) applies to Compact Series (UNI-2698), a composite-unit-45 that is not a subsidiary. Seasonal Programme D (domain_id 2) governs Legacy Assessment (UNI-2702), a primary-unit-46 subsidiary. Integrated Standard (domain_id 3) covers Regional Survey A (UNI-2706), an adaptive-unit-47 non-subsidiary. Extended Framework (domain_id 4) applies to Seasonal Corridor (UNI-2710), a distributed-unit-48 subsidiary. The view reveals that mandatory domains (Regional Protocol and Integrated Standard) cover non-subsidiary units, while optional domains (Seasonal Programme D and Extended Framework) govern subsidiary entities—a pattern that may reflect differing compliance expectations between parent and subsidiary operations.

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

This view maps each governance member to the committee they serve on. Member MEM-2021 (id 100, Distributed Standard) serves on Committee 1 (Composite Cluster) and Committee 4 (Regional Model), spanning two distinct oversight bodies. Member MEM-2023 (id 101, Adaptive Framework D) serves on Committee 1 (Composite Cluster) and Committee 2 (Compact Review A). Member MEM-2025 (id 102, Primary Protocol) serves on Committee 2 (Compact Review A) and Committee 3 (Legacy Initiative). Member MEM-2027 (id 103, Composite Programme) serves on Committee 3 (Legacy Initiative) and Committee 4 (Regional Model). Each member participates in exactly two committees, creating a chain of continuity across the governance structure where adjacent committees share a common member.

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

This join links governance members to the business units they serve. Member MEM-2021 (id 100) is assigned to Compact Series (UNI-2698), a composite-unit-45. Member MEM-2023 (id 101) serves Legacy Assessment (UNI-2702), a primary-unit-46 subsidiary. Member MEM-2025 (id 102) covers Regional Survey A (UNI-2706), an adaptive-unit-47. Member MEM-2027 (id 103) is responsible for Seasonal Corridor (UNI-2710), a distributed-unit-48 subsidiary. The one-to-one alignment between members and business units in this view reflects the direct accountability structure: each member is the designated governance contact for a single operational unit.

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

This view reverses the member-to-unit relationship, presenting each business unit alongside its assigned governance member. Compact Series (UNI-2698) is served by MEM-2021 (id 100), an external Distributed Standard specialist. Legacy Assessment (UNI-2702) is covered by MEM-2023 (id 101), an internal Adaptive Framework D member. Regional Survey A (UNI-2706) is overseen by MEM-2025 (id 102), an external Primary Protocol appointee. Seasonal Corridor (UNI-2710) is managed by MEM-2027 (id 103), an internal Composite Programme member. The alternating pattern of external and internal members across business units suggests a deliberate strategy to balance independent expertise with organizational knowledge.

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

This join connects business units to the governance committees that oversee them. Compact Series (UNI-2698) falls under Committee 1 (Composite Cluster), a cross-functional body. Legacy Assessment (UNI-2702) is governed by Committee 2 (Compact Review A), which is not cross-functional. Regional Survey A (UNI-2706) is overseen by Committee 3 (Legacy Initiative), a cross-functional committee. Seasonal Corridor (UNI-2710) is managed by Committee 4 (Regional Model), which is not cross-functional. The alternating pattern of cross-functional and non-cross-functional committees across business units may reflect a design choice to provide broader organizational perspective to some units while maintaining focused oversight for others.

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

This view links governance policies to the business units they apply to. Policy POL-2680 (Baseline Initiative D, effective 2023-02-14, compact-complian-56 status) applies to Compact Series (UNI-2698). Policy POL-2685 (Distributed Model, effective 2024-07-25, composite-complian-57 status) governs Legacy Assessment (UNI-2702). Policy POL-2690 (Adaptive Cluster, effective 2025-12-09, primary-complian-58 status) applies to Regional Survey A (UNI-2706). Policy POL-2695 (Primary Review A, effective 2022-05-20, adaptive-complian-59 status) governs Seasonal Corridor (UNI-2710). Each business unit has exactly one active policy, and the compliance_status values suggest a tiered approach to enforcement where different units operate under different compliance rigor levels.

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

This final view connects governance policies to the domains they support. Policy POL-2680 (Baseline Initiative D) is associated with Regional Protocol (domain_id 1), a mandatory domain. Policy POL-2685 (Distributed Model) supports Seasonal Programme D (domain_id 2), a non-mandatory domain. Policy POL-2690 (Adaptive Cluster) applies to Integrated Standard (domain_id 3), a mandatory domain. Policy POL-2695 (Primary Review A) governs Extended Framework (domain_id 4), a non-mandatory domain. The view reveals that both mandatory and non-mandatory domains have active policies, but the compliance_status values differ in character: mandatory domains tend toward compact and primary compliance designations, while non-mandatory domains carry composite and adaptive compliance labels. This distinction may reflect the higher enforcement expectations placed on mandatory regulatory frameworks.

## Synthesis

The governance architecture documented here operates as an integrated system of checks and balances. Committees are chartered with clear objectives and reporting cadences, members bring certified expertise from both inside and outside the organization, domains establish the regulatory boundaries, and policies translate those boundaries into enforceable requirements. The cross-functional membership structure ensures that no single perspective dominates decision-making, while the alternating pattern of subsidiary and non-subsidiary oversight reflects a nuanced approach to compliance that accounts for organizational hierarchy. Every record in this system—from the establishment date of the oldest committee to the certification type of the most recent member—contributes to a governance framework designed for transparency, accountability, and operational coherence.