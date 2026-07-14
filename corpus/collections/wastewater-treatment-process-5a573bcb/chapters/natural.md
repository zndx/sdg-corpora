## Foundations of Wastewater Remediation Research

Industrial wastewater treatment sits at the intersection of chemical engineering, materials science, and environmental policy. Facilities discharging effluents from textile dyeing, tannery operations, paper and pulp manufacturing, and chemical processing carry complex contaminant loads that demand targeted remediation strategies. The records maintained across treatment process registries, effluent sampling databases, catalytic material inventories, and research project portfolios form an interconnected knowledge base that practitioners consult to match treatment technologies to specific industrial challenges. This chapter walks through the principal data entities and the relational views that synthesize them into actionable intelligence.

**Table `wastewater_treatment_processes`**

| id | process_identifier | process_type | efficiency_rating | resource_consumption_rate | status | target_pollutant_class | research_project_id |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2267 | photocatalysis | 16.95 | 16.45 | design | persistent organic pollutants | 1000 |
| 2 | PRO-2271 | photo-electrocatalysis | 20.90 | 18.90 | development | dye stuff | 1001 |
| 3 | PRO-2275 | advanced oxidation process | 24.85 | 21.35 | dissemination | heavy metals | 1002 |
| 4 | PRO-2279 | photocatalysis | 28.80 | 23.80 | operational | recalcitrant organic pollutants | 1003 |

The wastewater treatment processes table catalogs discrete remediation technologies, each identified by a process identifier such as PRO-2267 or PRO-2279. The process_type column distinguishes between photocatalysis, photo-electrocatalysis, and advanced oxidation processes. Efficiency ratings range from 16.95 for the photocatalysis process PRO-2267 up to 28.80 for the operational photocatalysis process PRO-2279, while resource consumption rates follow a similar upward trajectory from 16.45 to 23.80. The status column tracks the maturity of each process through stages—design, development, dissemination, and operational—with PRO-2279 being the sole process currently classified as operational. Each process targets a specific pollutant class: persistent organic pollutants, dye stuff, heavy metals, or recalcitrant organic pollutants. The research_project_id column links each process to its sponsoring research initiative, establishing the first bridge between technology development and project management.

**Table `industrial_effluents`**

| id | effluent_identifier | source_industry | pollutant_concentration | biodegradability_status | toxicity_level | sample_collection_date |
|---|---|---|---|---|---|---|
| 1000 | EFF-2121 | textile & dyeing | 18.95 | non-biodegradable | highly toxic | 2025-12-06T23:57:00 |
| 1001 | EFF-2128 | tannery | 21.90 | recalcitrant | hazardous | 2022-05-17T06:14:00 |
| 1002 | EFF-2135 | paper & pulp | 24.85 | persistent | moderate | 2023-10-01T13:31:00 |
| 1003 | EFF-2142 | chemical | 27.80 | non-biodegradable | highly toxic | 2024-03-12T20:48:00 |

Industrial effluents represent the waste streams that treatment processes are designed to address. The effluent_identifier column assigns codes such as EFF-2121 and EFF-2142 to individual waste streams, while the source_industry column identifies their origin—textile and dyeing, tannery, paper and pulp, and chemical industries. Pollutant concentration values range from 18.95 for the textile effluent EFF-2121 to 27.80 for the chemical effluent EFF-2142. Biodegradability status distinguishes between non-biodegradable, recalcitrant, and persistent waste streams, with toxicity levels classified as highly toxic, hazardous, or moderate. Sample collection dates span from 2022-05-17 to 2025-12-06, providing a temporal record of when each effluent characterization was performed.

**Table `catalytic_materials`**

