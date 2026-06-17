---
chapter_id: 1fbc6bea2403a8fe
topic_id: 171
family: 03_directive_governance
cited_terms: ['audit_for_period', 'attestation_min_one_signer', 'audit_conducted_by', 'verification_min_one_evidence', 'requirement_equiv_specifies_target']
model: xai/grok-4.3
---

# Directive Governance Ontologies in Municipal Audit Trails

This chapter defines five axioms that formalize directive and verification processes within audit governance. Each axiom is projected to a dedicated relational table whose columns directly encode the Manchester slots. The resulting schema supports cross-table joins that recover multi-hop facts such as the period, signatory, conductor, and evidence associated with a given requirement or attestation.

## 1. Core Axioms and Table Projections

### 1.1 Audit Period Association

Axiom 1 states that a process X exists for a designated audit period Y. The table therefore stores the pair (x, y) under a surrogate primary key; y functions as a foreign key that can be joined to period identifiers maintained in other governance tables.

```sql
CREATE TABLE t_audit_for_period (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x                        | y            |
|--------|--------------------------|--------------|
| AFP001 | BudgetIntroduction       | FY2014Q2     |
| AFP002 | ProclamationAdoption     | FY2014Q2     |
| AFP003 | RollCallVerification     | FY2014Q1     |
| AFP004 | MinutesAdoption          | FY2014Q2     |
| AFP005 | BudgetHearing            | FY2014Q2     |
| AFP006 | AutismAwarenessRecord    | FY2014Q2     |

### 1.2 Attestation Signature Requirement

Axiom 2 requires every attestation process X to be signed by at least one person. The table records only the process identifier; referential integrity to signer entities is enforced outside the table via application logic or additional join tables.

```sql
CREATE TABLE t_attestation_min_one_signer (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id     | x                        |
|--------|--------------------------|
| AMS001 | BudgetIntroduction       |
| AMS002 | ProclamationAdoption     |
| AMS003 | MinutesAdoption          |
| AMS004 | BudgetHearing            |
| AMS005 | RollCallVerification     |

### 1.3 Audit Conductor Assignment

Axiom 3 asserts that an audit process X is conducted by a person. The table captures the process identifier; the conducting person is resolved through an external person registry referenced by application-level joins.

```sql
CREATE TABLE t_audit_conducted_by (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id     | x                        |
|--------|--------------------------|
| ACB001 | BudgetIntroduction       |
| ACB002 | RollCallVerification     |
| ACB003 | MinutesAdoption          |
| ACB004 | BudgetHearing            |
| ACB005 | ProclamationAdoption     |

### 1.4 Evidence Production Constraint

Axiom 4 requires a verification process X to produce at least one evidence artifact Y. The table therefore stores both the process and the evidence identifier; y serves as a foreign key to evidence records.

```sql
CREATE TABLE t_verification_min_one_evidence (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x                        | y                  |
|--------|--------------------------|--------------------|
| VME001 | RollCallVerification     | SignedMinutes      |
| VME002 | BudgetHearing            | AttendanceLog      |
| VME003 | ProclamationAdoption     | CouncilResolution  |
| VME004 | MinutesAdoption          | ApprovedTranscript |
| VME005 | BudgetIntroduction       | FiscalSummary      |
| VME006 | AutismAwarenessRecord    | ProclamationText   |

### 1.5 Requirement Specification and Scope

Axiom 5 defines a requirement as a DirectiveICE that both specifies a target Y and applies to a subject Z. All three slots are stored; y and z are foreign keys to directive targets and subject entities respectively.

```sql
CREATE TABLE t_requirement_equiv_specifies_target (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  z VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x                        | y                    | z                  |
|--------|--------------------------|----------------------|--------------------|
| REQ001 | BudgetAdoptionDirective  | MunicipalBudget      | TownshipCouncil    |
| REQ002 | ProclamationDirective    | AutismAwareness      | EHKnightsOfColumbus|
| REQ003 | MeetingDirective         | RollCallRecord       | CouncilMembers     |
| REQ004 | HearingDirective         | PublicCommentPeriod  | Residents          |
| REQ005 | MinutesDirective         | AdoptionVote         | MeetingClerk       |

## 2. Cross-Table Query Example

To determine the evidence produced for the BudgetIntroduction process that occurred in FY2014Q2 and was conducted under the BudgetAdoptionDirective, the following join path is used:

- Start at t_audit_for_period (AFP001) to obtain x = BudgetIntroduction and y = FY2014Q2.
- Join on x to t_verification_min_one_evidence (VME005) to retrieve y = FiscalSummary.
- Join on x to t_requirement_equiv_specifies_target (REQ001) to confirm y = MunicipalBudget and z = TownshipCouncil.

The resulting joined row is:

(BudgetIntroduction, FY2014Q2, FiscalSummary, MunicipalBudget, TownshipCouncil)

```json
{"tables": [{"name": "t_audit_for_period", "rows": [["AFP001", "BudgetIntroduction", "FY2014Q2"], ["AFP002", "ProclamationAdoption", "FY2014Q2"], ["AFP003", "RollCallVerification", "FY2014Q1"], ["AFP004", "MinutesAdoption", "FY2014Q2"], ["AFP005", "BudgetHearing", "FY2014Q2"], ["AFP006", "AutismAwarenessRecord", "FY2014Q2"]]}, {"name": "t_attestation_min_one_signer", "rows": [["AMS001", "BudgetIntroduction"], ["AMS002", "ProclamationAdoption"], ["AMS003", "MinutesAdoption"], ["AMS004", "BudgetHearing"], ["AMS005", "RollCallVerification"]]}, {"name": "t_audit_conducted_by", "rows": [["ACB001", "BudgetIntroduction"], ["ACB002", "RollCallVerification"], ["ACB003", "MinutesAdoption"], ["ACB004", "BudgetHearing"], ["ACB005", "ProclamationAdoption"]]}, {"name": "t_verification_min_one_evidence", "rows": [["VME001", "RollCallVerification", "SignedMinutes"], ["VME002", "BudgetHearing", "AttendanceLog"], ["VME003", "ProclamationAdoption", "CouncilResolution"], ["VME004", "MinutesAdoption", "ApprovedTranscript"], ["VME005", "BudgetIntroduction", "FiscalSummary"], ["VME006", "AutismAwarenessRecord", "ProclamationText"]]}, {"name": "t_requirement_equiv_specifies_target", "rows": [["REQ001", "BudgetAdoptionDirective", "MunicipalBudget", "TownshipCouncil"], ["REQ002", "ProclamationDirective", "AutismAwareness", "EHKnightsOfColumbus"], ["REQ003", "MeetingDirective", "RollCallRecord", "CouncilMembers"], ["REQ004", "HearingDirective", "PublicCommentPeriod", "Residents"], ["REQ005", "MinutesDirective", "AdoptionVote", "MeetingClerk"]]}]}
```