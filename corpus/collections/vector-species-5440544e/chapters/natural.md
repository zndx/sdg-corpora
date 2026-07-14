## Vector-Borne Disease Surveillance and Epidemiological Monitoring

The surveillance of vector-borne diseases represents a critical public health infrastructure, linking ecological monitoring of disease-carrying organisms with clinical case tracking, healthcare delivery, and administrative governance. At its core, the system records where vectors are found, which pathogens they carry, how those pathogens manifest in human populations, and which institutions manage the response. This chapter describes the entities, measurements, and operational relationships that constitute a modern vector-borne disease surveillance architecture, drawing on representative records from an operational deployment.

## Vector Species and Their Ecological Profiles

Vector species form the ecological foundation of the surveillance system. Each record captures taxonomic identity, behavioral ecology, and operational relevance.

**Table `vector_specieses`**

| id | species_code | common_name | is_primary_vector | breeding_preference | is_urban_adapted | pathogen_id | surveillance_site_id |
|---|---|---|---|---|---|---|---|
| 1 | Aedes aegypti | Seasonal Review | false | seasonal-breeding-59 | true | 1 | 1 |
| 2 | Aedes albopictus | Integrated Initiative | true | regional-breeding-60 | false | 2 | 2 |
| 3 | Aedes aegypti | Extended Model D | false | legacy-breeding-61 | true | 3 | 3 |
| 4 | Aedes albopictus | Pilot Cluster | true | compact-breeding-62 | false | 4 | 4 |

The vector species table documents four primary entries, each representing a distinct mosquito species with specific ecological attributes. *Aedes aegypti* appears twice in the records (identifiers 1 and 3), reflecting its dual presence across different surveillance contexts. The species are distinguished by their breeding preferences—ranging from seasonal-breeding-59 to compact-breeding-62—and by their urban adaptation status. Notably, *Aedes aegypti* at identifier 1 is marked as urban-adapted with a seasonal breeding pattern, while *Aedes albopictus* at identifier 2 carries the is_primary_vector flag, designating it as the principal vector in its surveillance zone. The breeding_preference field encodes ecological niche information using standardized codes such as regional-breeding-60 and legacy-breeding-61, enabling comparative analysis across species and sites. Each vector species record also carries a foreign reference to a pathogen and a surveillance site, anchoring the biological entity within the operational surveillance network.

## Pathogen Characteristics and Disease Classification

Pathogens are the disease-causing agents transmitted by vectors, and their classification drives clinical and public health decision-making.

**Table `pathogens`**

| id | pathogen_code | disease_name | severity_level | is_endemic | circulating_strain | vector_species_id |
|---|---|---|---|---|---|---|
| 1 | Dengue Virus | Regional Protocol | Self-limiting | true | compact-circulat-68 | 1 |
| 2 | Japanese Encephalitis Virus | Seasonal Programme D | Severe | false | composite-circulat-69 | 2 |
| 3 | Dengue Virus | Integrated Standard | Fatal | true | primary-circulat-70 | 3 |
| 4 | Japanese Encephalitis Virus | Extended Framework | Self-limiting | false | adaptive-circulat-71 | 4 |

The pathogens table contains four records representing two distinct viral agents: Dengue Virus and Japanese Encephalitis Virus. Each pathogen record includes a severity_level classification ranging from Self-limiting to Fatal, which directly informs clinical triage and resource allocation. The circulating_strain field provides molecular-level detail—compact-circulat-68, composite-circulat-69, primary-circulat-70, and adaptive-circulat-71—enabling strain-level epidemiological tracking. The is_endemic flag distinguishes pathogens that are persistently present in a region from those that appear episodically. Dengue Virus at identifier 1 is classified as Self-limiting and endemic, while the same species at identifier 3 carries a Fatal severity rating, illustrating how severity can vary by strain or geographic context. Each pathogen record references a vector_species_id, establishing the biological transmission pathway.

## Surveillance Sites and Geographic Infrastructure

Surveillance sites are the physical locations where vector monitoring, environmental sampling, and case detection occur. They serve as the geographic anchors connecting ecological, clinical, and administrative data.

**Table `surveillance_sites`**

