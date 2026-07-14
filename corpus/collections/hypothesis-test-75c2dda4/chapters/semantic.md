## The Anatomy of a Statistical Hypothesis Test

A statistical hypothesis test is a structured decision procedure: a researcher posits a null and an alternative hypothesis about a population parameter, selects a test statistic and its sampling distribution, defines a critical region at a chosen significance level, observes data, computes the statistic, and reaches a conclusion. The relational model captures this entire workflow as a network of five base tables and a junction table, each normalizing a distinct facet of the testing process. The tables are linked by foreign keys that enforce the logical dependencies of the scientific method, and a suite of views reconstructs the domain facts by joining the normalized pieces back together. The data in this domain is entirely fictional; every identifier, parameter name, and conclusion is synthetic.

**Table `hypothesis_tests`**

| id | test_identifier | test_type | significance_level | actual_significance_level | conclusion | conclusion_text | test_statistic_id | population_parameter_id | critical_region_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | TES-2761 | one-tailed | 7.70 | 15.70 | reject null | adaptive-conclusi-41 | 100 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | TES-2765 | two-tailed | 12.40 | 17.40 | fail to reject null | distributed-conclusi-42 | 101 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | TES-2769 | one-tailed | 17.10 | 19.10 | reject null | baseline-conclusi-43 | 102 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | TES-2773 | two-tailed | 21.80 | 20.80 | fail to reject null | pilot-conclusi-44 | 103 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `hypothesis_tests` table is the central fact table of the model. Each row represents a single completed or planned hypothesis test, identified by a surrogate `id` and a human-readable `test_identifier` such as `TES-2761` or `TES-2773`. The `test_type` column distinguishes between `one-tailed` and `two-tailed` tests, while `significance_level` and `actual_significance_level` record the nominal and empirically observed error rates — for instance, test `TES-2761` was designed at a 7.70 significance level but yielded an actual level of 15.70. The `conclusion` column stores a machine-readable verdict (`reject null` or `fail to reject null`), and `conclusion_text` carries a free-text label such as `adaptive-conclusi-41` or `pilot-conclusi-44`. Three foreign keys anchor the test to its supporting artifacts: `test_statistic_id` points into `test_statistics`, `population_parameter_id` points into `population_parameters`, and `critical_region_id` points into `critical_regions`. Timestamps `created_at` and `updated_at` track the lifecycle; test `TES-2765`, for example, was created on 2025-02-06 and last updated on 2025-02-09.

**Table `statistical_hypothesises`**

| statistical_hypothesis_id | hypothesis_type | parameter_symbol | operator | threshold_value | hypothesis_test_id | population_parameter_id |
|---|---|---|---|---|---|---|
| 100 | null | pilot-paramete-74 | = | 10.70 | 1 | 1 |
| 101 | alternative | extended-paramete-75 | != | 12.40 | 2 | 2 |
| 102 | null | integrated-paramete-76 | > | 14.10 | 3 | 3 |
| 103 | alternative | seasonal-paramete-77 | < | 15.80 | 4 | 4 |

The `statistical_hypothesises` table stores the formal hypotheses themselves. Each row carries a `statistical_hypothesis_id`, a `hypothesis_type` that is either `null` or `alternative`, a `parameter_symbol` (e.g., `pilot-paramete-74` or `seasonal-paramete-77`), an `operator` (`=`, `!=`, `>`, or `<`), and a `threshold_value` against which the parameter is compared. The row `statistical_hypothesis_id = 100` encodes the null hypothesis `pilot-paramete-74 = 10.70`, while `statistical_hypothesis_id = 103` encodes the alternative `seasonal-paramete-77 < 15.80`. Two foreign keys tie the hypothesis to the broader test context: `hypothesis_test_id` links back to `hypothesis_tests`, and `population_parameter_id` links forward to `population_parameters`.

**Table `test_statistics`**

| id | statistic_symbol | observed_value | distribution_model | distribution_parameter | hypothesis_test_id | population_parameter_id |
|---|---|---|---|---|---|---|
| 100 | extended-statisti-51 | 24 | integrated-distribu-88 | 12.70 | 1 | 1 |
| 101 | integrated-statisti-52 | 30 | seasonal-distribu-89 | 14.40 | 2 | 2 |
| 102 | seasonal-statisti-53 | 36 | regional-distribu-90 | 16.10 | 3 | 3 |
| 103 | regional-statisti-54 | 42 | legacy-distribu-91 | 17.80 | 4 | 4 |

