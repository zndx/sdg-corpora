## Computational Structural Biology and Food Systems

The intersection of molecular modeling, pathogen biology, and food science forms a complex investigative landscape where computational tools enable researchers to trace relationships between protein architectures, small-molecule interactions, and biological threats. Modern laboratories maintain extensive records documenting protein structures resolved through various experimental methods, the small molecules that bind to them, the molecular dynamics simulations that reveal their behavior over time, and the software tools that make all of this analysis possible. Beyond the molecular scale, these same records connect to pathogens that threaten crop plants and to the food formulations and industry applications where these molecular insights ultimately translate into practical outcomes. The following chapter describes the entities, measurements, and operational relationships that structure this domain.

## Protein Structures and Their Resolving Methods

Protein structures constitute the foundational records of the domain, capturing the results of experimental or computational structure determination. Each entry records a unique structure identifier, a PDB code, and the resolution achieved during determination, along with the method employed and the date the structure was resolved. Additional measurements include the number of chains present in the structure and an RMSD value quantifying structural deviation.

**Table `protein_structures`**

| id | structure_id | pdb_code | resolution | method | date_resolved | chain_count | rmsd_value | software_tool_id | protein_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2405 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 13.20 | seasonal-method-77 | 2022-09-15T20:48:00 | 16 | 13.95 | 100 | 1 |
| 1001 | 7441140 | 9736914 | 16.40 | regional-method-78 | 2023-02-26T03:05:00 | 0 | 15.90 | 101 | 2 |
| 1002 | 7119772 | b_VB-IC-6 | 19.60 | legacy-method-79 | 2024-07-10T10:22:00 | 7 | 17.85 | 102 | 3 |
| 1003 | 1996930 | 8189500 | 22.80 | compact-method-80 | 2025-12-21T17:39:00 | 0 | 19.80 | 103 | 4 |

The structure identified by PDB code `c746bff2-8fcc-11eb-924d-9cd76263cbd0` was resolved on 2022-09-15 using `seasonal-method-77` at a resolution of 13.20 angstroms, containing 16 chains with an RMSD of 13.95. By contrast, the structure with PDB code `b_VB-IC-6` was resolved more recently on 2024-07-10 using `legacy-method-79` at 19.60 angstroms resolution, with only 7 chains and an RMSD of 17.85. Some structures, such as the one with PDB code `9736914`, show zero chains and were resolved using `regional-method-78` at 16.40 angstroms resolution. The resolution values span from 13.20 to 22.80, while RMSD values range from 13.95 to 19.80, reflecting the variability inherent in structure determination across different methods and conditions.

## Proteins and Their Functional Annotations

Proteins are catalogued with their UniProt accession numbers, gene names, source organisms, molecular weights, sequence lengths, and functional descriptions. Each protein record links to a resolved protein structure, a small molecule of interest, and a pathogen of relevance, creating a bridge between sequence-level information and structural and functional contexts.

**Table `proteins`**

| protein_id | uniprot_accession | gene_name | organism | molecular_weight | sequence_length | function | protein_structure_id | small_molecule_id | pathogen_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | extended-uniprot-27 | Regional Protocol | extended-organism-75 | 0.53 | 11 | extended-function-33 | 1000 | 1 | 1996917 |
| 2 | integrated-uniprot-28 | Seasonal Programme D | integrated-organism-76 | 0.74 | 17 | integrated-function-34 | 1001 | 2 | 7119791 |
| 3 | seasonal-uniprot-29 | Integrated Standard | seasonal-organism-77 | 0.74 | 23 | seasonal-function-35 | 1002 | 3 | 392493 |
| 4 | regional-uniprot-30 | Extended Framework | regional-organism-78 | 0.6 | 29 | regional-function-36 | 1003 | 4 | 13483868 |

