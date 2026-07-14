## Ontology-Grounded Relational Modelling of Wastewater Treatment Research

The domain under examination sits at the intersection of environmental engineering and materials science, where wastewater treatment processes are developed, tested, and deployed through structured research programmes. The conceptual model captures seven core entity types: wastewater treatment processes, industrial effluents, catalytic materials, research projects, research institutions, chemical pollutants, and chemical elements. These entities are related through a network of many-to-many associations that reflect the real-world complexity of how a treatment technology is researched, which effluents it targets, what catalytic materials it employs, and which chemical constituents are involved. The relational schema materialises this ontology by decomposing each entity into a base table, encoding cardinality-bounded relationships as foreign keys where appropriate, and modelling unrestricted many-to-many relationships through junction tables. Views then reassemble the normalised facts into domain-meaningful projections.

**Table `wastewater_treatment_processes`**

| id | process_identifier | process_type | efficiency_rating | resource_consumption_rate | status | target_pollutant_class | research_project_id |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2267 | photocatalysis | 16.95 | 16.45 | design | persistent organic pollutants | 1000 |
| 2 | PRO-2271 | photo-electrocatalysis | 20.90 | 18.90 | development | dye stuff | 1001 |
| 3 | PRO-2275 | advanced oxidation process | 24.85 | 21.35 | dissemination | heavy metals | 1002 |
| 4 | PRO-2279 | photocatalysis | 28.80 | 23.80 | operational | recalcitrant organic pollutants | 1003 |

The `wastewater_treatment_processes` table is the central process entity. Each row represents a distinct treatment technology, identified by a surrogate primary key `id` and a business key `process_identifier` such as `PRO-2267` or `PRO-2279`. The `process_type` column classifies the technology — values observed include `photocatalysis`, `photo-electrocatalysis`, `advanced oxidation process`, and `recalcitrant organic pollutants` as a target class. Quantitative attributes `efficiency_rating` and `resource_consumption_rate` capture performance metrics; for instance, process `PRO-2275` (an advanced oxidation process) achieves an efficiency rating of 24.85 while consuming resources at a rate of 21.35. The `status` column tracks lifecycle stage with values like `design`, `development`, `dissemination`, and `operational`. A foreign key `research_project_id` links each process to its sponsoring research project, establishing a direct many-to-one relationship with the `research_projects` table.

**Table `industrial_effluents`**

| id | effluent_identifier | source_industry | pollutant_concentration | biodegradability_status | toxicity_level | sample_collection_date |
|---|---|---|---|---|---|---|
| 1000 | EFF-2121 | textile & dyeing | 18.95 | non-biodegradable | highly toxic | 2025-12-06T23:57:00 |
| 1001 | EFF-2128 | tannery | 21.90 | recalcitrant | hazardous | 2022-05-17T06:14:00 |
| 1002 | EFF-2135 | paper & pulp | 24.85 | persistent | moderate | 2023-10-01T13:31:00 |
| 1003 | EFF-2142 | chemical | 27.80 | non-biodegradable | highly toxic | 2024-03-12T20:48:00 |

Industrial effluents are captured in the `industrial_effluents` table, where each row describes a waste stream characterised by its `source_industry` (e.g., `textile & dyeing`, `tannery`, `paper & pulp`, `chemical`), a numeric `pollutant_concentration` (ranging from 18.95 to 27.80 in the sample), a `biodegradability_status` such as `non-biodegradable` or `recalcitrant`, a `toxicity_level` ranging from `moderate` to `highly toxic`, and a `sample_collection_date` timestamp. The surrogate primary key `id` (values 1000–1003) and the business key `effluent_identifier` (e.g., `EFF-2121`) uniquely identify each effluent. This table stands as an independent entity in the ontology — its relationships to processes, pollutants, and elements are mediated through junction tables rather than direct foreign keys.

**Table `catalytic_materials`**

| id | material_identifier | material_class | synthesis_method | surface_area | band_gap_energy | patent_status | research_project_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MAT-2726 | nanomaterial | sol-gel | 15.95 | 7.95 | registered | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | MAT-2727 | photo-catalytic membrane | hydrothermal | 19.90 | 11.90 | pending | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | MAT-2728 | semiconductor | chemical vapor deposition | 23.85 | 15.85 | public domain | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | MAT-2729 | nanomaterial | sol-gel | 27.80 | 19.80 | registered | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `catalytic_materials` table stores the material science dimension of the domain. Each catalytic material is identified by `id`, `material_identifier` (e.g., `MAT-2726`), `material_class` (such as `nanomaterial`, `photo-catalytic membrane`, or `semiconductor`), and `synthesis_method` (including `sol-gel`, `hydrothermal`, and `chemical vapor deposition`). Physical properties are captured as `surface_area` and `band_gap_energy`, while `patent_status` records intellectual property state with values like `registered`, `pending`, and `public domain`. The `research_project_id` foreign key ties each material to its parent research project, and `created_at` / `updated_at` timestamps provide auditability.

**Table `research_projects`**

| research_project_id | project_identifier | funding_agency | start_date | end_date | project_status | grant_amount | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | PRO-2058 | DST | 2022-09-05 | 2022-09-01 | active | 11.88 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | PRO-2059 | ONGC | 2023-02-16 | 2023-02-12 | completed | 14.31 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | PRO-2060 | Korea Foundation | 2024-07-27 | 2024-07-23 | planned | 18.47 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | PRO-2061 | DST | 2025-12-11 | 2025-12-07 | active | 14.58 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Research projects form the organisational backbone of the model. The `research_projects` table uses `research_project_id` as its primary key (values 1000–1003), with `project_identifier` (e.g., `PRO-2058`) as the business key. The `funding_agency` column records the sponsor — observed values include `DST`, `ONGC`, and `Korea Foundation`. Temporal attributes `start_date` and `end_date` bracket the project lifecycle, while `project_status` takes values `active`, `completed`, or `planned`. The `grant_amount` column (e.g., 11.88, 14.31) quantifies funding. This table is referenced by processes, materials, and institutions through foreign keys and junction tables.

**Table `research_institutions`**