| surveillance_site_id | site_code | district_name | region_type | is_endemic_zone | latitude | longitude | vector_species_id | clinical_case_id | administrative_region_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | account_pymes_2935 | Extended Review | Urban | false | 13.95 | 21.20 | 1 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 7731860 | Pilot Initiative A | Suburban | true | 17.90 | 25.40 | 2 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1336176 | Baseline Model | Rural | false | 21.85 | 29.60 | 3 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 10207160 | Distributed Cluster | Peri-urban | true | 25.80 | 33.80 | 4 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The surveillance_sites table records four operational sites, each with precise geographic coordinates and administrative context. Site account_pymes_2935 (identifier 1) is located at latitude 13.95 and longitude 21.20 in an Urban region_type with is_endemic_zone set to false, suggesting it monitors a non-endemic urban area. In contrast, site 7731860 (identifier 2) at coordinates 17.90, 25.40 is classified as Suburban and marked as an endemic zone, indicating active pathogen circulation. The district_name field uses standardized labels—Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster—reflecting the operational phase or programmatic designation of each site. Each site carries vector_species_id, clinical_case_id, and administrative_region_id foreign keys, embedding it within the broader surveillance ecosystem. The created_at and updated_at timestamps provide temporal provenance for data quality assessment.

## Clinical Case Records and Patient Outcomes

Clinical cases represent the human impact of vector-borne disease transmission, documenting individual patient encounters from diagnosis through outcome.

**Table `clinical_cases`**

| id | case_i_d | diagnosis_date | symptom_profile | disease_form | patient_age | outcome | healthcare_facility_id | pathogen_id | surveillance_site_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2654 | 2023-10-26T21:51:00 | legacy-symptom-13 | Dengue Fever | 27 | Recovered | 1 | 1 | 1 |
| 2 | CAS-2660 | 2024-03-10T04:08:00 | compact-symptom-14 | Dengue Hemorrhagic Fever | 38 | Fatal | 2 | 2 | 2 |
| 3 | CAS-2666 | 2025-08-21T11:25:00 | composite-symptom-15 | Dengue Shock Syndrome | 49 | Ongoing | 3 | 3 | 3 |
| 4 | CAS-2672 | 2022-01-05T18:42:00 | primary-symptom-16 | Dengue Fever | 60 | Recovered | 4 | 4 | 4 |

The clinical_cases table contains four patient records, each identified by a structured case identifier (CAS-2654 through CAS-2672). The symptom_profile field uses standardized codes—legacy-symptom-13, compact-symptom-14, composite-symptom-15, and primary-symptom-16—to categorize clinical presentations. Disease forms range from Dengue Fever to Dengue Hemorrhagic Fever to Dengue Shock Syndrome, reflecting the spectrum of clinical severity. Patient ages span from 27 to 60 years, and outcomes include Recovered, Fatal, and Ongoing statuses. Case CAS-2660, diagnosed on 2024-03-10, resulted in a Fatal outcome for a 38-year-old patient with Dengue Hemorrhagic Fever, while CAS-2666, diagnosed on 2025-08-21, remains Ongoing for a 49-year-old with Dengue Shock Syndrome. Each case references a healthcare_facility_id, pathogen_id, and surveillance_site_id, linking the clinical event to its institutional, biological, and geographic context.

## Healthcare Facilities and Referral Networks

Healthcare facilities provide the clinical infrastructure for case detection, treatment, and referral. Their capacity and interconnections shape the response to outbreaks.

**Table `healthcare_facilities`**

| healthcare_facility_id | facility_code | facility_name | facility_type | city_location | has_referral_capacity | surveillance_site_id | pathogen_id | receives_referrals_healthcare_facility_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | Medical College | regional-city-12 | true | 1 | 1 | 1 |
| 2 | Bjuukia | Extended Programme | Zonal Hospital | legacy-city-13 | false | 2 | 2 | 2 |
| 3 | 2106693 | Pilot Standard | Subregional Hospital | compact-city-14 | true | 3 | 3 | 3 |
| 4 | 6969439 | Baseline Framework D | Tropical Hospital | composite-city-15 | false | 4 | 4 | 4 |

The healthcare_facilities table documents four medical institutions, each with a distinct facility_type ranging from Medical College to Zonal Hospital to Subregional Hospital to Tropical Hospital. The facility_code field uses both numeric identifiers (2933476, 2106693, 6969439) and alphanumeric codes (Bjuukia) to distinguish facilities. The city_location field encodes urban context using standardized labels such as regional-city-12 and legacy-city-13. The has_referral_capacity flag indicates whether a facility can accept referrals from lower-tier institutions; facilities at identifiers 1 and 3 have this capacity enabled, while identifiers 2 and 4 do not. The receives_referrals_healthcare_facility_id field establishes a self-referential referral chain, allowing the system to model hierarchical care networks. Each facility is linked to a surveillance_site_id and pathogen_id, grounding its operational scope in specific geographic and biological contexts.

## Administrative Regions and Health Governance

Administrative regions define the geographic and political boundaries within which surveillance activities are coordinated and health authorities exercise jurisdiction.

**Table `administrative_regions`**

