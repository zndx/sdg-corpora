---
chapter_id: ch_live_schema_version_subclass_e8da02
topic_id: 186
family: 07_long_tail
cited_terms: ['schema_version_subclass', 'indoor_air_quality_action_plan', 'farmland_acquisition_process']
model: engine-refine
---

Institutional land stewardship and occupant health governance both depend on the same underlying design: every governed object is an **entity** carrying a stable **identifier**, described through typed **attributes** whose **attribute types** prescribe how values may be recorded and validated. An agricultural land parcel such as Parcel 44B North or Willow Creek Tract 7 is not merely a geospatial boundary; it is an entity that enters compliance workflows when linked to a farmland acquisition process. Black Soil Expansion Deal and Central Valley Irrigation Rights name concrete processes that bind institutional investors—PensionsPlus Land Trust, Norges Bank Investment, Blackstone Real Estate Income—to specific parcels under due-diligence, title, and environmental review. The identifier PROC-0001 or PLAN-0003 is what permits auditors, counsel, and operations staff to reference the same record across systems without ambiguity, and what allows downstream reporting to join process steps, investor mandates, and land characteristics into a single evidentiary chain.

**t_farmland_acquisition_process**

| id | farmland_acquisition_process | targets_investor | acquires_land |
| --- | --- | --- | --- |
| PROC-0001 | Black Soil Expansion Deal | Asbestos Fibers | Parcel 44B North |
| PROC-0002 | Appalachian Ridge Timberland Swap | PensionsPlus Land Trust | Parcel 44B North |
| PROC-0003 | Central Valley Irrigation Rights | Norges Bank Investment | Willow Creek Tract 7 |
| PROC-0004 | Black Soil Expansion Deal | Blackstone Real Estate Income | Blackwater Wetland Reserve |
| PROC-0005 | Midwest Grain Corridor Buy | PensionsPlus Land Trust | High Plains Grazing Lease |
| PROC-0006 | Central Valley Irrigation Rights | Norges Bank Investment | Oakhaven Irrigation Zone |
| PROC-0007 | Sierra Foothold Vineyard Purchase | Volatile Organic Compounds | Blackwater Wetland Reserve |

Attribute semantics are what transform identifiers into auditable facts. Each **attr** declares a property name—checksum, created_date, license, effective_date, mandatory, priority—and each **attr type** constrains its legal shape: `xsd:date` for temporal facts, `xsd:boolean` for binding obligations, `xsd:integer` for ordinal ranking, `cco:DesignativeICE` for designative identifiers in controlled vocabularies. Values themselves are stored as **misc** entries partitioned by type so that a date such as 2024-06-07 or 2025-02-08 cannot be confused with an integer priority of 5 or 346, nor with a license string like MPL-2.0. Schema governance applies the same pattern at the metadata layer: versioned subclasses identified as VERS-0001 through VERS-0004 track EventCatalog at release-11.0, successive AccessControlMatrix builds from alpha-0.9 through rc-2.1, and TelemetryStream at patch-3.2, each with its own created_date and integrity checksum a3f9c21e. When an access matrix or telemetry stream changes, the entity–attribute–value model preserves which release carried which obligation and when it became authoritative.

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | EventCatalog | release-11.0 |
| VERS-0002 | AccessControlMatrix | rc-2.1 |
| VERS-0003 | AccessControlMatrix | alpha-0.9 |
| VERS-0004 | TelemetryStream | patch-3.2 |
| VERS-0005 | AccessControlMatrix | rc-2.1 |
| VERS-0006 | AssetRegistry | hotfix-2.0 |
| VERS-0007 | AccessControlMatrix | alpha-0.9 |
| VERS-0008 | EventCatalog | hotfix-2.0 |

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

Indoor environmental compliance extends the entity model from land to occupant health. An **indoor air quality action plan** is a governed intervention—HVAC Filter Upgrade Protocol, Dust Suppression Procedure, Air Purifier Deployment Plan—identified by PLAN-0001 and siblings, with an effective_date anchoring when controls take force and a mandatory flag distinguishing binding procedures from advisory guidance. Plans declare which **indoor air pollution** they address: Mold Spores, Nitrogen Dioxide, Sulfur Dioxide. Effectiveness is not asserted by engineering judgment alone; each plan names a **health outcome metric** used for verification, such as Respiratory Infection Incidence or Asthma Symptom Frequency, so that filter upgrades and dust suppression can be evaluated against population-level outcomes rather than sensor readings in isolation. Priority integers and enforcement strings further encode how aggressively a facility must implement a plan, turning qualitative policy into operational triage. Where a plan record incorrectly associates Vanguard Global Real Assets with a pollution target, the typed attribute layer surfaces a referential integrity failure that governance review must resolve before the plan can be treated as audit-ready.

**t_indoor_air_quality_action_plan_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PLAN-0001 | effective_date | xsd:date |
| PLAN-0002 | enforcement | xsd:string |
| PLAN-0003 | mandatory | xsd:boolean |
| PLAN-0004 | priority | xsd:integer |
| PLAN-0005 | review_cycle_days | xsd:integer |
| PLAN-0006 | scope | xsd:string |
| PLAN-0007 | encoding | xsd:string |
| PLAN-0008 | label_text | xsd:string |

