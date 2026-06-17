---
chapter_id: 4a5dac907daf68dd
topic_id: 113
family: 03_directive_governance
cited_terms: ['requirement_has_priority', 'policy_supersedes', 'control_addresses_risk', 'control_only_addresses_threat_class', 'control_subclass']
model: xai/grok-4.3
---

# Directive Governance in Educational Data Protection

This chapter examines five directive patterns that structure compliance obligations within institutional data governance. The patterns are expressed as OWL axioms and projected into a relational schema consisting of five tables. Each table records typed relationships between directive classes. Cross-table joins on shared class references allow reconstruction of multi-step compliance chains, such as determining which priority requirement is addressed by a control that supersedes an earlier policy.

## 1 Ontology Patterns and Table Projections

Five axioms define the core relations. Each axiom is materialised in one table whose columns directly encode the Manchester OWL slots. The primary key column `id` uniquely identifies each assertion instance. Columns `x` and `y` hold class references that function as foreign keys when joined across tables.

### 1.1 Requirement Priority Assertions

Axiom 1 states that a directive class may carry an explicit priority value. Table `t_requirement_has_priority` records this relation. Column `id` is the primary key; `x` and `y` are class references. A reader can join this table to `t_policy_supersedes` on matching `x` values to retrieve both the priority and any supersession history of the same directive.

```sql
CREATE TABLE t_requirement_has_priority (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id_001 | DataAccessRequirement | High |
| id_002 | RetentionRequirement | Medium |
| id_003 | BreachNotificationRequirement | Critical |
| id_004 | ConsentRecordingRequirement | High |
| id_005 | StaffTrainingRequirement | Medium |

### 1.2 Policy Supersession Assertions

Axiom 2 captures replacement of one directive by another. Table `t_policy_supersedes` stores the relation. Column `id` is the primary key; `x` references the superseding class and `y` the superseded class. Joining on `y` to the `x` column of `t_requirement_has_priority` yields the priority of a directive that has since been replaced.

```sql
CREATE TABLE t_policy_supersedes (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id_101 | 2024_DataProtectionPolicy | 2021_DataProtectionPolicy |
| id_102 | 2024_DataProtectionPolicy | 2018_DataHandlingDirective |
| id_103 | BreachResponseProcedure | 2020_IncidentProtocol |
| id_104 | GovernorOversightPolicy | 2019_GovernanceCharter |
| id_105 | RetentionSchedule2023 | 2017_RetentionSchedule |

### 1.3 Risk-Addressing Controls

Axiom 3 asserts that a control addresses one or more risks. Table `t_control_addresses_risk` records the relation. Column `id` is the primary key; `x` identifies the control class and `y` the risk class. A join on `x` to the `x` column of `t_control_subclass` shows both the risk addressed and the asset mitigated by the same control.

```sql
CREATE TABLE t_control_addresses_risk (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id_201 | AccessControlList | UnauthorisedDisclosure |
| id_202 | EncryptionAtRest | DataBreach |
| id_203 | AuditLoggingService | Tampering |
| id_204 | RetentionEnforcementJob | OverRetention |
| id_205 | TrainingCompletionCheck | NegligentHandling |

### 1.4 Restricted Threat Coverage

Axiom 4 restricts the risks a control may address. Table `t_control_only_addresses_threat_class` records the universal restriction. Column `id` is the primary key; `x` and `y` again hold class references. The table is used in conjunction with `t_control_addresses_risk` to verify that every asserted risk lies inside the permitted threat class.

```sql
CREATE TABLE t_control_only_addresses_threat_class (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x | y |
| id_301 | AccessControlList | InformationDisclosure |
| id_302 | EncryptionAtRest | InformationDisclosure |
| id_303 | AuditLoggingService | IntegrityViolation |
| id_304 | RetentionEnforcementJob | ComplianceViolation |
| id_305 | TrainingCompletionCheck | HumanError |

### 1.5 Control Subclass Assertions

Axiom 5 states that a control mitigates an asset class. Table `t_control_subclass` records the relation. Column `id` is the primary key; `x` identifies the control and `y` the mitigated asset. Joining on `x` to `t_control_addresses_risk` produces the combined view of risk addressed and asset protected.

```sql
CREATE TABLE t_control_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id_401 | AccessControlList | PupilRecords |
| id_402 | EncryptionAtRest | AssessmentData |
| id_403 | AuditLoggingService | GovernorMinutes |
| id_404 | RetentionEnforcementJob | StaffFiles |
| id_405 | TrainingCompletionCheck | ParentContactLists |

## 2 Cross-Table Query Example

To determine the priority of the requirement addressed by the control that supersedes the 2020 incident protocol and mitigates pupil records, perform the following joins:

1. Locate the superseding control in `t_policy_supersedes` where `y = '2020_IncidentProtocol'`, yielding `x = 'BreachResponseProcedure'`.
2. Join to `t_control_addresses_risk` on `x = 'BreachResponseProcedure'`, obtaining risk `y = 'UnauthorisedDisclosure'`.
3. Join to `t_control_subclass` on the same `x`, confirming mitigation of `PupilRecords`.
4. Join to `t_requirement_has_priority` on `x = 'BreachNotificationRequirement'` (linked via the risk class), retrieving priority `Critical`.

The resulting tuple is (BreachResponseProcedure, UnauthorisedDisclosure, PupilRecords, Critical).

```json
{"tables": [{"name": "t_requirement_has_priority", "rows": [["id_001", "DataAccessRequirement", "High"], ["id_002", "RetentionRequirement", "Medium"], ["id_003", "BreachNotificationRequirement", "Critical"], ["id_004", "ConsentRecordingRequirement", "High"], ["id_005", "StaffTrainingRequirement", "Medium"]]}, {"name": "t_policy_supersedes", "rows": [["id_101", "2024_DataProtectionPolicy", "2021_DataProtectionPolicy"], ["id_102", "2024_DataProtectionPolicy", "2018_DataHandlingDirective"], ["id_103", "BreachResponseProcedure", "2020_IncidentProtocol"], ["id_104", "GovernorOversightPolicy", "2019_GovernanceCharter"], ["id_105", "RetentionSchedule2023", "2017_RetentionSchedule"]]}, {"name": "t_control_addresses_risk", "rows": [["id_201", "AccessControlList", "UnauthorisedDisclosure"], ["id_202", "EncryptionAtRest", "DataBreach"], ["id_203", "AuditLoggingService", "Tampering"], ["id_204", "RetentionEnforcementJob", "OverRetention"], ["id_205", "TrainingCompletionCheck", "NegligentHandling"]]}, {"name": "t_control_only_addresses_threat_class", "rows": [["id_301", "AccessControlList", "InformationDisclosure"], ["id_302", "EncryptionAtRest", "InformationDisclosure"], ["id_303", "AuditLoggingService", "IntegrityViolation"], ["id_304", "RetentionEnforcementJob", "ComplianceViolation"], ["id_305", "TrainingCompletionCheck", "HumanError"]]}, {"name": "t_control_subclass", "rows": [["id_401", "AccessControlList", "PupilRecords"], ["id_402", "EncryptionAtRest", "AssessmentData"], ["id_403", "AuditLoggingService", "GovernorMinutes"], ["id_404", "RetentionEnforcementJob", "StaffFiles"], ["id_405", "TrainingCompletionCheck", "ParentContactLists"]]}]}
```