| id | region_code | region_name | region_level | bordering_country | climate_zone | health_authority_id |
|---|---|---|---|---|---|---|
| 100 | 1562837 | Distributed Assessment | Country | baseline-borderin-91 | Tropical | 100 |
| 101 | 6564391 | Adaptive Survey D | District | pilot-borderin-92 | Sub-tropical | 101 |
| 102 | 778560 | Primary Corridor | Province | extended-borderin-93 | Temperate | 102 |
| 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | Country | integrated-borderin-94 | Tropical | 103 |

The administrative_regions table contains four records at different governance levels: Country, District, Province, and Country. Region 1562837 (Distributed Assessment) and region 8667ec1da10c4a0293d91388b49bc77c (Composite Series) are both classified at the Country level but differ in their bordering_country designations (baseline-borderin-91 versus integrated-borderin-94) and share a Tropical climate_zone. Region 6564391 (Adaptive Survey D) operates at the District level in a Sub-tropical zone, while region 778560 (Primary Corridor) is a Province in a Temperate climate. Each region carries a health_authority_id, establishing the governance relationship. The region_code field uses both numeric and hexadecimal identifiers, reflecting the system's support for diverse administrative coding schemes.

## Health Authorities and Research Oversight

Health authorities provide the institutional governance for surveillance programs, while research projects generate the evidence base for policy and intervention.

**Table `health_authorities`**

| id | authority_code | authority_name | authority_type | is_regulatory | funding_source | administrative_region_id | research_project_id |
|---|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | National Council | false | baseline-funding-73 | 100 | 1000 |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | Department | true | pilot-funding-74 | 101 | 1001 |
| 102 | 9246326 | Kimberly Smith | Ministry | false | extended-funding-75 | 102 | 1002 |
| 103 | 9085244 | Kimberly Smith | WHO Office | true | integrated-funding-76 | 103 | 1003 |

**Table `research_projects`**

| id | project_code | start_date | end_date | primary_objective | is_completed | methodology_type | administrative_region_id | health_authority_id | pathogen_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | IVC20det15 | 2022-09-05 | 2022-09-01 | primary-primary-58 | false | Entomological Surveillance | 100 | 100 | 1 |
| 1001 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | adaptive-primary-59 | true | Clinical Review | 101 | 101 | 2 |
| 1002 | 324 | 2024-07-27 | 2024-07-23 | distributed-primary-60 | false | Stakeholder Meeting | 102 | 102 | 3 |
| 1003 | template_ivacode_pagata_20det50 | 2025-12-11 | 2025-12-07 | baseline-primary-61 | true | Entomological Surveillance | 103 | 103 | 4 |

Health authorities serve as the governing bodies responsible for surveillance coordination, resource allocation, and policy implementation within their jurisdictions. Research projects generate the scientific evidence that informs surveillance strategy, pathogen characterization, and intervention design. Together, these entities form the institutional backbone of the surveillance system, linking field operations to policy decisions and scientific advancement.

## Geographic-Site Mapping

The regions_sites table provides the explicit mapping between administrative regions and surveillance sites, enabling geographic aggregation and cross-jurisdictional analysis.

**Table `regions_sites`**

| administrative_region_id | surveillance_site_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

This junction table resolves the many-to-many relationship between administrative regions and surveillance sites, allowing a single site to be associated with multiple overlapping jurisdictions and a single region to encompass multiple monitoring locations. The mapping is essential for aggregating case counts, vector densities, and pathogen prevalence by administrative boundary.

## Integrated Surveillance Views

The surveillance system provides a suite of joined views that synthesize data across entity types, answering specific operational questions about the relationships between vectors, pathogens, sites, cases, and institutions.

### Vector-Pathogen and Vector-Site Relationships

The vector_species_pathogen_view and pathogen_vector_species_view both capture the biological transmission relationship between vector species and the pathogens they carry. The vector_species_pathogen_view presents the relationship from the vector's perspective, showing which pathogens each species is associated with. For example, the record linking vector species identifier 1 (Aedes aegypti) to pathogen identifier 1 (Dengue Virus, severity Self-limiting) indicates that this particular population of Aedes aegypti is monitored for Dengue Virus transmission. The pathogen_vector_species_view inverts this perspective, presenting the pathogen as the primary entity and listing its associated vectors—useful for understanding the full vectorial capacity of a given pathogen.

The vector_species_surveillance_site_view and surveillance_site_vector_species_view similarly provide bidirectional views of the vector-site relationship. The vector_species_surveillance_site_view shows which surveillance sites monitor each vector species, while surveillance_site_vector_species_view shows which vector species are active at each site. Site account_pymes_2935 (identifier 1) monitors vector species identifier 1 (Aedes aegypti), establishing the ecological baseline for that urban location.

### Site-Clinical and Site-Administrative Relationships

