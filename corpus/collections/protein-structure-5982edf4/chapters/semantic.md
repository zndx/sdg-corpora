The domain under examination spans molecular biology, computational chemistry, and food science — a research ecosystem where protein structures, small molecules, pathogens, crop plants, and food formulations are tracked alongside the software tools and molecular dynamics simulations that model them. Every entity is captured in a dedicated relational table, and every relationship between entities is materialized as a foreign key column. The result is a normalized schema of nine base tables and nineteen derived views, each view answering a specific cross-entity question by joining two or more tables. The following sections walk through the entity types, their attributes, the foreign-key topology that binds them, and the views that reconstruct domain facts from the normalized grain.

## Base Tables and Entity Types

The schema's backbone consists of nine base tables, each representing a distinct entity type in the domain. The table `protein_structures` stores experimentally or computationally determined protein conformations. Its primary key `id` is an auto-incrementing integer, while the business identifier `structure_id` carries a UUID or numeric code. Additional columns capture structural metadata: `pdb_code` (a human-readable or encoded code), `resolution` (a floating-point measure of structural precision), `method` (the experimental or computational technique), `date_resolved` (an ISO timestamp), `chain_count` (an integer of structural chains), and `rmsd_value` (root-mean-square deviation). In the sample data, row 1000 carries `pdb_code` `c746bff2-8fcc-11eb-924d-9cd76263cbd0`, a `resolution` of `13.20`, and was resolved on `2022-09-15T20:48:00` using `seasonal-method-77`.

**Table `protein_structures`**

| id | structure_id | pdb_code | resolution | method | date_resolved | chain_count | rmsd_value | software_tool_id | protein_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 13.20 | seasonal-method-77 | 2022-09-15T20:48:00 | 16 | 13.95 | 100 | 1 |
| 1001 | 7441140 | 9736914 | 16.40 | regional-method-78 | 2023-02-26T03:05:00 | 0 | 15.90 | 101 | 2 |
| 1002 | 7119772 | b_VB-IC-6 | 19.60 | legacy-method-79 | 2024-07-10T10:22:00 | 7 | 17.85 | 102 | 3 |
| 1003 | 1996930 | 8189500 | 22.80 | compact-method-80 | 2025-12-21T17:39:00 | 0 | 19.80 | 103 | 4 |

The `proteins` table records amino-acid sequences and their functional annotations. Its primary key `protein_id` is an integer, and the table carries `uniprot_accession` (e.g., `extended-uniprot-27`), `gene_name` (e.g., `Regional Protocol`), `organism` (e.g., `extended-organism-75`), `molecular_weight` (a float such as `0.53`), `sequence_length` (an integer like `11`), and `function` (e.g., `extended-function-33`). Each protein row also holds three foreign keys — `protein_structure_id`, `small_molecule_id`, and `pathogen_id` — that link the protein to its structural model, an associated small molecule, and a pathogen of interest.

**Table `proteins`**

| protein_id | uniprot_accession | gene_name | organism | molecular_weight | sequence_length | function | protein_structure_id | small_molecule_id | pathogen_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | extended-uniprot-27 | Regional Protocol | extended-organism-75 | 0.53 | 11 | extended-function-33 | 1000 | 1 | 1996917 |
| 2 | integrated-uniprot-28 | Seasonal Programme D | integrated-organism-76 | 0.74 | 17 | integrated-function-34 | 1001 | 2 | 7119791 |
| 3 | seasonal-uniprot-29 | Integrated Standard | seasonal-organism-77 | 0.74 | 23 | seasonal-function-35 | 1002 | 3 | 392493 |
| 4 | regional-uniprot-30 | Extended Framework | regional-organism-78 | 0.6 | 29 | regional-function-36 | 1003 | 4 | 13483868 |

Small molecules are catalogued in `small_molecules`, whose primary key `id` is an integer and whose business identifier `molecule_id` is a UUID or string. The table stores chemical descriptors: `smiles` (the SMILES string, e.g., `compact-smiles-50`), `iupac_name` (e.g., `Composite Protocol`), `molecular_formula` (e.g., `distributed-molecula-84`), `molecular_weight` (e.g., `0.53`), `activity_class` (e.g., `distributed-activity-18`), `toxicity_score` (e.g., `15.20`), and `optimization_status` (e.g., `legacy-optimiza-85`). Two foreign keys — `protein_id` and `food_formulation_id` — connect each molecule to a protein and to a food formulation.

**Table `small_molecules`**

| id | molecule_id | smiles | iupac_name | molecular_formula | molecular_weight | activity_class | toxicity_score | optimization_status | protein_id | food_formulation_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3706 | compact-smiles-50 | Composite Protocol | distributed-molecula-84 | 0.53 | distributed-activity-18 | 15.20 | legacy-optimiza-85 | 1 | 1 |
| 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 | Compact Programme A | baseline-molecula-85 | 0.74 | baseline-activity-19 | 19.40 | compact-optimiza-86 | 2 | 2 |
| 3 | b_VB-PA-Tab | primary-smiles-52 | Legacy Standard | pilot-molecula-86 | 0.74 | pilot-activity-20 | 23.60 | composite-optimiza-87 | 3 | 3 |
| 4 | account_pymes_1030 | adaptive-smiles-53 | Regional Framework | extended-molecula-87 | 0.6 | extended-activity-21 | 27.80 | primary-optimiza-88 | 4 | 4 |

Molecular dynamics simulations are tracked in `molecular_dynamics_simulations`. Its primary key `molecular_dynamics_simulation_id` is an integer, and the table carries `simulation_id` (UUID or string), `start_time` and `end_time` (ISO timestamps), `duration` (a float), `temperature` and `pressure` (floats), `force_field` (e.g., `primary-force-52`), and `convergence_status` (e.g., `distributed-converge-78`). Foreign keys `software_tool_id` and `protein_structure_id` tie each simulation to the software that ran it and the protein structure it modelled.

**Table `molecular_dynamics_simulations`**

| molecular_dynamics_simulation_id | simulation_id | start_time | end_time | duration | temperature | pressure | force_field | convergence_status | software_tool_id | protein_structure_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 212 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 4.20 | 1.33 | 16.20 | primary-force-52 | distributed-converge-78 | 100 | 1000 |
| 1001 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 8.40 | 1.1714807757148185 | 18.40 | adaptive-force-53 | baseline-converge-79 | 101 | 1001 |
| 1002 | 974945 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 12.60 | 0.51 | 20.60 | distributed-force-54 | pilot-converge-80 | 102 | 1002 |
| 1003 | 7119790 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 16.80 | 0.85 | 22.80 | baseline-force-55 | extended-converge-81 | 103 | 1003 |

The `software_tools` table enumerates computational tools used across the domain. Its primary key `id` is an integer, and the table stores `tool_id` (e.g., `comi`), `tool_name` (e.g., `Composite Model`), `version` (e.g., `seasonal-version-71`), `license_type` (e.g., `regional-license-78`), `primary_function` (e.g., `seasonal-primary-77`), and `developer` (e.g., `extended-develope-63`). Three foreign keys — `molecular_dynamics_simulation_id`, `protein_structure_id`, and `small_molecule_id` — link each tool to the simulations it ran, the structures it analysed, and the molecules it processed.

**Table `software_tools`**

| id | tool_id | tool_name | version | license_type | primary_function | developer | molecular_dynamics_simulation_id | protein_structure_id | small_molecule_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | seasonal-version-71 | regional-license-78 | seasonal-primary-77 | extended-develope-63 | 1000 | 1000 | 1 |
| 101 | 195360 | Compact Cluster A | regional-version-72 | legacy-license-79 | regional-primary-78 | integrated-develope-64 | 1001 | 1001 | 2 |
| 102 | 3355763 | Legacy Review | legacy-version-73 | compact-license-80 | legacy-primary-79 | seasonal-develope-65 | 1002 | 1002 | 3 |
| 103 | 8387539 | Regional Initiative | compact-version-74 | composite-license-81 | compact-primary-80 | regional-develope-66 | 1003 | 1003 | 4 |

Pathogens are recorded in `pathogens`, with primary key `pathogen_id` and columns `scientific_name` (e.g., `Integrated Protocol A`), `common_name` (e.g., `Seasonal Review`), `host_plant` (e.g., `primary-host-22`), `disease_name` (e.g., `Regional Protocol`), and `geographic_distribution` (e.g., `extended-geograph-69`). Foreign keys `crop_plant_id` and `protein_id` connect each pathogen to its host crop and to a protein target.

**Table `pathogens`**

| pathogen_id | scientific_name | common_name | host_plant | disease_name | geographic_distribution | crop_plant_id | protein_id |
|---|---|---|---|---|---|---|---|
| 1996917 | Integrated Protocol A | Seasonal Review | primary-host-22 | Regional Protocol | extended-geograph-69 | 1 | 1 |
| 7119791 | Extended Programme | Integrated Initiative | adaptive-host-23 | Seasonal Programme D | integrated-geograph-70 | 2 | 2 |
| 392493 | Pilot Standard | Extended Model D | distributed-host-24 | Integrated Standard | seasonal-geograph-71 | 3 | 3 |
| 13483868 | Baseline Framework D | Pilot Cluster | baseline-host-25 | Extended Framework | regional-geograph-72 | 4 | 4 |

Crop plants are stored in `crop_plants`, with primary key `crop_plant_id` and columns `plant_id`, `plant_name`, `species`, `origin_region`, `growth_habit`, and `disease_resistance`. Foreign keys `pathogen_id` and `small_molecule_id` link each crop to the pathogens that infect it and to small molecules used in its management.

**Table `crop_plants`**

| id | plant_id | species_name | variety | growth_stage | stress_tolerance_level | yield_metric | pathogen_id | small_molecule_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5082988 | Primary Programme A | primary-variety-16 | adaptive-growth-35 | 11.45 | 14.70 | 1996917 | 1 |
| 2 | template_ivacode_pagata_20ind | Composite Standard | adaptive-variety-17 | distributed-growth-36 | 15.90 | 19.40 | 7119791 | 2 |
| 3 | L331 | Compact Framework | distributed-variety-18 | baseline-growth-37 | 20.35 | 24.10 | 392493 | 3 |
| 4 | 14484998 | Legacy Protocol D | baseline-variety-19 | pilot-growth-38 | 24.80 | 28.80 | 13483868 | 4 |

