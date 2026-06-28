# Collection — topic 39 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **4 chapters** · **2 topics** (target + style) · **10 ontology terms** · **10 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 39: topic 102.

> **Topic gist** (representative FinePDFs text): SNOQUALMIE WATERSHED AQUATIC HABITAT CONDITIONS REPORT: SUMMARY OF 1999-2001 DATA November 2002 Fran Solomon and Melissa Boles King County Department of Natural Resources and Parks Water and Land Resources Division LIST OF ABBREVIATIONS AND ACRONYMS ACOE....... Army Corps of Engineers AFS ........ American Fisheries Society APD ......... Agricultural Production District C ............ Celsius... …

## Chapters

- [ch_live_aggregation_aggregates_measurement_53309f](chapters/ch_live_aggregation_aggregates_measurement_53309f.md)
- [ch_live_measurement_subclass_3397d2](chapters/ch_live_measurement_subclass_3397d2.md)
- [ch_live_measurement_subclass_5b0c1f](chapters/ch_live_measurement_subclass_5b0c1f.md)
- [ch_live_outlier_claim_min_one_attribute_cf4640](chapters/ch_live_outlier_claim_min_one_attribute_cf4640.md)

## Ontology terms grounding this collection

- `aggregation_aggregates_measurement` — {X} is a descriptive information content entity that aggregates {Y}
- `belief_interval_exactly_two_bounds` — {X} is a descriptive information content entity
- `indoor_air_quality_action_plan` — An IndoorAirQualityActionPlan is a DirectiveICE that targets IndoorAirPollution and is verified by a HealthOutcomeMetric
- `measurement_subclass` — {X} is a descriptive information content entity that has dimension {Y}
- `measurement_subclass_only_one_unit` — {X} is a descriptive information content entity that has unit {Y}
- `measurement_with_method` — {X} is a descriptive information content entity that via method {Y}
- `national_dataset_augmentation_process` — NationalDatasetAugmentationProcess is a process that incorporates CopernicusObservationSource and augments ExistingNatio
- `outlier_claim_min_one_attribute` — {X} is a descriptive information content entity
- `outlier_claim_subclass` — {X} is a descriptive information content entity that explains anomaly in {Y}
- `outlier_claim_supported_by` — {X} is a descriptive information content entity that supported by {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_aggregates_measurement`](tables/t_aggregation_aggregates_measurement.sql) — realizes `aggregation_aggregates_measurement` · _shared with 6 other collection(s)_
- [`t_belief_interval_exactly_two_bounds`](tables/t_belief_interval_exactly_two_bounds.sql) — realizes `belief_interval_exactly_two_bounds` · _shared with 6 other collection(s)_
- [`t_indoor_air_quality_action_plan`](tables/t_indoor_air_quality_action_plan.sql) — realizes `indoor_air_quality_action_plan` · _shared with 6 other collection(s)_
- [`t_measurement_subclass`](tables/t_measurement_subclass.sql) — realizes `measurement_subclass` · _shared with 10 other collection(s)_
- [`t_measurement_subclass_only_one_unit`](tables/t_measurement_subclass_only_one_unit.sql) — realizes `measurement_subclass_only_one_unit` · _shared with 7 other collection(s)_
- [`t_measurement_with_method`](tables/t_measurement_with_method.sql) — realizes `measurement_with_method` · _shared with 9 other collection(s)_
- [`t_national_dataset_augmentation_process`](tables/t_national_dataset_augmentation_process.sql) — realizes `national_dataset_augmentation_process` · _shared with 11 other collection(s)_
- [`t_outlier_claim_min_one_attribute`](tables/t_outlier_claim_min_one_attribute.sql) — realizes `outlier_claim_min_one_attribute` · _shared with 4 other collection(s)_
- [`t_outlier_claim_subclass`](tables/t_outlier_claim_subclass.sql) — realizes `outlier_claim_subclass` · _shared with 4 other collection(s)_
- [`t_outlier_claim_supported_by`](tables/t_outlier_claim_supported_by.sql) — realizes `outlier_claim_supported_by` · _shared with 10 other collection(s)_