The protein with UniProt accession `extended-uniprot-27` carries the gene name `Regional Protocol` and originates from `extended-organism-75`. It has a molecular weight of 0.53, a sequence length of 11 residues, and is annotated with the function `extended-function-33`. This protein is associated with structure `1000`, small molecule `1`, and pathogen `1996917`. Another entry, `integrated-uniprot-28`, encodes `Seasonal Programme D` from `integrated-organism-76` with a molecular weight of 0.74 and sequence length of 17, linked to structure `1001`, small molecule `2`, and pathogen `7119791`. The proteins span sequence lengths from 11 to 29 residues and molecular weights from 0.53 to 0.74, representing a compact set of annotated sequences.

## Small Molecules and Their Chemical Properties

Small molecules are recorded with their SMILES strings, IUPAC names, molecular formulas, molecular weights, activity classes, toxicity scores, and optimization statuses. Each molecule is associated with a target protein and, in some cases, a food formulation, enabling traceability from chemical identity through biological activity to applied contexts.

**Table `small_molecules`**

| id | molecule_id | smiles | iupac_name | molecular_formula | molecular_weight | activity_class | toxicity_score | optimization_status | protein_id | food_formulation_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3706 | compact-smiles-50 | Composite Protocol | distributed-molecula-84 | 0.53 | distributed-activity-18 | 15.20 | legacy-optimiza-85 | 1 | 1 |
| 2 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | composite-smiles-51 | Compact Programme A | baseline-molecula-85 | 0.74 | baseline-activity-19 | 19.40 | compact-optimiza-86 | 2 | 2 |
| 3 | b_VB-PA-Tab | primary-smiles-52 | Legacy Standard | pilot-molecula-86 | 0.74 | pilot-activity-20 | 23.60 | composite-optimiza-87 | 3 | 3 |
| 4 | account_pymes_1030 | adaptive-smiles-53 | Regional Framework | extended-molecula-87 | 0.6 | extended-activity-21 | 27.80 | primary-optimiza-88 | 4 | 4 |

The molecule identified by SMILES `compact-smiles-50` carries the IUPAC name `Composite Protocol` and has the molecular formula `distributed-molecula-84` with a molecular weight of 0.53. It belongs to activity class `distributed-activity-18`, carries a toxicity score of 15.20, and has an optimization status of `legacy-optimiza-85`. This molecule targets protein `1` and is present in food formulation `1`. A second molecule, `5f923cfa-8fcd-11eb-924d-9cd76263cbd0`, named `Compact Programme A`, has a higher toxicity score of 19.40 and belongs to `baseline-activity-19`, targeting protein `2` within food formulation `2`. Toxicity scores range from 15.20 to 27.80, and optimization statuses include `legacy-optimiza-85`, `compact-optimiza-86`, `composite-optimiza-87`, and `primary-optimiza-88`, reflecting different stages of molecular development.

## Molecular Dynamics Simulations

Molecular dynamics simulations capture the temporal evolution of protein systems under defined physical conditions. Each simulation records a start and end time, the total duration, the temperature and pressure settings, the force field applied, and the convergence status. Simulations are linked to both the software tool that executed them and the protein structure under study.

**Table `molecular_dynamics_simulations`**

| molecular_dynamics_simulation_id | simulation_id | start_time | end_time | duration | temperature | pressure | force_field | convergence_status | software_tool_id | protein_structure_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 212 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 4.20 | 1.33 | 16.20 | primary-force-52 | distributed-converge-78 | 100 | 1000 |
| 1001 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 8.40 | 1.1714807757148185 | 18.40 | adaptive-force-53 | baseline-converge-79 | 101 | 1001 |
| 1002 | 974945 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 12.60 | 0.51 | 20.60 | distributed-force-54 | pilot-converge-80 | 102 | 1002 |
| 1003 | 7119790 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 16.80 | 0.85 | 22.80 | baseline-force-55 | extended-converge-81 | 103 | 1003 |

