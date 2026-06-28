---
chapter_id: ch_live_marketing_director_role_470b4e
topic_id: 26
family: 08_derived
cited_terms: ['marketing_director_role', 'mass_function_assigns_to_subset', 'mass_function_basic']
model: engine-refine
---

In operational governance and compliance analytics, every auditable assertion must be anchored by a stable identifier that survives renaming, reclassification, and system migration. Identifiers such as ROLE-0001 or FUNC-0003 are not display names; they are durable keys that let facts, dimensions, and assignment rules refer to the same entity across tables and over time. Without that separation, event totals would drift whenever a label changes, and cross-system reconciliation would collapse into string matching. The identifier is therefore the spine of traceability: it binds quantitative records to descriptive context without conflating the two.

Role and role holder distinguish function from actor, a distinction compliance frameworks depend on when attributing responsibility. A role names what someone does in a governed process—here, consistently encoded as observer in mass-assignment rules—while the role holder is the specific party that occupies that role in a given context. Dimension records carry human-oriented misc attributes (for example, Role Holder Label 02) alongside category values (Role Holder Category 02) that support roll-up reporting and policy segmentation. Category is the controlled vocabulary layer: it groups holders and activities into comparable buckets for thresholds, dashboards, and exception review, whereas misc fields carry the readable surface detail analysts need without polluting the fact grain.

Realized in activity captures where or through which operational context a governed outcome actually manifests. In marketing accountability, each fact row ties a role holder to a realized-in-activity key and records how many events occurred under that pairing—18 events for one combination versus 421 for another. Event count is the measurable residue of process execution: not a definition of the activity, but the volume attributable once roles, holders, and activity contexts are fixed. When ROLE-0002 appears as both role holder and realized-in-activity key in different rows, the model makes explicit that the same identifier can participate in different semantic slots; governance depends on reading those slots correctly, not on treating every key as interchangeable.

**fact_marketing**

| id | role_holder_key | realized_in_activity_key | event_count |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0002 | 18 |
| ROLE-0002 | ROLE-0005 | ROLE-0006 | 204 |
| ROLE-0003 | ROLE-0001 | ROLE-0006 | 421 |
| ROLE-0004 | ROLE-0003 | ROLE-0001 | 153 |
| ROLE-0005 | ROLE-0006 | ROLE-0003 | 434 |
| ROLE-0006 | ROLE-0003 | ROLE-0004 | 256 |
| ROLE-0007 | ROLE-0005 | ROLE-0005 | 457 |

Mass-function governance extends the same pattern into measurement and assignment. Basic function records declare what is being quantified—Filter cake, Effluent mass, Target mass—and how the quantification is performed. Method (automated versus manual) determines procedural rigor, sampling bias, and the control evidence auditors expect; encoding (ascii versus latin1) governs how values are serialized and exchanged, which matters the moment data crosses locales, legacy interfaces, or downstream parsers. A manual Total solids function encoded in ascii and an automated Effluent mass function encoded in latin1 are not interchangeable operations even if both produce numeric output; compliance hinges on preserving method and encoding as first-class attributes, not as incidental metadata.

**t_mass_function_basic**

| id | mass | method | encoding |
| --- | --- | --- | --- |
| FUNC-0001 | Filter cake | automated | ascii |
| FUNC-0002 | Effluent mass | manual | latin1 |
| FUNC-0003 | Target mass | automated | latin1 |
| FUNC-0004 | Total solids | manual | ascii |
| FUNC-0005 | Effluent mass | hybrid | latin1 |
| FUNC-0006 | Feedstock mass | automated | latin1 |