The `test_statistics` table holds the observed test statistics. Each row is identified by `id` (e.g., `100` through `103`), carries a `statistic_symbol` such as `extended-statisti-51` or `regional-statisti-54`, records the `observed_value` (integers 24, 30, 36, 42), specifies a `distribution_model` (e.g., `integrated-distribu-88` or `legacy-distribu-91`), and stores a `distribution_parameter` (floats 12.70 through 17.80). Foreign keys `hypothesis_test_id` and `population_parameter_id` connect the statistic to its parent test and to the population parameter it evaluates.

**Table `population_parameters`**

| population_parameter_id | parameter_symbol | parameter_name | true_value | test_statistic_id | statistical_hypothesis_id |
|---|---|---|---|---|---|
| 1 | pilot-paramete-74 | Extended Model | 18.45 | 100 | 100 |
| 2 | extended-paramete-75 | Pilot Cluster A | 21.90 | 101 | 101 |
| 3 | integrated-paramete-76 | Baseline Review | 25.35 | 102 | 102 |
| 4 | seasonal-paramete-77 | Distributed Initiative | 28.80 | 103 | 103 |

The `population_parameters` table defines the population-level quantities under investigation. Each row has a `population_parameter_id`, a `parameter_symbol`, a human-readable `parameter_name` (such as `Extended Model`, `Pilot Cluster A`, `Baseline Review`, or `Distributed Initiative`), and a `true_value` (18.45, 21.90, 25.35, 28.80). The table also carries foreign keys `test_statistic_id` and `statistical_hypothesis_id`, creating a bidirectional bridge: a population parameter is simultaneously the subject of a test statistic and the target of a statistical hypothesis.

**Table `critical_regions`**

| id | region_type | lower_bound | upper_bound | critical_value | hypothesis_test_id | test_statistic_id |
|---|---|---|---|---|---|---|
| 100 | lower tail | 14 | 19 | 44 | 1 | 100 |
| 101 | upper tail | 17 | 28 | 51 | 2 | 101 |
| 102 | two-tailed | 20 | 37 | 58 | 3 | 102 |
| 103 | lower tail | 23 | 46 | 65 | 4 | 103 |

The `critical_regions` table encodes the rejection zones for each test. Each row has an `id`, a `region_type` (`lower tail`, `upper tail`, or `two-tailed`), `lower_bound` and `upper_bound` defining the interval, and a `critical_value` (44, 51, 58, 65). Foreign keys `hypothesis_test_id` and `test_statistic_id` tie the region to its parent test and to the specific statistic whose observed value is compared against the bounds.

**Table `tests_hypothesises`**

| hypothesis_test_id | statistical_hypothesis_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `tests_hypothesises` table is a junction table that resolves a many-to-many relationship between `hypothesis_tests` and `statistical_hypothesises`. Each row pairs a `hypothesis_test_id` with a `statistical_hypothesis_id`. Test `TES-2761` (id = 1) is associated with both hypothesis `100` (null) and hypothesis `101` (alternative), as are tests 2, 3, and 4 — each test links to two hypotheses in a cyclic pattern: test 1 → {100, 101}, test 2 → {101, 102}, test 3 → {102, 103}, test 4 → {103, 100}. This junction table is the only place where the many-to-many cardinality is materialized; all other relationships are one-to-one or one-to-many and are enforced directly through foreign keys in the base tables.

The foreign-key topology of the schema can be summarized as follows. `hypothesis_tests` is the hub: it references `test_statistics` (via `test_statistic_id`), `population_parameters` (via `population_parameter_id`), and `critical_regions` (via `critical_region_id`). `statistical_hypothesises` references both `hypothesis_tests` and `population_parameters`. `test_statistics` references `hypothesis_tests` and `population_parameters`. `population_parameters` references `test_statistics` and `statistical_hypothesises`. `critical_regions` references `hypothesis_tests` and `test_statistics`. The junction table `tests_hypothesises` sits between `hypothesis_tests` and `statistical_hypothesises`, completing the cycle. This interlocking design ensures that every test statistic, population parameter, and critical region is traceable to a single hypothesis test, while each hypothesis test can be decomposed into its constituent statistical components.