Simulation `212` ran from 2024-03-27 to 2023-02-26 with a duration of 4.20 units, at a temperature of 1.33 and pressure of 16.20, using `primary-force-52` as the force field and achieving `distributed-converge-78` convergence status. It was executed by software tool `100` on protein structure `1000`. Simulation `974945` had the longest duration at 12.60 units, operating at temperature 0.51 and pressure 20.60 with `distributed-force-54`, reaching `pilot-converge-80` convergence. Durations range from 4.20 to 16.80, temperatures from 0.51 to 1.33, and pressures from 16.20 to 22.80, illustrating the parameter space explored across simulations.

## Software Tools

Software tools are the computational engines driving structure determination, simulation, and analysis. Each tool is identified by a tool ID, version, license type, primary function, and developer. Tools are linked to the molecular dynamics simulations they execute, the protein structures they analyze, and the small molecules they help characterize.

**Table `software_tools`**

| id | tool_id | tool_name | version | license_type | primary_function | developer | molecular_dynamics_simulation_id | protein_structure_id | small_molecule_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | comi | Composite Model | seasonal-version-71 | regional-license-78 | seasonal-primary-77 | extended-develope-63 | 1000 | 1000 | 1 |
| 101 | 195360 | Compact Cluster A | regional-version-72 | legacy-license-79 | regional-primary-78 | integrated-develope-64 | 1001 | 1001 | 2 |
| 102 | 3355763 | Legacy Review | legacy-version-73 | compact-license-80 | legacy-primary-79 | seasonal-develope-65 | 1002 | 1002 | 3 |
| 103 | 8387539 | Regional Initiative | compact-version-74 | composite-license-81 | compact-primary-80 | regional-develope-66 | 1003 | 1003 | 4 |

The tool `Composite Model` (version `seasonal-version-71`, license `regional-license-78`) has primary function `seasonal-primary-77` and was developed by `extended-develope-63`. It executed simulation `1000`, analyzed structure `1000`, and characterized small molecule `1`. The tool `Compact Cluster A` (version `regional-version-72`, license `legacy-license-79`) with function `regional-primary-78` from developer `integrated-develope-64` handled simulation `1001`, structure `1001`, and molecule `2`. Tool names include `Composite Model`, `Compact Cluster A`, `Legacy Review`, and `Regional Initiative`, with developer names spanning `extended-develope-63` through `regional-develope-66`.

## Pathogens and Their Host Associations

Pathogens are documented with their scientific and common names, host plants, associated disease names, and geographic distributions. Each pathogen record connects to a crop plant and a target protein, enabling epidemiological and molecular tracking across biological systems.

**Table `pathogens`**

| pathogen_id | scientific_name | common_name | host_plant | disease_name | geographic_distribution | crop_plant_id | protein_id |
|---|---|---|---|---|---|---|---|
| 1996917 | Integrated Protocol A | Seasonal Review | primary-host-22 | Regional Protocol | extended-geograph-69 | 1 | 1 |
| 7119791 | Extended Programme | Integrated Initiative | adaptive-host-23 | Seasonal Programme D | integrated-geograph-70 | 2 | 2 |
| 392493 | Pilot Standard | Extended Model D | distributed-host-24 | Integrated Standard | seasonal-geograph-71 | 3 | 3 |
| 13483868 | Baseline Framework D | Pilot Cluster | baseline-host-25 | Extended Framework | regional-geograph-72 | 4 | 4 |

Pathogen `1996917`, scientifically named `Integrated Protocol A` and commonly known as `Seasonal Review`, infects host plant `primary-host-22` and causes `Regional Protocol` disease. Its geographic distribution is `extended-geograph-69`, it targets crop plant `1`, and its protein target is `1`. Pathogen `7119791`, named `Extended Programme` with common name `Integrated Initiative`, infects `adaptive-host-23`, causes `Seasonal Programme D` disease, and is distributed across `integrated-geograph-70`, targeting crop plant `2` and protein `2`. Disease names include `Regional Protocol`, `Seasonal Programme D`, `Integrated Standard`, and `Extended Framework`.

## Crop Plants and Food Formulations

