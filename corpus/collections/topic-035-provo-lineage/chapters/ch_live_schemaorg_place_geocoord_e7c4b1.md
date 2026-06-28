---
chapter_id: ch_live_schemaorg_place_geocoord_e7c4b1
topic_id: 35
family: 07_long_tail
cited_terms: ['schemaorg_place_geocoord', 'requirement_satisfies', 'qualifications_framework']
model: engine-refine
---

In governed information architectures, the identifier constitutes the non-negotiable anchor through which every assertion remains traceable, auditable, and joinable across operational and analytical planes. Stable surrogate keys—whether denoted GEOC-0004 in a geospatial dimension, SATI-0003 in a compliance satisfaction registry, or FRAM-0002 within a qualifications framework—function not merely as row locators but as durable references that survive relabelling, version increments, and downstream federation. Where fact records such as schema.org artefacts carry version 8 alongside size_bytes of 998785819, the identifier persists as the invariant handle permitting reconciliation when physical representations change; size_bytes, by contrast, encodes material footprint as an evidentiary attribute of the artefact itself, signalling storage obligations, transfer costs, and retention-tier eligibility without collapsing identity into byte count.

**t_qualifications_framework**

| id | qualifications |
| --- | --- |
| FRAM-0001 | Master of Science Data |
| FRAM-0002 | National Vocational Qualification |
| FRAM-0003 | European Qualifications Framework |
| FRAM-0004 | Certified Public Accountant |
| FRAM-0005 | Professional Engineer License |
| FRAM-0006 | Graduate Certificate Cyber |

**t_qualifications_framework_specifies**

| id | specifies |
| --- | --- |
| FRAM-0001 | Advanced Practitioner |
| FRAM-0002 | EQF Level Three |
| FRAM-0003 | Advanced Practitioner |
| FRAM-0004 | NFQ Level Six |
| FRAM-0005 | Associate Degree |
| FRAM-0006 | Postgraduate Master |
| FRAM-0007 | Entry Level Technician |

Geo coordinates enter the domain as semantically typed spatial references whose operational meaning depends on disciplined dimensional modelling rather than on raw numeric tuples alone. A fact may reference geo_coordinates_key GEOC-0004 while sibling records point to GEOC-0006, establishing that spatial linkage is many-to-one against a conformed coordinate dimension where id GEOC-0004 carries geo_coordinates_label “Geo Coordinates Label 04” and geo_coordinates_category “Geo Coordinates Category 04.” Category partitions the coordinate universe into governance-relevant groupings—administrative, site-specific, regional grid, or other taxonomic slices—so that policy rules, access controls, and reporting cohorts can be applied uniformly; misc fields, exemplified by geo_coordinates_label, supply human-legible glosses that do not alter key integrity yet orient stewards during curation and incident response. The separation of identifier, category, and miscellaneous descriptor prevents the conflation of identity, classification, and presentation that otherwise undermines cross-dataset interoperability.

**dim_geo_coordinates**

| id | geo_coordinates_label | geo_coordinates_category |
| --- | --- | --- |
| GEOC-0001 | Geo Coordinates Label 01 | Geo Coordinates Category 01 |
| GEOC-0002 | Geo Coordinates Label 02 | Geo Coordinates Category 02 |
| GEOC-0003 | Geo Coordinates Label 03 | Geo Coordinates Category 03 |
| GEOC-0004 | Geo Coordinates Label 04 | Geo Coordinates Category 04 |
| GEOC-0005 | Geo Coordinates Label 05 | Geo Coordinates Category 05 |
| GEOC-0006 | Geo Coordinates Label 06 | Geo Coordinates Category 06 |

Compliance and control frameworks express obligation through requirement–satisfaction edges whose priority and scope jointly determine execution order and jurisdictional reach. When Audit Trail Mandate and ISO 27001 Annex A both register priority 5, they signal co-equal criticality relative to Encryption Standard AES-256 at priority 1, instructing implementers that foundational cryptographic controls must precede higher-numbered mandates in remediation backlogs only when explicit dependency graphs allow, not when numeric precedence is misread as severity inversion. Scope differentiates team-bound obligations—Data Retention Policy satisfied by Container Image Scan, or Encryption Standard satisfied by FIPS 140-2 Module—from regional mandates such as ISO 27001 Annex A addressed through WAF Rule Set, thereby constraining which organisational units may attest closure and which evidence artefacts suffice for external audit. Priority without scope yields globally ambiguous work queues; scope without priority yields locally correct yet strategically incoherent deployments.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | Data Masking Engine | 5 | team |
| SATI-0002 | Data Retention Policy | Container Image Scan | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | FIPS 140-2 Module | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WAF Rule Set | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | Backup Encryption Routine | 2 | team |
| SATI-0006 | Data Retention Policy | Vault Key Rotation | 1 | local |