| id | institution_identifier | institution_name | country | institution_type | establishment_date |
|---|---|---|---|---|---|
| 1 | INS-2717 | IIT Roorkee | India | university | 2024-07-11 |
| 2 | INS-2718 | Deakin University | Australia | foundation | 2025-12-22 |
| 3 | INS-2719 | Korea Foundation | South Korea | research center | 2022-05-06 |
| 4 | INS-2720 | IIT Roorkee | India | university | 2023-10-17 |

The `research_institutions` table captures the institutional actors. Each institution has a surrogate `id`, an `institution_identifier` (e.g., `INS-2717`), an `institution_name` (such as `IIT Roorkee`, `Deakin University`, or `Korea Foundation`), a `country` (e.g., `India`, `Australia`, `South Korea`), an `institution_type` (`university`, `foundation`, `research center`), and an `establishment_date`. The many-to-many relationship between institutions and projects is modelled through two complementary junction tables, `projects_institutions` and `institutions_projects`, which together capture the bidirectional association.

**Table `chemical_pollutants`**

| pollutant_identifier | chemical_name | cas_registry_number | molecular_weight | pollutant_class | concentration_threshold |
|---|---|---|---|---|---|
| POL-2202 | Regional Initiative | CAS-2539 | 0.53 | persistent organic pollutant | 2.95 |
| POL-2208 | Seasonal Model D | CAS-2540 | 0.74 | dye stuff | 5.90 |
| POL-2214 | Integrated Cluster | CAS-2541 | 0.74 | heavy metal | 8.85 |
| POL-2220 | Extended Review | CAS-2542 | 0.6 | persistent organic pollutant | 11.80 |

Chemical pollutants are catalogued in the `chemical_pollutants` table. Each pollutant is identified by `pollutant_identifier` (e.g., `POL-2202`, `POL-2208`) as the primary key, along with `chemical_name` (such as `Regional Initiative`, `Seasonal Model D`, `Integrated Cluster`, `Extended Review`), `cas_registry_number` (e.g., `CAS-2539`), `molecular_weight` (ranging from 0.53 to 1.180), `pollutant_class` (including `persistent organic pollutant`, `dye stuff`, `heavy metal`), and `concentration_threshold`. This entity participates in many-to-many relationships with effluents, processes, and elements.

**Table `chemical_elements`**

| id | element_symbol | atomic_number | atomic_mass | electronegativity | state_at_s_t_p |
|---|---|---|---|---|---|
| 1 | primary-element-76 | 37 | 1.70 | 5.45 | solid |
| 2 | adaptive-element-77 | 42 | 3.40 | 8.90 | liquid |
| 3 | distributed-element-78 | 47 | 5.10 | 12.35 | gas |
| 4 | baseline-element-79 | 52 | 6.80 | 15.80 | solid |

The `chemical_elements` table completes the seven base entities. While no sample rows are shown in the payload, the table is structurally symmetric with the other entity tables — it stores element identifiers, names, and properties, and participates in many-to-many relationships with materials and pollutants through the `elements_materials` and `elements_pollutants` junction tables.

With the seven base tables defined, the schema employs a hybrid approach to relationship modelling. Cardinality-bounded relationships — specifically, the association between a process and its sponsoring project, and between a material and its sponsoring project — are encoded as direct foreign keys (`research_project_id` in both `wastewater_treatment_processes` and `catalytic_materials`). All other relationships are many-to-many and are materialised through dedicated junction tables. This design choice reflects the ontology's assertion that processes, effluents, materials, pollutants, and elements can participate in multiple associations without a natural owner.

The junction tables fall into three categories. First, the process-centric junctions: `processes_effluents` and `effluents_processes` both link `wastewater_treatment_processes` to `industrial_effluents`, while `processes_materials` and `materials_processes` link processes to `catalytic_materials`. Second, the project-centric junctions: `projects_processes` and `projects_materials` associate research projects with processes and materials respectively, and `projects_institutions` and `institutions_projects` model the institution-project relationship. Third, the pollutant- and element-centric junctions: `effluents_pollutants` and `pollutants_effluents` connect effluents to pollutants, `pollutants_processes` and `pollutants_elements` link pollutants to processes and elements, and `elements_materials` and `elements_pollutants` connect elements to materials and pollutants. The symmetry in naming — for example, `processes_effluents` versus `effluents_processes` — reflects the bidirectional navigability of the underlying ontology relationships, even though the physical schema stores each association once.

**Table `processes_effluents`**

| wastewater_treatment_process_id | industrial_effluent_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `processes_effluents` junction table resolves the many-to-many relationship between treatment processes and industrial effluents. Each row pairs a `process_id` with an `effluent_id`, establishing that a given process is applicable to a given effluent stream. This table enables the schema to answer questions such as "which effluents can be treated by process PRO-2267?" or "which processes target the textile & dyeing effluent EFF-2121?"

**Table `processes_materials`**

| wastewater_treatment_process_id | catalytic_material_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Similarly, `processes_materials` links `wastewater_treatment_processes` to `catalytic_materials`, capturing which catalytic materials are employed in which treatment processes. A row pairing process `PRO-2275` with material `MAT-2728` (a semiconductor synthesised by chemical vapor deposition) encodes the domain fact that this advanced oxidation process utilises this particular catalytic material.

**Table `effluents_processes`**

| industrial_effluent_id | wastewater_treatment_process_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `effluents_processes` table provides the inverse perspective of the process-effluent relationship, storing the same associations from the effluent side. This redundancy supports query optimisation and reflects the ontology's symmetric relationship definition.

**Table `effluents_pollutants`**

| industrial_effluent_id | chemical_pollutant_cas_registry_number |
|---|---|
| 1000 | CAS-2539 |
| 1000 | CAS-2540 |
| 1001 | CAS-2540 |
| 1001 | CAS-2541 |
| 1002 | CAS-2541 |
| 1002 | CAS-2542 |
| 1003 | CAS-2542 |
| 1003 | CAS-2539 |