Crop plants and food formulations represent the agricultural and applied endpoints of the domain. Crop plants are linked to pathogens that threaten them, while food formulations are associated with small molecules and food industry applications. These tables anchor the molecular data to real-world biological and industrial contexts.

**Table `crop_plants`**

| id | plant_id | species_name | variety | growth_stage | stress_tolerance_level | yield_metric | pathogen_id | small_molecule_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5082988 | Primary Programme A | primary-variety-16 | adaptive-growth-35 | 11.45 | 14.70 | 1996917 | 1 |
| 2 | template_ivacode_pagata_20ind | Composite Standard | adaptive-variety-17 | distributed-growth-36 | 15.90 | 19.40 | 7119791 | 2 |
| 3 | L331 | Compact Framework | distributed-variety-18 | baseline-growth-37 | 20.35 | 24.10 | 392493 | 3 |
| 4 | 14484998 | Legacy Protocol D | baseline-variety-19 | pilot-growth-38 | 24.80 | 28.80 | 13483868 | 4 |

**Table `food_formulations`**

| id | formulation_id | product_code | colorant_source | concentration | ph_level | shelf_life | regulatory_status | small_molecule_id | food_industry_application_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m12 | PRO-2675 | regional-colorant-96 | 7.70 | 11.70 | 28 | adaptive-regulato-17 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9736908 | PRO-2681 | legacy-colorant-97 | 11.40 | 16.40 | 34 | distributed-regulato-18 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 392481 | PRO-2687 | compact-colorant-98 | 15.10 | 21.10 | 40 | baseline-regulato-19 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 505985 | PRO-2693 | composite-colorant-99 | 18.80 | 25.80 | 46 | pilot-regulato-20 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `food_industry_applications`**

| food_industry_application_id | application_id | application_type | target_food_matrix | dosage | efficacy_score | food_formulation_id |
|---|---|---|---|---|---|---|
| 1 | 505997 | legacy-applicat-73 | adaptive-target-29 | 7.20 | 13.20 | 1 |
| 2 | 1250196 | compact-applicat-74 | distributed-target-30 | 11.40 | 16.40 | 2 |
| 3 | 124 | composite-applicat-75 | baseline-target-31 | 15.60 | 19.60 | 3 |
| 4 | IVC20det40 | primary-applicat-76 | pilot-target-32 | 19.80 | 22.80 | 4 |

Crop plants are associated with pathogens through host relationships, and food formulations incorporate small molecules for specific industry applications. The food industry applications table captures the practical deployment contexts where molecular and structural insights are operationalized.

## Cross-Referenced Views

The domain's analytical power emerges from joined views that connect records across tables, answering specific investigative questions about relationships between entities.

### Protein Structure and Software Tool Relationships

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

This view answers which software tools were used to resolve or analyze each protein structure. It joins protein structures with software tools through the `software_tool_id` foreign key, revealing the computational provenance of structural data. For instance, structure `1000` (PDB code `c746bff2-8fcc-11eb-924d-9cd76263cbd0`) was resolved using tool `100` (`Composite Model`), while structure `1003` (PDB code `8189500`) was processed by tool `103` (`Regional Initiative`).

### Protein Structure and Protein Associations

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

This view links resolved protein structures to their corresponding protein sequences, answering which structural data corresponds to which annotated protein. The join on `protein_structure_id` connects structure `1000` to protein `extended-uniprot-27` (gene `Regional Protocol`), and structure `1002` to protein `seasonal-uniprot-29` (gene `Integrated Standard`). This relationship is essential for correlating structural measurements like resolution and RMSD with functional annotations.

### Protein and Protein Structure Linkage

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

This view reverses the perspective, starting from protein records and tracing to their resolved structures. It confirms that protein `integrated-uniprot-28` maps to structure `1001` (resolved with `regional-method-78` at 16.40 angstroms), and protein `regional-uniprot-30` maps to structure `1003` (resolved with `compact-method-80` at 22.80 angstroms). The bidirectional nature of this relationship ensures data consistency between sequence and structure records.