The surveillance_site_clinical_case_view links surveillance sites to the clinical cases detected within their catchment areas. This view answers the question: which cases were identified at which monitoring locations? Site 7731860 (identifier 2), classified as an endemic Suburban zone, is linked to clinical case CAS-2660, a Fatal case of Dengue Hemorrhagic Fever in a 38-year-old patient. This linkage is critical for calculating site-level incidence rates and identifying hotspots.

The surveillance_site_administrative_region_view maps surveillance sites to their governing administrative regions, enabling jurisdictional reporting. Site 10207160 (identifier 4), a Peri-urban location in an endemic zone, falls under administrative region 103 (Composite Series, Country level), which is governed by health authority 103. This mapping supports cross-regional comparisons and resource allocation decisions.

### Clinical Case Integration

The clinical_case_healthcare_facility_view connects individual patient cases to the facilities where they were treated. Case CAS-2654 (Dengue Fever, Recovered, age 27) was managed at healthcare facility 2933476 (Integrated Protocol A, a Medical College with referral capacity). This view enables analysis of facility-level case volumes, outcome rates, and referral patterns.

The clinical_case_pathogen_view links cases to their causative pathogens, providing a direct view of pathogen-specific clinical burden. Case CAS-2666 (Dengue Shock Syndrome, Ongoing outcome) is associated with pathogen identifier 3 (Dengue Virus, Fatal severity), illustrating the severity spectrum within a single pathogen species.

The clinical_case_surveillance_site_view connects clinical cases to their originating surveillance sites, enabling geographic clustering analysis. Case CAS-2672 (Dengue Fever, Recovered, age 60) originated from surveillance site 4 (Distributed Cluster, Peri-urban, endemic zone), providing the geographic context for this recovery outcome.

### Healthcare Facility Integration

The healthcare_facility_surveillance_site_view links medical facilities to their associated surveillance sites, establishing the clinical-ecological interface. Facility 2933476 (Integrated Protocol A, Medical College) is associated with surveillance site 1 (account_pymes_2935, Urban), indicating that this facility serves the urban monitoring zone.

The healthcare_facility_pathogen_view connects facilities to the pathogens they manage, enabling pathogen-specific capacity planning. Facility Bjuukia (Extended Programme, Zonal Hospital) is associated with pathogen identifier 2 (Japanese Encephalitis Virus, Severe severity), reflecting the facility's role in managing severe pathogen cases.

The healthcare_facility_healthcare_facility_view reveals the self-referential referral network among facilities. Facility 2933476 (Integrated Protocol A) both receives and sends referrals within the network, as indicated by its self-referential linkage. This view enables analysis of referral chain topology and identification of hub facilities.

### Administrative and Governance Integration

The administrative_region_surveillance_site_detail_view provides a detailed mapping of surveillance sites within administrative regions, supporting granular geographic analysis. This view enriches the basic region-site mapping with additional site attributes, enabling multi-dimensional geographic queries.

The administrative_region_health_authority_view links administrative regions to their governing health authorities, clarifying jurisdictional boundaries. Region 1562837 (Distributed Assessment, Country level, Tropical climate) is governed by health authority 100, establishing the governance chain for this territory.

The health_authority_administrative_region_view inverts this relationship, presenting health authorities as the primary entity and listing their subordinate regions. Health authority 100 governs region 1562837, providing a top-down view of administrative coverage.

The health_authority_research_project_view connects health authorities to the research projects they sponsor or oversee, linking governance to scientific activity. This view enables analysis of research investment patterns across jurisdictions.

### Research Project Integration

The research_project_administrative_region_view links research projects to the administrative regions in which they operate, enabling geographic analysis of research activity. This view supports funding allocation decisions and identification of research gaps by region.

The research_project_health_authority_view connects research projects to their sponsoring health authorities, clarifying the institutional sponsorship chain. This view enables analysis of research priorities by governing body.

The research_project_pathogen_view links research projects to the pathogens they study, providing a direct view of research focus areas. This view enables identification of under-researched pathogens and alignment of research investment with disease burden.

## Synthesis

The surveillance system described here integrates ecological monitoring of vector species, molecular characterization of pathogens, geographic tracking of surveillance sites, clinical documentation of patient cases, institutional mapping of healthcare facilities, and administrative governance through health authorities and research projects. The base tables capture the fundamental entities and their attributes, while the joined views synthesize cross-entity relationships that answer specific operational questions. From the vector-pathogen transmission pathway to the clinical case-to-facility referral chain, from the site-to-region geographic mapping to the authority-to-project governance link, each relationship serves a distinct analytical purpose. The system's design enables practitioners to move fluidly between ecological, clinical, institutional, and administrative perspectives, supporting evidence-based decision-making across the full spectrum of vector-borne disease surveillance and control.