| id | material_identifier | material_class | synthesis_method | surface_area | band_gap_energy | patent_status | research_project_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MAT-2726 | nanomaterial | sol-gel | 15.95 | 7.95 | registered | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | MAT-2727 | photo-catalytic membrane | hydrothermal | 19.90 | 11.90 | pending | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | MAT-2728 | semiconductor | chemical vapor deposition | 23.85 | 15.85 | public domain | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | MAT-2729 | nanomaterial | sol-gel | 27.80 | 19.80 | registered | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Catalytic materials form the physical medium through which many treatment processes achieve contaminant degradation. The material_identifier column assigns codes like MAT-2726 and MAT-2729 to individual materials, while the material_class column categorizes them as nanomaterial, photo-catalytic membrane, or semiconductor. Synthesis methods include sol-gel, hydrothermal, and chemical vapor deposition. Surface area values range from 15.95 for MAT-2726 to 27.80 for MAT-2729, and band gap energy values span from 7.95 to 19.80 electron volts. Patent status tracks intellectual property through registered, pending, and public domain categories. Each material is linked to a research_project_id, connecting material development to its funding source. Timestamps in created_at and updated_at columns record the material's lifecycle within the database.

**Table `research_projects`**

| research_project_id | project_identifier | funding_agency | start_date | end_date | project_status | grant_amount | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | PRO-2058 | DST | 2022-09-05 | 2022-09-01 | active | 11.88 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | PRO-2059 | ONGC | 2023-02-16 | 2023-02-12 | completed | 14.31 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | PRO-2060 | Korea Foundation | 2024-07-27 | 2024-07-23 | planned | 18.47 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | PRO-2061 | DST | 2025-12-11 | 2025-12-07 | active | 14.58 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Research projects serve as the organizational container for both treatment processes and catalytic materials. The project_identifier column assigns codes such as PRO-2058 through PRO-2061 to individual projects, while the funding_agency column identifies sponsors including DST, ONGC, and Korea Foundation. Start and end dates define project timelines, with project_status tracking active, completed, and planned phases. Grant amounts range from 11.88 for PRO-2058 to 18.47 for PRO-2060. The lifecycle timestamps in created_at and updated_at columns mirror those found in the catalytic materials table, reflecting synchronized data entry practices.

**Table `research_institutions`**

| id | institution_identifier | institution_name | country | institution_type | establishment_date |
|---|---|---|---|---|---|
| 1 | INS-2717 | IIT Roorkee | India | university | 2024-07-11 |
| 2 | INS-2718 | Deakin University | Australia | foundation | 2025-12-22 |
| 3 | INS-2719 | Korea Foundation | South Korea | research center | 2022-05-06 |
| 4 | INS-2720 | IIT Roorkee | India | university | 2023-10-17 |

Research institutions provide the organizational infrastructure supporting the projects. The institution_identifier column assigns codes like INS-2717 through INS-2720, while institution_name records names such as IIT Roorkee, Deakin University, and Korea Foundation. The country column identifies the geographic location—India, Australia, and South Korea—while institution_type distinguishes between university, foundation, and research center. Establishment dates range from 2022-05-06 to 2025-12-22, providing historical context for each organization.

**Table `chemical_pollutants`**

| pollutant_identifier | chemical_name | cas_registry_number | molecular_weight | pollutant_class | concentration_threshold |
|---|---|---|---|---|---|
| POL-2202 | Regional Initiative | CAS-2539 | 0.53 | persistent organic pollutant | 2.95 |
| POL-2208 | Seasonal Model D | CAS-2540 | 0.74 | dye stuff | 5.90 |
| POL-2214 | Integrated Cluster | CAS-2541 | 0.74 | heavy metal | 8.85 |
| POL-2220 | Extended Review | CAS-2542 | 0.6 | persistent organic pollutant | 11.80 |

Chemical pollutants represent the specific contaminants that effluents carry and treatment processes target. The pollutant_identifier column assigns codes such as POL-2202 and POL-2220, while chemical_name records designations like Regional Initiative, Seasonal Model D, Integrated Cluster, and Extended Review. CAS registry numbers (CAS-2539 through CAS-2542) provide standardized chemical identification. Molecular weight values range from 0.53 to 0.74, and pollutant_class categorizes contaminants as persistent organic pollutant, dye stuff, or heavy metal. Concentration thresholds define regulatory or operational limits, ranging from 2.95 for POL-2202 to 11.80 for POL-2220.

**Table `chemical_elements`**

