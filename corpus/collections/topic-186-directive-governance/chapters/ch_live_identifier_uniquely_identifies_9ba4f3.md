---
chapter_id: ch_live_identifier_uniquely_identifies_9ba4f3
topic_id: 186
family: 01_foundation
cited_terms: ['identifier_uniquely_identifies', 'indoor_air_quality_action_plan', 'indoor_environmental_monitoring_process']
model: engine-refine
---

Indoor air quality governance rests on a chain of accountable references: every policy artifact, monitoring workflow, and environmental intervention must be traceable to authoritative sources and measurable outcomes. **Identifier** schemes supply that traceability by binding stable, machine-resolvable keys to the things they denote. A DOI such as `doi:10.1145/3641519` may anchor a provenance graph at its root node, while the same identifier format can also label a data-pipeline stage—demonstrating that identifier semantics are contextual, not merely syntactic. Other conventions serve different evidentiary roles: an ISBN (`urn:isbn:9780131103627`) may identify a normative reference, an ORCID (`orcid:0000-0002-1825-0097`) may tie accountability to a responsible party, and a container-image digest may fingerprint deployable infrastructure. Each binding carries a **format** declaration—JSON, CSV, or E.164—so downstream systems know how to parse and validate the token, and an **issueddate** stamps when the identifier entered authoritative use (for example, 2024-09-07 for a provenance root or 2023-03-01 for a personnel credential). Together, format and issuance date turn opaque strings into auditable evidence suitable for compliance review.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

**Indoorairqualityactionplan** records translate environmental obligations into operational programs with explicit targets and verification logic. Plans such as the HVAC Filter Upgrade Protocol, Dust Suppression Procedure, and Air Purifier Deployment Plan are not generic checklists; each names a **indoorairpollution** class the intervention is designed to mitigate—carbon monoxide, asbestos fibers, particulate matter 2.5 (PM₂.₅), or nitrogen dioxide. Effectiveness is not assumed from engineering intent alone. Plans declare a **healthoutcomemetric** used to verify impact: respiratory infection incidence or asthma symptom frequency link ventilation and filtration decisions to population-level health signals auditors can trend over time. That pairing—pollutant target plus outcome metric—defines the evidentiary contract an inspector or risk officer evaluates when determining whether a facility met its duty of care.

Operational metadata for those plans is modeled through **entity**–**attr**–value structure rather than wide, plan-specific tables. Each plan is an **entity** (for example PLAN-0001 through PLAN-0004), and its governable properties are declared as named **attr** entries with typed **attr_type** constraints: `effective_date` as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. Typed attributes let validators reject incoherent assignments before they enter the compliance record—dates cannot be stored as free text, and mandatory flags cannot be ambiguous strings. Actual assignments land in type-specific value stores where the payload appears under **misc** (the concrete value slot): effective dates such as 2024-08-22 or 2025-01-11, mandatory flags including `true` for a dust-suppression plan and `false` elsewhere, integer priorities like 5 and 4, and varchar fields carrying enforcement labels (`Enforcement 02`), audit excerpts, or locale codes (`en`). The pattern scales because new attributes extend the schema by declaration, not by migrating dozens of nullable columns across every plan variant.

**Indoorenvironmentalmonitoringprocess** records close the loop between policy and observation. Processes—Library Climate Calibration, Office Floor CO₂ Mapping, Server Hall Alpha surveillance, Cafeteria Zone C sampling—describe repeatable workflows that watch specific **indoorenvironment** scopes: a server hall, an ICU wing, a dormitory radon campaign, or an HVAC survey of the west wing. Each process invokes a monitoring protocol (chemical storage vault checks, cafeteria ventilation tests, cleanroom particulate sweeps) appropriate to the hazards and occupancy patterns of the space under review. Where action plans commit facilities to reduce targeted pollutants and prove success through health metrics, monitoring processes generate the contemporaneous environmental evidence those plans depend on. A PM₂.₅ mitigation plan verified by respiratory infection incidence, for instance, only withstands scrutiny when paired with monitoring that actually characterizes particulate exposure in the relevant indoor zones.

Across these artifacts, **identifier** keys stitch the governance graph into a single auditable fabric. Plan identifiers (PLAN-0001), process identifiers (PROC-0001), and cross-domain keys (IDEN-0001) let reviewers traverse from bibliographic provenance through deployment lineage to live operational controls without collapsing distinct object classes into one undifferentiated namespace. **Format** and **issueddate** on identifier records support temporal and syntactic governance: credentials and standards references can be retired when superseded, and parsers can be selected deterministically. **Attr** typing and **entity**-scoped **misc** values ensure plan metadata remains queryable and legally defensible—an auditor can filter mandatory plans, rank by integer priority, or prove when a protocol became effective without interpreting ad hoc prose fields.

