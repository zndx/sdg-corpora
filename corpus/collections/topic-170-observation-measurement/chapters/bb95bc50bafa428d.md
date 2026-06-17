---
chapter_id: bb95bc50bafa428d
topic_id: 170
family: 07_long_tail
cited_terms: ['schemaorg_place_address', 'schemaorg_place_geocoord', 'schemaorg_place_latitude', 'schemaorg_org_taxid', 'schemaorg_place_longitude']
model: xai/grok-4.3
---

# Ontological Modeling of Artifact Locations and Identifiers

This chapter presents five deterministic relational projections of OWL axioms that attach postal addresses, geographic coordinates, and tax identifiers to artifacts. The resulting schema supports multi-table joins that recover compound facts such as the tax identifier of an organization whose primary facility lies at a stated latitude and longitude.

## 1 Schema Overview

The five tables are direct renderings of the supplied Manchester axioms. Each table contains an opaque surrogate identifier (primary key), a subject reference (x), and a value reference (y). Cross-table queries are formed by equating x values that denote the same artifact or by chaining y values that denote related location descriptors.

### 1.1 Postal Address Attachment

Table t_schemaorg_place_address embodies the axiom that an artifact may be linked to a postal address class. Column id is the primary key; columns x and y are foreign-key references to artifact and address individuals, respectively.

| id | x | y |
| id | x | y |
|----|----|----|
| addr1 | ManufacturingFacilityA | PostalAddress1 |
| addr2 | DistributionCenterB | PostalAddress2 |
| addr3 | QualityControlLabC | PostalAddress3 |
| addr4 | HeadquartersD | PostalAddress4 |
| addr5 | WarehouseE | PostalAddress5 |

### 1.2 Geographic Coordinate Attachment

Table t_schemaorg_place_geocoord embodies the axiom that an artifact may be linked to a geo-coordinate class. Column id is the primary key; x references the artifact and y references the coordinate individual.

| id | x | y |
|----|----|----|
| geo1 | ManufacturingFacilityA | GeoCoord1 |
| geo2 | DistributionCenterB | GeoCoord2 |
| geo3 | QualityControlLabC | GeoCoord3 |
| geo4 | HeadquartersD | GeoCoord4 |

### 1.3 Latitude Attachment

Table t_schemaorg_place_latitude embodies the axiom that an artifact may be linked to a latitude class. Column id is the primary key; x references the artifact and y references the latitude individual.

| id | x | y |
|----|----|----|
| lat1 | ManufacturingFacilityA | Latitude40N |
| lat2 | DistributionCenterB | Latitude35N |
| lat3 | QualityControlLabC | Latitude42N |
| lat4 | HeadquartersD | Latitude38N |
| lat5 | WarehouseE | Latitude37N |

### 1.4 Tax Identifier Attachment

Table t_schemaorg_org_taxid embodies the axiom that an artifact may be linked to a tax identifier class. Column id is the primary key; x references the organization artifact and y references the tax identifier individual.

| id | x | y |
|----|----|----|
| tax1 | MedTechCorp | TaxID123456789 |
| tax2 | SupplyPartnerF | TaxID987654321 |
| tax3 | LogisticsIncG | TaxID456789123 |
| tax4 | CalibrationSvcH | TaxID321654987 |

### 1.5 Longitude Attachment

Table t_schemaorg_place_longitude embodies the axiom that an artifact may be linked to a longitude class. Column id is the primary key; x references the artifact and y references the longitude individual.

| id | x | y |
|----|----|----|
| lon1 | ManufacturingFacilityA | Longitude74W |
| lon2 | DistributionCenterB | Longitude80W |
| lon3 | QualityControlLabC | Longitude71W |
| lon4 | HeadquartersD | Longitude77W |
| lon5 | WarehouseE | Longitude75W |

## 2 Cross-Table Query Example

To recover the tax identifier of the organization whose manufacturing facility is situated at latitude Latitude40N and longitude Longitude74W, first locate the artifact that satisfies both coordinate tables, then join to the tax table on the same artifact:

- t_schemaorg_place_latitude.x = ManufacturingFacilityA (row lat1)  
- t_schemaorg_place_longitude.x = ManufacturingFacilityA (row lon1)  
- t_schemaorg_org_taxid.x = ManufacturingFacilityA (row tax1)  

The joined result yields the single row (ManufacturingFacilityA, Latitude40N, Longitude74W, TaxID123456789).

```json
{"tables": [{"name": "t_schemaorg_place_address", "rows": [["addr1", "ManufacturingFacilityA", "PostalAddress1"], ["addr2", "DistributionCenterB", "PostalAddress2"], ["addr3", "QualityControlLabC", "PostalAddress3"], ["addr4", "HeadquartersD", "PostalAddress4"], ["addr5", "WarehouseE", "PostalAddress5"]]}, {"name": "t_schemaorg_place_geocoord", "rows": [["geo1", "ManufacturingFacilityA", "GeoCoord1"], ["geo2", "DistributionCenterB", "GeoCoord2"], ["geo3", "QualityControlLabC", "GeoCoord3"], ["geo4", "HeadquartersD", "GeoCoord4"]]}, {"name": "t_schemaorg_place_latitude", "rows": [["lat1", "ManufacturingFacilityA", "Latitude40N"], ["lat2", "DistributionCenterB", "Latitude35N"], ["lat3", "QualityControlLabC", "Latitude42N"], ["lat4", "HeadquartersD", "Latitude38N"], ["lat5", "WarehouseE", "Latitude37N"]]}, {"name": "t_schemaorg_org_taxid", "rows": [["tax1", "MedTechCorp", "TaxID123456789"], ["tax2", "SupplyPartnerF", "TaxID987654321"], ["tax3", "LogisticsIncG", "TaxID456789123"], ["tax4", "CalibrationSvcH", "TaxID321654987"]]}, {"name": "t_schemaorg_place_longitude", "rows": [["lon1", "ManufacturingFacilityA", "Longitude74W"], ["lon2", "DistributionCenterB", "Longitude80W"], ["lon3", "QualityControlLabC", "Longitude71W"], ["lon4", "HeadquartersD", "Longitude77W"], ["lon5", "WarehouseE", "Longitude75W"]]}]}
```