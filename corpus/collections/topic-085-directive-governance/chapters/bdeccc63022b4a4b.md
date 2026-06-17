---
chapter_id: bdeccc63022b4a4b
topic_id: 85
family: 03_directive_governance
cited_terms: ['gdpr_article_subclass', 'control_only_addresses_threat_class', 'control_addresses_risk', 'control_subclass', 'requirement_has_priority']
model: xai/grok-4.3
---

# Directive ICE Governance in GDPR Compliance Models

This chapter defines five core ontological patterns that classify DirectiveICE entities under GDPR constraints. Each pattern is realized as a relational table whose foreign-key graph supports multi-hop queries over article references, risk addresses, and priority assignments.

## 1. Axiom-to-Table Mapping

### 1.1 GDPR Article Subclass Table
The table t_gdpr_article_subclass embodies AXIOM 1. Column id is the primary key. Column y is a foreign key into t_control_only_addresses_threat_class, enforcing that every subclass instance is existentially linked to a control that addresses a threat class. A reader can join on y to retrieve the unique threat addressed by any given article subclass.

| id          | x                        | y                          |
|-------------|--------------------------|----------------------------|
| gdpr_001    | Article5Processing       | ctl_101                    |
| gdpr_002    | Article6Lawfulness       | ctl_102                    |
| gdpr_003    | Article9SpecialData      | ctl_103                    |
| gdpr_004    | Article32Security        | ctl_104                    |
| gdpr_005    | Article33BreachNotice    | ctl_105                    |

### 1.2 Control-Only Addresses Threat Class Table
The table t_control_only_addresses_threat_class embodies AXIOM 2. Column id is the primary key. Column y is a foreign key into t_gdpr_article_subclass, closing the universal restriction that the control addresses no risk outside the referenced article. Cross-table lookup on y yields the single permissible GDPR article for that control.

| id          | x                        | y                          |
|-------------|--------------------------|----------------------------|
| ctl_101     | EncryptionAtRest         | gdpr_001                   |
| ctl_102     | ConsentCapture           | gdpr_002                   |
| ctl_103     | DataMinimizationFilter   | gdpr_003                   |
| ctl_104     | AccessControlMatrix      | gdpr_004                   |
| ctl_105     | IncidentWorkflow         | gdpr_005                   |

### 1.3 Control Addresses Risk Table
The table t_control_addresses_risk embodies AXIOM 3. Column id is the primary key. Column y is a foreign key into t_gdpr_article_subclass, recording the existential risk addressed by each control. Joining on y retrieves every article that a given control may satisfy.

| id          | x                        | y                          |
|-------------|--------------------------|----------------------------|
| car_201     | PseudonymizationEngine   | gdpr_001                   |
| car_202     | LawfulBasisRegistry      | gdpr_002                   |
| car_203     | SpecialCategoryGuard     | gdpr_003                   |
| car_204     | IntegrityMonitoring      | gdpr_004                   |
| car_205     | BreachTimer              | gdpr_005                   |
| car_206     | RetentionEnforcer        | gdpr_001                   |

### 1.4 Control Subclass Table
The table t_control_subclass embodies AXIOM 4. Column id is the primary key. Column y is a foreign key into t_gdpr_article_subclass, asserting the mitigation target of each subclass. A join on y lists all controls that mitigate a selected article.

| id          | x                        | y                          |
|-------------|--------------------------|----------------------------|
| csc_301     | TechnicalMeasure         | gdpr_004                   |
| csc_302     | OrganizationalPolicy     | gdpr_002                   |
| csc_303     | PhysicalSafeguard        | gdpr_003                   |
| csc_304     | ProceduralControl        | gdpr_005                   |
| csc_305     | EncryptionStandard       | gdpr_001                   |

### 1.5 Requirement Has Priority Table
The table t_requirement_has_priority embodies AXIOM 5. Column id is the primary key. Column y is a foreign key into t_gdpr_article_subclass, capturing the priority value attached to each requirement. Joining on y surfaces the priority ordering of all requirements that reference a given article.

| id          | x                        | y                          |
|-------------|--------------------------|----------------------------|
| rhp_401     | High                     | gdpr_004                   |
| rhp_402     | Medium                   | gdpr_001                   |
| rhp_403     | High                     | gdpr_005                   |
| rhp_404     | Low                      | gdpr_002                   |
| rhp_405     | Medium                   | gdpr_003                   |

## 2. Cross-Join Demonstration

To determine the priority of the control that only addresses the threat linked to Article32Security, start at t_gdpr_article_subclass where x = 'Article32Security' (row gdpr_004). Follow its foreign key y into t_control_only_addresses_threat_class to obtain ctl_104. From ctl_104 follow the reverse link through t_control_addresses_risk to car_204, then join t_requirement_has_priority on y = gdpr_004 to retrieve rhp_401. The joined result row is:

gdpr_004 | Article32Security | ctl_104 | EncryptionAtRest | car_204 | IntegrityMonitoring | rhp_401 | High

```json
{"tables": [{"name": "t_gdpr_article_subclass", "rows": [["gdpr_001", "Article5Processing", "ctl_101"], ["gdpr_002", "Article6Lawfulness", "ctl_102"], ["gdpr_003", "Article9SpecialData", "ctl_103"], ["gdpr_004", "Article32Security", "ctl_104"], ["gdpr_005", "Article33BreachNotice", "ctl_105"]]}, {"name": "t_control_only_addresses_threat_class", "rows": [["ctl_101", "EncryptionAtRest", "gdpr_001"], ["ctl_102", "ConsentCapture", "gdpr_002"], ["ctl_103", "DataMinimizationFilter", "gdpr_003"], ["ctl_104", "AccessControlMatrix", "gdpr_004"], ["ctl_105", "IncidentWorkflow", "gdpr_005"]]}, {"name": "t_control_addresses_risk", "rows": [["car_201", "PseudonymizationEngine", "gdpr_001"], ["car_202", "LawfulBasisRegistry", "gdpr_002"], ["car_203", "SpecialCategoryGuard", "gdpr_003"], ["car_204", "IntegrityMonitoring", "gdpr_004"], ["car_205", "BreachTimer", "gdpr_005"], ["car_206", "RetentionEnforcer", "gdpr_001"]]}, {"name": "t_control_subclass", "rows": [["csc_301", "TechnicalMeasure", "gdpr_004"], ["csc_302", "OrganizationalPolicy", "gdpr_002"], ["csc_303", "PhysicalSafeguard", "gdpr_003"], ["csc_304", "ProceduralControl", "gdpr_005"], ["csc_305", "EncryptionStandard", "gdpr_001"]]}, {"name": "t_requirement_has_priority", "rows": [["rhp_401", "High", "gdpr_004"], ["rhp_402", "Medium", "gdpr_001"], ["rhp_403", "High", "gdpr_005"], ["rhp_404", "Low", "gdpr_002"], ["rhp_405", "Medium", "gdpr_003"]]}]}
```