The `effluents_pollutants` junction table connects industrial effluents to chemical pollutants. Each row asserts that a particular effluent stream contains or is associated with a specific pollutant. For example, the textile & dyeing effluent `EFF-2121` may be linked to the dye stuff pollutant `POL-2208` (Seasonal Model D, CAS-2540, molecular weight 0.74).

**Table `materials_processes`**

| catalytic_material_id | wastewater_treatment_process_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

`materials_processes` mirrors `processes_materials`, providing the material-to-process association from the catalytic material's perspective.

**Table `materials_elements`**

| catalytic_material_id | chemical_element_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `materials_elements` junction table links catalytic materials to chemical elements, capturing the elemental composition of each material. A nanomaterial such as `MAT-2726` (synthesised by sol-gel, surface area 15.95) may be associated with multiple elements through this table.

**Table `projects_processes`**

| research_project_id | wastewater_treatment_process_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

`projects_processes` associates research projects with the wastewater treatment processes they sponsor. Each row pairs a `research_project_id` with a `process_id`, enabling queries such as "which processes are funded by project PRO-2058?"

**Table `projects_materials`**

| research_project_id | catalytic_material_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `projects_materials` junction table links research projects to catalytic materials, capturing which materials are developed under which research programmes.

**Table `projects_institutions`**

| research_project_id | research_institution_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

`projects_institutions` models the many-to-many relationship between research projects and research institutions. A project such as `PRO-2058` (funded by DST, status `active`, grant amount 11.88) may be associated with multiple institutions, and an institution like `IIT Roorkee` may participate in multiple projects.

**Table `institutions_projects`**

| research_institution_id | research_project_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

`institutions_projects` provides the inverse association, storing the same institution-project pairs from the institution's perspective.

**Table `pollutants_effluents`**

| chemical_pollutant_cas_registry_number | industrial_effluent_id |
|---|---|
| CAS-2539 | 1000 |
| CAS-2539 | 1001 |
| CAS-2540 | 1001 |
| CAS-2540 | 1002 |
| CAS-2541 | 1002 |
| CAS-2541 | 1003 |
| CAS-2542 | 1003 |
| CAS-2542 | 1000 |

`pollutants_effluents` mirrors `effluents_pollutants`, providing the pollutant-to-effluent association.

**Table `pollutants_processes`**

| chemical_pollutant_cas_registry_number | wastewater_treatment_process_id |
|---|---|
| CAS-2539 | 1 |
| CAS-2539 | 2 |
| CAS-2540 | 2 |
| CAS-2540 | 3 |
| CAS-2541 | 3 |
| CAS-2541 | 4 |
| CAS-2542 | 4 |
| CAS-2542 | 1 |

The `pollutants_processes` junction table links chemical pollutants to wastewater treatment processes, capturing which processes are designed to target which pollutants. For instance, process `PRO-2267` (photocatalysis, status `design`, target class `persistent organic pollutants`) may be associated with pollutant `POL-2202` (Regional Initiative, CAS-2539).

**Table `pollutants_elements`**

| chemical_pollutant_cas_registry_number | chemical_element_id |
|---|---|
| CAS-2539 | 1 |
| CAS-2539 | 2 |
| CAS-2540 | 2 |
| CAS-2540 | 3 |
| CAS-2541 | 3 |
| CAS-2541 | 4 |
| CAS-2542 | 4 |
| CAS-2542 | 1 |

`pollutants_elements` connects chemical pollutants to chemical elements, encoding the elemental composition of each pollutant.

**Table `elements_materials`**

| chemical_element_id | catalytic_material_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

`elements_materials` mirrors `materials_elements`, providing the element-to-material association.

**Table `elements_pollutants`**

| chemical_element_id | chemical_pollutant_cas_registry_number |
|---|---|
| 1 | CAS-2539 |
| 1 | CAS-2540 |
| 2 | CAS-2540 |
| 2 | CAS-2541 |
| 3 | CAS-2541 |
| 3 | CAS-2542 |
| 4 | CAS-2542 |
| 4 | CAS-2539 |

`elements_pollutants` mirrors `pollutants_elements`, providing the element-to-pollutant association.

The junction tables collectively form a rich association graph that mirrors the ontology's relationship structure. Every many-to-many relationship is represented by at least one junction table, and most are represented by two (one in each direction), ensuring that the schema supports bidirectional navigation without requiring application-level logic to infer relationships.

The views in this schema reassemble the normalised facts into domain-meaningful projections. Each view performs a specific join across the base and junction tables to answer a particular class of domain question.

**View `v_wastewater_treatment_process_industrial_effluent_detail`**

```sql
CREATE VIEW v_wastewater_treatment_process_industrial_effluent_detail AS
SELECT a.id, a.process_identifier, a.process_type, b.id AS effluent_id, b.effluent_identifier AS effluent_effluent_identifier, b.source_industry AS effluent_source_industry
FROM wastewater_treatment_processes a
  JOIN processes_effluents j ON j.wastewater_treatment_process_id = a.id
  JOIN industrial_effluents b ON b.id = j.industrial_effluent_id;
```

| id | process_identifier | process_type | effluent_id | effluent_effluent_identifier | effluent_source_industry |
|---|---|---|---|---|---|
| 1 | PRO-2267 | photocatalysis | 1000 | EFF-2121 | textile & dyeing |
| 1 | PRO-2267 | photocatalysis | 1001 | EFF-2128 | tannery |
| 2 | PRO-2271 | photo-electrocatalysis | 1001 | EFF-2128 | tannery |
| 2 | PRO-2271 | photo-electrocatalysis | 1002 | EFF-2135 | paper & pulp |
| 3 | PRO-2275 | advanced oxidation process | 1002 | EFF-2135 | paper & pulp |
| 3 | PRO-2275 | advanced oxidation process | 1003 | EFF-2142 | chemical |
| 4 | PRO-2279 | photocatalysis | 1003 | EFF-2142 | chemical |
| 4 | PRO-2279 | photocatalysis | 1000 | EFF-2121 | textile & dyeing |