Qualifications governance extends these relational principles into human-capital semantics through frameworks that specify qualificationlevel, articulate learningoutcome, and bind both to subjects via attributed roles. Qualificationlevel entries—Advanced Practitioner, EQF Level Three, NFQ Level Six—encode formally recognised attainment bands that align credentials such as Master of Science Data, National Vocational Qualification, European Qualifications Framework, and Certified Public Accountant to operational expectations; learningoutcome statements including Cloud Infrastructure Deployment, Agile Project Management, and Natural Language Processing translate credential abstraction into demonstrable capability targets suitable for workforce planning and control design. Junction semantics make subject explicit: qualifications_id FRAM-0004 linked to articulates_id FRAM-0001 under role observer denotes who holds accountable visibility over a given outcome mapping, while FRAM-0001 paired with FRAM-0003 under role owner assigns custodial authority distinct from reviewer or contributor capacities observed elsewhere in the graph.

**t_qualifications_framework_articulates**

| id | articulates |
| --- | --- |
| FRAM-0001 | Cloud Infrastructure Deployment |
| FRAM-0002 | Agile Project Management |
| FRAM-0003 | Natural Language Processing |
| FRAM-0004 | Natural Language Processing |
| FRAM-0005 | Machine Learning Model Training |
| FRAM-0006 | Cybersecurity Threat Modeling |

**t_qualifications_framework__articulates**

| id | qualifications_id | articulates_id | role |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0004 | FRAM-0001 | observer |
| FRAM-0002 | FRAM-0004 | FRAM-0001 | reviewer |
| FRAM-0003 | FRAM-0001 | FRAM-0003 | owner |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | observer |
| FRAM-0005 | FRAM-0006 | FRAM-0004 | reviewer |
| FRAM-0006 | FRAM-0003 | FRAM-0004 | owner |
| FRAM-0007 | FRAM-0004 | FRAM-0005 | reviewer |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | reviewer |

Cardinality_note exists precisely where many-to-many articulations and specifications risk silent duplication or orphan edges, recording interpretive constraints that pure foreign-key multiplicity cannot express. Notes labelled Cardinality Note 01 through Cardinality Note 04 accompany specifies relationships in which qualifications_id FRAM-0006 participates twice with distinct specifies_id targets FRAM-0006 and FRAM-0007, alerting modellers that a single framework subject may lawfully specify multiple levels only when each edge’s role—contributor versus owner—and documented cardinality interpretation align with framework rules. Without such annotation, stewards routinely over-normalise credentials into one-to-one level assignments or, conversely, permit unbounded fan-out that breaks equivalency mapping across jurisdictions. Role, in this layer, is therefore not decorative access control vocabulary but a typed edge attribute that qualifies whether an actor may assert, validate, observe, or merely contribute to a subject–target binding.

**t_qualifications_framework__specifies**

| id | qualifications_id | specifies_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| FRAM-0001 | FRAM-0006 | FRAM-0006 | contributor | Cardinality Note 01 |
| FRAM-0002 | FRAM-0006 | FRAM-0007 | owner | Cardinality Note 02 |
| FRAM-0003 | FRAM-0002 | FRAM-0001 | owner | Cardinality Note 03 |
| FRAM-0004 | FRAM-0004 | FRAM-0005 | reviewer | Cardinality Note 04 |
| FRAM-0005 | FRAM-0003 | FRAM-0007 | contributor | Cardinality Note 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0001 | reviewer | Cardinality Note 06 |
| FRAM-0007 | FRAM-0005 | FRAM-0007 | reviewer | Cardinality Note 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0007 | contributor | Cardinality Note 08 |

Taken together, identifier, category, geo coordinates, misc, priority, scope, size_bytes, subject, role, qualificationlevel, learningoutcome, and cardinality_note form an interlocking evidence grammar: identifiers stabilise reference; geo coordinates and categories situate artefacts; size_bytes and version ground material reality; priority and scope route compliance effort; subjects and roles govern who may bind qualifications to outcomes and levels; learningoutcome and qualificationlevel articulate human capability in auditable terms; and cardinality_note preserves intentional many-to-many semantics against schema drift. Practitioners who treat these elements as isolated columns rather than as mutually conditioning governance primitives will produce catalogues that join cleanly yet fail attestation—whereas architectures that weave the exemplar values above into operational policy inherit both the join integrity of dimensional design and the interpretive resilience required for regulated, multi-scope enterprises.

**fact_schemaorg**

| id | geo_coordinates_key | size_bytes | version |
| --- | --- | --- | --- |
| GEOC-0001 | GEOC-0004 | 895265030 | 3 |
| GEOC-0002 | GEOC-0006 | 114301972 | 5 |
| GEOC-0003 | GEOC-0004 | 338701831 | 4 |
| GEOC-0004 | GEOC-0004 | 998785819 | 8 |