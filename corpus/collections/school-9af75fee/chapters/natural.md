## Domain Overview: Educational Infrastructure and Connectivity Management

Educational institutions worldwide depend on a complex web of hardware procurement, network connectivity, and geographic distribution to deliver modern learning experiences. The records in this domain capture the full lifecycle of school technology deployments—from device acquisition through supplier contracts to active network service and geographic placement. Each school operates as a node within a broader infrastructure ecosystem, where the quality of connectivity, the type of devices deployed, and the reliability of suppliers directly influence educational outcomes. Understanding how these entities interrelate requires examining both the individual records and the composite views that join them into actionable intelligence.

**Table `schools`**

| id | school_id | name | country_code | latitude | longitude | enrollment_count | connectivity_status | device_id | country_id | connectivity_provider_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 13.95 | 21.20 | 26 | connected | 3744015 | 1000 | 1 |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 17.90 | 25.40 | 1 | unconnected | 392495 | 1001 | 2 |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 21.85 | 29.60 | 33 | partially_connected | 209205 | 1002 | 3 |
| 103 | 338514 | Distributed Cluster | 727045 | 25.80 | 33.80 | 15 | connected | 22106999 | 1003 | 4 |

The schools table forms the central registry of educational institutions within the managed infrastructure. Each entry carries a unique internal identifier alongside a human-readable school name, geographic coordinates, enrollment figures, and connectivity status. The school named "Extended Review" (identifier 1152671) sits at coordinates 13.95°N, 21.20°E with an enrollment of 26 students and is marked as fully connected. By contrast, "Pilot Initiative A" (identifier 1186099), located at 17.90°N, 25.40°E, reports only a single enrolled student and an unconnected status, indicating a deployment that has not yet achieved network integration. The "Baseline Model" school (7441154) at 21.85°N, 29.60°E serves 33 students and holds a partially connected status, suggesting an intermediate state between deployment and full operational readiness. Finally, "Distributed Cluster" (338514) at 25.80°N, 33.80°E, with 15 students, has achieved connected status. The connectivity_status field—taking values of connected, unconnected, or partially_connected—serves as the primary operational indicator for each institution.

**Table `educational_devices`**

| device_id | device_type | manufacturer | model_number | procurement_cost | specification_score | status | school_id | supplier_id |
|---|---|---|---|---|---|---|---|---|
| 3744015 | tablet | Standard Chartered | MOD-2238 | 2,996 | 7.20 | procured | 100 | 1 |
| 392495 | laptop | General Motors | MOD-2244 | 172,403 | 10.40 | distributed | 101 | 2 |
| 209205 | desktop | Column Name cannot be empty | MOD-2250 | 19.97 | 13.60 | deployed | 102 | 3 |
| 22106999 | chromebook | Financial Information Service Co. Ltd. | MOD-2256 | 261.79 | 16.80 | retired | 103 | 4 |

Educational devices represent the physical technology assets deployed within schools. The device registry tracks tablets, laptops, desktops, and chromebooks, each associated with a manufacturer, model number, procurement cost, and specification score. The tablet assigned to the first school (device 3744015) was procured from Standard Chartered at a cost of 2,996 with a specification score of 7.20 and holds a procured status. The laptop (392495) for the second school, manufactured by General Motors, carries a procurement cost of 172,403 and a specification score of 10.40, with a distributed status indicating it has been allocated to the school. The desktop (209205) from "Column Name cannot be empty" costs 19.97 with a specification score of 13.60 and is deployed. The chromebook (22106999) from Financial Information Service Co. Ltd. costs 261.79, scores 16.80 on specifications, and holds a retired status, suggesting it has been removed from active service. The specification_score field provides a normalized measure of device capability, while the status field—procured, distributed, deployed, or retired—tracks the device through its lifecycle stages.

**Table `connectivity_providers`**

| id | provider_id | name | service_type | max_bandwidth | data_allowance | contract_start_date | contract_end_date | school_id | country_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717633 | Extended Review | broadband | 13.95 | 14.20 | 2022-01-26T12:36:00 | 2025-12-07T23:09:00 | 100 | 1000 |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A | satellite | 16.90 | 17.40 | 2023-06-10T19:53:00 | 2022-05-18T06:26:00 | 101 | 1001 |
| 3 | 8928519 | Baseline Model | mobile | 19.85 | 20.60 | 2024-11-21T02:10:00 | 2023-10-02T13:43:00 | 102 | 1002 |
| 4 | lu_tax_code_template_m13 | Distributed Cluster | fiber | 22.80 | 23.80 | 2025-04-05T09:27:00 | 2024-03-13T20:00:00 | 103 | 1003 |

Connectivity providers supply the network services that enable schools to access digital resources. The provider registry records the service type, bandwidth capacity, data allowances, and contract periods for each school's connection. The provider serving the first school offers broadband service with a maximum bandwidth of 13.95 and a data allowance of 14.20, under a contract running from 2022-01-26 through 2025-12-07. The second school's satellite connection provides 16.90 bandwidth and 17.40 data allowance, contracted from 2023-06-10 to 2022-05-18. The third school's mobile service delivers 19.85 bandwidth and 20.60 data allowance, with a contract period spanning 2024-11-21 to 2023-10-02. The fourth school's fiber connection offers the highest bandwidth at 22.80 and data allowance at 23.80, contracted from 2025-04-05 to 2024-03-13. The service_type field distinguishes between broadband, satellite, mobile, and fiber connections, each with distinct performance characteristics and deployment considerations.

**Table `countries`**

| id | country_code | name | region | gdp_per_capita | internet_penetration | school_connectivity_rate | school_id | connectivity_provider_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | distributed-region-12 | 11.20 | 11.95 | 10.45 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A | baseline-region-13 | 13.40 | 15.90 | 13.90 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | default_chart_a_account_57 | Baseline Model | pilot-region-14 | 15.60 | 19.85 | 17.35 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | 727045 | Distributed Cluster | extended-region-15 | 17.80 | 23.80 | 20.80 | 103 | 4 | 2025-04-16 09:14:00 |

The countries table anchors each school within its geographic and economic context. It records national identifiers, regional classifications, gross domestic product per capita, internet penetration rates, and school connectivity rates. The country associated with the first school (identifier 1000) belongs to distributed-region-12, reports a GDP per capita of 11.20, an internet penetration of 11.95, and a school connectivity rate of 10.45. The second country (1001) in baseline-region-13 shows a GDP per capita of 13.40, internet penetration of 15.90, and school connectivity rate of 13.90. The third country (1002) in pilot-region-14 has a GDP per capita of 15.60, internet penetration of 19.85, and school connectivity rate of 17.35. The fourth country (1003) in extended-region-15 reports a GDP per capita of 17.80, internet penetration of 23.80, and school connectivity rate of 20.80. These metrics provide a macro-level view of the technological and economic environment in which each school operates.

**Table `suppliers`**

| id | supplier_id | name | country_of_origin | certification_level | market_share | contact_email | school_id | country_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Extended Review | compact-country-80 | basic | 7.45 | Christopher Wilson | 100 | 1000 |
| 2 | Hinduja Group | Pilot Initiative A | composite-country-81 | advanced | 10.90 | Charles Larsen | 101 | 1001 |
| 3 | Standard Chartered | Baseline Model | primary-country-82 | premium | 14.35 | Mary Alvarez | 102 | 1002 |
| 4 | Taito America Corporation | Distributed Cluster | adaptive-country-83 | basic | 17.80 | April Snyder | 103 | 1003 |

Suppliers represent the organizations responsible for procuring and delivering educational devices. The supplier registry captures the supplier name, country of origin, certification level, market share, and contact information. The first supplier, Feedback Ratings, originates from compact-country-80, holds a basic certification level, and commands a market share of 7.45, with Christopher Wilson listed as the contact. The second supplier, Hinduja Group, from composite-country-81, holds an advanced certification and a market share of 10.90, with Charles Larsen as contact. The third supplier, Standard Chartered, based in primary-country-82, carries a premium certification and a market share of 14.35, with Mary Alvarez as the contact person. The fourth supplier, Taito America Corporation, from adaptive-country-83, holds a basic certification and a market share of 17.80, with April Snyder as contact. The certification_level field—basic, advanced, or premium—indicates the supplier's qualification tier, while market_share provides a normalized measure of their presence in the procurement ecosystem.