Food formulations are captured in `food_formulations`, with primary key `id` and columns `formulation_id`, `formulation_name`, `ingredient_list`, `nutritional_value` (a float), `shelf_life_days` (an integer), and `allergen_status`. Foreign keys `small_molecule_id` and `food_industry_application_id` connect each formulation to its constituent small molecules and to its downstream industry application.

**Table `food_formulations`**

| id | formulation_id | product_code | colorant_source | concentration | ph_level | shelf_life | regulatory_status | small_molecule_id | food_industry_application_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m12 | PRO-2675 | regional-colorant-96 | 7.70 | 11.70 | 28 | adaptive-regulato-17 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9736908 | PRO-2681 | legacy-colorant-97 | 11.40 | 16.40 | 34 | distributed-regulato-18 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 392481 | PRO-2687 | compact-colorant-98 | 15.10 | 21.10 | 40 | baseline-regulato-19 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 505985 | PRO-2693 | composite-colorant-99 | 18.80 | 25.80 | 46 | pilot-regulato-20 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Finally, `food_industry_applications` stores commercial use cases, with primary key `id` and columns `application_id`, `application_name`, `industry_sector`, `target_market`, and `regulatory_status`. The foreign key `food_formulation_id` links each application back to the formulation it employs.

**Table `food_industry_applications`**

| food_industry_application_id | application_id | application_type | target_food_matrix | dosage | efficacy_score | food_formulation_id |
|---|---|---|---|---|---|---|
| 1 | 505997 | legacy-applicat-73 | adaptive-target-29 | 7.20 | 13.20 | 1 |
| 2 | 1250196 | compact-applicat-74 | distributed-target-30 | 11.40 | 16.40 | 2 |
| 3 | 124 | composite-applicat-75 | baseline-target-31 | 15.60 | 19.60 | 3 |
| 4 | IVC20det40 | primary-applicat-76 | pilot-target-32 | 19.80 | 22.80 | 4 |

## Foreign-Key Topology and Cardinality

The foreign keys in these nine tables encode a rich web of cardinality-bounded relationships. Each relationship is a directed edge from a referencing column to a referenced primary key, and the direction tells us which entity "owns" the association.

The `protein_structures` table holds two outgoing foreign keys: `software_tool_id` references `software_tools.id`, and `protein_id` references `proteins.protein_id`. This means every protein structure record is annotated with exactly one software tool and one protein (when present). In the sample, row 1000 links to `software_tool_id` `100` and `protein_id` `1`.

Conversely, `proteins` carries three outgoing foreign keys. The column `protein_structure_id` references `protein_structures.id`, establishing that each protein is associated with a single structural model. The column `small_molecule_id` references `small_molecules.id`, and `pathogen_id` references `pathogens.pathogen_id`. Row 1 of `proteins` therefore connects to `protein_structure_id` `1000`, `small_molecule_id` `1`, and `pathogen_id` `1996917`.

The `small_molecules` table points outward via `protein_id` (to `proteins.protein_id`) and `food_formulation_id` (to `food_formulations.id`). Row 1 of `small_molecules` links to `protein_id` `1` and `food_formulation_id` `1`.

In `molecular_dynamics_simulations`, the foreign keys `software_tool_id` and `protein_structure_id` reference `software_tools.id` and `protein_structures.id` respectively. Row 1000 of this table connects to `software_tool_id` `100` and `protein_structure_id` `1000`.

The `software_tools` table is the most outward-pointing, with three foreign keys: `molecular_dynamics_simulation_id` references `molecular_dynamics_simulations.molecular_dynamics_simulation_id`, `protein_structure_id` references `protein_structures.id`, and `small_molecule_id` references `small_molecules.id`. Row 100 of `software_tools` links to `molecular_dynamics_simulation_id` `1000`, `protein_structure_id` `1000`, and `small_molecule_id` `1`.

In `pathogens`, the foreign keys `crop_plant_id` and `protein_id` reference `crop_plants.crop_plant_id` and `proteins.protein_id` respectively. Row with `pathogen_id` `1996917` links to `crop_plant_id` `1` and `protein_id` `1`.

The `crop_plants` table carries `pathogen_id` (to `pathogens.pathogen_id`) and `small_molecule_id` (to `small_molecules.id`).

In `food_formulations`, the foreign keys `small_molecule_id` and `food_industry_application_id` reference `small_molecules.id` and `food_industry_applications.id` respectively.

Finally, `food_industry_applications` holds `food_formulation_id`, referencing `food_formulations.id`.

This topology creates several bidirectional association patterns. For instance, `protein_structures.software_tool_id → software_tools.id` and `software_tools.protein_structure_id → protein_structures.id` form a mutual link: a structure records which tool produced it, and the tool records which structures it analysed. Similarly, `proteins.protein_structure_id → protein_structures.id` and `protein_structures.protein_id → proteins.protein_id` create a reciprocal protein–structure relationship.

## Views: Reconstructing Domain Facts

The nineteen views in the schema are derived tables that join two base tables and present the combined columns as a single flat result. Each view answers a specific cross-entity question.

