---
chapter_id: b18dc30f0fbeff40
topic_id: 198
family: 03_directive_governance
cited_terms: ['policy_min_one_enforcer', 'requirement_min_one_verification', 'policy_basic', 'attestation_min_one_signer', 'policy_only_governs_artifacts']
model: xai/grok-4.3
---

# Directive Governance in Regulatory Audit Systems

This chapter examines five relational tables that encode axioms for directive information content entities and related processes. The tables support queries that traverse enforcement, verification, attestation, and scope constraints while remaining grounded in audit-trail records for environmental compliance.

## 1. Policy and Requirement Tables

### 1.1 Enforcement of Directives
Axiom 1 states that every directive information content entity must be enforced by at least one entity. Table t_policy_min_one_enforcer therefore records the mandatory link between a policy identifier and its enforcer. Column id is the primary key; column x references the policy while column y references the enforcing organization or role. A reader can join this table to t_policy_basic on x to retrieve the textual directive that a given enforcer is responsible for.

```sql
CREATE TABLE t_policy_min_one_enforcer (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
|----|---|---|
| e001 | pol_air_001 | dept_inspections |
| e002 | pol_water_002 | dept_inspections |
| e003 | pol_haz_003 | agency_enforcement |
| e004 | pol_air_001 | regional_district_4 |
| e005 | pol_solid_004 | dept_inspections |

### 1.2 Verification of Directives
Axiom 2 requires that every directive information content entity be verified by at least one entity. Table t_requirement_min_one_verification captures the verification relationship. Column id is the primary key; x identifies the directive and y identifies the verifying body. Joining on x with t_policy_min_one_enforcer yields the pair of enforcer and verifier for any single policy.

```sql
CREATE TABLE t_requirement_min_one_verification (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
|----|---|---|
| v001 | pol_air_001 | audit_unit_alpha |
| v002 | pol_water_002 | audit_unit_beta |
| v003 | pol_haz_003 | external_auditor_7 |
| v004 | pol_solid_004 | audit_unit_alpha |
| v005 | pol_air_001 | audit_unit_beta |

### 1.3 Basic Directive Classification
Axiom 3 simply classifies an entity as a directive information content entity. Table t_policy_basic therefore lists the core policies without additional cardinality constraints. Column id is the primary key and x holds the policy identifier. This table supplies the common join key used by the two preceding tables.

```sql
CREATE TABLE t_policy_basic (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| b001 | pol_air_001 |
| b002 | pol_water_002 |
| b003 | pol_haz_003 |
| b004 | pol_solid_004 |
| b005 | pol_noise_005 |

### 1.4 Attestation as Signed Process
Axiom 4 classifies an attestation as a process that must be signed by at least one person. Table t_attestation_min_one_signer records each attestation event. Column id is the primary key and x identifies the attestation instance. The table can be joined to t_requirement_min_one_verification via shared policy references when attestation records are further linked to verification outcomes.

```sql
CREATE TABLE t_attestation_min_one_signer (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| a001 | att_2023_0412 |
| a002 | att_2023_0527 |
| a003 | att_2023_0614 |
| a004 | att_2023_0709 |
| a005 | att_2023_0811 |
| a006 | att_2023_0922 |

### 1.5 Scope Restriction to Artifacts
Axiom 5 restricts the governsScope relation of any directive information content entity to artifacts only. Table t_policy_only_governs_artifacts therefore lists policies whose scope is limited to artifacts such as permits or manifests. Column id is the primary key and x again references the policy. Cross-joining this table with t_policy_basic confirms that every listed policy satisfies the artifact-only constraint.

```sql
CREATE TABLE t_policy_only_governs_artifacts (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| s001 | pol_air_001 |
| s002 | pol_water_002 |
| s003 | pol_haz_003 |
| s004 | pol_solid_004 |

## 2. Cross-Table Query Example

To determine which verifier is responsible for a policy that is both enforced by the inspections department and limited to artifact scope, the following mental join is performed. Start with t_policy_min_one_enforcer where y = 'dept_inspections', yielding rows for pol_air_001 and pol_water_002. Restrict to those x values also present in t_policy_only_governs_artifacts, leaving pol_air_001 and pol_water_002. Finally join on x with t_requirement_min_one_verification to obtain the verifier identifiers audit_unit_alpha (for pol_air_001) and audit_unit_beta (for pol_water_002). The resulting joined rows are:

- pol_air_001, dept_inspections, audit_unit_alpha, audit_unit_beta
- pol_water_002, dept_inspections, audit_unit_beta

```json
{"tables": [{"name": "t_policy_min_one_enforcer", "rows": [["e001", "pol_air_001", "dept_inspections"], ["e002", "pol_water_002", "dept_inspections"], ["e003", "pol_haz_003", "agency_enforcement"], ["e004", "pol_air_001", "regional_district_4"], ["e005", "pol_solid_004", "dept_inspections"]]}, {"name": "t_requirement_min_one_verification", "rows": [["v001", "pol_air_001", "audit_unit_alpha"], ["v002", "pol_water_002", "audit_unit_beta"], ["v003", "pol_haz_003", "external_auditor_7"], ["v004", "pol_solid_004", "audit_unit_alpha"], ["v005", "pol_air_001", "audit_unit_beta"]]}, {"name": "t_policy_basic", "rows": [["b001", "pol_air_001"], ["b002", "pol_water_002"], ["b003", "pol_haz_003"], ["b004", "pol_solid_004"], ["b005", "pol_noise_005"]]}, {"name": "t_attestation_min_one_signer", "rows": [["a001", "att_2023_0412"], ["a002", "att_2023_0527"], ["a003", "att_2023_0614"], ["a004", "att_2023_0709"], ["a005", "att_2023_0811"], ["a006", "att_2023_0922"]]}, {"name": "t_policy_only_governs_artifacts", "rows": [["s001", "pol_air_001"], ["s002", "pol_water_002"], ["s003", "pol_haz_003"], ["s004", "pol_solid_004"]]}]}
```