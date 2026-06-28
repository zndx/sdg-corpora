---
chapter_id: ch_live_control_subclass_54fe75
topic_id: 0
family: 03_directive_governance
cited_terms: ['control_subclass', 'column_version_subclass', 'outlier_detection_targets_dataset']
model: engine-refine
---

Governance and operational telemetry rest on a small set of cross-cutting primitives that recur wherever controls, schema lineage, and anomaly records must be reconciled under audit. The **identifier** supplies the durable handle by which every artifact—whether a control subclass such as CONT-0001 (MFA enforcement), a column-version lineage keyed VERS-0003, or an outlier fact DATA-0004—remains addressable across revisions, joins, and evidentiary exports; without such stable keys, mitigation mappings, attribute bindings, and dimensional rollups cannot be proven to refer to the same object at two points in time. In relationship assertions, **subject** denotes the governed party or source entity in the directed edge: a control-to-mitigation link may name CONT-0004 as subject while pointing at CONT-0007 as target, or alternatively position CONT-0001 as subject against CONT-0002, thereby encoding who bears accountability rather than merely what is associated. **Role** then qualifies how that subject participates—owner, reviewer, observer, or contributor—so that the same structural triple does not collapse distinct compliance duties into an undifferentiated “related to” predicate.

**t_control_subclass**

| id | control |
| --- | --- |
| CONT-0001 | MFA enforcement |
| CONT-0002 | Backup frequency policy |
| CONT-0003 | Access review cycle |
| CONT-0004 | TLS 1.3 mandatory |
| CONT-0005 | Session timeout limit |
| CONT-0006 | Audit log retention |
| CONT-0007 | MFA enforcement |

**t_control_subclass_mitigates**

| id | mitigates |
| --- | --- |
| CONT-0001 | Service outage |
| CONT-0002 | Service outage |
| CONT-0003 | Phishing attack |
| CONT-0004 | Network intrusion |
| CONT-0005 | System downtime |
| CONT-0006 | Credential stuffing |
| CONT-0007 | Phishing attack |
| CONT-0008 | Data exfiltration |

**t_control_subclass__mitigates**

| id | control_id | mitigates_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0004 | CONT-0007 | owner |
| CONT-0002 | CONT-0004 | CONT-0002 | reviewer |
| CONT-0003 | CONT-0007 | CONT-0004 | observer |
| CONT-0004 | CONT-0001 | CONT-0002 | contributor |
| CONT-0005 | CONT-0006 | CONT-0002 | observer |
| CONT-0006 | CONT-0005 | CONT-0001 | owner |
| CONT-0007 | CONT-0001 | CONT-0002 | observer |
| CONT-0008 | CONT-0006 | CONT-0008 | observer |

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | CONT-0002 |
| VERS-0002 | operator_code | CONT-0007 |
| VERS-0003 | timestamp_utc | CONT-0007 |
| VERS-0004 | humidity_pct | CONT-0001 |
| VERS-0005 | sample_volume_ml | CONT-0004 |
| VERS-0006 | ph_level | CONT-0002 |

Column governance extends this pattern into typed metadata. An **attr** names the semantic dimension under measurement—confidence on a timestamp column, dimension_kind on operator_code, method or recorded_at on other versioned fields—while **attr_type** fixes the interpretive contract: xsd:decimal for numeric confidence scores, xsd:string for categorical encodings, xsd:dateTime for temporal provenance. Values do not live in a single undifferentiated store; they bind through **entity**, the versioned record (VERS-0001 through VERS-0004) that anchors each observation, and surface in type-appropriate **misc** payloads—0.648 and 933.19 as decimals, “Dimension Kind 01” and “de” as varchar fragments, 2024-04-09T04:38:55 and 2023-03-07T00:33:45 as recorded_at stamps—so auditors can validate both the declared type and the serialized form. The control subclass CONT-0002 (Backup frequency policy) and CONT-0007 appear repeatedly as column_version parents, illustrating how operational policy identifiers propagate into schema-version lineage rather than remaining isolated in a control catalogue.

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

Risk posture links controls to the events they are meant to constrain. CONT-0001 mitigates Service outage; CONT-0003 addresses Phishing attack; CONT-0004 mandates TLS 1.3 against Network intrusion—each pairing states intent, while the intervening subject–target edges with explicit roles distribute review and ownership across contributors and observers. That separation matters when an outlier later implicates the same control families: the governance graph answers whether MFA enforcement or backup policy was in force, and under which role assignment, independent of the raw measurement stream.

**Outlier** records capture executions or ingestions that depart from expected bounds and therefore demand triage before they pollute aggregates or compliance attestations. Each fact row carries an **outlier_key** referencing a dimensional label—Outlier Label 01 through Outlier Label 04—classified under **category** (Outlier Category 01–04), yielding a two-level taxonomy suitable for routing: category drives workflow and severity priors, while label preserves instance identity for repeat offenders such as DATA-0003, which appears twice under distinct duration and exit profiles. Operational forensics lean on **duration_seconds**, quantifying wall-clock cost (from 1182.39 s on one DATA-0003 run to 6466.78 s on DATA-0001), on **exit**, the terminal status code (760, 4, 490, 124) that distinguishes retryable faults from hard failures, and on **retry_count**, which records persistence before abandonment—293 and 308 retries signal chronic instability, whereas 101 may indicate a contained transient. Together these fields let investigators distinguish a long-running but eventually successful job from one that exhausted retry budget with a non-zero exit.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 3360.34 | 760 | 293 |
| DATA-0002 | DATA-0001 | 6466.78 | 4 | 225 |
| DATA-0003 | DATA-0002 | 5282.09 | 490 | 101 |
| DATA-0004 | DATA-0003 | 1182.39 | 124 | 308 |
| DATA-0005 | DATA-0002 | 3041.72 | 808 | 59 |
| DATA-0006 | DATA-0005 | 3852.38 | 619 | 489 |
| DATA-0007 | DATA-0003 | 1453.07 | 682 | 1 |

Read end-to-end, identifier, subject, role, attr, attr_type, entity, misc, outlier, category, duration_seconds, exit, and retry_count form a coherent evidence chain: stable keys and directed subjects establish accountability; typed attributes with entity-bound misc values document what was measured and when; categorized outliers with duration, exit, and retry telemetry explain where the measured world diverged from policy. A reviewer tracing humidity_pct (VERS-0004, parent CONT-0001) through recorded_at stamps and confidence decimals can therefore correlate schema lineage, control intent, and anomalous runtime behavior without conflating nomenclature with measurement—a distinction on which defensible compliance reporting depends.

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DATA-0001 | Outlier Label 01 | Outlier Category 01 |
| DATA-0002 | Outlier Label 02 | Outlier Category 02 |
| DATA-0003 | Outlier Label 03 | Outlier Category 03 |
| DATA-0004 | Outlier Label 04 | Outlier Category 04 |
| DATA-0005 | Outlier Label 05 | Outlier Category 05 |
| DATA-0006 | Outlier Label 06 | Outlier Category 06 |