The view `protein_structure_software_tool_view` joins `protein_structures` to `software_tools` on `protein_structures.software_tool_id = software_tools.id`. It answers the question "which software tool was used to resolve each protein structure?" Reading row 1000 as evidence: the structure with `pdb_code` `c746bff2-8fcc-11eb-924d-9cd76263cbd0` was resolved using the tool named `Composite Model` (tool `comi`, version `seasonal-version-71`).

**View `protein_structure_software_tool_view`**

```sql
CREATE VIEW protein_structure_software_tool_view AS
SELECT a.id, a.structure_id, a.pdb_code, a.resolution, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM protein_structures a JOIN software_tools b ON a.software_tool_id = b.id;
```

| id | structure_id | pdb_code | resolution | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 13.20 | 100 | comi | Composite Model |
| 1001 | 7441140 | 9736914 | 16.40 | 101 | 195360 | Compact Cluster A |
| 1002 | 7119772 | b_VB-IC-6 | 19.60 | 102 | 3355763 | Legacy Review |
| 1003 | 1996930 | 8189500 | 22.80 | 103 | 8387539 | Regional Initiative |

The view `protein_structure_protein_view` joins `protein_structures` to `proteins` on `protein_structures.protein_id = proteins.protein_id`. It answers "which protein is associated with each structure?" Row 1000 shows structure `c746bff2-8fcc-11eb-924d-9cd76263cbd0` linked to protein `extended-uniprot-27` (gene `Regional Protocol`, organism `extended-organism-75`).

**View `protein_structure_protein_view`**

```sql
CREATE VIEW protein_structure_protein_view AS
SELECT a.id, a.structure_id, a.pdb_code, a.resolution, b.protein_id AS protein_protein_id, b.uniprot_accession AS protein_uniprot_accession, b.gene_name AS protein_gene_name
FROM protein_structures a JOIN proteins b ON a.protein_id = b.protein_id;
```

| id | structure_id | pdb_code | resolution | protein_protein_id | protein_uniprot_accession | protein_gene_name |
|---|---|---|---|---|---|---|
| 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 13.20 | 1 | extended-uniprot-27 | Regional Protocol |
| 1001 | 7441140 | 9736914 | 16.40 | 2 | integrated-uniprot-28 | Seasonal Programme D |
| 1002 | 7119772 | b_VB-IC-6 | 19.60 | 3 | seasonal-uniprot-29 | Integrated Standard |
| 1003 | 1996930 | 8189500 | 22.80 | 4 | regional-uniprot-30 | Extended Framework |

The view `protein_protein_structure_view` performs the inverse join: `proteins` joined to `protein_structures` on `proteins.protein_structure_id = protein_structures.id`. It answers "which structure corresponds to each protein?" Row 1 of `proteins` (protein `extended-uniprot-27`) maps to structure `c746bff2-8fcc-11eb-924d-9cd76263cbd0` with resolution `13.20`.

**View `protein_protein_structure_view`**

```sql
CREATE VIEW protein_protein_structure_view AS
SELECT a.protein_id, a.uniprot_accession, a.gene_name, a.organism, b.id AS structure_id, b.structure_id AS structure_structure_id, b.pdb_code AS structure_pdb_code
FROM proteins a JOIN protein_structures b ON a.protein_structure_id = b.id;
```

| protein_id | uniprot_accession | gene_name | organism | structure_id | structure_structure_id | structure_pdb_code |
|---|---|---|---|---|---|---|
| 1 | extended-uniprot-27 | Regional Protocol | extended-organism-75 | 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 |
| 2 | integrated-uniprot-28 | Seasonal Programme D | integrated-organism-76 | 1001 | 7441140 | 9736914 |
| 3 | seasonal-uniprot-29 | Integrated Standard | seasonal-organism-77 | 1002 | 7119772 | b_VB-IC-6 |
| 4 | regional-uniprot-30 | Extended Framework | regional-organism-78 | 1003 | 1996930 | 8189500 |

The view `protein_small_molecule_view` joins `proteins` to `small_molecules` on `proteins.small_molecule_id = small_molecules.id`. It answers "which small molecule is associated with each protein?" Row 1 of `proteins` connects to molecule `compact-smiles-50` (IUPAC name `Composite Protocol`, toxicity score `15.20`).

**View `protein_small_molecule_view`**

```sql
CREATE VIEW protein_small_molecule_view AS
SELECT a.protein_id, a.uniprot_accession, a.gene_name, a.organism, b.id AS molecule_id, b.molecule_id AS molecule_molecule_id, b.smiles AS molecule_smiles
FROM proteins a JOIN small_molecules b ON a.small_molecule_id = b.id;
```

| protein_id | uniprot_accession | gene_name | organism | molecule_id | molecule_molecule_id | molecule_smiles |
|---|---|---|---|---|---|---|
| 1 | extended-uniprot-27 | Regional Protocol | extended-organism-75 | 1 | 3706 | compact-smiles-50 |
| 2 | integrated-uniprot-28 | Seasonal Programme D | integrated-organism-76 | 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 |
| 3 | seasonal-uniprot-29 | Integrated Standard | seasonal-organism-77 | 3 | b_VB-PA-Tab | primary-smiles-52 |
| 4 | regional-uniprot-30 | Extended Framework | regional-organism-78 | 4 | account_pymes_1030 | adaptive-smiles-53 |