The view `v_wastewater_treatment_process_industrial_effluent_detail` joins `wastewater_treatment_processes` with `industrial_effluents` through the `processes_effluents` junction table. It answers the question: "For each wastewater treatment process, which industrial effluents can it treat, and what are the characteristics of those effluents?" A row in this view might combine process `PRO-2267` (photocatalysis, efficiency 16.95, status `design`) with effluent `EFF-2121` (textile & dyeing, pollutant concentration 18.95, toxicity `highly toxic`), revealing that this photocatalytic process is being developed to treat highly toxic textile effluents.

**View `v_wastewater_treatment_process_research_project`**

```sql
CREATE VIEW v_wastewater_treatment_process_research_project AS
SELECT a.id, a.process_identifier, a.process_type, a.efficiency_rating, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.funding_agency AS project_funding_agency
FROM wastewater_treatment_processes a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| id | process_identifier | process_type | efficiency_rating | project_research_project_id | project_project_identifier | project_funding_agency |
|---|---|---|---|---|---|---|
| 1 | PRO-2267 | photocatalysis | 16.95 | 1000 | PRO-2058 | DST |
| 2 | PRO-2271 | photo-electrocatalysis | 20.90 | 1001 | PRO-2059 | ONGC |
| 3 | PRO-2275 | advanced oxidation process | 24.85 | 1002 | PRO-2060 | Korea Foundation |
| 4 | PRO-2279 | photocatalysis | 28.80 | 1003 | PRO-2061 | DST |

The view `v_wastewater_treatment_process_research_project` joins `wastewater_treatment_processes` with `research_projects` via the `research_project_id` foreign key. It answers: "Which research project sponsors each treatment process, and what are the project's funding and status details?" A row might show process `PRO-2275` (advanced oxidation process, efficiency 24.85) sponsored by project `PRO-2060` (funded by Korea Foundation, status `planned`, grant 18.47), indicating that this high-efficiency process is in the planning phase under Korean funding.

**View `v_wastewater_treatment_process_catalytic_material_detail`**

```sql
CREATE VIEW v_wastewater_treatment_process_catalytic_material_detail AS
SELECT a.id, a.process_identifier, a.process_type, b.id AS material_id, b.material_identifier AS material_material_identifier, b.material_class AS material_material_class
FROM wastewater_treatment_processes a
  JOIN processes_materials j ON j.wastewater_treatment_process_id = a.id
  JOIN catalytic_materials b ON b.id = j.catalytic_material_id;
```

| id | process_identifier | process_type | material_id | material_material_identifier | material_material_class |
|---|---|---|---|---|---|
| 1 | PRO-2267 | photocatalysis | 1 | MAT-2726 | nanomaterial |
| 1 | PRO-2267 | photocatalysis | 2 | MAT-2727 | photo-catalytic membrane |
| 2 | PRO-2271 | photo-electrocatalysis | 2 | MAT-2727 | photo-catalytic membrane |
| 2 | PRO-2271 | photo-electrocatalysis | 3 | MAT-2728 | semiconductor |
| 3 | PRO-2275 | advanced oxidation process | 3 | MAT-2728 | semiconductor |
| 3 | PRO-2275 | advanced oxidation process | 4 | MAT-2729 | nanomaterial |
| 4 | PRO-2279 | photocatalysis | 4 | MAT-2729 | nanomaterial |
| 4 | PRO-2279 | photocatalysis | 1 | MAT-2726 | nanomaterial |

The view `v_wastewater_treatment_process_catalytic_material_detail` joins `wastewater_treatment_processes` with `catalytic_materials` through the `processes_materials` junction table. It answers: "Which catalytic materials are used in each treatment process, and what are their physical and synthesis properties?" A row might pair process `PRO-2279` (photocatalysis, operational status) with material `MAT-2729` (nanomaterial, sol-gel synthesis, surface area 27.80), showing that an operational photocatalytic process employs a high-surface-area nanomaterial.

**View `v_industrial_effluent_wastewater_treatment_process_detail`**

```sql
CREATE VIEW v_industrial_effluent_wastewater_treatment_process_detail AS
SELECT a.id, a.effluent_identifier, a.source_industry, b.id AS process_id, b.process_identifier AS process_process_identifier, b.process_type AS process_process_type
FROM industrial_effluents a
  JOIN effluents_processes j ON j.industrial_effluent_id = a.id
  JOIN wastewater_treatment_processes b ON b.id = j.wastewater_treatment_process_id;
```

| id | effluent_identifier | source_industry | process_id | process_process_identifier | process_process_type |
|---|---|---|---|---|---|
| 1000 | EFF-2121 | textile & dyeing | 1 | PRO-2267 | photocatalysis |
| 1000 | EFF-2121 | textile & dyeing | 2 | PRO-2271 | photo-electrocatalysis |
| 1001 | EFF-2128 | tannery | 2 | PRO-2271 | photo-electrocatalysis |
| 1001 | EFF-2128 | tannery | 3 | PRO-2275 | advanced oxidation process |
| 1002 | EFF-2135 | paper & pulp | 3 | PRO-2275 | advanced oxidation process |
| 1002 | EFF-2135 | paper & pulp | 4 | PRO-2279 | photocatalysis |
| 1003 | EFF-2142 | chemical | 4 | PRO-2279 | photocatalysis |
| 1003 | EFF-2142 | chemical | 1 | PRO-2267 | photocatalysis |

The view `v_industrial_effluent_wastewater_treatment_process_detail` joins `industrial_effluents` with `wastewater_treatment_processes` through the `effluents_processes` junction table. It answers: "For each industrial effluent, which treatment processes are applicable?" A row might combine effluent `EFF-2128` (tannery, recalcitrant, hazardous) with process `PRO-2271` (photo-electrocatalysis, efficiency 20.90, status `development`), revealing that a developing photo-electrocatalytic process targets hazardous tannery effluents.

**View `v_industrial_effluent_chemical_pollutant_detail`**

```sql
CREATE VIEW v_industrial_effluent_chemical_pollutant_detail AS
SELECT a.id, a.effluent_identifier, a.source_industry, b.pollutant_identifier AS pollutant_pollutant_identifier, b.chemical_name AS pollutant_chemical_name, b.cas_registry_number AS pollutant_cas_registry_number
FROM industrial_effluents a
  JOIN effluents_pollutants j ON j.industrial_effluent_id = a.id
  JOIN chemical_pollutants b ON b.cas_registry_number = j.chemical_pollutant_cas_registry_number;
```

| id | effluent_identifier | source_industry | pollutant_pollutant_identifier | pollutant_chemical_name | pollutant_cas_registry_number |
|---|---|---|---|---|---|
| 1000 | EFF-2121 | textile & dyeing | POL-2202 | Regional Initiative | CAS-2539 |
| 1000 | EFF-2121 | textile & dyeing | POL-2208 | Seasonal Model D | CAS-2540 |
| 1001 | EFF-2128 | tannery | POL-2208 | Seasonal Model D | CAS-2540 |
| 1001 | EFF-2128 | tannery | POL-2214 | Integrated Cluster | CAS-2541 |
| 1002 | EFF-2135 | paper & pulp | POL-2214 | Integrated Cluster | CAS-2541 |
| 1002 | EFF-2135 | paper & pulp | POL-2220 | Extended Review | CAS-2542 |
| 1003 | EFF-2142 | chemical | POL-2220 | Extended Review | CAS-2542 |
| 1003 | EFF-2142 | chemical | POL-2202 | Regional Initiative | CAS-2539 |

The view `v_industrial_effluent_chemical_pollutant_detail` joins `industrial_effluents` with `chemical_pollutants` through the `effluents_pollutants` junction table. It answers: "Which chemical pollutants are associated with each industrial effluent?" A row might link effluent `EFF-2135` (paper & pulp, persistent, moderate toxicity) with pollutant `POL-2214` (Integrated Cluster, heavy metal class, CAS-2541, molecular weight 0.74), identifying the specific heavy metal pollutant of concern in paper mill effluents.

**View `v_catalytic_material_wastewater_treatment_process_detail`**

```sql
CREATE VIEW v_catalytic_material_wastewater_treatment_process_detail AS
SELECT a.id, a.material_identifier, a.material_class, b.id AS process_id, b.process_identifier AS process_process_identifier, b.process_type AS process_process_type
FROM catalytic_materials a
  JOIN materials_processes j ON j.catalytic_material_id = a.id
  JOIN wastewater_treatment_processes b ON b.id = j.wastewater_treatment_process_id;
```

| id | material_identifier | material_class | process_id | process_process_identifier | process_process_type |
|---|---|---|---|---|---|
| 1 | MAT-2726 | nanomaterial | 1 | PRO-2267 | photocatalysis |
| 1 | MAT-2726 | nanomaterial | 2 | PRO-2271 | photo-electrocatalysis |
| 2 | MAT-2727 | photo-catalytic membrane | 2 | PRO-2271 | photo-electrocatalysis |
| 2 | MAT-2727 | photo-catalytic membrane | 3 | PRO-2275 | advanced oxidation process |
| 3 | MAT-2728 | semiconductor | 3 | PRO-2275 | advanced oxidation process |
| 3 | MAT-2728 | semiconductor | 4 | PRO-2279 | photocatalysis |
| 4 | MAT-2729 | nanomaterial | 4 | PRO-2279 | photocatalysis |
| 4 | MAT-2729 | nanomaterial | 1 | PRO-2267 | photocatalysis |

The view `v_catalytic_material_wastewater_treatment_process_detail` joins `catalytic_materials` with `wastewater_treatment_processes` through the `materials_processes` junction table. It answers: "For each catalytic material, which treatment processes employ it?" A row might show material `MAT-2727` (photo-catalytic membrane, hydrothermal synthesis, band gap 11.90) used in process `PRO-2271` (photo-electrocatalysis, status `development`), connecting the material's physical properties to its application context.

**View `v_catalytic_material_research_project`**

```sql
CREATE VIEW v_catalytic_material_research_project AS
SELECT a.id, a.material_identifier, a.material_class, a.synthesis_method, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.funding_agency AS project_funding_agency
FROM catalytic_materials a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| id | material_identifier | material_class | synthesis_method | project_research_project_id | project_project_identifier | project_funding_agency |
|---|---|---|---|---|---|---|
| 1 | MAT-2726 | nanomaterial | sol-gel | 1000 | PRO-2058 | DST |
| 2 | MAT-2727 | photo-catalytic membrane | hydrothermal | 1001 | PRO-2059 | ONGC |
| 3 | MAT-2728 | semiconductor | chemical vapor deposition | 1002 | PRO-2060 | Korea Foundation |
| 4 | MAT-2729 | nanomaterial | sol-gel | 1003 | PRO-2061 | DST |

The view `v_catalytic_material_research_project` joins `catalytic_materials` with `research_projects` via the `research_project_id` foreign key. It answers: "Which research project develops each catalytic material?" A row might pair material `MAT-2728` (semiconductor, chemical vapor deposition, public domain patent status) with project `PRO-2060` (Korea Foundation, planned, grant 18.47), showing that a publicly available semiconductor material is being developed under Korean funding.

**View `v_catalytic_material_chemical_element_detail`**

```sql
CREATE VIEW v_catalytic_material_chemical_element_detail AS
SELECT a.id, a.material_identifier, a.material_class, b.id AS element_id, b.element_symbol AS element_element_symbol, b.atomic_number AS element_atomic_number
FROM catalytic_materials a
  JOIN materials_elements j ON j.catalytic_material_id = a.id
  JOIN chemical_elements b ON b.id = j.chemical_element_id;
```

| id | material_identifier | material_class | element_id | element_element_symbol | element_atomic_number |
|---|---|---|---|---|---|
| 1 | MAT-2726 | nanomaterial | 1 | primary-element-76 | 37 |
| 1 | MAT-2726 | nanomaterial | 2 | adaptive-element-77 | 42 |
| 2 | MAT-2727 | photo-catalytic membrane | 2 | adaptive-element-77 | 42 |
| 2 | MAT-2727 | photo-catalytic membrane | 3 | distributed-element-78 | 47 |
| 3 | MAT-2728 | semiconductor | 3 | distributed-element-78 | 47 |
| 3 | MAT-2728 | semiconductor | 4 | baseline-element-79 | 52 |
| 4 | MAT-2729 | nanomaterial | 4 | baseline-element-79 | 52 |
| 4 | MAT-2729 | nanomaterial | 1 | primary-element-76 | 37 |