The views in this schema are read-only projections that join the normalized tables to answer specific analytical questions. Each view reconstructs a domain fact by pulling together the relevant columns from two or more base tables.

**View `v_hypothesis_test_statistical_hypothesis_detail`**

```sql
CREATE VIEW v_hypothesis_test_statistical_hypothesis_detail AS
SELECT a.id, a.test_identifier, a.test_type, b.statistical_hypothesis_id AS hypothesis_statistical_hypothesis_id, b.hypothesis_type AS hypothesis_hypothesis_type, b.parameter_symbol AS hypothesis_parameter_symbol
FROM hypothesis_tests a
  JOIN tests_hypothesises j ON j.hypothesis_test_id = a.id
  JOIN statistical_hypothesises b ON b.statistical_hypothesis_id = j.statistical_hypothesis_id;
```

| id | test_identifier | test_type | hypothesis_statistical_hypothesis_id | hypothesis_hypothesis_type | hypothesis_parameter_symbol |
|---|---|---|---|---|---|
| 1 | TES-2761 | one-tailed | 100 | null | pilot-paramete-74 |
| 1 | TES-2761 | one-tailed | 101 | alternative | extended-paramete-75 |
| 2 | TES-2765 | two-tailed | 101 | alternative | extended-paramete-75 |
| 2 | TES-2765 | two-tailed | 102 | null | integrated-paramete-76 |
| 3 | TES-2769 | one-tailed | 102 | null | integrated-paramete-76 |
| 3 | TES-2769 | one-tailed | 103 | alternative | seasonal-paramete-77 |
| 4 | TES-2773 | two-tailed | 103 | alternative | seasonal-paramete-77 |
| 4 | TES-2773 | two-tailed | 100 | null | pilot-paramete-74 |

The view `v_hypothesis_test_statistical_hypothesis_detail` joins `hypothesis_tests` with `statistical_hypothesises` through the junction table `tests_hypothesises`. It answers the question: "For each hypothesis test, what are the associated null and alternative hypotheses, including their operators and thresholds?" Reading row 1 of the view — test `TES-2761` paired with the null hypothesis `pilot-paramete-74 = 10.70` — reveals the complete hypothesis pair for that test. Row 2 shows test `TES-2765` with the alternative hypothesis `extended-paramete-75 != 12.40`. The view makes it possible to inspect the hypothesis structure of any test without navigating the junction table manually.

**View `v_hypothesis_test_test_statistic`**

```sql
CREATE VIEW v_hypothesis_test_test_statistic AS
SELECT a.id, a.test_identifier, a.test_type, a.significance_level, b.id AS statistic_id, b.statistic_symbol AS statistic_statistic_symbol, b.observed_value AS statistic_observed_value
FROM hypothesis_tests a JOIN test_statistics b ON a.test_statistic_id = b.id;
```

| id | test_identifier | test_type | significance_level | statistic_id | statistic_statistic_symbol | statistic_observed_value |
|---|---|---|---|---|---|---|
| 1 | TES-2761 | one-tailed | 7.70 | 100 | extended-statisti-51 | 24 |
| 2 | TES-2765 | two-tailed | 12.40 | 101 | integrated-statisti-52 | 30 |
| 3 | TES-2769 | one-tailed | 17.10 | 102 | seasonal-statisti-53 | 36 |
| 4 | TES-2773 | two-tailed | 21.80 | 103 | regional-statisti-54 | 42 |

The view `v_hypothesis_test_test_statistic` joins `hypothesis_tests` with `test_statistics` on `test_statistic_id`. It answers: "What test statistic was computed for each hypothesis test, and what distribution model was assumed?" Row 1 of the view pairs test `TES-2761` with statistic `extended-statisti-51`, observed value 24, and distribution model `integrated-distribu-88` with parameter 12.70. Row 4 pairs test `TES-2773` with statistic `regional-statisti-54`, observed value 42, and distribution model `legacy-distribu-91` with parameter 17.80. This view is the primary diagnostic for assessing whether the observed statistic falls within or beyond the critical region.

**View `v_hypothesis_test_population_parameter`**