The view `protein_pathogen_view` joins `proteins` to `pathogens` on `proteins.pathogen_id = pathogens.pathogen_id`. It answers "which pathogen is linked to each protein?" Row 1 of `proteins` links to pathogen `Integrated Protocol A` (common name `Seasonal Review`, geographic distribution `extended-geograph-69`).

**View `protein_pathogen_view`**

```sql
CREATE VIEW protein_pathogen_view AS
SELECT a.protein_id, a.uniprot_accession, a.gene_name, a.organism, b.pathogen_id AS pathogen_pathogen_id, b.scientific_name AS pathogen_scientific_name, b.common_name AS pathogen_common_name
FROM proteins a JOIN pathogens b ON a.pathogen_id = b.pathogen_id;
```

| protein_id | uniprot_accession | gene_name | organism | pathogen_pathogen_id | pathogen_scientific_name | pathogen_common_name |
|---|---|---|---|---|---|---|
| 1 | extended-uniprot-27 | Regional Protocol | extended-organism-75 | 1996917 | Integrated Protocol A | Seasonal Review |
| 2 | integrated-uniprot-28 | Seasonal Programme D | integrated-organism-76 | 7119791 | Extended Programme | Integrated Initiative |
| 3 | seasonal-uniprot-29 | Integrated Standard | seasonal-organism-77 | 392493 | Pilot Standard | Extended Model D |
| 4 | regional-uniprot-30 | Extended Framework | regional-organism-78 | 13483868 | Baseline Framework D | Pilot Cluster |

The view `small_molecule_protein_view` performs the inverse: `small_molecules` joined to `proteins` on `small_molecules.protein_id = proteins.protein_id`. It answers "which protein is associated with each small molecule?" Row 1 of `small_molecules` (molecule `compact-smiles-50`) connects to protein `extended-uniprot-27`.

**View `small_molecule_protein_view`**

```sql
CREATE VIEW small_molecule_protein_view AS
SELECT a.id, a.molecule_id, a.smiles, a.iupac_name, b.protein_id AS protein_protein_id, b.uniprot_accession AS protein_uniprot_accession, b.gene_name AS protein_gene_name
FROM small_molecules a JOIN proteins b ON a.protein_id = b.protein_id;
```

| id | molecule_id | smiles | iupac_name | protein_protein_id | protein_uniprot_accession | protein_gene_name |
|---|---|---|---|---|---|---|
| 1 | 3706 | compact-smiles-50 | Composite Protocol | 1 | extended-uniprot-27 | Regional Protocol |
| 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 | Compact Programme A | 2 | integrated-uniprot-28 | Seasonal Programme D |
| 3 | b_VB-PA-Tab | primary-smiles-52 | Legacy Standard | 3 | seasonal-uniprot-29 | Integrated Standard |
| 4 | account_pymes_1030 | adaptive-smiles-53 | Regional Framework | 4 | regional-uniprot-30 | Extended Framework |

The view `small_molecule_food_formulation_view` joins `small_molecules` to `food_formulations` on `small_molecules.food_formulation_id = food_formulations.id`. It answers "which food formulation contains each small molecule?" Row 1 of `small_molecules` links to formulation `1` (the formulation whose `formulation_id` column carries the value `1`).

**View `small_molecule_food_formulation_view`**

```sql
CREATE VIEW small_molecule_food_formulation_view AS
SELECT a.id, a.molecule_id, a.smiles, a.iupac_name, b.id AS formulation_id, b.formulation_id AS formulation_formulation_id, b.product_code AS formulation_product_code
FROM small_molecules a JOIN food_formulations b ON a.food_formulation_id = b.id;
```

| id | molecule_id | smiles | iupac_name | formulation_id | formulation_formulation_id | formulation_product_code |
|---|---|---|---|---|---|---|
| 1 | 3706 | compact-smiles-50 | Composite Protocol | 1 | lu_tax_code_template_m12 | PRO-2675 |
| 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 | Compact Programme A | 2 | 9736908 | PRO-2681 |
| 3 | b_VB-PA-Tab | primary-smiles-52 | Legacy Standard | 3 | 392481 | PRO-2687 |
| 4 | account_pymes_1030 | adaptive-smiles-53 | Regional Framework | 4 | 505985 | PRO-2693 |

The view `molecular_dynamics_simulation_software_tool_view` joins `molecular_dynamics_simulations` to `software_tools` on `molecular_dynamics_simulations.software_tool_id = software_tools.id`. It answers "which software tool ran each simulation?" Row 1000 of simulations (simulation `212`, duration `4.20`, temperature `1.33`) was run by tool `Composite Model` (tool `comi`).

**View `molecular_dynamics_simulation_software_tool_view`**

```sql
CREATE VIEW molecular_dynamics_simulation_software_tool_view AS
SELECT a.molecular_dynamics_simulation_id, a.simulation_id, a.start_time, a.end_time, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM molecular_dynamics_simulations a JOIN software_tools b ON a.software_tool_id = b.id;
```

| molecular_dynamics_simulation_id | simulation_id | start_time | end_time | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 1000 | 212 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | comi | Composite Model |
| 1001 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | 195360 | Compact Cluster A |
| 1002 | 974945 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | 3355763 | Legacy Review |
| 1003 | 7119790 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | 8387539 | Regional Initiative |

