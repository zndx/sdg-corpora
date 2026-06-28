---
chapter_id: ch_live_farmland_acquisition_process_3a3843
topic_id: 186
family: 08_derived
cited_terms: ['farmland_acquisition_process', 'legal_advocate_role', 'gauge_metric_subclass']
model: engine-refine
---

In agricultural land investment, acquisition processes serve as the operational backbone linking capital to physical assets. Each acquisition is captured as a discrete transaction record that identifies the deal, the institutional investor being targeted, and the specific parcel of land under acquisition. The "Black Soil Expansion Deal," for instance, targets PensionsPlus Land Trust for the acquisition of Parcel 44B North, while the same deal name also appears linked to Meridian Agricultural Capital acquiring the same parcel—suggesting either a multi-investor structure or a data artifact worth investigating. Other transactions include the "Appalachian Ridge Timberland Swap" routed through Meridian Agricultural Capital, the "Central Valley Irrigation Rights" deal directed at CalPERS Agricultural Fund for Willow Creek Tract 7, and the "Blackwater Wetland Reserve" acquisition, again targeting Meridian Agricultural Capital. These records establish a clear three-way relationship: a named process, the institutional investor it seeks to attract, and the agricultural land parcel it brings into the investor's portfolio.

**t_farmland_acquisition_process**

| id | farmland_acquisition_process | targets_investor | acquires_land |
| --- | --- | --- | --- |
| PROC-0001 | Black Soil Expansion Deal | PensionsPlus Land Trust | Parcel 44B North |
| PROC-0002 | Appalachian Ridge Timberland Swap | Meridian Agricultural Capital | Parcel 44B North |
| PROC-0003 | Central Valley Irrigation Rights | CalPERS Agricultural Fund | Willow Creek Tract 7 |
| PROC-0004 | Black Soil Expansion Deal | Meridian Agricultural Capital | Blackwater Wetland Reserve |
| PROC-0005 | Midwest Grain Corridor Buy | Meridian Agricultural Capital | High Plains Grazing Lease |
| PROC-0006 | Central Valley Irrigation Rights | Sovereign Wealth Alpha | Oakhaven Irrigation Zone |
| PROC-0007 | Sierra Foothold Vineyard Purchase | BlackRock Farmland Partners | Blackwater Wetland Reserve |

The legal advocacy dimension of this ecosystem introduces a parallel structure centered on role-based access and survivor support. Legal advocate roles are catalogued with identifiers such as "LegalAid-Case33," "CourtAdvoc-15B," "SurvivorAdvoc-118," and "CourtAdvoc-15B" (appearing twice, indicating a shared role template). These roles are instantiated by actual persons—Priya Nair, Robert Kim, Aisha B. Williams, and Marcus Chen—who serve as role bearers, effectively occupying the legal advocate position within a given case or matter. The separation between the abstract role definition and the person who fills it enables flexible assignment: the same role can be borne by different individuals across cases, and a single individual can bear multiple roles simultaneously.

**t_legal_advocate_role**

| id | legal_advocate_role |
| --- | --- |
| ROLE-0001 | LegalAid-Case33 |
| ROLE-0002 | CourtAdvoc-15B |
| ROLE-0003 | SurvivorAdvoc-118 |
| ROLE-0004 | CourtAdvoc-15B |
| ROLE-0005 | LegalShield-Intake |
| ROLE-0006 | LegalAid-Case33 |
| ROLE-0007 | LegalShield-Intake |
| ROLE-0008 | LegalAid-Case33 |

**t_legal_advocate_role_role_bearer**

| id | role_bearer |
| --- | --- |
| ROLE-0001 | Priya Nair |
| ROLE-0002 | Robert Kim |
| ROLE-0003 | Aisha B. Williams |
| ROLE-0004 | Marcus Chen |
| ROLE-0005 | James T. Vance |
| ROLE-0006 | Maria G. Delgado |
| ROLE-0007 | David Okafor |

**t_legal_advocate_role__role_bearer**

| id | legal_id | role_bearer_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0006 | ROLE-0007 | reviewer |
| ROLE-0002 | ROLE-0008 | ROLE-0007 | reviewer |
| ROLE-0003 | ROLE-0005 | ROLE-0007 | reviewer |
| ROLE-0004 | ROLE-0007 | ROLE-0005 | contributor |
| ROLE-0005 | ROLE-0007 | ROLE-0007 | reviewer |
| ROLE-0006 | ROLE-0005 | ROLE-0001 | owner |
| ROLE-0007 | ROLE-0001 | ROLE-0006 | reviewer |
| ROLE-0008 | ROLE-0002 | ROLE-0007 | reviewer |

**t_legal_advocate_role_assists**

| id | assists |
| --- | --- |
| ROLE-0001 | Case-Client-004 |
| ROLE-0002 | DV-Record-338 |
| ROLE-0003 | Case-Client-004 |
| ROLE-0004 | Ref-Survivor-091 |
| ROLE-0005 | Survivor-Ref-115 |
| ROLE-0006 | Client-Code-773 |
| ROLE-0007 | DV-Client-8842 |

The relationship between legal advocates and the survivors they assist is modeled through a dedicated association table that captures not just the linkage but the nature and scope of each connection. A legal advocate role may assist a domestic violence survivor identified by references such as "Case-Client-004," "DV-Record-338," or "Ref-Survivor-091." The association table enriches this linkage with a role descriptor—observer, contributor, or owner—that specifies the advocate's functional relationship to the survivor in that particular context. For example, one association records an "observer" relationship, another a "contributor" relationship, and a third an "owner" designation, each carrying distinct implications for access, responsibility, and data visibility. Cardinality notes (labeled "Cardinality Note 01" through "Cardinality Note 04") accompany these associations, providing metadata about the one-to-many or many-to-many constraints governing how many survivors a single advocate role may assist and vice versa.

**t_legal_advocate_role__assists**

| id | legal_id | assists_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0007 | ROLE-0004 | observer | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0003 | contributor | Cardinality Note 02 |
| ROLE-0003 | ROLE-0003 | ROLE-0004 | observer | Cardinality Note 03 |
| ROLE-0004 | ROLE-0006 | ROLE-0005 | owner | Cardinality Note 04 |
| ROLE-0005 | ROLE-0004 | ROLE-0007 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0007 | ROLE-0002 | observer | Cardinality Note 06 |
| ROLE-0007 | ROLE-0002 | ROLE-0004 | contributor | Cardinality Note 07 |
| ROLE-0008 | ROLE-0003 | ROLE-0001 | reviewer | Cardinality Note 08 |

A separate measurement infrastructure tracks metric gauges that quantify various dimensions of the system. The fact table `fact_gauge` records individual metric readings with a `size_bytes` value—ranging from approximately 15.6 MB to 944.6 MB—and a version number (4, 10, or 11). Each gauge entry references a metric kind through a foreign key, which is resolved against the `dim_metric_kind` dimension table. This dimension table provides human-readable labels ("Metric Kind Label 01" through "Metric Kind Label 04") and categorical groupings ("Metric Kind Category 01" through "Metric Kind Category 04") that classify the nature of each metric. The version field on the gauge records enables temporal tracking of metric definitions and their evolution over time, supporting auditability and reproducibility in measurement reporting.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |