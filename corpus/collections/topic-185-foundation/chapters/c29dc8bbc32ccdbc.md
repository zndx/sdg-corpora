---
chapter_id: c29dc8bbc32ccdbc
topic_id: 185
family: 07_long_tail
cited_terms: ['schemaorg_place_address', 'pci_dss_requirement', 'schemaorg_product_price', 'schemaorg_org_taxid', 'trace_supports_claim']
model: xai/grok-4.3
---

# Compliance Modeling for Merchant Information Entities

This chapter defines a minimal relational schema that materializes five OWL axioms drawn from artifact, directive, and process classes. The schema supports verification of postal addresses, PCI DSS requirements, prices, tax identifiers, and claim-supporting traces through equi-joins on identifier values. All column values are instances of the slot types declared in the axioms; primary keys are opaque identifiers, while cross-table references occur when the x or y column of one table contains the id value of another table.

## 1. Address Attachment for Artifacts

Axiom 1 (schemaorg_place_address) states that an artifact class is something that has postal address. Table t_schemaorg_place_address therefore records each attachment as a distinct row whose primary key is id. Column x references the artifact; column y references the address class. Joins are performed by matching y values against id values stored in other tables that also represent address-bearing artifacts.

```sql
CREATE TABLE t_schemaorg_place_address (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x          | y          |
|--------|------------|------------|
| addr1  | merchantA  | locGB      |
| addr2  | merchantB  | locUS      |
| addr3  | processorC | locDE      |
| addr4  | merchantA  | locNL      |
| addr5  | auditorD   | locGB      |

## 2. PCI DSS Requirement Attachment

Axiom 2 (pci_dss_requirement) states that a directive ICE is something that pci dss requirement. Table t_pci_dss_requirement captures each such attachment. Its primary key is id; x identifies the directive and y identifies the requirement class. A reader can join this table to t_schemaorg_place_address by testing whether any y value equals an address id, thereby retrieving the geographic context of a compliance directive.

```sql
CREATE TABLE t_pci_dss_requirement (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x           | y          |
|--------|-------------|------------|
| pci1   | dirStorage  | req12_3    |
| pci2   | dirNetwork  | req1_1     |
| pci3   | dirAccess   | req7_1     |
| pci4   | dirStorage  | req3_4     |
| pci5   | dirMonitor  | req10_2    |
| pci6   | dirNetwork  | req1_3     |

## 3. Price Attachment for Artifacts

Axiom 3 (schemaorg_product_price) states that an artifact is something that has price. Table t_schemaorg_product_price records each price declaration. Primary key id distinguishes the attachment; x names the artifact and y names the price class. Because x values may coincide with x values in t_schemaorg_place_address, a two-table join yields both price and address for the same artifact.

```sql
CREATE TABLE t_schemaorg_product_price (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x          | y       |
|--------|------------|---------|
| price1 | merchantA  | eur12_5 |
| price2 | merchantB  | usd9_99 |
| price3 | processorC | eur45_0 |
| price4 | merchantA  | eur8_0  |
| price5 | merchantB  | usd22_0 |

## 4. Tax Identifier Attachment for Artifacts

Axiom 4 (schemaorg_org_taxid) states that an artifact is something that has tax id. Table t_schemaorg_org_taxid stores each attachment. Its primary key is id; x identifies the artifact and y the tax identifier class. Joining on x with t_schemaorg_product_price produces the tax identifier that applies to a priced artifact.

```sql
CREATE TABLE t_schemaorg_org_taxid (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id    | x          | y          |
|-------|------------|------------|
| tax1  | merchantA  | gb123456 |
| tax2  | merchantB  | us987654 |
| tax3  | processorC | de456789 |
| tax4  | merchantA  | nl321987 |
| tax5  | auditorD   | gb654321 |

## 5. Trace Support for Descriptive Claims

Axiom 5 (trace_supports_claim) states that a process is something that supports claim descriptive information content entity. Table t_trace_supports_claim records each support assertion. Its sole non-key column x references the supporting process; the primary key is id. Because x values may equal id values from t_pci_dss_requirement, a join demonstrates which compliance directive is supported by a given trace.

```sql
CREATE TABLE t_trace_supports_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id     | x          |
|--------|------------|
| trace1 | pci1       |
| trace2 | pci3       |
| trace3 | pci2       |
| trace4 | pci5       |
| trace5 | pci4       |

## 6. Multi-Hop Query Example

To retrieve the price, tax identifier, and supporting trace for merchantA, first locate its address rows in t_schemaorg_place_address (addr1, addr4), then locate matching x rows in t_schemaorg_product_price (price1, price4) and t_schemaorg_org_taxid (tax1, tax4). Finally join those x values to t_trace_supports_claim via the pci rows that share the same merchant identifier. The resulting joined row set is:

- merchantA, addr1/locGB, price1/eur12_5, tax1/gb123456, trace1/pci1
- merchantA, addr4/locNL, price4/eur8_0, tax1/gb123456, trace5/pci4

```json
{"tables": [{"name": "t_schemaorg_place_address", "rows": [["addr1", "merchantA", "locGB"], ["addr2", "merchantB", "locUS"], ["addr3", "processorC", "locDE"], ["addr4", "merchantA", "locNL"], ["addr5", "auditorD", "locGB"]]}, {"name": "t_pci_dss_requirement", "rows": [["pci1", "dirStorage", "req12_3"], ["pci2", "dirNetwork", "req1_1"], ["pci3", "dirAccess", "req7_1"], ["pci4", "dirStorage", "req3_4"], ["pci5", "dirMonitor", "req10_2"], ["pci6", "dirNetwork", "req1_3"]]}, {"name": "t_schemaorg_product_price", "rows": [["price1", "merchantA", "eur12_5"], ["price2", "merchantB", "usd9_99"], ["price3", "processorC", "eur45_0"], ["price4", "merchantA", "eur8_0"], ["price5", "merchantB", "usd22_0"]]}, {"name": "t_schemaorg_org_taxid", "rows": [["tax1", "merchantA", "gb123456"], ["tax2", "merchantB", "us987654"], ["tax3", "processorC", "de456789"], ["tax4", "merchantA", "nl321987"], ["tax5", "auditorD", "gb654321"]]}, {"name": "t_trace_supports_claim", "rows": [["trace1", "pci1"], ["trace2", "pci3"], ["trace3", "pci2"], ["trace4", "pci5"], ["trace5", "pci4"]]}]}
```