## School-Device Relationships

The relationship between schools and their deployed devices is captured through a join that pairs each institution with its assigned hardware. This view answers the question of which device type and manufacturer each school currently operates, enabling infrastructure managers to assess hardware diversity and vendor distribution across the network.

**View `v_school_educational_device`**

```sql
CREATE VIEW v_school_educational_device AS
SELECT a.id, a.school_id, a.name, a.country_code, b.device_id AS device_device_id, b.device_type AS device_device_type, b.manufacturer AS device_manufacturer
FROM schools a JOIN educational_devices b ON a.device_id = b.device_id;
```

| id | school_id | name | country_code | device_device_id | device_device_type | device_manufacturer |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 3744015 | tablet | Standard Chartered |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 392495 | laptop | General Motors |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 209205 | desktop | Column Name cannot be empty |
| 103 | 338514 | Distributed Cluster | 727045 | 22106999 | chromebook | Financial Information Service Co. Ltd. |

In the joined result, the school "Extended Review" (id 100) is paired with a tablet manufactured by Standard Chartered (device 3744015). The school "Pilot Initiative A" (id 101) operates a laptop from General Motors (device 392495). The "Baseline Model" school (id 102) uses a desktop from "Column Name cannot be empty" (device 209205). Finally, "Distributed Cluster" (id 103) runs a chromebook from Financial Information Service Co. Ltd. (device 22106999). This pairing reveals a heterogeneous hardware landscape where no two schools share the same device type, suggesting a deliberate strategy of technology diversification across the deployment.

## School-Country Relationships

Placing schools within their national contexts requires joining the school registry with the countries table. This relationship answers the question of which geographic and economic environment each school inhabits, providing essential context for interpreting connectivity rates and infrastructure investment needs.

**View `v_school_country`**

```sql
CREATE VIEW v_school_country AS
SELECT a.id, a.school_id, a.name, a.country_code, b.id AS country_id, b.country_code AS country_country_code, b.name AS country_name
FROM schools a JOIN countries b ON a.country_id = b.id;
```

| id | school_id | name | country_code | country_id | country_country_code | country_name |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 1002 | default_chart_a_account_57 | Baseline Model |
| 103 | 338514 | Distributed Cluster | 727045 | 1003 | 727045 | Distributed Cluster |

The joined view shows that the school "Extended Review" (id 100) resides in country 1000, which belongs to distributed-region-12 and reports a school connectivity rate of 10.45. The school "Pilot Initiative A" (id 101) is located in country 1001 (baseline-region-13) with a connectivity rate of 13.90. The "Baseline Model" school (id 102) falls within country 1002 (pilot-region-14), where the connectivity rate reaches 17.35. The "Distributed Cluster" school (id 103) is situated in country 1003 (extended-region-15) with the highest connectivity rate of 20.80. The progression of connectivity rates across these countries correlates with increasing GDP per capita and internet penetration, suggesting that national economic development is a strong predictor of school-level connectivity achievement.

## School-Connectivity Provider Relationships

The connection between schools and their network service providers is essential for monitoring service quality and contract management. This join answers which provider serves each school, what service type is in use, and the performance parameters of the connection.

**View `v_school_connectivity_provider`**

```sql
CREATE VIEW v_school_connectivity_provider AS
SELECT a.id, a.school_id, a.name, a.country_code, b.id AS provider_id, b.provider_id AS provider_provider_id, b.name AS provider_name
FROM schools a JOIN connectivity_providers b ON a.connectivity_provider_id = b.id;
```

| id | school_id | name | country_code | provider_id | provider_provider_id | provider_name |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 3717633 | Extended Review |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 3 | 8928519 | Baseline Model |
| 103 | 338514 | Distributed Cluster | 727045 | 4 | lu_tax_code_template_m13 | Distributed Cluster |