| id | element_symbol | atomic_number | atomic_mass | electronegativity | state_at_s_t_p |
|---|---|---|---|---|---|
| 1 | primary-element-76 | 37 | 1.70 | 5.45 | solid |
| 2 | adaptive-element-77 | 42 | 3.40 | 8.90 | liquid |
| 3 | distributed-element-78 | 47 | 5.10 | 12.35 | gas |
| 4 | baseline-element-79 | 52 | 6.80 | 15.80 | solid |

Chemical elements form the atomic building blocks of both catalytic materials and chemical pollutants. The element_identifier column assigns codes such as ELM-2701 through ELM-2704, while element_name records names including Titanium, Iron, Zinc, and Carbon. Atomic number values range from 22 to 29, and atomic weight values span from 44.96 to 55.85. The group and period columns place each element within the periodic table framework, while electron configuration records such as [Ar] 3d² 4s² provide electronic structure information.

The relational tables between these core entities capture the many-to-many relationships that characterize real-world wastewater treatment research.

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

The processes_effluents table establishes which treatment processes are applied to which industrial effluents. The process_id and effluent_id columns create the linkage, while the application_date records when the process was deployed against the effluent. The effectiveness_rating column quantifies the outcome of each process-effluent pairing, providing empirical evidence of treatment performance.

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

The processes_materials table links treatment processes to the catalytic materials that enable them. Through process_id and material_id columns, it documents which materials are employed in which processes. The deployment_date records the timeline of material adoption, while the material_role column describes the function the material serves within the process.

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

The effluents_processes table provides an alternative perspective on the process-effluent relationship, organizing records by effluent rather than by process. The effluent_id and process_id columns create the same linkage as processes_effluents but from the effluent's perspective, with application_date and effectiveness_rating columns providing identical contextual information.

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

The effluents_pollutants table connects industrial effluents to the chemical pollutants they contain. Through effluent_id and pollutant_id columns, it documents the contaminant composition of each waste stream. The concentration_level column quantifies the pollutant load, while the_detection_method column records how the pollutant was identified during sampling.

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

The materials_processes table mirrors the processes_materials relationship from the material's perspective. The material_id and process_id columns establish which processes utilize a given material, with deployment_date and material_role columns providing the same contextual information.

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

The materials_elements table links catalytic materials to the chemical elements that compose them. Through material_id and element_id columns, it documents the elemental composition of each material. The abundance_percentage column quantifies the proportion of each element within the material, while the_role column describes the element's function in the material's catalytic properties.

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

The projects_processes table connects research projects to the treatment processes they develop. Through project_id and process_id columns, it documents which processes are sponsored by which projects. The role_in_project column describes the process's contribution to the project's objectives.

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

The projects_materials table links research projects to the catalytic materials they develop. Through project_id and material_id columns, it documents which materials are produced under which projects. The development_stage column tracks the maturity of each material within its project.

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

The projects_institutions table connects research projects to the institutions that host or fund them. Through project_id and institution_id columns, it documents the organizational affiliation of each project. The role_type column distinguishes between primary host, collaborating partner, and funding entity.

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

The institutions_projects table mirrors the projects_institutions relationship from the institution's perspective. The institution_id and project_id columns establish which projects are associated with each institution, with role_type providing the same contextual information.

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

The pollutants_effluents table mirrors the effluents_pollutants relationship from the pollutant's perspective. Through pollutant_id and effluent_id columns, it documents which effluents contain a given pollutant. The concentration_level and detection_method columns provide identical contextual information.

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

The pollutants_processes table links chemical pollutants to the treatment processes designed to remove them. Through pollutant_id and process_id columns, it documents the target pollutant for each process. The_removal_mechanism column describes how the process achieves contaminant degradation.

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

The pollutants_elements table connects chemical pollutants to the chemical elements that constitute them. Through pollutant_id and element_id columns, it documents the elemental composition of each pollutant. The stoichiometric_ratio column quantifies the proportion of each element within the pollutant molecule.

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

The elements_materials table mirrors the materials_elements relationship from the element's perspective. Through element_id and material_id columns, it documents which materials contain a given element. The abundance_percentage and role columns provide identical contextual information.

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

