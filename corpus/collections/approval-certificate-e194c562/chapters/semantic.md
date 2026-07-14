The domain of industrial product certification revolves around the formal relationship between manufacturing organizations, their engineered product models, and the regulatory approvals that authorize those models for deployment. A manufacturer produces a product model—characterized by its nominal pipe size, working pressure ratings, material composition, and dimensional standard compliance—and that model must be certified under an approval certificate issued by a recognized authority. The schema captures this ecosystem in a normalized relational form: five base tables hold the core entities, four junction tables resolve the many-to-many relationships that naturally arise when certificates cover multiple models and models can be certified under multiple certificates, and nine materialized views reassemble the normalized fragments into domain-meaningful projections.

## The Core Entities

The approval certificate is the regulatory anchor of the domain. Each certificate represents a formal authorization granted by an issuing organization to a specific manufacturer, with an audit trail of dates, revisions, and officer sign-offs.

**Table `approval_certificates`**

| id | approval_id | approval_standard | approval_granted_date | date_authorized | revision_request | issuing_organization | issuing_officer | issuing_officer_title | manufacturer_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 17629497 | primary-approval-10 | 2023-02-11T01:27:00 | 2024-11-16T10:30:00 | baseline-revision-97 | Alphabet Inc Class A | extended-issuing-21 | Regional Corridor | 1 |
| 101 | 3355765 | adaptive-approval-11 | 2024-07-22T08:44:00 | 2025-04-27T17:47:00 | pilot-revision-98 | ITT Industries | integrated-issuing-22 | Seasonal Series D | 2 |
| 102 | 18175211 | distributed-approval-12 | 2025-12-06T15:01:00 | 2022-09-11T00:04:00 | extended-revision-99 | Switch Card Services Ltd. | seasonal-issuing-23 | Integrated Assessment | 3 |
| 103 | 6564391 | baseline-approval-13 | 2022-05-17T22:18:00 | 2023-02-22T07:21:00 | integrated-revision-100 | Buypass AS | regional-issuing-24 | Extended Survey | 4 |

The table `approval_certificates` stores one row per authorization event. The surrogate key `id` (e.g. `100`, `101`, `102`, `103`) distinguishes certificate records internally, while `approval_id` (e.g. `17629497`, `3355765`) carries the external regulatory identifier. The column `approval_standard` classifies the authorization type—`primary-approval-10`, `adaptive-approval-11`, `distributed-approval-12`, `baseline-approval-13`—and `approval_granted_date` records when the certificate became effective. The `date_authorized` column captures the later administrative sign-off, `revision_request` tracks the revision lineage (e.g. `baseline-revision-97`, `pilot-revision-98`), and `issuing_organization` names the certifying body such as `Alphabet Inc Class A` or `ITT Industries`. The officer who issued the certificate is recorded in `issuing_officer` and `issuing_officer_title` (e.g. `Regional Corridor`, `Seasonal Series D`). Finally, `manufacturer_id` is a foreign key pointing to the `manufacturers` table, binding each certificate to its recipient organization.

The `manufacturers` table holds the legal and geographic identity of each producing organization.

**Table `manufacturers`**

| id | legal_name | address | city | postal_code | country |
|---|---|---|---|---|---|
| 1 | Adaptive Model | distributed-address-72 | integrated-city-34 | 9125611 | compact-country-26 |
| 2 | Primary Cluster | baseline-address-73 | seasonal-city-35 | ChIJt4hBkzhu5kcRJJDUNqGUpso | composite-country-27 |
| 3 | Composite Review D | pilot-address-74 | regional-city-36 | 3001009030200 | primary-country-28 |
| 4 | Compact Initiative | extended-address-75 | legacy-city-37 | 4060635 | adaptive-country-29 |