The view `v_catalytic_material_chemical_element_detail` joins `catalytic_materials` with `chemical_elements` through the `materials_elements` junction table. It answers: "Which chemical elements compose each catalytic material?" A row might link material `MAT-2726` (nanomaterial, sol-gel, surface area 15.95) with a chemical element, revealing the elemental constituents that determine the material's catalytic properties.

**View `v_research_project_wastewater_treatment_process_detail`**

```sql
CREATE VIEW v_research_project_wastewater_treatment_process_detail AS
SELECT a.research_project_id, a.project_identifier, a.funding_agency, b.id AS process_id, b.process_identifier AS process_process_identifier, b.process_type AS process_process_type
FROM research_projects a
  JOIN projects_processes j ON j.research_project_id = a.research_project_id
  JOIN wastewater_treatment_processes b ON b.id = j.wastewater_treatment_process_id;
```

| research_project_id | project_identifier | funding_agency | process_id | process_process_identifier | process_process_type |
|---|---|---|---|---|---|
| 1000 | PRO-2058 | DST | 1 | PRO-2267 | photocatalysis |
| 1000 | PRO-2058 | DST | 2 | PRO-2271 | photo-electrocatalysis |
| 1001 | PRO-2059 | ONGC | 2 | PRO-2271 | photo-electrocatalysis |
| 1001 | PRO-2059 | ONGC | 3 | PRO-2275 | advanced oxidation process |
| 1002 | PRO-2060 | Korea Foundation | 3 | PRO-2275 | advanced oxidation process |
| 1002 | PRO-2060 | Korea Foundation | 4 | PRO-2279 | photocatalysis |
| 1003 | PRO-2061 | DST | 4 | PRO-2279 | photocatalysis |
| 1003 | PRO-2061 | DST | 1 | PRO-2267 | photocatalysis |

The view `v_research_project_wastewater_treatment_process_detail` joins `research_projects` with `wastewater_treatment_processes` through the `projects_processes` junction table. It answers: "For each research project, which treatment processes does it fund?" A row might show project `PRO-2058` (DST, active, grant 11.88) funding process `PRO-2267` (photocatalysis, efficiency 16.95, status `design`), connecting funding decisions to specific technology development efforts.

**View `v_research_project_catalytic_material_detail`**

```sql
CREATE VIEW v_research_project_catalytic_material_detail AS
SELECT a.research_project_id, a.project_identifier, a.funding_agency, b.id AS material_id, b.material_identifier AS material_material_identifier, b.material_class AS material_material_class
FROM research_projects a
  JOIN projects_materials j ON j.research_project_id = a.research_project_id
  JOIN catalytic_materials b ON b.id = j.catalytic_material_id;
```

| research_project_id | project_identifier | funding_agency | material_id | material_material_identifier | material_material_class |
|---|---|---|---|---|---|
| 1000 | PRO-2058 | DST | 1 | MAT-2726 | nanomaterial |
| 1000 | PRO-2058 | DST | 2 | MAT-2727 | photo-catalytic membrane |
| 1001 | PRO-2059 | ONGC | 2 | MAT-2727 | photo-catalytic membrane |
| 1001 | PRO-2059 | ONGC | 3 | MAT-2728 | semiconductor |
| 1002 | PRO-2060 | Korea Foundation | 3 | MAT-2728 | semiconductor |
| 1002 | PRO-2060 | Korea Foundation | 4 | MAT-2729 | nanomaterial |
| 1003 | PRO-2061 | DST | 4 | MAT-2729 | nanomaterial |
| 1003 | PRO-2061 | DST | 1 | MAT-2726 | nanomaterial |

The view `v_research_project_catalytic_material_detail` joins `research_projects` with `catalytic_materials` through the `projects_materials` junction table. It answers: "For each research project, which catalytic materials does it develop?" A row might pair project `PRO-2059` (ONGC, completed, grant 14.31) with material `MAT-2727` (photo-catalytic membrane, pending patent), showing that a completed ONGC-funded project produced a patent-pending photo-catalytic membrane.

**View `v_research_project_research_institution_detail`**

```sql
CREATE VIEW v_research_project_research_institution_detail AS
SELECT a.research_project_id, a.project_identifier, a.funding_agency, b.id AS institution_id, b.institution_identifier AS institution_institution_identifier, b.institution_name AS institution_institution_name
FROM research_projects a
  JOIN projects_institutions j ON j.research_project_id = a.research_project_id
  JOIN research_institutions b ON b.id = j.research_institution_id;
```

| research_project_id | project_identifier | funding_agency | institution_id | institution_institution_identifier | institution_institution_name |
|---|---|---|---|---|---|
| 1000 | PRO-2058 | DST | 1 | INS-2717 | IIT Roorkee |
| 1000 | PRO-2058 | DST | 2 | INS-2718 | Deakin University |
| 1001 | PRO-2059 | ONGC | 2 | INS-2718 | Deakin University |
| 1001 | PRO-2059 | ONGC | 3 | INS-2719 | Korea Foundation |
| 1002 | PRO-2060 | Korea Foundation | 3 | INS-2719 | Korea Foundation |
| 1002 | PRO-2060 | Korea Foundation | 4 | INS-2720 | IIT Roorkee |
| 1003 | PRO-2061 | DST | 4 | INS-2720 | IIT Roorkee |
| 1003 | PRO-2061 | DST | 1 | INS-2717 | IIT Roorkee |

The view `v_research_project_research_institution_detail` joins `research_projects` with `research_institutions` through the `projects_institutions` junction table. It answers: "For each research project, which institutions participate in it?" A row might link project `PRO-2061` (DST, active, grant 14.58) with institution `INS-2717` (IIT Roorkee, India, university), identifying the institutional partners in DST-funded research.

**View `v_research_institution_research_project_detail`**

