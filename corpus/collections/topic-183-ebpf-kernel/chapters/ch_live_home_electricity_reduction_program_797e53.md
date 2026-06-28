---
chapter_id: ch_live_home_electricity_reduction_program_797e53
topic_id: 183
family: 08_derived
cited_terms: ['home_electricity_reduction_program', 'host_connection_process', 'human_rights_impact_report']
model: engine-refine
---

Relational data architectures rely on stable identifiers to anchor entities across disparate domains, ensuring that every record can be uniquely referenced and consistently joined. Whether tracking residential energy conservation initiatives like the EcoHome Initiative or SmartThermostat Rebate, or cataloging botanical interactions such as Zea mays B73 and Helianthus annuus, each entity receives a distinct identifier that serves as the primary key for downstream relationships. These identifiers do not exist in isolation; they function as reference points within subject-target linkages that map how one entity engages with another. In practice, a subject record acts as the initiating or owning entity in a relationship, while the target represents the counterpart it connects to, forming the structural backbone of many-to-many and one-to-many associations.

The nature of these connections is further clarified through role assignments and cardinality constraints. When entities intersect, a role attribute defines the specific function or capacity in which one party participates relative to the other—whether acting as a contributor, reviewer, owner, or observer. For instance, a household participant such as a Property Manager or MultiGen Home may be linked to a reductionprogram under a contributor role, while another entity assumes a reviewer capacity. Similarly, in agricultural host-parasite modeling, a hostconnectionprocess might link to a parasiticplant component like Haustorium or Cortical cells under an observer or owner role. To prevent ambiguous multiplicity, a cardinality note is attached to these junction records, explicitly documenting relationship constraints and ensuring that data consumers understand whether associations are strictly bounded, one-to-many, or fully flexible.

**t_home_electricity_reduction_program**

| id | reduction_program |
| --- | --- |
| PROG-0001 | EcoHome Initiative |
| PROG-0002 | SmartThermostat Rebate |
| PROG-0003 | PowerDown Project |
| PROG-0004 | NetZero Home |
| PROG-0005 | DemandResponse Trial |
| PROG-0006 | SmartThermostat Rebate |

**t_home_electricity_reduction_program_targets_participant**

| id | targets_participant |
| --- | --- |
| PROG-0001 | MultiGen Home |
| PROG-0002 | Property Manager |
| PROG-0003 | SingleParent Household |
| PROG-0004 | Property Manager |
| PROG-0005 | Suburban Dweller |
| PROG-0006 | Large Family Unit |
| PROG-0007 | Urban Apartment |

**t_host_connection_process**

| id | host_connection_process |
| --- | --- |
| PROC-0001 | Zea mays B73 |
| PROC-0002 | Helianthus annuus |
| PROC-0003 | Hordeum vulgare |
| PROC-0004 | Quercus robur |
| PROC-0005 | Helianthus annuus |
| PROC-0006 | Populus trichocarpa |
| PROC-0007 | Gossypium hirsutum |

**t_host_connection_process_has_participant**

| id | has_participant |
| --- | --- |
| PROC-0001 | Haustorium |
| PROC-0002 | Cortical cells |
| PROC-0003 | Haustorium |
| PROC-0004 | Cortical cells |
| PROC-0005 | Parasite root tip |
| PROC-0006 | Sieve tube element |
| PROC-0007 | Vascular cambium |
| PROC-0008 | Root xylem |

**t_host_connection_process__has_participant**

| id | host_id | has_participant_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0007 | PROC-0003 | observer |
| PROC-0002 | PROC-0007 | PROC-0007 | observer |
| PROC-0003 | PROC-0007 | PROC-0004 | owner |
| PROC-0004 | PROC-0007 | PROC-0003 | reviewer |
| PROC-0005 | PROC-0005 | PROC-0005 | contributor |
| PROC-0006 | PROC-0001 | PROC-0008 | contributor |
| PROC-0007 | PROC-0003 | PROC-0002 | contributor |
| PROC-0008 | PROC-0004 | PROC-0004 | owner |

Beyond structural linkages, dimensional attributes provide the contextual layer necessary for classification, filtering, and reporting. Categories and misc descriptors serve as organizational taxonomies that group entities by function, status, or domain relevance. In reporting frameworks, a dimension table might assign a categorical classification alongside a misc label to each reports on entity, enabling analysts to slice data by thematic groupings rather than raw identifiers. These attributes transform opaque reference keys into interpretable business or scientific concepts, allowing systems to aggregate, drill down, or cross-tabulate records without altering the underlying relational schema.