```sql
CREATE VIEW v_hypothesis_test_population_parameter AS
SELECT a.id, a.test_identifier, a.test_type, a.significance_level, b.population_parameter_id AS parameter_population_parameter_id, b.parameter_symbol AS parameter_parameter_symbol, b.parameter_name AS parameter_parameter_name
FROM hypothesis_tests a JOIN population_parameters b ON a.population_parameter_id = b.population_parameter_id;
```

| id | test_identifier | test_type | significance_level | parameter_population_parameter_id | parameter_parameter_symbol | parameter_parameter_name |
|---|---|---|---|---|---|---|
| 1 | TES-2761 | one-tailed | 7.70 | 1 | pilot-paramete-74 | Extended Model |
| 2 | TES-2765 | two-tailed | 12.40 | 2 | extended-paramete-75 | Pilot Cluster A |
| 3 | TES-2769 | one-tailed | 17.10 | 3 | integrated-paramete-76 | Baseline Review |
| 4 | TES-2773 | two-tailed | 21.80 | 4 | seasonal-paramete-77 | Distributed Initiative |

The view `v_hypothesis_test_population_parameter` joins `hypothesis_tests` with `population_parameters` on `population_parameter_id`. It answers: "Which population parameter is being tested in each hypothesis test, and what is its true value?" Row 1 shows test `TES-2761` testing the `Extended Model` parameter (`pilot-paramete-74`) with a true value of 18.45. Row 3 shows test `TES-2769` testing the `Baseline Review` parameter (`integrated-paramete-76`) with a true value of 25.35. This view is essential for evaluating the accuracy of conclusions against known ground truth.

**View `v_hypothesis_test_critical_region`**

```sql
CREATE VIEW v_hypothesis_test_critical_region AS
SELECT a.id, a.test_identifier, a.test_type, a.significance_level, b.id AS region_id, b.region_type AS region_region_type, b.lower_bound AS region_lower_bound
FROM hypothesis_tests a JOIN critical_regions b ON a.critical_region_id = b.id;
```

| id | test_identifier | test_type | significance_level | region_id | region_region_type | region_lower_bound |
|---|---|---|---|---|---|---|
| 1 | TES-2761 | one-tailed | 7.70 | 100 | lower tail | 14 |
| 2 | TES-2765 | two-tailed | 12.40 | 101 | upper tail | 17 |
| 3 | TES-2769 | one-tailed | 17.10 | 102 | two-tailed | 20 |
| 4 | TES-2773 | two-tailed | 21.80 | 103 | lower tail | 23 |

The view `v_hypothesis_test_critical_region` joins `hypothesis_tests` with `critical_regions` on `critical_region_id`. It answers: "What is the rejection region for each hypothesis test?" Row 1 of the view shows test `TES-2761` with a `lower tail` critical region spanning bounds 14 to 19 and a critical value of 44. Row 3 shows test `TES-2769` with a `two-tailed` region spanning bounds 20 to 37 and a critical value of 58. By comparing the observed test statistic from `v_hypothesis_test_test_statistic` against these bounds, one can independently verify the conclusion recorded in `hypothesis_tests`.

**View `v_statistical_hypothesis_hypothesis_test`**

```sql
CREATE VIEW v_statistical_hypothesis_hypothesis_test AS
SELECT a.statistical_hypothesis_id, a.hypothesis_type, a.parameter_symbol, a.operator, b.id AS test_id, b.test_identifier AS test_test_identifier, b.test_type AS test_test_type
FROM statistical_hypothesises a JOIN hypothesis_tests b ON a.hypothesis_test_id = b.id;
```

| statistical_hypothesis_id | hypothesis_type | parameter_symbol | operator | test_id | test_test_identifier | test_test_type |
|---|---|---|---|---|---|---|
| 100 | null | pilot-paramete-74 | = | 1 | TES-2761 | one-tailed |
| 101 | alternative | extended-paramete-75 | != | 2 | TES-2765 | two-tailed |
| 102 | null | integrated-paramete-76 | > | 3 | TES-2769 | one-tailed |
| 103 | alternative | seasonal-paramete-77 | < | 4 | TES-2773 | two-tailed |