```sql
CREATE VIEW v_research_institution_research_project_detail AS
SELECT a.id, a.institution_identifier, a.institution_name, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.funding_agency AS project_funding_agency
FROM research_institutions a
  JOIN institutions_projects j ON j.research_institution_id = a.id
  JOIN research_projects b ON b.research_project_id = j.research_project_id;
```

| id | institution_identifier | institution_name | project_research_project_id | project_project_identifier | project_funding_agency |
|---|---|---|---|---|---|
| 1 | INS-2717 | IIT Roorkee | 1000 | PRO-2058 | DST |
| 1 | INS-2717 | IIT Roorkee | 1001 | PRO-2059 | ONGC |
| 2 | INS-2718 | Deakin University | 1001 | PRO-2059 | ONGC |
| 2 | INS-2718 | Deakin University | 1002 | PRO-2060 | Korea Foundation |
| 3 | INS-2719 | Korea Foundation | 1002 | PRO-2060 | Korea Foundation |
| 3 | INS-2719 | Korea Foundation | 1003 | PRO-2061 | DST |
| 4 | INS-2720 | IIT Roorkee | 1003 | PRO-2061 | DST |
| 4 | INS-2720 | IIT Roorkee | 1000 | PRO-2058 | DST |

The view `v_research_institution_research_project_detail` joins `research_institutions` with `research_projects` through the `institutions_projects` junction table. It answers: "For each research institution, which projects does it participate in?" A row might show institution `INS-2719` (Korea Foundation, South Korea, research center) participating in project `PRO-2060` (Korea Foundation, planned, grant 18.47), confirming the institution's role as both funder and participant.

**View `v_chemical_pollutant_industrial_effluent_detail`**

```sql
CREATE VIEW v_chemical_pollutant_industrial_effluent_detail AS
SELECT a.pollutant_identifier, a.chemical_name, a.cas_registry_number, b.id AS effluent_id, b.effluent_identifier AS effluent_effluent_identifier, b.source_industry AS effluent_source_industry
FROM chemical_pollutants a
  JOIN pollutants_effluents j ON j.chemical_pollutant_cas_registry_number = a.cas_registry_number
  JOIN industrial_effluents b ON b.id = j.industrial_effluent_id;
```

| pollutant_identifier | chemical_name | cas_registry_number | effluent_id | effluent_effluent_identifier | effluent_source_industry |
|---|---|---|---|---|---|
| POL-2202 | Regional Initiative | CAS-2539 | 1000 | EFF-2121 | textile & dyeing |
| POL-2202 | Regional Initiative | CAS-2539 | 1001 | EFF-2128 | tannery |
| POL-2208 | Seasonal Model D | CAS-2540 | 1001 | EFF-2128 | tannery |
| POL-2208 | Seasonal Model D | CAS-2540 | 1002 | EFF-2135 | paper & pulp |
| POL-2214 | Integrated Cluster | CAS-2541 | 1002 | EFF-2135 | paper & pulp |
| POL-2214 | Integrated Cluster | CAS-2541 | 1003 | EFF-2142 | chemical |
| POL-2220 | Extended Review | CAS-2542 | 1003 | EFF-2142 | chemical |
| POL-2220 | Extended Review | CAS-2542 | 1000 | EFF-2121 | textile & dyeing |

The view `v_chemical_pollutant_industrial_effluent_detail` joins `chemical_pollutants` with `industrial_effluents` through the `pollutants_effluents` junction table. It answers: "For each chemical pollutant, which industrial effluents contain or are associated with it?" A row might link pollutant `POL-2208` (Seasonal Model D, dye stuff class, CAS-2540) with effluent `EFF-2121` (textile & dyeing, highly toxic), connecting the pollutant's chemical identity to its industrial source.

**View `v_chemical_pollutant_wastewater_treatment_process_detail`**

```sql
CREATE VIEW v_chemical_pollutant_wastewater_treatment_process_detail AS
SELECT a.pollutant_identifier, a.chemical_name, a.cas_registry_number, b.id AS process_id, b.process_identifier AS process_process_identifier, b.process_type AS process_process_type
FROM chemical_pollutants a
  JOIN pollutants_processes j ON j.chemical_pollutant_cas_registry_number = a.cas_registry_number
  JOIN wastewater_treatment_processes b ON b.id = j.wastewater_treatment_process_id;
```

| pollutant_identifier | chemical_name | cas_registry_number | process_id | process_process_identifier | process_process_type |
|---|---|---|---|---|---|
| POL-2202 | Regional Initiative | CAS-2539 | 1 | PRO-2267 | photocatalysis |
| POL-2202 | Regional Initiative | CAS-2539 | 2 | PRO-2271 | photo-electrocatalysis |
| POL-2208 | Seasonal Model D | CAS-2540 | 2 | PRO-2271 | photo-electrocatalysis |
| POL-2208 | Seasonal Model D | CAS-2540 | 3 | PRO-2275 | advanced oxidation process |
| POL-2214 | Integrated Cluster | CAS-2541 | 3 | PRO-2275 | advanced oxidation process |
| POL-2214 | Integrated Cluster | CAS-2541 | 4 | PRO-2279 | photocatalysis |
| POL-2220 | Extended Review | CAS-2542 | 4 | PRO-2279 | photocatalysis |
| POL-2220 | Extended Review | CAS-2542 | 1 | PRO-2267 | photocatalysis |

The view `v_chemical_pollutant_wastewater_treatment_process_detail` joins `chemical_pollutants` with `wastewater_treatment_processes` through the `pollutants_processes` junction table. It answers: "For each chemical pollutant, which treatment processes target it?" A row might pair pollutant `POL-2202` (Regional Initiative, persistent organic pollutant, CAS-2539) with process `PRO-2267` (photocatalysis, target class `persistent organic pollutants`), showing that this photocatalytic process is specifically designed to address persistent organic pollutants.

**View `v_chemical_pollutant_chemical_element_detail`**