## Data appendix

**View `vector_species_pathogen_view`**

```sql
CREATE VIEW vector_species_pathogen_view AS
SELECT a.id, a.species_code, a.common_name, a.is_primary_vector, b.id AS pathogen_id, b.pathogen_code AS pathogen_pathogen_code, b.disease_name AS pathogen_disease_name
FROM vector_specieses a JOIN pathogens b ON a.pathogen_id = b.id;
```

| id | species_code | common_name | is_primary_vector | pathogen_id | pathogen_pathogen_code | pathogen_disease_name |
|---|---|---|---|---|---|---|
| 1 | Aedes aegypti | Seasonal Review | false | 1 | Dengue Virus | Regional Protocol |
| 2 | Aedes albopictus | Integrated Initiative | true | 2 | Japanese Encephalitis Virus | Seasonal Programme D |
| 3 | Aedes aegypti | Extended Model D | false | 3 | Dengue Virus | Integrated Standard |
| 4 | Aedes albopictus | Pilot Cluster | true | 4 | Japanese Encephalitis Virus | Extended Framework |

**View `vector_species_surveillance_site_view`**

```sql
CREATE VIEW vector_species_surveillance_site_view AS
SELECT a.id, a.species_code, a.common_name, a.is_primary_vector, b.surveillance_site_id AS site_surveillance_site_id, b.site_code AS site_site_code, b.district_name AS site_district_name
FROM vector_specieses a JOIN surveillance_sites b ON a.surveillance_site_id = b.surveillance_site_id;
```

| id | species_code | common_name | is_primary_vector | site_surveillance_site_id | site_site_code | site_district_name |
|---|---|---|---|---|---|---|
| 1 | Aedes aegypti | Seasonal Review | false | 1 | account_pymes_2935 | Extended Review |
| 2 | Aedes albopictus | Integrated Initiative | true | 2 | 7731860 | Pilot Initiative A |
| 3 | Aedes aegypti | Extended Model D | false | 3 | 1336176 | Baseline Model |
| 4 | Aedes albopictus | Pilot Cluster | true | 4 | 10207160 | Distributed Cluster |

**View `pathogen_vector_species_view`**

```sql
CREATE VIEW pathogen_vector_species_view AS
SELECT a.id, a.pathogen_code, a.disease_name, a.severity_level, b.id AS species_id, b.species_code AS species_species_code, b.common_name AS species_common_name
FROM pathogens a JOIN vector_specieses b ON a.vector_species_id = b.id;
```

| id | pathogen_code | disease_name | severity_level | species_id | species_species_code | species_common_name |
|---|---|---|---|---|---|---|
| 1 | Dengue Virus | Regional Protocol | Self-limiting | 1 | Aedes aegypti | Seasonal Review |
| 2 | Japanese Encephalitis Virus | Seasonal Programme D | Severe | 2 | Aedes albopictus | Integrated Initiative |
| 3 | Dengue Virus | Integrated Standard | Fatal | 3 | Aedes aegypti | Extended Model D |
| 4 | Japanese Encephalitis Virus | Extended Framework | Self-limiting | 4 | Aedes albopictus | Pilot Cluster |

**View `surveillance_site_vector_species_view`**

```sql
CREATE VIEW surveillance_site_vector_species_view AS
SELECT a.surveillance_site_id, a.site_code, a.district_name, a.region_type, b.id AS species_id, b.species_code AS species_species_code, b.common_name AS species_common_name
FROM surveillance_sites a JOIN vector_specieses b ON a.vector_species_id = b.id;
```

| surveillance_site_id | site_code | district_name | region_type | species_id | species_species_code | species_common_name |
|---|---|---|---|---|---|---|
| 1 | account_pymes_2935 | Extended Review | Urban | 1 | Aedes aegypti | Seasonal Review |
| 2 | 7731860 | Pilot Initiative A | Suburban | 2 | Aedes albopictus | Integrated Initiative |
| 3 | 1336176 | Baseline Model | Rural | 3 | Aedes aegypti | Extended Model D |
| 4 | 10207160 | Distributed Cluster | Peri-urban | 4 | Aedes albopictus | Pilot Cluster |

**View `surveillance_site_clinical_case_view`**

```sql
CREATE VIEW surveillance_site_clinical_case_view AS
SELECT a.surveillance_site_id, a.site_code, a.district_name, a.region_type, b.id AS case_id, b.case_i_d AS case_case_i_d, b.diagnosis_date AS case_diagnosis_date
FROM surveillance_sites a JOIN clinical_cases b ON a.clinical_case_id = b.id;
```