**dim_reports_on**

| id | reports_on_label | reports_on_category |
| --- | --- | --- |
| REPO-0001 | Reports On Label 01 | Reports On Category 01 |
| REPO-0002 | Reports On Label 02 | Reports On Category 02 |
| REPO-0003 | Reports On Label 03 | Reports On Category 03 |
| REPO-0004 | Reports On Label 04 | Reports On Category 04 |
| REPO-0005 | Reports On Label 05 | Reports On Category 05 |
| REPO-0006 | Reports On Label 06 | Reports On Category 06 |
| REPO-0007 | Reports On Label 07 | Reports On Category 07 |

Quantitative analysis emerges when these dimensional structures are anchored to fact tables that capture measurable outcomes. Event counts, for example, quantify activity volume or transaction frequency tied to a specific reports on dimension. A fact record might associate a reporting key with a discrete event count—such as 369, 491, 354, or 167 occurrences—providing a numerical baseline for trend analysis, benchmarking, or compliance tracking. Because the reporting key references a dimensional entity, the count inherits all associated categories and misc labels, ensuring that numerical metrics remain semantically grounded and contextually rich.

**fact_human**

| id | reports_on_key | event_count |
| --- | --- | --- |
| REPO-0001 | REPO-0006 | 369 |
| REPO-0002 | REPO-0006 | 491 |
| REPO-0003 | REPO-0005 | 354 |
| REPO-0004 | REPO-0007 | 167 |
| REPO-0005 | REPO-0007 | 8 |
| REPO-0006 | REPO-0001 | 333 |
| REPO-0007 | REPO-0001 | 488 |
| REPO-0008 | REPO-0002 | 207 |

Together, these patterns form a cohesive data governance framework that balances structural precision with analytical flexibility. Identifiers guarantee referential integrity, subject-target mappings capture complex real-world interactions, roles and cardinality notes clarify relationship semantics, and dimensional attributes supply the categorization needed for meaningful reporting. Whether modeling residential electricity reduction programs, botanical host-parasite dynamics, or institutional reporting hierarchies, this relational approach ensures that data remains both machine-readable and human-interpretable, supporting auditability, scalability, and cross-domain interoperability.

**t_home_electricity_reduction_program__targets_participant**

| id | home_id | targets_participant_id | role |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0001 | PROG-0007 | contributor |
| PROG-0002 | PROG-0003 | PROG-0002 | contributor |
| PROG-0003 | PROG-0002 | PROG-0007 | reviewer |
| PROG-0004 | PROG-0001 | PROG-0003 | reviewer |
| PROG-0005 | PROG-0006 | PROG-0004 | contributor |
| PROG-0006 | PROG-0003 | PROG-0007 | observer |
| PROG-0007 | PROG-0001 | PROG-0002 | contributor |
| PROG-0008 | PROG-0004 | PROG-0004 | contributor |

**t_home_electricity_reduction_program_addresses_usage_metric**

| id | addresses_usage_metric |
| --- | --- |
| PROG-0001 | Seasonal Peak |
| PROG-0002 | Daily kWh Consumption |
| PROG-0003 | Base Load Baseline |
| PROG-0004 | Daily kWh Consumption |
| PROG-0005 | Base Load Baseline |
| PROG-0006 | Base Load Baseline |

**t_home_electricity_reduction_program__addresses_usage_metric**

| id | home_id | addresses_usage_metric_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | PROG-0004 | reviewer | Cardinality Note 01 |
| PROG-0002 | PROG-0001 | PROG-0006 | owner | Cardinality Note 02 |
| PROG-0003 | PROG-0001 | PROG-0006 | observer | Cardinality Note 03 |
| PROG-0004 | PROG-0006 | PROG-0002 | observer | Cardinality Note 04 |
| PROG-0005 | PROG-0002 | PROG-0005 | contributor | Cardinality Note 05 |
| PROG-0006 | PROG-0005 | PROG-0005 | contributor | Cardinality Note 06 |
| PROG-0007 | PROG-0003 | PROG-0003 | observer | Cardinality Note 07 |
| PROG-0008 | PROG-0006 | PROG-0002 | contributor | Cardinality Note 08 |