The view `molecular_dynamics_simulation_protein_structure_view` joins `molecular_dynamics_simulations` to `protein_structures` on `molecular_dynamics_simulations.protein_structure_id = protein_structures.id`. It answers "which protein structure was simulated?" Row 1000 of simulations links to structure `c746bff2-8fcc-11eb-924d-9cd76263cbd0` (resolution `13.20`, method `seasonal-method-77`).

**View `molecular_dynamics_simulation_protein_structure_view`**

```sql
CREATE VIEW molecular_dynamics_simulation_protein_structure_view AS
SELECT a.molecular_dynamics_simulation_id, a.simulation_id, a.start_time, a.end_time, b.id AS structure_id, b.structure_id AS structure_structure_id, b.pdb_code AS structure_pdb_code
FROM molecular_dynamics_simulations a JOIN protein_structures b ON a.protein_structure_id = b.id;
```

| molecular_dynamics_simulation_id | simulation_id | start_time | end_time | structure_id | structure_structure_id | structure_pdb_code |
|---|---|---|---|---|---|---|
| 1000 | 212 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 1001 | 7441140 | 9736914 |
| 1002 | 974945 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 1002 | 7119772 | b_VB-IC-6 |
| 1003 | 7119790 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 1003 | 1996930 | 8189500 |

The view `software_tool_molecular_dynamics_simulation_view` performs the inverse: `software_tools` joined to `molecular_dynamics_simulations` on `software_tools.molecular_dynamics_simulation_id = molecular_dynamics_simulations.molecular_dynamics_simulation_id`. It answers "which simulations did each software tool run?" Row 100 of `software_tools` (tool `Composite Model`) ran simulation `212` with duration `4.20` and force field `primary-force-52`.

**View `software_tool_molecular_dynamics_simulation_view`**

```sql
CREATE VIEW software_tool_molecular_dynamics_simulation_view AS
SELECT a.id, a.tool_id, a.tool_name, a.version, b.molecular_dynamics_simulation_id AS simulation_molecular_dynamics_simulation_id, b.simulation_id AS simulation_simulation_id, b.start_time AS simulation_start_time
FROM software_tools a JOIN molecular_dynamics_simulations b ON a.molecular_dynamics_simulation_id = b.molecular_dynamics_simulation_id;
```

| id | tool_id | tool_name | version | simulation_molecular_dynamics_simulation_id | simulation_simulation_id | simulation_start_time |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | seasonal-version-71 | 1000 | 212 | 2024-03-27T14:42:00 |
| 101 | 195360 | Compact Cluster A | regional-version-72 | 1001 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-08-11T21:59:00 |
| 102 | 3355763 | Legacy Review | legacy-version-73 | 1002 | 974945 | 2022-01-22T04:16:00 |
| 103 | 8387539 | Regional Initiative | compact-version-74 | 1003 | 7119790 | 2023-06-06T11:33:00 |

The view `software_tool_protein_structure_view` joins `software_tools` to `protein_structures` on `software_tools.protein_structure_id = protein_structures.id`. It answers "which protein structures did each software tool analyse?" Row 100 of `software_tools` analysed structure `c746bff2-8fcc-11eb-924d-9cd76263cbd0` (resolution `13.20`).

**View `software_tool_protein_structure_view`**

```sql
CREATE VIEW software_tool_protein_structure_view AS
SELECT a.id, a.tool_id, a.tool_name, a.version, b.id AS structure_id, b.structure_id AS structure_structure_id, b.pdb_code AS structure_pdb_code
FROM software_tools a JOIN protein_structures b ON a.protein_structure_id = b.id;
```

| id | tool_id | tool_name | version | structure_id | structure_structure_id | structure_pdb_code |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | seasonal-version-71 | 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 |
| 101 | 195360 | Compact Cluster A | regional-version-72 | 1001 | 7441140 | 9736914 |
| 102 | 3355763 | Legacy Review | legacy-version-73 | 1002 | 7119772 | b_VB-IC-6 |
| 103 | 8387539 | Regional Initiative | compact-version-74 | 1003 | 1996930 | 8189500 |

The view `software_tool_small_molecule_view` joins `software_tools` to `small_molecules` on `software_tools.small_molecule_id = small_molecules.id`. It answers "which small molecules did each software tool process?" Row 100 of `software_tools` processed molecule `compact-smiles-50` (IUPAC name `Composite Protocol`, toxicity score `15.20`).

**View `software_tool_small_molecule_view`**

```sql
CREATE VIEW software_tool_small_molecule_view AS
SELECT a.id, a.tool_id, a.tool_name, a.version, b.id AS molecule_id, b.molecule_id AS molecule_molecule_id, b.smiles AS molecule_smiles
FROM software_tools a JOIN small_molecules b ON a.small_molecule_id = b.id;
```

| id | tool_id | tool_name | version | molecule_id | molecule_molecule_id | molecule_smiles |
|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | seasonal-version-71 | 1 | 3706 | compact-smiles-50 |
| 101 | 195360 | Compact Cluster A | regional-version-72 | 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 |
| 102 | 3355763 | Legacy Review | legacy-version-73 | 3 | b_VB-PA-Tab | primary-smiles-52 |
| 103 | 8387539 | Regional Initiative | compact-version-74 | 4 | account_pymes_1030 | adaptive-smiles-53 |

