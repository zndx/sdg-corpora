---
chapter_id: ch_live_mental_health_education_program_80c6c9
topic_id: 46
family: 08_derived
cited_terms: ['mental_health_education_program', 'schemaorg_person_named', 'ganglion_cyst_tissue_origin']
model: engine-refine
---

The anatomical classification of ganglion cysts relies on precise mapping between tissue origin sites and the connective tissue structures they inhabit. Each cyst origin is anchored to a specific anatomical landmark—sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment—before being nested within a broader connective tissue architecture such as the periosteal layer, joint capsule, deep fascia, or fibrous adventitia. This two-tiered structure, where a ganglion origin table feeds into a connective tissue structure table through a junction table, enforces referential integrity across the anatomical hierarchy. The junction table itself carries a triad of foreign keys: the ganglion identifier, the connective tissue structure identifier, and a role attribute that distinguishes whether the relationship is one of ownership, contribution, or review. For instance, the origin at ORIG-0007 is linked to ORIG-0001 with the role of reviewer, while ORIG-0002 connects to ORIG-0006 as an owner, establishing an audit trail for which anatomical classification carries authoritative weight.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

Parallel to this anatomical taxonomy, mental health education programs are catalogued through a comparable identification and targeting framework. Each program receives a unique identifier—PROG-0001 through PROG-0004—and is characterized by its title, the specific educational presentation it delivers, and the youth demographic it targets. The Youth Wellness Initiative, for example, appears across multiple program records (PROG-0001, PROG-0002, PROG-0004) yet delivers distinct presentations—Coping Skills Session, Understanding Anxiety Workshop, and Emotional Intelligence Talk—to different populations including Immigrant Adolescents, Foster Care Youths, and College Freshmen. The Sources of Strength program (PROG-0003) targets Athlete Communities with a Recognizing Depression Workshop. This design allows a single program title to branch into multiple delivery modes and audience segments without conflating the program identity with any particular presentation or demographic.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |

The Schema.org person-naming infrastructure operates on a similar principle of decoupled identification, where the canonical person entity is separated from its full-name representation and linked through an associative table that records the nature of the relationship. The person table stores normalized identifiers such as person/tim_berners_lee, person/alan_kay, person/alan_turing, and person/john_von_neumann, while the full-name table holds display names like Grace Hopper, Donald Knuth, and John von Neumann. The junction table t_schemaorg_person_named__full_name binds these together with a schemaorg_id pointing to the person entity, a full_name_id pointing to the name record, and a role attribute that specifies whether the relationship is one of ownership, observation, or review. Notably, NAME-0003 (person/alan_turing) is associated with NAME-0002 (Donald Knuth) in the role of owner, while NAME-0004 (person/john_von_neumann) is linked to NAME-0003 (John von Neumann) as an observer, illustrating that the same person entity can carry multiple name associations with distinct governance roles.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

Across all three domains, the structural pattern is consistent: a primary entity table provides a stable identifier and descriptive attributes, a secondary table captures a related classification or representation, and a junction table mediates the relationship with a role attribute that encodes provenance or authority. In the ganglion cyst domain, the junction table t_ganglion_cyst_tissue_origin__part_of connects tissue origins to connective tissue structures; in the mental health domain, the program table itself is self-contained but could be extended with a similar junction for multi-delivery programs; in the Schema.org domain, the person-to-name junction table explicitly records ownership and review relationships. This tripartite architecture ensures that identifiers remain stable across changes in classification, that relationships are auditable through role attributes, and that the data model supports both direct queries and complex joins across anatomical, educational, and semantic-web ontologies.