In practice, compliance officers treat this structure as an evidence system, not a filing cabinet. They ask whether each **indoorairqualityactionplan** names a credible **indoorairpollution** target, whether the chosen **healthoutcomemetric** is epidemiologically appropriate, whether **mandatory** and **effective_date** attributes align with jurisdictional deadlines, and whether **indoorenvironmentalmonitoringprocess** coverage matches the spaces those plans protect. **Identifier** linkages answer provenance questions—who authored the standard, which pipeline stage produced the dataset, which image build ran in production—while typed attribute values supply the operational particulars inspectors need on site. Dense, cross-referenced records of this kind reduce ambiguity in enforcement: obligations, measurements, and accountability collapse into a single traceable narrative from issuance date through monitored environment to verified health outcome.

**t_indoor_air_quality_action_plan**

| id | indoor_air_quality_action_plan | targets_pollution | verified_by_metric |
| --- | --- | --- | --- |
| PLAN-0001 | HVAC Filter Upgrade Protocol | Carbon Monoxide | Respiratory Infection Incidence |
| PLAN-0002 | HVAC Filter Upgrade Protocol | Asbestos Fibers | Asthma Symptom Frequency |
| PLAN-0003 | Dust Suppression Procedure | Particulate Matter 2.5 | Respiratory Infection Incidence |
| PLAN-0004 | Air Purifier Deployment Plan | Nitrogen Dioxide | Asthma Symptom Frequency |
| PLAN-0005 | HVAC Filter Upgrade Protocol | Particulate Matter 2.5 | FEV1 Improvement Rate |
| PLAN-0006 | Mold Remediation Directive | Formaldehyde | Pulmonary Function Test Delta |
| PLAN-0007 | CO2 Ventilation Schedule | Radon Gas | Sleep Quality Score |

**t_indoor_air_quality_action_plan_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PLAN-0001 | effective_date | xsd:date |
| PLAN-0002 | enforcement | xsd:string |
| PLAN-0003 | mandatory | xsd:boolean |
| PLAN-0004 | priority | xsd:integer |
| PLAN-0005 | review_cycle_days | xsd:integer |
| PLAN-0006 | scope | xsd:string |
| PLAN-0007 | encoding | xsd:string |
| PLAN-0008 | label_text | xsd:string |

**t_indoor_air_quality_action_plan_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0003 | false |
| PLAN-0002 | PLAN-0002 | PLAN-0003 | false |
| PLAN-0003 | PLAN-0003 | PLAN-0003 | true |
| PLAN-0004 | PLAN-0004 | PLAN-0003 | false |
| PLAN-0005 | PLAN-0005 | PLAN-0003 | true |
| PLAN-0006 | PLAN-0006 | PLAN-0003 | false |
| PLAN-0007 | PLAN-0007 | PLAN-0003 | true |

**t_indoor_air_quality_action_plan_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0001 | 2024-08-22 |
| PLAN-0002 | PLAN-0002 | PLAN-0001 | 2025-02-08 |
| PLAN-0003 | PLAN-0003 | PLAN-0001 | 2024-12-25 |
| PLAN-0004 | PLAN-0004 | PLAN-0001 | 2025-01-11 |
| PLAN-0005 | PLAN-0005 | PLAN-0001 | 2023-11-11 |
| PLAN-0006 | PLAN-0006 | PLAN-0001 | 2024-01-21 |
| PLAN-0007 | PLAN-0007 | PLAN-0001 | 2024-08-19 |

**t_indoor_air_quality_action_plan_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0004 | 5 |
| PLAN-0002 | PLAN-0001 | PLAN-0005 | 345 |
| PLAN-0003 | PLAN-0002 | PLAN-0004 | 4 |
| PLAN-0004 | PLAN-0002 | PLAN-0005 | 346 |
| PLAN-0005 | PLAN-0003 | PLAN-0004 | 3 |
| PLAN-0006 | PLAN-0003 | PLAN-0005 | 243 |
| PLAN-0007 | PLAN-0004 | PLAN-0004 | 1 |
| PLAN-0008 | PLAN-0004 | PLAN-0005 | 453 |

**t_indoor_air_quality_action_plan_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0007 | Encoding 01 |
| PLAN-0002 | PLAN-0001 | PLAN-0002 | Enforcement 02 |
| PLAN-0003 | PLAN-0001 | PLAN-0008 | audit excerpt |
| PLAN-0004 | PLAN-0001 | PLAN-0009 | en |
| PLAN-0005 | PLAN-0001 | PLAN-0006 | Scope 05 |
| PLAN-0006 | PLAN-0002 | PLAN-0007 | Encoding 06 |
| PLAN-0007 | PLAN-0002 | PLAN-0002 | Enforcement 07 |
| PLAN-0008 | PLAN-0002 | PLAN-0008 | audit excerpt |

**t_indoor_environmental_monitoring_process**

| id | indoor_environmental_monitoring_process | monitors_indoor_environment | uses_monitoring_protocol |
| --- | --- | --- | --- |
| PROC-0001 | Library Climate Calibration | Server Hall Alpha | Chemical Storage Vault |
| PROC-0002 | Office Floor CO2 Mapping | West Wing HVAC Survey | Cafeteria Ventilation Test |
| PROC-0003 | Server Hall Alpha | ICU Wing South | Cleanroom Particulate Sweep |
| PROC-0004 | Cafeteria Zone C | Dormitory Radon Campaign | Office Floor CO2 Mapping |