The view `pathogen_crop_plant_view` joins `pathogens` to `crop_plants` on `pathogens.crop_plant_id = crop_plants.crop_plant_id`. It answers "which crop plant is infected by each pathogen?" Row with `pathogen_id` `1996917` (scientific name `Integrated Protocol A`) infects crop plant `1`.

**View `pathogen_crop_plant_view`**

```sql
CREATE VIEW pathogen_crop_plant_view AS
SELECT a.pathogen_id, a.scientific_name, a.common_name, a.host_plant, b.id AS plant_id, b.plant_id AS plant_plant_id, b.species_name AS plant_species_name
FROM pathogens a JOIN crop_plants b ON a.crop_plant_id = b.id;
```

| pathogen_id | scientific_name | common_name | host_plant | plant_id | plant_plant_id | plant_species_name |
|---|---|---|---|---|---|---|
| 1996917 | Integrated Protocol A | Seasonal Review | primary-host-22 | 1 | 5082988 | Primary Programme A |
| 7119791 | Extended Programme | Integrated Initiative | adaptive-host-23 | 2 | template_ivacode_pagata_20ind | Composite Standard |
| 392493 | Pilot Standard | Extended Model D | distributed-host-24 | 3 | L331 | Compact Framework |
| 13483868 | Baseline Framework D | Pilot Cluster | baseline-host-25 | 4 | 14484998 | Legacy Protocol D |

The view `pathogen_protein_view` joins `pathogens` to `proteins` on `pathogens.protein_id = proteins.protein_id`. It answers "which protein is targeted by each pathogen?" Row with `pathogen_id` `1996917` targets protein `extended-uniprot-27` (gene `Regional Protocol`).

**View `pathogen_protein_view`**

```sql
CREATE VIEW pathogen_protein_view AS
SELECT a.pathogen_id, a.scientific_name, a.common_name, a.host_plant, b.protein_id AS protein_protein_id, b.uniprot_accession AS protein_uniprot_accession, b.gene_name AS protein_gene_name
FROM pathogens a JOIN proteins b ON a.protein_id = b.protein_id;
```

| pathogen_id | scientific_name | common_name | host_plant | protein_protein_id | protein_uniprot_accession | protein_gene_name |
|---|---|---|---|---|---|---|
| 1996917 | Integrated Protocol A | Seasonal Review | primary-host-22 | 1 | extended-uniprot-27 | Regional Protocol |
| 7119791 | Extended Programme | Integrated Initiative | adaptive-host-23 | 2 | integrated-uniprot-28 | Seasonal Programme D |
| 392493 | Pilot Standard | Extended Model D | distributed-host-24 | 3 | seasonal-uniprot-29 | Integrated Standard |
| 13483868 | Baseline Framework D | Pilot Cluster | baseline-host-25 | 4 | regional-uniprot-30 | Extended Framework |

The view `crop_plant_pathogen_view` performs the inverse: `crop_plants` joined to `pathogens` on `crop_plants.pathogen_id = pathogens.pathogen_id`. It answers "which pathogen infects each crop plant?" Crop plant `1` is infected by pathogen `Integrated Protocol A` (common name `Seasonal Review`).

**View `crop_plant_pathogen_view`**

```sql
CREATE VIEW crop_plant_pathogen_view AS
SELECT a.id, a.plant_id, a.species_name, a.variety, b.pathogen_id AS pathogen_pathogen_id, b.scientific_name AS pathogen_scientific_name, b.common_name AS pathogen_common_name
FROM crop_plants a JOIN pathogens b ON a.pathogen_id = b.pathogen_id;
```

| id | plant_id | species_name | variety | pathogen_pathogen_id | pathogen_scientific_name | pathogen_common_name |
|---|---|---|---|---|---|---|
| 1 | 5082988 | Primary Programme A | primary-variety-16 | 1996917 | Integrated Protocol A | Seasonal Review |
| 2 | template_ivacode_pagata_20ind | Composite Standard | adaptive-variety-17 | 7119791 | Extended Programme | Integrated Initiative |
| 3 | L331 | Compact Framework | distributed-variety-18 | 392493 | Pilot Standard | Extended Model D |
| 4 | 14484998 | Legacy Protocol D | baseline-variety-19 | 13483868 | Baseline Framework D | Pilot Cluster |

The view `crop_plant_small_molecule_view` joins `crop_plants` to `small_molecules` on `crop_plants.small_molecule_id = small_molecules.id`. It answers "which small molecule is used in the management of each crop plant?" Crop plant `1` is associated with molecule `compact-smiles-50` (toxicity score `15.20`).

**View `crop_plant_small_molecule_view`**

```sql
CREATE VIEW crop_plant_small_molecule_view AS
SELECT a.id, a.plant_id, a.species_name, a.variety, b.id AS molecule_id, b.molecule_id AS molecule_molecule_id, b.smiles AS molecule_smiles
FROM crop_plants a JOIN small_molecules b ON a.small_molecule_id = b.id;
```