Each row in `manufacturers` is identified by `id` (values `1` through `4`) and carries `legal_name` (e.g. `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`), `address`, `city`, `postal_code`, and `country`. The country values are coded identifiers such as `compact-country-26` and `composite-country-27`. This table is the target of the `manufacturer_id` foreign key in `approval_certificates` and also participates in the `manufacturers_models` junction table.

The product model is the central engineered artifact. It encapsulates the technical specifications of a pipe or pressure-rated component and links to its regulatory and manufacturing provenance.

**Table `product_models`**

| product_model_id | model_number | product_description | nominal_pipe_size | rated_working_pressure_psi | rated_working_pressure_kpa | remarks | approval_certificate_id | manufacturer_id | material_specification_id | dimensional_standard_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | MOD-2238 | Baseline Initiative D | distributed-nominal-66 | 8.20 | 19.45 | composite-remarks-99 | 100 | 1 | 1000 | 1 |
| 101 | MOD-2244 | Distributed Model | baseline-nominal-67 | 10.40 | 23.90 | primary-remarks-100 | 101 | 2 | 1001 | 2 |
| 102 | MOD-2250 | Adaptive Cluster | pilot-nominal-68 | 12.60 | 28.35 | adaptive-remarks-101 | 102 | 3 | 1002 | 3 |
| 103 | MOD-2256 | Primary Review A | extended-nominal-69 | 14.80 | 32.80 | distributed-remarks-102 | 103 | 4 | 1003 | 4 |

The `product_models` table uses `product_model_id` as its surrogate key (values `100` through `103`). The `model_number` column (e.g. `MOD-2238`, `MOD-2244`, `MOD-2250`, `MOD-2256`) provides a human-readable identifier, while `product_description` gives a descriptive name such as `Baseline Initiative D` or `Distributed Model`. The technical attributes `nominal_pipe_size` (coded as `distributed-nominal-66`, `baseline-nominal-67`, etc.), `rated_working_pressure_psi` (e.g. `8.20`, `10.40`, `12.60`, `14.80`), and `rated_working_pressure_kpa` (e.g. `19.45`, `23.90`, `28.35`, `32.80`) define the pressure rating envelope. The `remarks` column carries free-form annotations like `composite-remarks-99`. Three foreign keys anchor the model to its regulatory and material context: `approval_certificate_id` points to `approval_certificates`, `manufacturer_id` points to `manufacturers`, `material_specification_id` points to `material_specifications`, and `dimensional_standard_id` points to `dimensional_standards`.

The material specification and dimensional standard tables provide the reference catalogs for the material and geometric constraints that product models must satisfy.

**Table `material_specifications`**

| id | material_type | service_application |
|---|---|---|
| 1000 | adaptive-material-71 | regional-service-30 |
| 1001 | distributed-material-72 | legacy-service-31 |
| 1002 | baseline-material-73 | compact-service-32 |
| 1003 | pilot-material-74 | composite-service-33 |

The `material_specifications` table defines the allowable material types and their service applications. Each row has `id` (e.g. `1000`, `1001`, `1002`, `1003`), `material_type` (e.g. `adaptive-material-71`, `distributed-material-72`), and `service_application` (e.g. `regional-service-30`, `legacy-service-31`). The `product_models.material_specification_id` foreign key references this table.

**Table `dimensional_standards`**

| dimensional_standard_id | standard_name | standard_version | pressure_rating_basis |
|---|---|---|---|
| 1 | Compact Framework | compact-standard-86 | IPS |
| 2 | Legacy Protocol | composite-standard-87 | DIPS |
| 3 | Regional Programme A | primary-standard-88 | IPS |
| 4 | Seasonal Standard | adaptive-standard-89 | DIPS |

The `dimensional_standards` table defines the geometric and pressure-rating frameworks. Each row has `dimensional_standard_id` (e.g. `1`, `2`, `3`, `4`), `standard_name` (e.g. `Compact Framework`, `Legacy Protocol`, `Regional Programme A`, `Seasonal Standard`), `standard_version`, and `pressure_rating_basis` (either `IPS` or `DIPS`). The `product_models.dimensional_standard_id` foreign key references this table.