The elements_pollutants table mirrors the pollutants_elements relationship from the element's perspective. Through element_id and pollutant_id columns, it documents which pollutants contain a given element. The stoichiometric_ratio column provides the same quantitative information.

The relational views synthesize these base tables into detailed, multi-entity records that answer specific operational questions.

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

This view joins wastewater treatment processes with the industrial effluents they target, answering which treatment technologies are applied to which waste streams. A representative row might show process PRO-2267 (photocatalysis, targeting persistent organic pollutants) applied to effluent EFF-2121 (textile and dyeing source, with a pollutant concentration of 18.95 and highly toxic classification). The view consolidates efficiency ratings, resource consumption rates, and biodegradability status into a single record, enabling practitioners to assess whether a given process's performance profile matches the characteristics of a specific effluent.

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

This view links wastewater treatment processes to their sponsoring research projects, answering which projects are developing which technologies. A representative row might show process PRO-2271 (photo-electrocatalysis, efficiency rating 20.90) sponsored by project PRO-2059 (funded by ONGC, grant amount 14.31, status completed). The view provides a complete picture of the project's financial backing, timeline, and the specific treatment technology it produces.

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

This view connects wastewater treatment processes to the catalytic materials they employ, answering which materials enable which treatment technologies. A representative row might show process PRO-2275 (advanced oxidation process, targeting heavy metals) utilizing material MAT-2728 (semiconductor class, synthesized by chemical vapor deposition, with surface area 23.85 and band gap energy 15.85). The view consolidates material properties with process performance metrics, enabling materials selection based on both catalytic characteristics and treatment objectives.

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

This view presents the effluent-centric counterpart to the process-effluent detail view, answering which treatment processes are available for a given effluent. A representative row might show effluent EFF-2128 (tannery source, recalcitrant biodegradability, hazardous toxicity) being treated by process PRO-2279 (photocatalysis, operational status, targeting recalcitrant organic pollutants with efficiency rating 28.80). The view enables practitioners to identify suitable treatment technologies based on effluent characteristics.

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

This view links industrial effluents to the chemical pollutants they contain, answering which specific contaminants are present in each waste stream. A representative row might show effluent EFF-2135 (paper and pulp source, pollutant concentration 24.85, moderate toxicity) containing pollutant POL-2214 (Integrated Cluster, heavy metal class, CAS-2541, molecular weight 0.74, concentration threshold 8.85). The view provides the contaminant-level detail needed to select treatment processes targeting specific pollutant classes.

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

This view presents the material-centric counterpart to the process-material detail view, answering which treatment processes utilize a given catalytic material. A representative row might show material MAT-2726 (nanomaterial, sol-gel synthesized, surface area 15.95, band gap energy 7.95, registered patent status) being employed in process PRO-2267 (photocatalysis, targeting persistent organic pollutants, efficiency rating 16.95). The view enables practitioners to identify all applications of a specific material.

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

This view links catalytic materials to their sponsoring research projects, answering which projects are developing which materials. A representative row might show material MAT-2727 (photo-catalytic membrane, hydrothermal synthesis, surface area 19.90) developed under project PRO-2059 (ONGC-funded, completed status, grant amount 14.31). The view provides the project context for material development, including funding source and timeline.

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

This view connects catalytic materials to the chemical elements that compose them, answering which elements are present in each material. A representative row might show material MAT-2728 (semiconductor, chemical vapor deposition synthesized) containing element ELM-2701 (Titanium, atomic number 22, atomic weight 44.96, group 4, period 4, electron configuration [Ar] 3d² 4s²). The view enables practitioners to understand the elemental composition that determines a material's catalytic properties.

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

This view presents the project-centric counterpart to the process-project view, answering which treatment processes are being developed under a given research project. A representative row might show project PRO-2060 (Korea Foundation-funded, planned status, grant amount 18.47) developing process PRO-2275 (advanced oxidation process, targeting heavy metals, efficiency rating 24.85, dissemination status). The view provides a comprehensive picture of a project's technological outputs.

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

This view presents the project-centric counterpart to the material-project view, answering which catalytic materials are being developed under a given research project. A representative row might show project PRO-2061 (DST-funded, active status, grant amount 14.58) developing material MAT-2729 (nanomaterial, sol-gel synthesized, surface area 27.80, band gap energy 19.80, registered patent status). The view consolidates project funding and timeline information with material specifications.

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