The view `v_statistical_hypothesis_hypothesis_test` joins `statistical_hypothesises` with `hypothesis_tests` through `tests_hypothesises`. It answers the inverse of `v_hypothesis_test_statistical_hypothesis_detail`: "For each statistical hypothesis, which hypothesis test does it belong to?" Row 1 of the view shows hypothesis `100` (null, `pilot-paramete-74 = 10.70`) belonging to test `TES-2761`. Row 4 shows hypothesis `103` (alternative, `seasonal-paramete-77 < 15.80`) belonging to test `TES-2773`. This view is useful when starting from a hypothesis and needing to trace back to the test that evaluated it.

**View `v_statistical_hypothesis_population_parameter`**

```sql
CREATE VIEW v_statistical_hypothesis_population_parameter AS
SELECT a.statistical_hypothesis_id, a.hypothesis_type, a.parameter_symbol, a.operator, b.population_parameter_id AS parameter_population_parameter_id, b.parameter_symbol AS parameter_parameter_symbol, b.parameter_name AS parameter_parameter_name
FROM statistical_hypothesises a JOIN population_parameters b ON a.population_parameter_id = b.population_parameter_id;
```

| statistical_hypothesis_id | hypothesis_type | parameter_symbol | operator | parameter_population_parameter_id | parameter_parameter_symbol | parameter_parameter_name |
|---|---|---|---|---|---|---|
| 100 | null | pilot-paramete-74 | = | 1 | pilot-paramete-74 | Extended Model |
| 101 | alternative | extended-paramete-75 | != | 2 | extended-paramete-75 | Pilot Cluster A |
| 102 | null | integrated-paramete-76 | > | 3 | integrated-paramete-76 | Baseline Review |
| 103 | alternative | seasonal-paramete-77 | < | 4 | seasonal-paramete-77 | Distributed Initiative |

The view `v_statistical_hypothesis_population_parameter` joins `statistical_hypothesises` with `population_parameters` on `population_parameter_id`. It answers: "Which population parameter is the subject of each statistical hypothesis, and what is its true value?" Row 1 of the view pairs hypothesis `100` with the `Extended Model` parameter (`pilot-paramete-74`, true value 18.45). Row 2 pairs hypothesis `101` with the `Pilot Cluster A` parameter (`extended-paramete-75`, true value 21.90). This view consolidates the hypothesis definition with the ground-truth parameter value, enabling direct comparison of the threshold against the true value.

**View `v_test_statistic_hypothesis_test`**

```sql
CREATE VIEW v_test_statistic_hypothesis_test AS
SELECT a.id, a.statistic_symbol, a.observed_value, a.distribution_model, b.id AS test_id, b.test_identifier AS test_test_identifier, b.test_type AS test_test_type
FROM test_statistics a JOIN hypothesis_tests b ON a.hypothesis_test_id = b.id;
```

| id | statistic_symbol | observed_value | distribution_model | test_id | test_test_identifier | test_test_type |
|---|---|---|---|---|---|---|
| 100 | extended-statisti-51 | 24 | integrated-distribu-88 | 1 | TES-2761 | one-tailed |
| 101 | integrated-statisti-52 | 30 | seasonal-distribu-89 | 2 | TES-2765 | two-tailed |
| 102 | seasonal-statisti-53 | 36 | regional-distribu-90 | 3 | TES-2769 | one-tailed |
| 103 | regional-statisti-54 | 42 | legacy-distribu-91 | 4 | TES-2773 | two-tailed |

The view `v_test_statistic_hypothesis_test` joins `test_statistics` with `hypothesis_tests` on `hypothesis_test_id`. It answers: "For each test statistic, which hypothesis test produced it?" Row 1 of the view shows statistic `extended-statisti-51` (observed value 24, distribution `integrated-distribu-88`) was computed for test `TES-2761`. Row 4 shows statistic `regional-statisti-54` (observed value 42, distribution `legacy-distribu-91`) was computed for test `TES-2773`. This view is the natural starting point for any analysis that begins with a test statistic and needs to recover the test context.

**View `v_test_statistic_population_parameter`**

```sql
CREATE VIEW v_test_statistic_population_parameter AS
SELECT a.id, a.statistic_symbol, a.observed_value, a.distribution_model, b.population_parameter_id AS parameter_population_parameter_id, b.parameter_symbol AS parameter_parameter_symbol, b.parameter_name AS parameter_parameter_name
FROM test_statistics a JOIN population_parameters b ON a.population_parameter_id = b.population_parameter_id;
```