## Resolving Many-to-Many Relationships

The schema employs four junction tables to resolve many-to-many relationships that the base entity tables cannot express through simple foreign keys. The `certificates_models` table links approval certificates to product models, allowing a single certificate to cover multiple models and a model to be certified under multiple certificates.

**Table `certificates_models`**

| approval_certificate_id | product_model_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `certificates_models` junction table contains pairs of `approval_certificate_id` and `product_model_id`. For example, certificate `100` covers models `100` and `101`; certificate `101` covers models `101` and `102`; certificate `102` covers models `102` and `103`; and certificate `103` covers models `103` and `100`. This creates a cyclic certification chain where each certificate overlaps with its neighbors.

The `manufacturers_models` junction table resolves the relationship between manufacturers and product models.

**Table `manufacturers_models`**

| manufacturer_id | product_model_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

This table links `manufacturer_id` to `product_model_id`, allowing a manufacturer to produce multiple models and a model to be attributed to multiple manufacturers.

The `specifications_models` junction table links material specifications to product models.

**Table `specifications_models`**

| material_specification_id | product_model_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

This table connects `material_specification_id` to `product_model_id`, enabling a material specification to be used across multiple models and a model to reference multiple material specifications.

The `standards_models` junction table links dimensional standards to product models.

**Table `standards_models`**

| dimensional_standard_id | product_model_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

This table connects `dimensional_standard_id` to `product_model_id`, enabling a dimensional standard to be applied across multiple models and a model to reference multiple dimensional standards.

## Materialized Views as Domain Projections

The nine views reconstruct normalized fragments into domain-meaningful projections, each answering a specific analytical question about the certification ecosystem.

The view `vw_approval_certificate_product_model_detail` joins approval certificates to their certified product models, producing a certificate-centric detail report.

**View `vw_approval_certificate_product_model_detail`**

```sql
CREATE VIEW vw_approval_certificate_product_model_detail AS
SELECT a.id, a.approval_id, a.approval_standard, b.product_model_id AS model_product_model_id, b.model_number AS model_model_number, b.product_description AS model_product_description
FROM approval_certificates a
  JOIN certificates_models j ON j.approval_certificate_id = a.id
  JOIN product_models b ON b.product_model_id = j.product_model_id;
```

| id | approval_id | approval_standard | model_product_model_id | model_model_number | model_product_description |
|---|---|---|---|---|---|
| 100 | 17629497 | primary-approval-10 | 100 | MOD-2238 | Baseline Initiative D |
| 100 | 17629497 | primary-approval-10 | 101 | MOD-2244 | Distributed Model |
| 101 | 3355765 | adaptive-approval-11 | 101 | MOD-2244 | Distributed Model |
| 101 | 3355765 | adaptive-approval-11 | 102 | MOD-2250 | Adaptive Cluster |
| 102 | 18175211 | distributed-approval-12 | 102 | MOD-2250 | Adaptive Cluster |
| 102 | 18175211 | distributed-approval-12 | 103 | MOD-2256 | Primary Review A |
| 103 | 6564391 | baseline-approval-13 | 103 | MOD-2256 | Primary Review A |
| 103 | 6564391 | baseline-approval-13 | 100 | MOD-2238 | Baseline Initiative D |

This view answers the question: "Which product models does a given approval certificate authorize?" Reading row `100` as evidence, certificate `100` (issued by `Alphabet Inc Class A` under standard `primary-approval-10`) covers model `MOD-2238` (`Baseline Initiative D`) with a rated working pressure of `8.20` psi. Row `101` shows certificate `100` also covers model `MOD-2244` (`Distributed Model`) at `10.40` psi. The join reconstructs the certificate-to-models relationship from `certificates_models`, demonstrating how the junction table materializes a many-to-many link into a flat, queryable projection.

The view `vw_approval_certificate_manufacturer` joins approval certificates to their issuing manufacturers.