**t_indoor_air_quality_action_plan_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0003 | false |
| PLAN-0002 | PLAN-0002 | PLAN-0003 | false |
| PLAN-0003 | PLAN-0003 | PLAN-0003 | true |
| PLAN-0004 | PLAN-0004 | PLAN-0003 | false |
| PLAN-0005 | PLAN-0005 | PLAN-0003 | true |
| PLAN-0006 | PLAN-0006 | PLAN-0003 | false |
| PLAN-0007 | PLAN-0007 | PLAN-0003 | true |

**t_indoor_air_quality_action_plan_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0001 | 2024-08-22 |
| PLAN-0002 | PLAN-0002 | PLAN-0001 | 2025-02-08 |
| PLAN-0003 | PLAN-0003 | PLAN-0001 | 2024-12-25 |
| PLAN-0004 | PLAN-0004 | PLAN-0001 | 2025-01-11 |
| PLAN-0005 | PLAN-0005 | PLAN-0001 | 2023-11-11 |
| PLAN-0006 | PLAN-0006 | PLAN-0001 | 2024-01-21 |
| PLAN-0007 | PLAN-0007 | PLAN-0001 | 2024-08-19 |

**t_indoor_air_quality_action_plan_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0004 | 5 |
| PLAN-0002 | PLAN-0001 | PLAN-0005 | 345 |
| PLAN-0003 | PLAN-0002 | PLAN-0004 | 4 |
| PLAN-0004 | PLAN-0002 | PLAN-0005 | 346 |
| PLAN-0005 | PLAN-0003 | PLAN-0004 | 3 |
| PLAN-0006 | PLAN-0003 | PLAN-0005 | 243 |
| PLAN-0007 | PLAN-0004 | PLAN-0004 | 1 |
| PLAN-0008 | PLAN-0004 | PLAN-0005 | 453 |

**t_indoor_air_quality_action_plan_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0007 | Encoding 01 |
| PLAN-0002 | PLAN-0001 | PLAN-0002 | Enforcement 02 |
| PLAN-0003 | PLAN-0001 | PLAN-0008 | audit excerpt |
| PLAN-0004 | PLAN-0001 | PLAN-0009 | en |
| PLAN-0005 | PLAN-0001 | PLAN-0006 | Scope 05 |
| PLAN-0006 | PLAN-0002 | PLAN-0007 | Encoding 06 |
| PLAN-0007 | PLAN-0002 | PLAN-0002 | Enforcement 07 |
| PLAN-0008 | PLAN-0002 | PLAN-0008 | audit excerpt |

Farmland acquisition and indoor air programs differ in subject matter but converge on institutional accountability. **Institutional investors** enter acquisition processes as targeted counterparties whose mandates, fiduciary constraints, and ESG policies must align with the parcel being acquired; the same investor concept appears in real assets portfolios that may also sponsor building retrofits governed by air-quality plans. A process that acquires Blackwater Wetland Reserve or repeats Black Soil Expansion Deal against Parcel 44B North demonstrates how one parcel identifier can participate in multiple transactions while each process identifier retains its own evidentiary trail. Cross-domain identifiers—doi:10.1109/x for scholarly provenance, on-prem-dc1 for deployment locale—illustrate how misc values attach provenance and infrastructure context to otherwise abstract entities, supporting chain-of-custody arguments in both environmental health litigation and land-title disputes.

**t_indoor_air_quality_action_plan**

| id | indoor_air_quality_action_plan | targets_pollution | verified_by_metric |
| --- | --- | --- | --- |
| PLAN-0001 | HVAC Filter Upgrade Protocol | Mold Spores | Respiratory Infection Incidence |
| PLAN-0002 | HVAC Filter Upgrade Protocol | Nitrogen Dioxide | Asthma Symptom Frequency |
| PLAN-0003 | Dust Suppression Procedure | Vanguard Global Real Assets | Respiratory Infection Incidence |
| PLAN-0004 | Air Purifier Deployment Plan | Sulfur Dioxide | Asthma Symptom Frequency |
| PLAN-0005 | HVAC Filter Upgrade Protocol | Vanguard Global Real Assets | FEV1 Improvement Rate |
| PLAN-0006 | Mold Remediation Directive | Blackstone Real Estate Income | Pulmonary Function Test Delta |
| PLAN-0007 | CO2 Ventilation Schedule | Asbestos Fibers | Sleep Quality Score |

In practice, operators work by traversing entity graphs: from PROC-0002 through its investor and parcel links to environmental assessments; from PLAN-0003, where mandatory is true, through its pollution target and verified metric to post-implementation surveillance. Attribute typing enforces that effective_date values sort chronologically, that boolean mandatory flags gate workflow automation, and that varchar enforcement codes map to jurisdictional rule sets. Schema version subclasses ensure that the catalogs and control matrices governing these traversals are themselves version-stamped and checksum-verified, so that a 2023-07-15 creation date on an alpha AccessControlMatrix build cannot be mistaken for a production release. The misc partition across date, integer, boolean, and varchar stores is not an implementation detail for engineers alone; it is the compliance substrate that lets regulators, investors, and health authorities reconstruct what was known, what was required, and what was measured at any point in an acquisition or remediation lifecycle.