| surveillance_site_id | site_code | district_name | region_type | case_id | case_case_i_d | case_diagnosis_date |
|---|---|---|---|---|---|---|
| 1 | account_pymes_2935 | Extended Review | Urban | 1 | CAS-2654 | 2023-10-26T21:51:00 |
| 2 | 7731860 | Pilot Initiative A | Suburban | 2 | CAS-2660 | 2024-03-10T04:08:00 |
| 3 | 1336176 | Baseline Model | Rural | 3 | CAS-2666 | 2025-08-21T11:25:00 |
| 4 | 10207160 | Distributed Cluster | Peri-urban | 4 | CAS-2672 | 2022-01-05T18:42:00 |

**View `surveillance_site_administrative_region_view`**

```sql
CREATE VIEW surveillance_site_administrative_region_view AS
SELECT a.surveillance_site_id, a.site_code, a.district_name, a.region_type, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM surveillance_sites a JOIN administrative_regions b ON a.administrative_region_id = b.id;
```

| surveillance_site_id | site_code | district_name | region_type | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1 | account_pymes_2935 | Extended Review | Urban | 100 | 1562837 | Distributed Assessment |
| 2 | 7731860 | Pilot Initiative A | Suburban | 101 | 6564391 | Adaptive Survey D |
| 3 | 1336176 | Baseline Model | Rural | 102 | 778560 | Primary Corridor |
| 4 | 10207160 | Distributed Cluster | Peri-urban | 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

**View `clinical_case_healthcare_facility_view`**

```sql
CREATE VIEW clinical_case_healthcare_facility_view AS
SELECT a.id, a.case_i_d, a.diagnosis_date, a.symptom_profile, b.healthcare_facility_id AS facility_healthcare_facility_id, b.facility_code AS facility_facility_code, b.facility_name AS facility_facility_name
FROM clinical_cases a JOIN healthcare_facilities b ON a.healthcare_facility_id = b.healthcare_facility_id;
```

| id | case_i_d | diagnosis_date | symptom_profile | facility_healthcare_facility_id | facility_facility_code | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | CAS-2654 | 2023-10-26T21:51:00 | legacy-symptom-13 | 1 | 2933476 | Integrated Protocol A |
| 2 | CAS-2660 | 2024-03-10T04:08:00 | compact-symptom-14 | 2 | Bjuukia | Extended Programme |
| 3 | CAS-2666 | 2025-08-21T11:25:00 | composite-symptom-15 | 3 | 2106693 | Pilot Standard |
| 4 | CAS-2672 | 2022-01-05T18:42:00 | primary-symptom-16 | 4 | 6969439 | Baseline Framework D |

**View `clinical_case_pathogen_view`**

```sql
CREATE VIEW clinical_case_pathogen_view AS
SELECT a.id, a.case_i_d, a.diagnosis_date, a.symptom_profile, b.id AS pathogen_id, b.pathogen_code AS pathogen_pathogen_code, b.disease_name AS pathogen_disease_name
FROM clinical_cases a JOIN pathogens b ON a.pathogen_id = b.id;
```

| id | case_i_d | diagnosis_date | symptom_profile | pathogen_id | pathogen_pathogen_code | pathogen_disease_name |
|---|---|---|---|---|---|---|
| 1 | CAS-2654 | 2023-10-26T21:51:00 | legacy-symptom-13 | 1 | Dengue Virus | Regional Protocol |
| 2 | CAS-2660 | 2024-03-10T04:08:00 | compact-symptom-14 | 2 | Japanese Encephalitis Virus | Seasonal Programme D |
| 3 | CAS-2666 | 2025-08-21T11:25:00 | composite-symptom-15 | 3 | Dengue Virus | Integrated Standard |
| 4 | CAS-2672 | 2022-01-05T18:42:00 | primary-symptom-16 | 4 | Japanese Encephalitis Virus | Extended Framework |

**View `clinical_case_surveillance_site_view`**

```sql
CREATE VIEW clinical_case_surveillance_site_view AS
SELECT a.id, a.case_i_d, a.diagnosis_date, a.symptom_profile, b.surveillance_site_id AS site_surveillance_site_id, b.site_code AS site_site_code, b.district_name AS site_district_name
FROM clinical_cases a JOIN surveillance_sites b ON a.surveillance_site_id = b.surveillance_site_id;
```

| id | case_i_d | diagnosis_date | symptom_profile | site_surveillance_site_id | site_site_code | site_district_name |
|---|---|---|---|---|---|---|
| 1 | CAS-2654 | 2023-10-26T21:51:00 | legacy-symptom-13 | 1 | account_pymes_2935 | Extended Review |
| 2 | CAS-2660 | 2024-03-10T04:08:00 | compact-symptom-14 | 2 | 7731860 | Pilot Initiative A |
| 3 | CAS-2666 | 2025-08-21T11:25:00 | composite-symptom-15 | 3 | 1336176 | Baseline Model |
| 4 | CAS-2672 | 2022-01-05T18:42:00 | primary-symptom-16 | 4 | 10207160 | Distributed Cluster |