**View `vw_approval_certificate_manufacturer`**

```sql
CREATE VIEW vw_approval_certificate_manufacturer AS
SELECT a.id, a.approval_id, a.approval_standard, a.approval_granted_date, b.id AS manufacturer_id, b.legal_name AS manufacturer_legal_name, b.address AS manufacturer_address
FROM approval_certificates a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| id | approval_id | approval_standard | approval_granted_date | manufacturer_id | manufacturer_legal_name | manufacturer_address |
|---|---|---|---|---|---|---|
| 100 | 17629497 | primary-approval-10 | 2023-02-11T01:27:00 | 1 | Adaptive Model | distributed-address-72 |
| 101 | 3355765 | adaptive-approval-11 | 2024-07-22T08:44:00 | 2 | Primary Cluster | baseline-address-73 |
| 102 | 18175211 | distributed-approval-12 | 2025-12-06T15:01:00 | 3 | Composite Review D | pilot-address-74 |
| 103 | 6564391 | baseline-approval-13 | 2022-05-17T22:18:00 | 4 | Compact Initiative | extended-address-75 |

This view answers: "Which manufacturer holds a given approval certificate?" Row `100` shows certificate `100` (standard `primary-approval-10`, issued by `Alphabet Inc Class A`) is held by manufacturer `Adaptive Model` (id `1`). Row `101` shows certificate `101` (standard `adaptive-approval-11`, issued by `ITT Industries`) is held by manufacturer `Primary Cluster` (id `2`). The join between `approval_certificates` and `manufacturers` on `manufacturer_id` reconstructs the certificate-to-manufacturer relationship that is stored as a single foreign key in the base table.

The view `vw_manufacturer_product_model_detail` joins manufacturers to their product models.

**View `vw_manufacturer_product_model_detail`**

```sql
CREATE VIEW vw_manufacturer_product_model_detail AS
SELECT a.id, a.legal_name, a.address, b.product_model_id AS model_product_model_id, b.model_number AS model_model_number, b.product_description AS model_product_description
FROM manufacturers a
  JOIN manufacturers_models j ON j.manufacturer_id = a.id
  JOIN product_models b ON b.product_model_id = j.product_model_id;