### Protein and Small Molecule Interactions

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

This view reveals which small molecules are associated with which proteins, answering questions about molecular targeting and binding relationships. Protein `extended-uniprot-27` is linked to small molecule `compact-smiles-50` (IUPAC: `Composite Protocol`, toxicity: 15.20), while protein `regional-uniprot-30` is linked to small molecule `account_pymes_1030` (IUPAC: `Regional Framework`, toxicity: 27.80). The toxicity scores in this view range from 15.20 to 27.80, providing a quick reference for risk assessment.

### Protein and Pathogen Associations

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

This view connects proteins to the pathogens that target them, answering epidemiological and functional questions about pathogen-host molecular interactions. Pathogen `1996917` (`Integrated Protocol A`) targets protein `extended-uniprot-27`, while pathogen `13483868` (`Baseline Framework D`) targets protein `regional-uniprot-30`. The geographic distributions in this view—`extended-geograph-69` through `regional-geograph-72`—provide spatial context for pathogen spread.

### Small Molecule and Protein Targeting

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

This view inverts the protein-small molecule relationship, starting from molecules and identifying their protein targets. Small molecule `compact-smiles-50` targets protein `extended-uniprot-27` from `extended-organism-75`, and small molecule `b_VB-PA-Tab` targets protein `seasonal-uniprot-29` from `seasonal-organism-77`. The activity classes in this view—`distributed-activity-18` through `extended-activity-21`—categorize the functional profiles of the molecules.

### Small Molecule and Food Formulation Integration

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

This view reveals which small molecules are incorporated into which food formulations, answering questions about molecular deployment in food systems. Small molecule `compact-smiles-50` is present in food formulation `1`, and small molecule `5f923cfa-8fcd-11eb-924d-9cd76263cbd0` is present in food formulation `2`. This relationship bridges molecular chemistry with applied food science.

### Molecular Dynamics Simulation and Software Tool Execution

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

This view identifies which software tools executed which molecular dynamics simulations, providing computational provenance for simulation results. Simulation `212` was executed by tool `100` (`Composite Model`), and simulation `974945` was executed by tool `102` (`Legacy Review`). The force fields used—`primary-force-52` through `baseline-force-55`—and convergence statuses—`distributed-converge-78` through `extended-converge-81`—are visible in this joined context.

### Molecular Dynamics Simulation and Protein Structure Context

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

This view links simulations to the protein structures they model, answering which structural data was simulated under which conditions. Simulation `212` modeled structure `1000` (PDB code `c746bff2-8fcc-11eb-924d-9cd76263cbd0`, resolution 13.20), while simulation `7119790` modeled structure `1003` (PDB code `8189500`, resolution 22.80). The temperature and pressure settings in this view range from 0.51 to 1.33 and 16.20 to 22.80 respectively, showing the physical conditions under which each structure was simulated.

### Software Tool and Molecular Dynamics Simulation Execution

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

This view reverses the simulation-software relationship, starting from tools and listing the simulations they executed. Tool `100` (`Composite Model`) executed simulation `212` at temperature 1.33 with force field `primary-force-52`, and tool `103` (`Regional Initiative`) executed simulation `7119790` at temperature 0.85 with force field `baseline-force-55`. This perspective is useful for auditing tool usage and performance across simulations.

### Software Tool and Protein Structure Analysis

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

This view connects software tools to the protein structures they analyzed, answering which tools were responsible for which structural determinations. Tool `100` (`Composite Model`) analyzed structure `1000` (resolved 2022-09-15, 16 chains), and tool `102` (`Legacy Review`) analyzed structure `1002` (resolved 2024-07-10, 7 chains). The resolution values and chain counts in this view provide quality metrics for the structures processed by each tool.

### Software Tool and Small Molecule Characterization

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