**View `healthcare_facility_surveillance_site_view`**

```sql
CREATE VIEW healthcare_facility_surveillance_site_view AS
SELECT a.healthcare_facility_id, a.facility_code, a.facility_name, a.facility_type, b.surveillance_site_id AS site_surveillance_site_id, b.site_code AS site_site_code, b.district_name AS site_district_name
FROM healthcare_facilities a JOIN surveillance_sites b ON a.surveillance_site_id = b.surveillance_site_id;
```

| healthcare_facility_id | facility_code | facility_name | facility_type | site_surveillance_site_id | site_site_code | site_district_name |
|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | Medical College | 1 | account_pymes_2935 | Extended Review |
| 2 | Bjuukia | Extended Programme | Zonal Hospital | 2 | 7731860 | Pilot Initiative A |
| 3 | 2106693 | Pilot Standard | Subregional Hospital | 3 | 1336176 | Baseline Model |
| 4 | 6969439 | Baseline Framework D | Tropical Hospital | 4 | 10207160 | Distributed Cluster |

**View `healthcare_facility_pathogen_view`**

```sql
CREATE VIEW healthcare_facility_pathogen_view AS
SELECT a.healthcare_facility_id, a.facility_code, a.facility_name, a.facility_type, b.id AS pathogen_id, b.pathogen_code AS pathogen_pathogen_code, b.disease_name AS pathogen_disease_name
FROM healthcare_facilities a JOIN pathogens b ON a.pathogen_id = b.id;
```

| healthcare_facility_id | facility_code | facility_name | facility_type | pathogen_id | pathogen_pathogen_code | pathogen_disease_name |
|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | Medical College | 1 | Dengue Virus | Regional Protocol |
| 2 | Bjuukia | Extended Programme | Zonal Hospital | 2 | Japanese Encephalitis Virus | Seasonal Programme D |
| 3 | 2106693 | Pilot Standard | Subregional Hospital | 3 | Dengue Virus | Integrated Standard |
| 4 | 6969439 | Baseline Framework D | Tropical Hospital | 4 | Japanese Encephalitis Virus | Extended Framework |

**View `healthcare_facility_healthcare_facility_view`**

```sql
CREATE VIEW healthcare_facility_healthcare_facility_view AS
SELECT a.healthcare_facility_id, a.facility_code, a.facility_name, a.facility_type, b.healthcare_facility_id AS facility_healthcare_facility_id, b.facility_code AS facility_facility_code, b.facility_name AS facility_facility_name
FROM healthcare_facilities a JOIN healthcare_facilities b ON a.receives_referrals_healthcare_facility_id = b.healthcare_facility_id;
```

| healthcare_facility_id | facility_code | facility_name | facility_type | facility_healthcare_facility_id | facility_facility_code | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | 2933476 | Integrated Protocol A | Medical College | 1 | 2933476 | Integrated Protocol A |
| 2 | Bjuukia | Extended Programme | Zonal Hospital | 2 | Bjuukia | Extended Programme |
| 3 | 2106693 | Pilot Standard | Subregional Hospital | 3 | 2106693 | Pilot Standard |
| 4 | 6969439 | Baseline Framework D | Tropical Hospital | 4 | 6969439 | Baseline Framework D |

**View `administrative_region_surveillance_site_detail_view`**

```sql
CREATE VIEW administrative_region_surveillance_site_detail_view AS
SELECT a.id, a.region_code, a.region_name, b.surveillance_site_id AS site_surveillance_site_id, b.site_code AS site_site_code, b.district_name AS site_district_name
FROM administrative_regions a
  JOIN regions_sites j ON j.administrative_region_id = a.id
  JOIN surveillance_sites b ON b.surveillance_site_id = j.surveillance_site_id;
```

| id | region_code | region_name | site_surveillance_site_id | site_site_code | site_district_name |
|---|---|---|---|---|---|
| 100 | 1562837 | Distributed Assessment | 1 | account_pymes_2935 | Extended Review |
| 100 | 1562837 | Distributed Assessment | 2 | 7731860 | Pilot Initiative A |
| 101 | 6564391 | Adaptive Survey D | 2 | 7731860 | Pilot Initiative A |
| 101 | 6564391 | Adaptive Survey D | 3 | 1336176 | Baseline Model |
| 102 | 778560 | Primary Corridor | 3 | 1336176 | Baseline Model |
| 102 | 778560 | Primary Corridor | 4 | 10207160 | Distributed Cluster |
| 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | 4 | 10207160 | Distributed Cluster |
| 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | 1 | account_pymes_2935 | Extended Review |