| id | statistic_symbol | observed_value | distribution_model | parameter_population_parameter_id | parameter_parameter_symbol | parameter_parameter_name |
|---|---|---|---|---|---|---|
| 100 | extended-statisti-51 | 24 | integrated-distribu-88 | 1 | pilot-paramete-74 | Extended Model |
| 101 | integrated-statisti-52 | 30 | seasonal-distribu-89 | 2 | extended-paramete-75 | Pilot Cluster A |
| 102 | seasonal-statisti-53 | 36 | regional-distribu-90 | 3 | integrated-paramete-76 | Baseline Review |
| 103 | regional-statisti-54 | 42 | legacy-distribu-91 | 4 | seasonal-paramete-77 | Distributed Initiative |

The view `v_test_statistic_population_parameter` joins `test_statistics` with `population_parameters` on `population_parameter_id`. It answers: "Which population parameter does each test statistic evaluate, and what is its true value?" Row 1 of the view pairs statistic `extended-statisti-51` with the `Extended Model` parameter (true value 18.45). Row 3 pairs statistic `seasonal-statisti-53` with the `Baseline Review` parameter (true value 25.35). This view is particularly useful for assessing whether the observed statistic is consistent with the true parameter value under the assumed distribution.

**View `v_population_parameter_test_statistic`**

```sql
CREATE VIEW v_population_parameter_test_statistic AS
SELECT a.population_parameter_id, a.parameter_symbol, a.parameter_name, a.true_value, b.id AS statistic_id, b.statistic_symbol AS statistic_statistic_symbol, b.observed_value AS statistic_observed_value
FROM population_parameters a JOIN test_statistics b ON a.test_statistic_id = b.id;
```

| population_parameter_id | parameter_symbol | parameter_name | true_value | statistic_id | statistic_statistic_symbol | statistic_observed_value |
|---|---|---|---|---|---|---|
| 1 | pilot-paramete-74 | Extended Model | 18.45 | 100 | extended-statisti-51 | 24 |
| 2 | extended-paramete-75 | Pilot Cluster A | 21.90 | 101 | integrated-statisti-52 | 30 |
| 3 | integrated-paramete-76 | Baseline Review | 25.35 | 102 | seasonal-statisti-53 | 36 |
| 4 | seasonal-paramete-77 | Distributed Initiative | 28.80 | 103 | regional-statisti-54 | 42 |

The view `v_population_parameter_test_statistic` joins `population_parameters` with `test_statistics` on `test_statistic_id`. It answers: "For each population parameter, which test statistic was used to evaluate it?" Row 1 of the view shows the `Extended Model` parameter (`pilot-paramete-74`, true value 18.45) was evaluated using statistic `extended-statisti-51` (observed value 24). Row 4 shows the `Distributed Initiative` parameter (`seasonal-paramete-77`, true value 28.80) was evaluated using statistic `regional-statisti-54` (observed value 42). This view is useful when analyzing a parameter from the perspective of the statistic that tested it.

**View `v_population_parameter_statistical_hypothesis`**

```sql
CREATE VIEW v_population_parameter_statistical_hypothesis AS
SELECT a.population_parameter_id, a.parameter_symbol, a.parameter_name, a.true_value, b.statistical_hypothesis_id AS hypothesis_statistical_hypothesis_id, b.hypothesis_type AS hypothesis_hypothesis_type, b.parameter_symbol AS hypothesis_parameter_symbol
FROM population_parameters a JOIN statistical_hypothesises b ON a.statistical_hypothesis_id = b.statistical_hypothesis_id;
```

| population_parameter_id | parameter_symbol | parameter_name | true_value | hypothesis_statistical_hypothesis_id | hypothesis_hypothesis_type | hypothesis_parameter_symbol |
|---|---|---|---|---|---|---|
| 1 | pilot-paramete-74 | Extended Model | 18.45 | 100 | null | pilot-paramete-74 |
| 2 | extended-paramete-75 | Pilot Cluster A | 21.90 | 101 | alternative | extended-paramete-75 |
| 3 | integrated-paramete-76 | Baseline Review | 25.35 | 102 | null | integrated-paramete-76 |
| 4 | seasonal-paramete-77 | Distributed Initiative | 28.80 | 103 | alternative | seasonal-paramete-77 |