This view reveals which software tools were used to characterize which small molecules, linking computational chemistry tools to molecular properties. Tool `100` (`Composite Model`) characterized small molecule `compact-smiles-50` (toxicity 15.20, activity class `distributed-activity-18`), and tool `103` (`Regional Initiative`) characterized small molecule `account_pymes_1030` (toxicity 27.80, activity class `extended-activity-21`). The optimization statuses visible here—`legacy-optimiza-85` through `primary-optimiza-88`—indicate the development stage of each molecule.

### Pathogen and Crop Plant Host Relationships

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

This view identifies which pathogens threaten which crop plants, answering agricultural risk assessment questions. Pathogen `1996917` (`Integrated Protocol A`) threatens crop plant `1`, and pathogen `392493` (`Pilot Standard`) threatens crop plant `3`. The disease names—`Regional Protocol`, `Seasonal Programme D`, `Integrated Standard`, and `Extended Framework`—and geographic distributions provide context for the scope of each threat.

### Pathogen and Protein Target Associations

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

This view connects pathogens to the proteins they target, answering molecular epidemiology questions about pathogen-host interactions at the protein level. Pathogen `1996917` targets protein `extended-uniprot-27` (gene `Regional Protocol`, organism `extended-organism-75`), and pathogen `13483868` targets protein `regional-uniprot-30` (gene `Extended Framework`, organism `regional-organism-78`). The protein functions and sequence lengths in this view provide functional context for the targeted proteins.

### Crop Plant and Pathogen Threat Assessment

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

This view inverts the pathogen-crop plant relationship, starting from crop plants and listing the pathogens that threaten them. Crop plant `1` is threatened by pathogen `1996917` (`Integrated Protocol A`, disease `Regional Protocol`), and crop plant `4` is threatened by pathogen `13483868` (`Baseline Framework D`, disease `Extended Framework`). The host plant names and geographic distributions in this view help assess the geographic scope of agricultural risks.

### Crop Plant and Small Molecule Applications

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

This view links crop plants to small molecules, answering questions about molecular interventions in agricultural systems. Crop plant `1` is associated with small molecule `compact-smiles-50` (IUPAC `Composite Protocol`, toxicity 15.20), and crop plant `4` is associated with small molecule `account_pymes_1030` (IUPAC `Regional Framework`, toxicity 27.80). The activity classes and optimization statuses provide insight into the developmental stage and functional profile of agricultural molecular interventions.

### Food Formulation and Small Molecule Composition

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

This view reveals the small molecule composition of food formulations, answering questions about molecular ingredients. Food formulation `1` contains small molecule `compact-smiles-50` (toxicity 15.20, activity class `distributed-activity-18`), and food formulation `3` contains small molecule `b_VB-PA-Tab` (toxicity 23.60, activity class `pilot-activity-20`). The molecular formulas and optimization statuses provide chemical and developmental context for the formulation ingredients.

### Food Formulation and Industry Application Deployment

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

This view connects food formulations to their food industry applications, answering questions about the practical deployment of molecular formulations. Food formulation `1` is deployed in food industry application contexts, and food formulation `4` is similarly linked to its application. This relationship bridges molecular composition with industrial use cases.

### Food Industry Application and Formulation Sourcing

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

This view reverses the application-formulation relationship, starting from industry applications and identifying the food formulations they source. Food industry applications trace back to specific formulations, enabling traceability from industrial use through formulation composition to molecular ingredients. This perspective is essential for quality assurance and regulatory compliance in food industry operations.

## Synthesis

The domain integrates molecular-level data—protein structures, sequences, small molecules, and their dynamic behaviors—with higher-level biological and industrial contexts including pathogens, crop plants, food formulations, and industry applications. Software tools serve as the computational infrastructure connecting these layers, executing simulations, analyzing structures, and characterizing molecules. The joined views enable cross-cutting queries that answer practical questions: which tools produced which structures, which molecules target which proteins, which pathogens threaten which crops, and which molecules compose which food formulations. Together, these records and their relationships form a comprehensive framework for investigating the molecular foundations of food systems and the biological threats that challenge them.