The joined result reveals that school "Extended Review" (id 100) is served by provider 1, offering broadband service. School "Pilot Initiative A" (id 101) uses provider 2 with satellite service. The "Baseline Model" school (id 102) connects through provider 3 via mobile service. The "Distributed Cluster" school (id 103) relies on provider 4's fiber connection. The variety of service types—broadband, satellite, mobile, and fiber—reflects the diverse geographic and infrastructural conditions across the deployment area, with fiber providing the highest bandwidth and satellite serving as a fallback in areas lacking terrestrial infrastructure.

## Device-School Relationships

Reversing the perspective, the device-to-school join answers the question of which school each device is assigned to, providing a hardware-centric view of the deployment. This orientation is useful for inventory management, warranty tracking, and lifecycle planning.

**View `v_educational_device_school`**

```sql
CREATE VIEW v_educational_device_school AS
SELECT a.device_id, a.device_type, a.manufacturer, a.model_number, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM educational_devices a JOIN schools b ON a.school_id = b.id;
```

| device_id | device_type | manufacturer | model_number | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 3744015 | tablet | Standard Chartered | MOD-2238 | 100 | 1152671 | Extended Review |
| 392495 | laptop | General Motors | MOD-2244 | 101 | 1186099 | Pilot Initiative A |
| 209205 | desktop | Column Name cannot be empty | MOD-2250 | 102 | 7441154 | Baseline Model |
| 22106999 | chromebook | Financial Information Service Co. Ltd. | MOD-2256 | 103 | 338514 | Distributed Cluster |

In this orientation, device 3744015 (a tablet from Standard Chartered) is assigned to school "Extended Review" (id 100). Device 392495 (a laptop from General Motors) serves school "Pilot Initiative A" (id 101). Device 209205 (a desktop from "Column Name cannot be empty") is deployed at school "Baseline Model" (id 102). Device 22106999 (a chromebook from Financial Information Service Co. Ltd.) is associated with school "Distributed Cluster" (id 103). The one-to-one mapping between devices and schools in this dataset simplifies inventory tracking, though real-world deployments may involve multiple devices per school.

## Device-Supplier Relationships

The device-supplier join links each hardware asset to its procuring supplier, answering the question of which organization is responsible for each device. This relationship is critical for warranty claims, replacement orders, and supplier performance evaluation.

**View `v_educational_device_supplier`**

```sql
CREATE VIEW v_educational_device_supplier AS
SELECT a.device_id, a.device_type, a.manufacturer, a.model_number, b.id AS supplier_id, b.supplier_id AS supplier_supplier_id, b.name AS supplier_name
FROM educational_devices a JOIN suppliers b ON a.supplier_id = b.id;
```

| device_id | device_type | manufacturer | model_number | supplier_id | supplier_supplier_id | supplier_name |
|---|---|---|---|---|---|---|
| 3744015 | tablet | Standard Chartered | MOD-2238 | 1 | Feedback Ratings | Extended Review |
| 392495 | laptop | General Motors | MOD-2244 | 2 | Hinduja Group | Pilot Initiative A |
| 209205 | desktop | Column Name cannot be empty | MOD-2250 | 3 | Standard Chartered | Baseline Model |
| 22106999 | chromebook | Financial Information Service Co. Ltd. | MOD-2256 | 4 | Taito America Corporation | Distributed Cluster |

The joined view shows that device 3744015 (tablet) was supplied by supplier 1, Feedback Ratings. Device 392495 (laptop) came from supplier 2, Hinduja Group. Device 209205 (desktop) was provided by supplier 3, Standard Chartered. Device 22106999 (chromebook) was supplied by supplier 4, Taito America Corporation. Each device traces to a distinct supplier, enabling granular assessment of supplier performance based on device specification scores, procurement costs, and lifecycle outcomes.

## Connectivity Provider-School Relationships

The provider-to-school join provides a service-provider perspective on the network infrastructure, answering which schools each provider serves. This view supports capacity planning, service-level agreement monitoring, and provider performance benchmarking.

**View `v_connectivity_provider_school`**

```sql
CREATE VIEW v_connectivity_provider_school AS
SELECT a.id, a.provider_id, a.name, a.service_type, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM connectivity_providers a JOIN schools b ON a.school_id = b.id;
```