Assignment topology introduces subject and target to express directed relationships without collapsing them into a single undifferentiated link. In subset assignment, a mass function assigns mass to a particular entity type—FlightMass_Empty toward ObservationRecord, DroneMass_Complete toward DataQualityMetric—while bridge records bind a subject (mass_id) to a target (assigns_mass_to_id) under an explicit role. Subject is the originating governed object; target is where mass responsibility lands in the observability or quality surface. Repeating subject identifiers across rows (SUBS-0006 appearing multiple times) is intentional: one mass artifact may fan out to different targets, each edge auditable on its own. Role on the edge states the capacity in which that binding holds—observer again—so reviewers can answer not only what was assigned to what, but under which functional obligation.

**t_mass_function_assigns_to_subset**

| id | mass |
| --- | --- |
| SUBS-0001 | FlightMass_Empty |
| SUBS-0002 | TestMass_Aluminum |
| SUBS-0003 | FlightMass_Empty |
| SUBS-0004 | DroneMass_Complete |
| SUBS-0005 | CargoMass_Max |
| SUBS-0006 | DroneMass_Complete |

**t_mass_function_assigns_to_subset_assigns_mass_to**

| id | assigns_mass_to |
| --- | --- |
| SUBS-0001 | ObservationRecord |
| SUBS-0002 | SensorNode |
| SUBS-0003 | CalibrationEvent |
| SUBS-0004 | DataQualityMetric |
| SUBS-0005 | TelemetryStream |
| SUBS-0006 | GovernanceRule |

**t_mass_function_assigns_to_subset__assigns_mass_to**

| id | mass_id | assigns_mass_to_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0006 | SUBS-0002 | observer |
| SUBS-0002 | SUBS-0006 | SUBS-0004 | observer |
| SUBS-0003 | SUBS-0001 | SUBS-0003 | observer |
| SUBS-0004 | SUBS-0006 | SUBS-0003 | observer |
| SUBS-0005 | SUBS-0002 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0002 | SUBS-0003 | reviewer |
| SUBS-0007 | SUBS-0005 | SUBS-0004 | reviewer |
| SUBS-0008 | SUBS-0006 | SUBS-0003 | observer |

Taken together, these elements form a practical compliance architecture. Identifiers stabilize reference; categories and misc labels stratify meaning for humans and machines; role, role holder, and realized in activity partition accountability across people, functions, and contexts; event count supplies the quantitative footing for monitoring and investigation; method and encoding document how measurements were produced and represented; subject, target, and role articulate directed assignments that must be reconstructed during audits. Operational teams use the model to trace high-volume anomalies—such as a 421-event concentration—back through holder category, activity category, measurement method, and assignment edges, producing an evidence chain that is dense enough for control testing and legible enough for remediation. That is why each attribute is modeled explicitly rather than inferred: governance fails when any one of these dimensions is implicit, and it succeeds when every claim can be replayed from identifier through context to counted outcome.

**dim_role_holder**

| id | role_holder_label | role_holder_category |
| --- | --- | --- |
| ROLE-0001 | Role Holder Label 01 | Role Holder Category 01 |
| ROLE-0002 | Role Holder Label 02 | Role Holder Category 02 |
| ROLE-0003 | Role Holder Label 03 | Role Holder Category 03 |
| ROLE-0004 | Role Holder Label 04 | Role Holder Category 04 |
| ROLE-0005 | Role Holder Label 05 | Role Holder Category 05 |
| ROLE-0006 | Role Holder Label 06 | Role Holder Category 06 |

**dim_realized_in_activity**

| id | realized_in_activity_label | realized_in_activity_category |
| --- | --- | --- |
| ROLE-0001 | Realized In Activity Label 01 | Realized In Activity Category 01 |
| ROLE-0002 | Realized In Activity Label 02 | Realized In Activity Category 02 |
| ROLE-0003 | Realized In Activity Label 03 | Realized In Activity Category 03 |
| ROLE-0004 | Realized In Activity Label 04 | Realized In Activity Category 04 |
| ROLE-0005 | Realized In Activity Label 05 | Realized In Activity Category 05 |
| ROLE-0006 | Realized In Activity Label 06 | Realized In Activity Category 06 |