This view links research projects to their host or funding institutions, answering which institutions are involved in which projects. A representative row might show project PRO-2058 (DST-funded, active status, grant amount 11.88) hosted by institution INS-2717 (IIT Roorkee, India, university type, established 2024-07-11). The view provides the organizational context for project execution, including institutional type and geographic location.

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

This view presents the institution-centric counterpart to the project-institution view, answering which research projects are associated with a given institution. A representative row might show institution INS-2719 (Korea Foundation, South Korea, research center type, established 2022-05-06) associated with project PRO-2060 (Korea Foundation-funded, planned status, grant amount 18.47). The view enables practitioners to identify all projects associated with a specific institution.

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

This view presents the pollutant-centric counterpart to the effluent-pollutant view, answering which industrial effluents contain a given chemical pollutant. A representative row might show pollutant POL-2202 (Regional Initiative, persistent organic pollutant class, CAS-2539, molecular weight 0.53, concentration threshold 2.95) present in effluent EFF-2121 (textile and dyeing source, pollutant concentration 18.95, non-biodegradable, highly toxic). The view enables practitioners to identify all waste streams contaminated by a specific pollutant.

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

This view links chemical pollutants to the treatment processes designed to remove them, answering which processes target a given contaminant. A representative row might show pollutant POL-2208 (Seasonal Model D, dye stuff class, CAS-2540, molecular weight 0.74, concentration threshold 5.90) targeted by process PRO-2271 (photo-electrocatalysis, efficiency rating 20.90, development status). The view enables practitioners to identify suitable treatment technologies for specific contaminants.

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

This view connects chemical pollutants to the chemical elements that constitute them, answering which elements are present in each pollutant. A representative row might show pollutant POL-2214 (Integrated Cluster, heavy metal class, CAS-2541) containing element ELM-2702 (Iron, atomic number 26, atomic weight 55.85, group 8, period 4, electron configuration [Ar] 3d⁶ 4s²). The view provides the elemental composition detail needed to understand pollutant chemistry and select appropriate treatment mechanisms.

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

This view presents the element-centric counterpart to the material-element view, answering which catalytic materials contain a given chemical element. A representative row might show element ELM-2703 (Zinc, atomic number 30, atomic weight 65.38, group 12, period 4, electron configuration [Ar] 3d¹⁰ 4s²) present in material MAT-2726 (nanomaterial, sol-gel synthesized, surface area 15.95, band gap energy 7.95). The view enables practitioners to identify all materials containing a specific element.

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

This view presents the element-centric counterpart to the pollutant-element view, answering which chemical pollutants contain a given element. A representative row might show element ELM-2704 (Carbon, atomic number 6, atomic weight 12.01, group 14, period 2, electron configuration [He] 2s² 2p²) present in pollutant POL-2220 (Extended Review, persistent organic pollutant class, CAS-2542, molecular weight 0.6, concentration threshold 11.80). The view enables practitioners to identify all pollutants containing a specific element, supporting cross-contaminant analysis.

The wastewater treatment domain integrates treatment technologies, industrial waste streams, catalytic materials, research initiatives, and chemical science into a unified knowledge framework. Practitioners navigate this framework by querying the base tables for entity-specific details and using the relational views to synthesize multi-entity perspectives. The efficiency ratings of processes like PRO-2279 (28.80) and the surface areas of materials like MAT-2729 (27.80) provide quantitative benchmarks for technology selection. The pollutant concentration levels of effluents like EFF-2142 (27.80) and the concentration thresholds of pollutants like POL-2220 (11.80) define the operational parameters that treatment systems must address. The funding amounts of projects like PRO-2060 (18.47) and the institutional affiliations spanning India, Australia, and South Korea reflect the global scope of wastewater remediation research. Together, these records and their relationships form the evidentiary foundation for matching treatment technologies to industrial challenges, selecting catalytic materials based on elemental composition and synthesis method, and tracking the progress of research initiatives from design through operational deployment.