The view `v_population_parameter_statistical_hypothesis` joins `population_parameters` with `statistical_hypothesises` on `statistical_hypothesis_id`. It answers: "For each population parameter, what hypothesis was formulated about it?" Row 1 of the view shows the `Extended Model` parameter is the subject of hypothesis `100` (null, `pilot-paramete-74 = 10.70`). Row 2 shows the `Pilot Cluster A` parameter is the subject of hypothesis `101` (alternative, `extended-paramete-75 != 12.40`). This view consolidates the parameter definition with the formal hypothesis, providing a complete picture of the inferential claim.

**View `v_critical_region_hypothesis_test`**

```sql
CREATE VIEW v_critical_region_hypothesis_test AS
SELECT a.id, a.region_type, a.lower_bound, a.upper_bound, b.id AS test_id, b.test_identifier AS test_test_identifier, b.test_type AS test_test_type
FROM critical_regions a JOIN hypothesis_tests b ON a.hypothesis_test_id = b.id;
```

| id | region_type | lower_bound | upper_bound | test_id | test_test_identifier | test_test_type |
|---|---|---|---|---|---|---|
| 100 | lower tail | 14 | 19 | 1 | TES-2761 | one-tailed |
| 101 | upper tail | 17 | 28 | 2 | TES-2765 | two-tailed |
| 102 | two-tailed | 20 | 37 | 3 | TES-2769 | one-tailed |
| 103 | lower tail | 23 | 46 | 4 | TES-2773 | two-tailed |

The view `v_critical_region_hypothesis_test` joins `critical_regions` with `hypothesis_tests` on `hypothesis_test_id`. It answers: "For each critical region, which hypothesis test does it define the rejection zone for?" Row 1 of the view shows the `lower tail` region (bounds 14–19, critical value 44) belongs to test `TES-2761`. Row 3 shows the `two-tailed` region (bounds 20–37, critical value 58) belongs to test `TES-2769`. This view is useful for auditing the rejection criteria across all tests.

**View `v_critical_region_test_statistic`**

```sql
CREATE VIEW v_critical_region_test_statistic AS
SELECT a.id, a.region_type, a.lower_bound, a.upper_bound, b.id AS statistic_id, b.statistic_symbol AS statistic_statistic_symbol, b.observed_value AS statistic_observed_value
FROM critical_regions a JOIN test_statistics b ON a.test_statistic_id = b.id;
```

| id | region_type | lower_bound | upper_bound | statistic_id | statistic_statistic_symbol | statistic_observed_value |
|---|---|---|---|---|---|---|
| 100 | lower tail | 14 | 19 | 100 | extended-statisti-51 | 24 |
| 101 | upper tail | 17 | 28 | 101 | integrated-statisti-52 | 30 |
| 102 | two-tailed | 20 | 37 | 102 | seasonal-statisti-53 | 36 |
| 103 | lower tail | 23 | 46 | 103 | regional-statisti-54 | 42 |

The view `v_critical_region_test_statistic` joins `critical_regions` with `test_statistics` on `test_statistic_id`. It answers: "For each critical region, which test statistic's observed value is compared against it?" Row 1 of the view pairs the `lower tail` region (bounds 14–19) with statistic `extended-statisti-51` (observed value 24). Row 4 pairs the `lower tail` region (bounds 23–46) with statistic `regional-statisti-54` (observed value 42). This view directly supports the decision logic: if the observed value falls within the region bounds, the null hypothesis is rejected; otherwise, it is not.

The schema as a whole embodies a disciplined normalization of the hypothesis testing workflow. The `hypothesis_tests` table captures the test-level metadata and outcome; `statistical_hypothesises` captures the formal claims; `test_statistics` captures the computed evidence; `population_parameters` captures the ground truth; `critical_regions` captures the decision boundaries; and `tests_hypothesises` resolves the many-to-many association between tests and hypotheses. The views provide denormalized lenses that reconstruct the full context of any single facet — whether you start from a test, a hypothesis, a statistic, a parameter, or a critical region. This design supports both transactional integrity (through foreign keys) and analytical flexibility (through views), making it suitable for environments where hypothesis tests are recorded, audited, and retrospectively analyzed.