| id | provider_id | name | service_type | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1 | 3717633 | Extended Review | broadband | 100 | 1152671 | Extended Review |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A | satellite | 101 | 1186099 | Pilot Initiative A |
| 3 | 8928519 | Baseline Model | mobile | 102 | 7441154 | Baseline Model |
| 4 | lu_tax_code_template_m13 | Distributed Cluster | fiber | 103 | 338514 | Distributed Cluster |

Provider 1 serves school "Extended Review" (id 100) with broadband connectivity. Provider 2 serves school "Pilot Initiative A" (id 101) via satellite. Provider 3 connects to school "Baseline Model" (id 102) through mobile service. Provider 4 delivers fiber connectivity to school "Distributed Cluster" (id 103). The one-to-one provider-school mapping in this dataset indicates a dedicated service arrangement per school, which simplifies accountability but may limit economies of scale in bulk procurement.

## Connectivity Provider-Country Relationships

Linking connectivity providers to countries answers the question of which national markets each provider operates in, providing a geographic distribution analysis of network service coverage.

**View `v_connectivity_provider_country`**

```sql
CREATE VIEW v_connectivity_provider_country AS
SELECT a.id, a.provider_id, a.name, a.service_type, b.id AS country_id, b.country_code AS country_country_code, b.name AS country_name
FROM connectivity_providers a JOIN countries b ON a.country_id = b.id;
```

| id | provider_id | name | service_type | country_id | country_country_code | country_name |
|---|---|---|---|---|---|---|
| 1 | 3717633 | Extended Review | broadband | 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A | satellite | 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A |
| 3 | 8928519 | Baseline Model | mobile | 1002 | default_chart_a_account_57 | Baseline Model |
| 4 | lu_tax_code_template_m13 | Distributed Cluster | fiber | 1003 | 727045 | Distributed Cluster |

The joined result shows that provider 1 operates in country 1000 (distributed-region-12). Provider 2 serves country 1001 (baseline-region-13). Provider 3 is active in country 1002 (pilot-region-14). Provider 4 operates in country 1003 (extended-region-15). Each provider is associated with a single country in this dataset, suggesting a geographically segmented market structure where providers hold exclusive or primary rights within their assigned regions.

## Country-School Relationships

The country-to-school join reverses the school-country perspective, answering which schools exist within each national territory. This view supports regional planning, resource allocation, and policy development at the country level.

**View `v_country_school`**

```sql
CREATE VIEW v_country_school AS
SELECT a.id, a.country_code, a.name, a.region, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM countries a JOIN schools b ON a.school_id = b.id;
```

| id | country_code | name | region | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | distributed-region-12 | 100 | 1152671 | Extended Review |
| 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A | baseline-region-13 | 101 | 1186099 | Pilot Initiative A |
| 1002 | default_chart_a_account_57 | Baseline Model | pilot-region-14 | 102 | 7441154 | Baseline Model |
| 1003 | 727045 | Distributed Cluster | extended-region-15 | 103 | 338514 | Distributed Cluster |

Country 1000 contains school "Extended Review" (id 100). Country 1001 includes school "Pilot Initiative A" (id 101). Country 1002 encompasses school "Baseline Model" (id 102). Country 1003 houses school "Distributed Cluster" (id 103). Each country hosts a single school in this dataset, indicating a sampling design where each national context is represented by one institution. In a full deployment, countries would likely contain multiple schools, enabling within-country comparisons of connectivity performance and device utilization.

## Country-Connectivity Provider Relationships

The country-provider join answers which network service providers operate within each country, providing a market analysis of connectivity service availability and competition.

**View `v_country_connectivity_provider`**

```sql
CREATE VIEW v_country_connectivity_provider AS
SELECT a.id, a.country_code, a.name, a.region, b.id AS provider_id, b.provider_id AS provider_provider_id, b.name AS provider_name
FROM countries a JOIN connectivity_providers b ON a.connectivity_provider_id = b.id;
```