```sql
CREATE VIEW v_chemical_pollutant_chemical_element_detail AS
SELECT a.pollutant_identifier, a.chemical_name, a.cas_registry_number, b.id AS element_id, b.element_symbol AS element_element_symbol, b.atomic_number AS element_atomic_number
FROM chemical_pollutants a
  JOIN pollutants_elements j ON j.chemical_pollutant_cas_registry_number = a.cas_registry_number
  JOIN chemical_elements b ON b.id = j.chemical_element_id;
```

| pollutant_identifier | chemical_name | cas_registry_number | element_id | element_element_symbol | element_atomic_number |
|---|---|---|---|---|---|
| POL-2202 | Regional Initiative | CAS-2539 | 1 | primary-element-76 | 37 |
| POL-2202 | Regional Initiative | CAS-2539 | 2 | adaptive-element-77 | 42 |
| POL-2208 | Seasonal Model D | CAS-2540 | 2 | adaptive-element-77 | 42 |
| POL-2208 | Seasonal Model D | CAS-2540 | 3 | distributed-element-78 | 47 |
| POL-2214 | Integrated Cluster | CAS-2541 | 3 | distributed-element-78 | 47 |
| POL-2214 | Integrated Cluster | CAS-2541 | 4 | baseline-element-79 | 52 |
| POL-2220 | Extended Review | CAS-2542 | 4 | baseline-element-79 | 52 |
| POL-2220 | Extended Review | CAS-2542 | 1 | primary-element-76 | 37 |

The view `v_chemical_pollutant_chemical_element_detail` joins `chemical_pollutants` with `chemical_elements` through the `pollutants_elements` junction table. It answers: "Which chemical elements compose each chemical pollutant?" A row might link pollutant `POL-2220` (Extended Review, persistent organic pollutant, CAS-2542) with a chemical element, revealing the elemental building blocks of the pollutant molecule.

**View `v_chemical_element_catalytic_material_detail`**

```sql
CREATE VIEW v_chemical_element_catalytic_material_detail AS
SELECT a.id, a.element_symbol, a.atomic_number, b.id AS material_id, b.material_identifier AS material_material_identifier, b.material_class AS material_material_class
FROM chemical_elements a
  JOIN elements_materials j ON j.chemical_element_id = a.id
  JOIN catalytic_materials b ON b.id = j.catalytic_material_id;
```

| id | element_symbol | atomic_number | material_id | material_material_identifier | material_material_class |
|---|---|---|---|---|---|
| 1 | primary-element-76 | 37 | 1 | MAT-2726 | nanomaterial |
| 1 | primary-element-76 | 37 | 2 | MAT-2727 | photo-catalytic membrane |
| 2 | adaptive-element-77 | 42 | 2 | MAT-2727 | photo-catalytic membrane |
| 2 | adaptive-element-77 | 42 | 3 | MAT-2728 | semiconductor |
| 3 | distributed-element-78 | 47 | 3 | MAT-2728 | semiconductor |
| 3 | distributed-element-78 | 47 | 4 | MAT-2729 | nanomaterial |
| 4 | baseline-element-79 | 52 | 4 | MAT-2729 | nanomaterial |
| 4 | baseline-element-79 | 52 | 1 | MAT-2726 | nanomaterial |

The view `v_chemical_element_catalytic_material_detail` joins `chemical_elements` with `catalytic_materials` through the `elements_materials` junction table. It answers: "For each chemical element, which catalytic materials contain it?" A row might show a chemical element present in material `MAT-2726` (nanomaterial, sol-gel, surface area 15.95), connecting elemental composition to material properties.

**View `v_chemical_element_chemical_pollutant_detail`**

```sql
CREATE VIEW v_chemical_element_chemical_pollutant_detail AS
SELECT a.id, a.element_symbol, a.atomic_number, b.pollutant_identifier AS pollutant_pollutant_identifier, b.chemical_name AS pollutant_chemical_name, b.cas_registry_number AS pollutant_cas_registry_number
FROM chemical_elements a
  JOIN elements_pollutants j ON j.chemical_element_id = a.id
  JOIN chemical_pollutants b ON b.cas_registry_number = j.chemical_pollutant_cas_registry_number;
```

| id | element_symbol | atomic_number | pollutant_pollutant_identifier | pollutant_chemical_name | pollutant_cas_registry_number |
|---|---|---|---|---|---|
| 1 | primary-element-76 | 37 | POL-2202 | Regional Initiative | CAS-2539 |
| 1 | primary-element-76 | 37 | POL-2208 | Seasonal Model D | CAS-2540 |
| 2 | adaptive-element-77 | 42 | POL-2208 | Seasonal Model D | CAS-2540 |
| 2 | adaptive-element-77 | 42 | POL-2214 | Integrated Cluster | CAS-2541 |
| 3 | distributed-element-78 | 47 | POL-2214 | Integrated Cluster | CAS-2541 |
| 3 | distributed-element-78 | 47 | POL-2220 | Extended Review | CAS-2542 |
| 4 | baseline-element-79 | 52 | POL-2220 | Extended Review | CAS-2542 |
| 4 | baseline-element-79 | 52 | POL-2202 | Regional Initiative | CAS-2539 |

The view `v_chemical_element_chemical_pollutant_detail` joins `chemical_elements` with `chemical_pollutants` through the `elements_pollutants` junction table. It answers: "For each chemical element, which pollutants contain it?" A row might link a chemical element to pollutant `POL-2214` (Integrated Cluster, heavy metal class, molecular weight 0.74), identifying the elemental constituents of heavy metal pollutants.

The schema's design reflects a deliberate trade-off between normalisation and query convenience. By decomposing the ontology into seven base tables and twenty junction tables, the model eliminates redundancy and enforces referential integrity at the database level. The views then provide denormalised projections that answer specific domain questions without requiring application-level joins. This architecture supports both analytical queries (e.g., "what is the average efficiency of photocatalysis processes?") and operational queries (e.g., "which effluents can be treated by the processes funded by DST?") while maintaining a single source of truth for each entity. The symmetric junction table pairs — such as `processes_effluents` and `effluents_processes` — ensure that navigation is equally efficient in either direction, a design choice that mirrors the bidirectional nature of the underlying ontology relationships and simplifies query construction across the full association graph.