| id | plant_id | species_name | variety | molecule_id | molecule_molecule_id | molecule_smiles |
|---|---|---|---|---|---|---|
| 1 | 5082988 | Primary Programme A | primary-variety-16 | 1 | 3706 | compact-smiles-50 |
| 2 | template_ivacode_pagata_20ind | Composite Standard | adaptive-variety-17 | 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 |
| 3 | L331 | Compact Framework | distributed-variety-18 | 3 | b_VB-PA-Tab | primary-smiles-52 |
| 4 | 14484998 | Legacy Protocol D | baseline-variety-19 | 4 | account_pymes_1030 | adaptive-smiles-53 |

The view `food_formulation_small_molecule_view` joins `food_formulations` to `small_molecules` on `food_formulations.small_molecule_id = small_molecules.id`. It answers "which small molecule is an ingredient in each food formulation?" Formulation `1` contains molecule `compact-smiles-50` (IUPAC name `Composite Protocol`).

**View `food_formulation_small_molecule_view`**

```sql
CREATE VIEW food_formulation_small_molecule_view AS
SELECT a.id, a.formulation_id, a.product_code, a.colorant_source, b.id AS molecule_id, b.molecule_id AS molecule_molecule_id, b.smiles AS molecule_smiles
FROM food_formulations a JOIN small_molecules b ON a.small_molecule_id = b.id;
```

| id | formulation_id | product_code | colorant_source | molecule_id | molecule_molecule_id | molecule_smiles |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m12 | PRO-2675 | regional-colorant-96 | 1 | 3706 | compact-smiles-50 |
| 2 | 9736908 | PRO-2681 | legacy-colorant-97 | 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 |
| 3 | 392481 | PRO-2687 | compact-colorant-98 | 3 | b_VB-PA-Tab | primary-smiles-52 |
| 4 | 505985 | PRO-2693 | composite-colorant-99 | 4 | account_pymes_1030 | adaptive-smiles-53 |

The view `food_formulation_food_industry_application_view` joins `food_formulations` to `food_industry_applications` on `food_formulations.food_industry_application_id = food_industry_applications.id`. It answers "which industry application uses each food formulation?" Formulation `1` is used in application `1`.

**View `food_formulation_food_industry_application_view`**

```sql
CREATE VIEW food_formulation_food_industry_application_view AS
SELECT a.id, a.formulation_id, a.product_code, a.colorant_source, b.food_industry_application_id AS application_food_industry_application_id, b.application_id AS application_application_id, b.application_type AS application_application_type
FROM food_formulations a JOIN food_industry_applications b ON a.food_industry_application_id = b.food_industry_application_id;
```

| id | formulation_id | product_code | colorant_source | application_food_industry_application_id | application_application_id | application_application_type |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m12 | PRO-2675 | regional-colorant-96 | 1 | 505997 | legacy-applicat-73 |
| 2 | 9736908 | PRO-2681 | legacy-colorant-97 | 2 | 1250196 | compact-applicat-74 |
| 3 | 392481 | PRO-2687 | compact-colorant-98 | 3 | 124 | composite-applicat-75 |
| 4 | 505985 | PRO-2693 | composite-colorant-99 | 4 | IVC20det40 | primary-applicat-76 |

The view `food_industry_application_food_formulation_view` performs the inverse: `food_industry_applications` joined to `food_formulations` on `food_industry_applications.food_formulation_id = food_formulations.id`. It answers "which food formulation is employed by each industry application?" Application `1` employs formulation `1`.

**View `food_industry_application_food_formulation_view`**

```sql
CREATE VIEW food_industry_application_food_formulation_view AS
SELECT a.food_industry_application_id, a.application_id, a.application_type, a.target_food_matrix, b.id AS formulation_id, b.formulation_id AS formulation_formulation_id, b.product_code AS formulation_product_code
FROM food_industry_applications a JOIN food_formulations b ON a.food_formulation_id = b.id;
```

| food_industry_application_id | application_id | application_type | target_food_matrix | formulation_id | formulation_formulation_id | formulation_product_code |
|---|---|---|---|---|---|---|
| 1 | 505997 | legacy-applicat-73 | adaptive-target-29 | 1 | lu_tax_code_template_m12 | PRO-2675 |
| 2 | 1250196 | compact-applicat-74 | distributed-target-30 | 2 | 9736908 | PRO-2681 |
| 3 | 124 | composite-applicat-75 | baseline-target-31 | 3 | 392481 | PRO-2687 |
| 4 | IVC20det40 | primary-applicat-76 | pilot-target-32 | 4 | 505985 | PRO-2693 |

## Synthesis

The schema models a domain where proteins, structures, small molecules, pathogens, crops, and food formulations are the core entities, and software tools and molecular dynamics simulations are the computational instruments that observe and manipulate them. The nine base tables are normalized to third normal form: each table stores attributes of a single entity type, and every relationship between types is expressed as a foreign key column in the referencing table. The nineteen views are thin join layers that reconstruct two-table facts from this normalized grain, each view answering a single cross-entity question. The mutual foreign-key pairs — such as `protein_structures.software_tool_id` ↔ `software_tools.protein_structure_id` and `proteins.protein_structure_id` ↔ `protein_structures.protein_id` — encode bidirectional associations that the views expose from both directions. Together, the base tables and views provide a complete relational representation of the domain, where every row in every view can be traced back to concrete values in the underlying tables.