```

| id | legal_name | address | model_product_model_id | model_model_number | model_product_description |
|---|---|---|---|---|---|
| 1 | Adaptive Model | distributed-address-72 | 100 | MOD-2238 | Baseline Initiative D |
| 1 | Adaptive Model | distributed-address-72 | 101 | MOD-2244 | Distributed Model |
| 2 | Primary Cluster | baseline-address-73 | 101 | MOD-2244 | Distributed Model |
| 2 | Primary Cluster | baseline-address-73 | 102 | MOD-2250 | Adaptive Cluster |
| 3 | Composite Review D | pilot-address-74 | 102 | MOD-2250 | Adaptive Cluster |
| 3 | Composite Review D | pilot-address-74 | 103 | MOD-2256 | Primary Review A |
| 4 | Compact Initiative | extended-address-75 | 103 | MOD-2256 | Primary Review A |
| 4 | Compact Initiative | extended-address-75 | 100 | MOD-2238 | Baseline Initiative D |

This view answers: "What product models does a given manufacturer produce?" Row `100` shows manufacturer `Adaptive Model` (id `1`) produces model `MOD-2238` (`Baseline Initiative D`) with nominal pipe size `distributed-nominal-66` and rated working pressure `8.20` psi. Row `101` shows manufacturer `Primary Cluster` (id `2`) produces model `MOD-2244` (`Distributed Model`) at `10.40` psi. The join reconstructs the manufacturer-to-models relationship from the `manufacturers_models` junction table, demonstrating how the schema separates the manufacturing attribution from the product model's own `manufacturer_id` foreign key to allow multiple attribution paths.

The view `vw_product_model_approval_certificate` joins product models to their approving certificates.

**View `vw_product_model_approval_certificate`**

```sql
CREATE VIEW vw_product_model_approval_certificate AS
SELECT a.product_model_id, a.model_number, a.product_description, a.nominal_pipe_size, b.id AS certificate_id, b.approval_id AS certificate_approval_id, b.approval_standard AS certificate_approval_standard
FROM product_models a JOIN approval_certificates b ON a.approval_certificate_id = b.id;
```

| product_model_id | model_number | product_description | nominal_pipe_size | certificate_id | certificate_approval_id | certificate_approval_standard |
|---|---|---|---|---|---|---|
| 100 | MOD-2238 | Baseline Initiative D | distributed-nominal-66 | 100 | 17629497 | primary-approval-10 |
| 101 | MOD-2244 | Distributed Model | baseline-nominal-67 | 101 | 3355765 | adaptive-approval-11 |
| 102 | MOD-2250 | Adaptive Cluster | pilot-nominal-68 | 102 | 18175211 | distributed-approval-12 |
| 103 | MOD-2256 | Primary Review A | extended-nominal-69 | 103 | 6564391 | baseline-approval-13 |

This view answers: "Which approval certificate authorizes a given product model?" Row `100` shows model `MOD-2238` (`Baseline Initiative D`) is certified under certificate `100` (standard `primary-approval-10`, issued by `Alphabet Inc Class A`). Row `101` shows model `MOD-2244` (`Distributed Model`) is certified under certificate `101` (standard `adaptive-approval-11`, issued by `ITT Industries`). The join reconstructs the model-to-certificate relationship from the `certificates_models` junction table, providing the inverse perspective of `vw_approval_certificate_product_model_detail`.

The view `vw_product_model_manufacturer` joins product models to their manufacturers.

**View `vw_product_model_manufacturer`**

```sql
CREATE VIEW vw_product_model_manufacturer AS
SELECT a.product_model_id, a.model_number, a.product_description, a.nominal_pipe_size, b.id AS manufacturer_id, b.legal_name AS manufacturer_legal_name, b.address AS manufacturer_address
FROM product_models a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| product_model_id | model_number | product_description | nominal_pipe_size | manufacturer_id | manufacturer_legal_name | manufacturer_address |
|---|---|---|---|---|---|---|
| 100 | MOD-2238 | Baseline Initiative D | distributed-nominal-66 | 1 | Adaptive Model | distributed-address-72 |
| 101 | MOD-2244 | Distributed Model | baseline-nominal-67 | 2 | Primary Cluster | baseline-address-73 |
| 102 | MOD-2250 | Adaptive Cluster | pilot-nominal-68 | 3 | Composite Review D | pilot-address-74 |
| 103 | MOD-2256 | Primary Review A | extended-nominal-69 | 4 | Compact Initiative | extended-address-75 |

This view answers: "Which manufacturer produces a given product model?" Row `100` shows model `MOD-2238` (`Baseline Initiative D`) is produced by `Adaptive Model` (id `1`). Row `101` shows model `MOD-2244` (`Distributed Model`) is produced by `Primary Cluster` (id `2`). The join reconstructs the model-to-manufacturer relationship from the `manufacturers_models` junction table, providing the inverse perspective of `vw_manufacturer_product_model_detail`.

The view `vw_product_model_material_specification` joins product models to their material specifications.

**View `vw_product_model_material_specification`**

```sql
CREATE VIEW vw_product_model_material_specification AS
SELECT a.product_model_id, a.model_number, a.product_description, a.nominal_pipe_size, b.id AS specification_id, b.material_type AS specification_material_type, b.service_application AS specification_service_application
FROM product_models a JOIN material_specifications b ON a.material_specification_id = b.id;
```