| id | country_code | name | region | provider_id | provider_provider_id | provider_name |
|---|---|---|---|---|---|---|
| 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | distributed-region-12 | 1 | 3717633 | Extended Review |
| 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A | baseline-region-13 | 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A |
| 1002 | default_chart_a_account_57 | Baseline Model | pilot-region-14 | 3 | 8928519 | Baseline Model |
| 1003 | 727045 | Distributed Cluster | extended-region-15 | 4 | lu_tax_code_template_m13 | Distributed Cluster |

Country 1000 is served by provider 1. Country 1001 relies on provider 2. Country 1002 is connected through provider 3. Country 1003 uses provider 4. The exclusive provider-country pairing in this dataset suggests either monopolistic market structures or a simplified representation where each country has a designated primary provider. In practice, countries may host multiple competing providers, and this view would need to accommodate many-to-many relationships.

## Supplier-School Relationships

The supplier-school join links each supplier to the schools they serve, answering which institutions benefit from each supplier's products. This relationship supports procurement strategy evaluation and supplier diversification analysis.

**View `v_supplier_school`**

```sql
CREATE VIEW v_supplier_school AS
SELECT a.id, a.supplier_id, a.name, a.country_of_origin, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM suppliers a JOIN schools b ON a.school_id = b.id;
```

| id | supplier_id | name | country_of_origin | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Extended Review | compact-country-80 | 100 | 1152671 | Extended Review |
| 2 | Hinduja Group | Pilot Initiative A | composite-country-81 | 101 | 1186099 | Pilot Initiative A |
| 3 | Standard Chartered | Baseline Model | primary-country-82 | 102 | 7441154 | Baseline Model |
| 4 | Taito America Corporation | Distributed Cluster | adaptive-country-83 | 103 | 338514 | Distributed Cluster |

Supplier 1 (Feedback Ratings) serves school "Extended Review" (id 100). Supplier 2 (Hinduja Group) supplies school "Pilot Initiative A" (id 101). Supplier 3 (Standard Chartered) provides to school "Baseline Model" (id 102). Supplier 4 (Taito America Corporation) serves school "Distributed Cluster" (id 103). The one-to-one supplier-school mapping indicates a dedicated procurement arrangement per school, which may reflect specialized requirements or regional sourcing preferences.

## Supplier-Country Relationships

The supplier-country join answers which national markets each supplier operates in, providing a geographic distribution analysis of the procurement ecosystem.

**View `v_supplier_country`**

```sql
CREATE VIEW v_supplier_country AS
SELECT a.id, a.supplier_id, a.name, a.country_of_origin, b.id AS country_id, b.country_code AS country_country_code, b.name AS country_name
FROM suppliers a JOIN countries b ON a.country_id = b.id;
```

| id | supplier_id | name | country_of_origin | country_id | country_country_code | country_name |
|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Extended Review | compact-country-80 | 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | Hinduja Group | Pilot Initiative A | composite-country-81 | 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A |
| 3 | Standard Chartered | Baseline Model | primary-country-82 | 1002 | default_chart_a_account_57 | Baseline Model |
| 4 | Taito America Corporation | Distributed Cluster | adaptive-country-83 | 1003 | 727045 | Distributed Cluster |

Supplier 1 (Feedback Ratings) operates in country 1000. Supplier 2 (Hinduja Group) serves country 1001. Supplier 3 (Standard Chartered) is active in country 1002. Supplier 4 (Taito America Corporation) operates in country 1003. Each supplier is associated with a single country in this dataset, suggesting a geographically segmented procurement model where suppliers hold primary or exclusive rights within their assigned markets. This structure simplifies supplier management but may limit competitive pressure and price optimization opportunities.

## Synthesis

The educational infrastructure domain presents a tightly interwoven ecosystem where schools, devices, connectivity providers, countries, and suppliers form a coherent operational network. Each entity carries measurable attributes—enrollment counts, specification scores, bandwidth capacities, GDP figures, and market shares—that enable quantitative assessment of the deployment's health and effectiveness. The views derived from joining these base tables answer distinct operational questions: which device serves which school, which provider connects which institution, which supplier delivered which asset, and how these relationships map onto national contexts. Together, the records and their composite views provide a comprehensive picture of the technology infrastructure supporting education, enabling data-driven decisions about procurement, connectivity investment, and regional development priorities.