**View `administrative_region_health_authority_view`**

```sql
CREATE VIEW administrative_region_health_authority_view AS
SELECT a.id, a.region_code, a.region_name, a.region_level, b.id AS authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM administrative_regions a JOIN health_authorities b ON a.health_authority_id = b.id;
```

| id | region_code | region_name | region_level | authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 100 | 1562837 | Distributed Assessment | Country | 100 | 6926376 | Sean Green |
| 101 | 6564391 | Adaptive Survey D | District | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 102 | 778560 | Primary Corridor | Province | 102 | 9246326 | Kimberly Smith |
| 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | Country | 103 | 9085244 | Kimberly Smith |

**View `health_authority_administrative_region_view`**

```sql
CREATE VIEW health_authority_administrative_region_view AS
SELECT a.id, a.authority_code, a.authority_name, a.authority_type, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM health_authorities a JOIN administrative_regions b ON a.administrative_region_id = b.id;
```

| id | authority_code | authority_name | authority_type | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | National Council | 100 | 1562837 | Distributed Assessment |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | Department | 101 | 6564391 | Adaptive Survey D |
| 102 | 9246326 | Kimberly Smith | Ministry | 102 | 778560 | Primary Corridor |
| 103 | 9085244 | Kimberly Smith | WHO Office | 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

**View `health_authority_research_project_view`**

```sql
CREATE VIEW health_authority_research_project_view AS
SELECT a.id, a.authority_code, a.authority_name, a.authority_type, b.id AS project_id, b.project_code AS project_project_code, b.start_date AS project_start_date
FROM health_authorities a JOIN research_projects b ON a.research_project_id = b.id;
```

| id | authority_code | authority_name | authority_type | project_id | project_project_code | project_start_date |
|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | National Council | 1000 | IVC20det15 | 2022-09-05 |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | Department | 1001 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 |
| 102 | 9246326 | Kimberly Smith | Ministry | 1002 | 324 | 2024-07-27 |
| 103 | 9085244 | Kimberly Smith | WHO Office | 1003 | template_ivacode_pagata_20det50 | 2025-12-11 |

**View `research_project_administrative_region_view`**

```sql
CREATE VIEW research_project_administrative_region_view AS
SELECT a.id, a.project_code, a.start_date, a.end_date, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM research_projects a JOIN administrative_regions b ON a.administrative_region_id = b.id;
```

| id | project_code | start_date | end_date | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | IVC20det15 | 2022-09-05 | 2022-09-01 | 100 | 1562837 | Distributed Assessment |
| 1001 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | 101 | 6564391 | Adaptive Survey D |
| 1002 | 324 | 2024-07-27 | 2024-07-23 | 102 | 778560 | Primary Corridor |
| 1003 | template_ivacode_pagata_20det50 | 2025-12-11 | 2025-12-07 | 103 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

**View `research_project_health_authority_view`**

```sql
CREATE VIEW research_project_health_authority_view AS
SELECT a.id, a.project_code, a.start_date, a.end_date, b.id AS authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM research_projects a JOIN health_authorities b ON a.health_authority_id = b.id;
```

| id | project_code | start_date | end_date | authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 1000 | IVC20det15 | 2022-09-05 | 2022-09-01 | 100 | 6926376 | Sean Green |
| 1001 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 1002 | 324 | 2024-07-27 | 2024-07-23 | 102 | 9246326 | Kimberly Smith |
| 1003 | template_ivacode_pagata_20det50 | 2025-12-11 | 2025-12-07 | 103 | 9085244 | Kimberly Smith |

**View `research_project_pathogen_view`**

```sql
CREATE VIEW research_project_pathogen_view AS
SELECT a.id, a.project_code, a.start_date, a.end_date, b.id AS pathogen_id, b.pathogen_code AS pathogen_pathogen_code, b.disease_name AS pathogen_disease_name
FROM research_projects a JOIN pathogens b ON a.pathogen_id = b.id;
```

| id | project_code | start_date | end_date | pathogen_id | pathogen_pathogen_code | pathogen_disease_name |
|---|---|---|---|---|---|---|
| 1000 | IVC20det15 | 2022-09-05 | 2022-09-01 | 1 | Dengue Virus | Regional Protocol |
| 1001 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16 | 2023-02-12 | 2 | Japanese Encephalitis Virus | Seasonal Programme D |
| 1002 | 324 | 2024-07-27 | 2024-07-23 | 3 | Dengue Virus | Integrated Standard |
| 1003 | template_ivacode_pagata_20det50 | 2025-12-11 | 2025-12-07 | 4 | Japanese Encephalitis Virus | Extended Framework |