| product_model_id | model_number | product_description | nominal_pipe_size | specification_id | specification_material_type | specification_service_application |
|---|---|---|---|---|---|---|
| 100 | MOD-2238 | Baseline Initiative D | distributed-nominal-66 | 1000 | adaptive-material-71 | regional-service-30 |
| 101 | MOD-2244 | Distributed Model | baseline-nominal-67 | 1001 | distributed-material-72 | legacy-service-31 |
| 102 | MOD-2250 | Adaptive Cluster | pilot-nominal-68 | 1002 | baseline-material-73 | compact-service-32 |
| 103 | MOD-2256 | Primary Review A | extended-nominal-69 | 1003 | pilot-material-74 | composite-service-33 |

This view answers: "What material specification does a given product model use?" Row `100` shows model `MOD-2238` (`Baseline Initiative D`) uses material specification `adaptive-material-71` for service application `regional-service-30`. Row `101` shows model `MOD-2244` (`Distributed Model`) uses material specification `distributed-material-72` for service application `legacy-service-31`. The join reconstructs the model-to-material relationship from the `specifications_models` junction table, providing the inverse perspective of the base table's `material_specification_id` foreign key.

The view `vw_product_model_dimensional_standard` joins product models to their dimensional standards.

**View `vw_product_model_dimensional_standard`**

```sql
CREATE VIEW vw_product_model_dimensional_standard AS
SELECT a.product_model_id, a.model_number, a.product_description, a.nominal_pipe_size, b.dimensional_standard_id AS standard_dimensional_standard_id, b.standard_name AS standard_standard_name, b.standard_version AS standard_standard_version
FROM product_models a JOIN dimensional_standards b ON a.dimensional_standard_id = b.dimensional_standard_id;
```

| product_model_id | model_number | product_description | nominal_pipe_size | standard_dimensional_standard_id | standard_standard_name | standard_standard_version |
|---|---|---|---|---|---|---|
| 100 | MOD-2238 | Baseline Initiative D | distributed-nominal-66 | 1 | Compact Framework | compact-standard-86 |
| 101 | MOD-2244 | Distributed Model | baseline-nominal-67 | 2 | Legacy Protocol | composite-standard-87 |
| 102 | MOD-2250 | Adaptive Cluster | pilot-nominal-68 | 3 | Regional Programme A | primary-standard-88 |
| 103 | MOD-2256 | Primary Review A | extended-nominal-69 | 4 | Seasonal Standard | adaptive-standard-89 |

This view answers: "Which dimensional standard governs a given product model?" Row `100` shows model `MOD-2238` (`Baseline Initiative D`) is governed by standard `Compact Framework` (version `compact-standard-86`) with pressure rating basis `IPS`. Row `101` shows model `MOD-2244` (`Distributed Model`) is governed by standard `Legacy Protocol` (version `composite-standard-87`) with pressure rating basis `DIPS`. The join reconstructs the model-to-standard relationship from the `standards_models` junction table, providing the inverse perspective of the base table's `dimensional_standard_id` foreign key.

The view `vw_material_specification_product_model_detail` joins material specifications to their product models.

**View `vw_material_specification_product_model_detail`**

```sql
CREATE VIEW vw_material_specification_product_model_detail AS
SELECT a.id, a.material_type, a.service_application, b.product_model_id AS model_product_model_id, b.model_number AS model_model_number, b.product_description AS model_product_description
FROM material_specifications a
  JOIN specifications_models j ON j.material_specification_id = a.id
  JOIN product_models b ON b.product_model_id = j.product_model_id;
```

| id | material_type | service_application | model_product_model_id | model_model_number | model_product_description |
|---|---|---|---|---|---|
| 1000 | adaptive-material-71 | regional-service-30 | 100 | MOD-2238 | Baseline Initiative D |
| 1000 | adaptive-material-71 | regional-service-30 | 101 | MOD-2244 | Distributed Model |
| 1001 | distributed-material-72 | legacy-service-31 | 101 | MOD-2244 | Distributed Model |
| 1001 | distributed-material-72 | legacy-service-31 | 102 | MOD-2250 | Adaptive Cluster |
| 1002 | baseline-material-73 | compact-service-32 | 102 | MOD-2250 | Adaptive Cluster |
| 1002 | baseline-material-73 | compact-service-32 | 103 | MOD-2256 | Primary Review A |
| 1003 | pilot-material-74 | composite-service-33 | 103 | MOD-2256 | Primary Review A |
| 1003 | pilot-material-74 | composite-service-33 | 100 | MOD-2238 | Baseline Initiative D |

