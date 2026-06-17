---
chapter_id: dbc09d7fddf85acc
topic_id: 120
family: 07_long_tail
cited_terms: ['schemaorg_place_address']
model: xai/grok-4.3
---

# Artifact-Address Relations in Site-Managed Laboratory Records

This chapter defines the subclass relation of an artifact to a postal address and shows how the relation is recorded in a minimal relational schema. The schema supports retrieval of address data for any artifact by direct key reference and by two-hop traversal through the linking table.

## 1. Core Ontological Relation

The axiom states that any individual of class X that is a subclass of cco:Artifact stands in the relation sdg:hasPostalAddress to an individual of class Y. The verbalization is therefore: X is something that has postal address Y. In the relational projection the link is stored once, with X and Y recorded as foreign references.

### 1.1 Table t_lab_artifact
The table holds instances of X. Its single-column primary key artifact_id is referenced by the linking table.

```sql
CREATE TABLE t_lab_artifact (
  artifact_id VARCHAR(255) PRIMARY KEY,
  label VARCHAR(255)
);
```

### 1.2 Table t_postal_address
The table holds instances of Y. Its single-column primary key address_id is referenced by the linking table.

```sql
CREATE TABLE t_postal_address (
  address_id VARCHAR(255) PRIMARY KEY,
  formatted VARCHAR(255)
);
```

### 1.3 Table t_schemaorg_place_address
The table embodies the axiom directly. Column id is the primary key of the assertion. Column x is a foreign key to t_lab_artifact.artifact_id. Column y is a foreign key to t_postal_address.address_id and is required.

```sql
CREATE TABLE t_schemaorg_place_address (
  id VARCHAR(255) PRIMARY KEY,
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  FOREIGN KEY (x) REFERENCES t_lab_artifact(artifact_id),
  FOREIGN KEY (y) REFERENCES t_postal_address(address_id)
);
```

## 2. Populated Instances

Four artifacts, four addresses, and four assertions are recorded.

t_lab_artifact  
artifact_id | label  
L-001 | North Wing Cold Store  
L-002 | Main Analytical Bench  
L-003 | Sample Receipt Bay  
L-004 | Archive Freezer Room  

t_postal_address  
address_id | formatted  
A-100 | 1845 Manchester Road, Chelmsford, MA 01824  
A-101 | 23 Analytical Drive, Manchester, UK M1 2AB  
A-102 | 7 Sample Lane, Chelmsford, MA 01824  
A-103 | 12 Archive Close, Manchester, UK M1 3CD  

t_schemaorg_place_address  
id | x | y  
PA-001 | L-001 | A-100  
PA-002 | L-002 | A-101  
PA-003 | L-003 | A-102  
PA-004 | L-004 | A-103  

## 3. Cross-Join Example

Question: what postal address is recorded for the artifact that holds sample S-4721?  
The answer is obtained by joining t_schemaorg_place_address on x to t_lab_artifact and on y to t_postal_address.

Joined row:  
artifact_id = L-002, label = Main Analytical Bench, address_id = A-101, formatted = 23 Analytical Drive, Manchester, UK M1 2AB

```json
{"tables": [{"name": "t_lab_artifact", "rows": [["L-001", "North Wing Cold Store"], ["L-002", "Main Analytical Bench"], ["L-003", "Sample Receipt Bay"], ["L-004", "Archive Freezer Room"]]}, {"name": "t_postal_address", "rows": [["A-100", "1845 Manchester Road, Chelmsford, MA 01824"], ["A-101", "23 Analytical Drive, Manchester, UK M1 2AB"], ["A-102", "7 Sample Lane, Chelmsford, MA 01824"], ["A-103", "12 Archive Close, Manchester, UK M1 3CD"]]}, {"name": "t_schemaorg_place_address", "rows": [["PA-001", "L-001", "A-100"], ["PA-002", "L-002", "A-101"], ["PA-003", "L-003", "A-102"], ["PA-004", "L-004", "A-103"]]}]}
```