This view answers: "Which product models use a given material specification?" Row `100` shows material specification `adaptive-material-71` (service application `regional-service-30`) is used by model `MOD-2238` (`Baseline Initiative D`) with rated working pressure `8.20` psi. Row `101` shows material specification `distributed-material-72` (service application `legacy-service-31`) is used by model `MOD-2244` (`Distributed Model`) at `10.40` psi. The join reconstructs the material-to-models relationship from the `specifications_models` junction table, providing a material-centric detail report.

The view `vw_dimensional_standard_product_model_detail` joins dimensional standards to their product models.

**View `vw_dimensional_standard_product_model_detail`**

```sql
CREATE VIEW vw_dimensional_standard_product_model_detail AS
SELECT a.dimensional_standard_id, a.standard_name, a.standard_version, b.product_model_id AS model_product_model_id, b.model_number AS model_model_number, b.product_description AS model_product_description
FROM dimensional_standards a
  JOIN standards_models j ON j.dimensional_standard_id = a.dimensional_standard_id
  JOIN product_models b ON b.product_model_id = j.product_model_id;
```

| dimensional_standard_id | standard_name | standard_version | model_product_model_id | model_model_number | model_product_description |
|---|---|---|---|---|---|
| 1 | Compact Framework | compact-standard-86 | 100 | MOD-2238 | Baseline Initiative D |
| 1 | Compact Framework | compact-standard-86 | 101 | MOD-2244 | Distributed Model |
| 2 | Legacy Protocol | composite-standard-87 | 101 | MOD-2244 | Distributed Model |
| 2 | Legacy Protocol | composite-standard-87 | 102 | MOD-2250 | Adaptive Cluster |
| 3 | Regional Programme A | primary-standard-88 | 102 | MOD-2250 | Adaptive Cluster |
| 3 | Regional Programme A | primary-standard-88 | 103 | MOD-2256 | Primary Review A |
| 4 | Seasonal Standard | adaptive-standard-89 | 103 | MOD-2256 | Primary Review A |
| 4 | Seasonal Standard | adaptive-standard-89 | 100 | MOD-2238 | Baseline Initiative D |

This view answers: "Which product models are governed by a given dimensional standard?" Row `100` shows standard `Compact Framework` (basis `IPS`) governs model `MOD-2238` (`Baseline Initiative D`) with nominal pipe size `distributed-nominal-66`. Row `101` shows standard `Legacy Protocol` (basis `DIPS`) governs model `MOD-2244` (`Distributed Model`) at nominal size `baseline-nominal-67`. The join reconstructs the standard-to-models relationship from the `standards_models` junction table, providing a standard-centric detail report.

## Synthesis

The schema models the industrial certification domain through five base entity tables, four junction tables, and nine materialized views. The base tables capture the core entities—certificates, manufacturers, product models, material specifications, and dimensional standards—with their attributes as columns and their one-to-many relationships as foreign keys. The junction tables resolve the many-to-many relationships that arise when certificates cover multiple models, manufacturers produce multiple models, and models reference multiple material specifications and dimensional standards. The views materialize the most common analytical queries by joining the normalized tables back together, each view answering a specific domain question from a particular entity-centric perspective. The result is a schema that is both normalized for data integrity and richly queryable through its view layer, faithfully representing the certification ecosystem where `Alphabet Inc Class A` certifies `Adaptive Model`'s `MOD-2238` under standard `primary-approval-10` with material `adaptive-material-71` and dimensional standard `Compact Framework`.