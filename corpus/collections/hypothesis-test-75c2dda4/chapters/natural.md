Statistical hypothesis testing serves as the backbone of evidence-based decision-making across scientific and industrial domains. Practitioners design experiments, collect observations, and evaluate whether measured data provide sufficient evidence to challenge prevailing assumptions about population parameters. The discipline requires careful alignment between the research question, the statistical model, and the decision criteria that separate routine variation from meaningful signal. Within a managed testing environment, every hypothesis test is a structured artifact: it carries an identifier, a tail configuration, a nominal significance level, and a documented conclusion. These artifacts connect to the underlying statistical hypotheses, the computed test statistics, the population parameters under investigation, and the critical regions that define rejection boundaries. Understanding how these components interlock is essential for reproducible analysis and for auditing the reasoning that led from raw data to a final verdict.

## The Hypothesis Test as a Decision Record

At the center of the workflow sits the hypothesis test record, which captures the full context of a single evaluation. Each test is assigned a unique identifier and a human-readable label such as `TES-2761` or `TES-2773`. The `test_type` column distinguishes between one-tailed and two-tailed configurations, reflecting whether the practitioner is probing for deviation in a single direction or in either direction. The `significance_level` records the nominal alpha chosen before data collection, while `actual_significance_level` captures the realized value after adjustments or recalculations. The `conclusion` field stores a machine-readable verdict—either `reject null` or `fail to reject null`—and `conclusion_text` provides a descriptive label such as `adaptive-conclusi-41` or `pilot-conclusi-44`.

**Table `hypothesis_tests`**

| id | test_identifier | test_type | significance_level | actual_significance_level | conclusion | conclusion_text | test_statistic_id | population_parameter_id | critical_region_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | TES-2761 | one-tailed | 7.70 | 15.70 | reject null | adaptive-conclusi-41 | 100 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | TES-2765 | two-tailed | 12.40 | 17.40 | fail to reject null | distributed-conclusi-42 | 101 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | TES-2769 | one-tailed | 17.10 | 19.10 | reject null | baseline-conclusi-43 | 102 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | TES-2773 | two-tailed | 21.80 | 20.80 | fail to reject null | pilot-conclusi-44 | 103 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consider test `TES-2761`, a one-tailed evaluation with a nominal significance level of 7.70 and an actual level of 15.70. Its conclusion is `reject null`, documented under the label `adaptive-conclusi-41`. By contrast, test `TES-2765` is two-tailed, with a nominal level of 12.40 and an actual level of 17.40, and it ends with `fail to reject null` under the label `distributed-conclusi-42`. The progression from `TES-2761` through `TES-2773` shows how different tail configurations and significance thresholds produce varied outcomes, even when the underlying data-generating processes share structural similarities. Each test also carries foreign keys pointing to its associated test statistic, population parameter, and critical region, anchoring the decision to the specific numerical and conceptual elements that supported it.

## Statistical Hypotheses and Their Operators

A hypothesis test does not exist in isolation; it evaluates one or more statistical hypotheses. Each hypothesis specifies a type—`null` or `alternative`—along with a parameter symbol, a relational operator, and a threshold value. The parameter symbol, such as `pilot-paramete-74` or `seasonal-paramete-77`, identifies the population quantity under scrutiny. The operator encodes the directionality of the claim: `=` for equality, `!=` for inequality, `>` for a lower-bound alternative, and `<` for an upper-bound alternative. The `threshold_value` sets the benchmark against which the parameter is compared.

**Table `statistical_hypothesises`**

| statistical_hypothesis_id | hypothesis_type | parameter_symbol | operator | threshold_value | hypothesis_test_id | population_parameter_id |
|---|---|---|---|---|---|---|
| 100 | null | pilot-paramete-74 | = | 10.70 | 1 | 1 |
| 101 | alternative | extended-paramete-75 | != | 12.40 | 2 | 2 |
| 102 | null | integrated-paramete-76 | > | 14.10 | 3 | 3 |
| 103 | alternative | seasonal-paramete-77 | < | 15.80 | 4 | 4 |

In the first hypothesis record, the null hypothesis asserts that `pilot-paramete-74` equals 10.70. The second record defines an alternative hypothesis for `extended-paramete-75` with the operator `!=` and a threshold of 12.40, indicating a two-sided departure from the baseline. The third record presents a null hypothesis for `integrated-paramete-76` with the operator `>`, suggesting a lower-bound claim, while the fourth record offers an alternative for `seasonal-paramete-77` with the operator `<`, pointing to an upper-bound alternative. Each hypothesis is linked to a hypothesis test and, in some cases, to a population parameter, establishing the logical bridge between the abstract claim and the concrete quantity being estimated.

## Test Statistics and Distribution Models

The test statistic translates observed data into a single numerical summary that can be compared against a theoretical distribution. The `test_statistics` table records the symbol used to denote the statistic—`extended-statisti-51`, `integrated-statisti-52`, `seasonal-statisti-53`, or `regional-statisti-54`—along with its observed value, the distribution model assumed under the null, and a distribution parameter that characterizes that model.

**Table `test_statistics`**

| id | statistic_symbol | observed_value | distribution_model | distribution_parameter | hypothesis_test_id | population_parameter_id |
|---|---|---|---|---|---|---|
| 100 | extended-statisti-51 | 24 | integrated-distribu-88 | 12.70 | 1 | 1 |
| 101 | integrated-statisti-52 | 30 | seasonal-distribu-89 | 14.40 | 2 | 2 |
| 102 | seasonal-statisti-53 | 36 | regional-distribu-90 | 16.10 | 3 | 3 |
| 103 | regional-statisti-54 | 42 | legacy-distribu-91 | 17.80 | 4 | 4 |

Test statistic `extended-statisti-51` has an observed value of 24 and follows the `integrated-distribu-88` model with a distribution parameter of 12.70. The statistic `integrated-statisti-52` yields an observed value of 30 under the `seasonal-distribu-89` model with parameter 14.40. Moving further, `seasonal-statisti-53` produces 36 under `regional-distribu-90` with parameter 16.10, and `regional-statisti-54` reaches 42 under `legacy-distribu-91` with parameter 17.80. Each statistic is tied to a specific hypothesis test and population parameter, ensuring that the numerical summary is always traceable to the data and the model that generated it.

## Population Parameters as Ground Truth

Population parameters represent the quantities of interest—the true values that practitioners seek to learn about or test. The `population_parameters` table stores the parameter symbol, a descriptive name, and the true value. The parameter names, such as `Extended Model`, `Pilot Cluster A`, `Baseline Review`, and `Distributed Initiative`, provide domain context that helps analysts interpret results.

**Table `population_parameters`**

| population_parameter_id | parameter_symbol | parameter_name | true_value | test_statistic_id | statistical_hypothesis_id |
|---|---|---|---|---|---|
| 1 | pilot-paramete-74 | Extended Model | 18.45 | 100 | 100 |
| 2 | extended-paramete-75 | Pilot Cluster A | 21.90 | 101 | 101 |
| 3 | integrated-paramete-76 | Baseline Review | 25.35 | 102 | 102 |
| 4 | seasonal-paramete-77 | Distributed Initiative | 28.80 | 103 | 103 |

Parameter `pilot-paramete-74`, labeled `Extended Model`, has a true value of 18.45. The parameter `extended-paramete-75`, associated with `Pilot Cluster A`, holds a true value of 21.90. Parameter `integrated-paramete-76`, named `Baseline Review`, registers at 25.35, while `seasonal-paramete-77`, tied to `Distributed Initiative`, stands at 28.80. Each population parameter is linked to a test statistic and a statistical hypothesis, forming the conceptual anchor that connects the abstract hypothesis to the measurable reality.

## Critical Regions and Decision Boundaries

The critical region defines the set of test statistic values that lead to rejection of the null hypothesis. It is characterized by a `region_type`—`lower tail`, `upper tail`, or `two-tailed`—along with `lower_bound`, `upper_bound`, and `critical_value` that together specify the rejection zone.

**Table `critical_regions`**

| id | region_type | lower_bound | upper_bound | critical_value | hypothesis_test_id | test_statistic_id |
|---|---|---|---|---|---|---|
| 100 | lower tail | 14 | 19 | 44 | 1 | 100 |
| 101 | upper tail | 17 | 28 | 51 | 2 | 101 |
| 102 | two-tailed | 20 | 37 | 58 | 3 | 102 |
| 103 | lower tail | 23 | 46 | 65 | 4 | 103 |

The critical region for test `TES-2761` is a `lower tail` region spanning from 14 to 19, with a critical value of 44. The region for `TES-2765` is an `upper tail` region from 17 to 28, with a critical value of 51. Test `TES-2769` employs a `two-tailed` region from 20 to 37 and a critical value of 58, while `TES-2773` uses a `lower tail` region from 23 to 46 with a critical value of 65. Each critical region is associated with a hypothesis test and a test statistic, providing the decision boundary that the observed statistic is measured against.

## Linking Tests to Hypotheses

A single hypothesis test may evaluate multiple statistical hypotheses, and the `tests_hypothesises` table captures these many-to-many relationships. Each row pairs a `hypothesis_test_id` with a `statistical_hypothesis_id`, documenting which hypotheses were considered in which test.

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

Test 1 (`TES-2761`) evaluates both hypothesis 100 and hypothesis 101. Test 2 (`TES-2765`) evaluates hypotheses 101 and 102. Test 3 (`TES-2769`) evaluates hypotheses 102 and 103. Test 4 (`TES-2773`) evaluates hypotheses 103 and 100. This overlapping structure reflects the common practice of testing multiple claims within a single experimental run, where the same data may support or refute several related hypotheses. The linkage table ensures that every hypothesis-test pairing is explicitly recorded, enabling full traceability from conclusion back to claim.

## View: Hypothesis Test with Statistical Hypothesis Detail

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

This view joins the hypothesis test record with its associated statistical hypotheses, answering the question: which hypotheses were evaluated in each test, and what are their formal specifications? For the row corresponding to test `TES-2761`, the view surfaces both the null hypothesis asserting `pilot-paramete-74 = 10.70` and the alternative hypothesis asserting `extended-paramete-75 != 12.40`. The second row, for test `TES-2765`, pairs the test with hypotheses on `extended-paramete-75` and `integrated-paramete-76`. By presenting the test metadata alongside the hypothesis operators and thresholds, this view enables analysts to verify that the hypotheses under consideration align with the research design before examining the conclusion.

## View: Hypothesis Test with Test Statistic

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

This view connects each hypothesis test to its computed test statistic, answering: what numerical summary was derived for this test, and under which distribution model? The row for test `TES-2761` shows test statistic `extended-statisti-51` with an observed value of 24, modeled under `integrated-distribu-88` with parameter 12.70. The row for test `TES-2765` links to `integrated-statisti-52` with observed value 30 under `seasonal-distribu-89` with parameter 14.40. This join is essential for auditing the numerical chain: it confirms that the statistic used in the decision matches the one computed from the data and the assumed model.

## View: Hypothesis Test with Population Parameter

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

This view ties each hypothesis test to the population parameter it investigates, answering: which ground-truth quantity is at stake in this evaluation? For test `TES-2761`, the view reveals population parameter `pilot-paramete-74` (`Extended Model`) with a true value of 18.45. For test `TES-2765`, it surfaces `extended-paramete-75` (`Pilot Cluster A`) with a true value of 21.90. By placing the test conclusion alongside the true parameter value, this view supports post-hoc assessment of whether the test correctly identified the state of nature, a key consideration in power analysis and error-rate evaluation.

## View: Hypothesis Test with Critical Region

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

This view associates each hypothesis test with its critical region, answering: what decision boundary was applied to this test? The row for test `TES-2761` shows a `lower tail` region with bounds 14 to 19 and a critical value of 44. The row for test `TES-2769` displays a `two-tailed` region spanning 20 to 37 with a critical value of 58. This join allows practitioners to verify that the observed test statistic falls within or outside the specified region, providing a transparent check on the correctness of the `reject null` or `fail to reject null` conclusion.

## View: Statistical Hypothesis with Hypothesis Test

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

This view inverts the perspective, starting from the statistical hypothesis and revealing which tests evaluated it. For hypothesis 100 (the null on `pilot-paramete-74`), the view shows it was evaluated in tests 1 and 4. For hypothesis 101 (the alternative on `extended-paramete-75`), it appears in tests 1 and 2. This cross-tabulation is valuable for understanding hypothesis reuse: the same claim may be tested under different configurations, and this view surfaces all instances where a particular hypothesis was brought to bear.

## View: Statistical Hypothesis with Population Parameter

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

This view links each statistical hypothesis to the population parameter it references, answering: which measurable quantity does this hypothesis concern? Hypothesis 100 references parameter `pilot-paramete-74` (`Extended Model`, true value 18.45). Hypothesis 103 references `seasonal-paramete-77` (`Distributed Initiative`, true value 28.80). By pairing the hypothesis operator and threshold with the parameter name and true value, this view supports direct comparison between the claimed relationship and the actual parameter, a critical step in assessing the validity of the hypothesis formulation.

## View: Test Statistic with Hypothesis Test

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

This view starts from the test statistic and reveals which hypothesis test it belongs to, answering: for which test was this statistic computed? The row for statistic `extended-statisti-51` (observed value 24) shows it was computed for test `TES-2761`. The row for `regional-statisti-54` (observed value 42) links to test `TES-2773`. This perspective is useful when reviewing a computed statistic in isolation and needing to trace it back to the test context, including the test type, significance level, and conclusion.

## View: Test Statistic with Population Parameter

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

This view connects each test statistic to the population parameter it estimates or tests, answering: which ground-truth quantity does this statistic inform? Statistic `extended-statisti-51` is linked to parameter `pilot-paramete-74` (true value 18.45). Statistic `regional-statisti-54` connects to `seasonal-paramete-77` (true value 28.80). This join is particularly valuable in sensitivity analysis, where practitioners examine how different statistics behave under the same parameter or how the same statistic performs across different parameters.

## View: Population Parameter with Test Statistic

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

This view inverts the previous relationship, starting from the population parameter and listing the test statistics that inform it. Parameter `pilot-paramete-74` (`Extended Model`) is associated with statistic `extended-statisti-51` (observed value 24). Parameter `seasonal-paramete-77` (`Distributed Initiative`) is associated with `regional-statisti-54` (observed value 42). This perspective helps analysts understand which statistics contribute evidence about each parameter, supporting aggregation of evidence across multiple tests when the same parameter is evaluated repeatedly.

## View: Population Parameter with Statistical Hypothesis

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

This view pairs each population parameter with the statistical hypotheses that reference it, answering: which claims are made about this parameter? Parameter `pilot-paramete-74` is referenced by hypothesis 100 (null, `=` 10.70) and hypothesis 103 (alternative, `<` 15.80). Parameter `extended-paramete-75` is referenced by hypothesis 101 (alternative, `!=` 12.40). This join clarifies the hypothesis landscape for each parameter, revealing whether a parameter is subject to a single claim or multiple competing claims, and enabling analysts to assess the consistency of conclusions across related hypotheses.

## View: Critical Region with Hypothesis Test

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

This view links each critical region to the hypothesis test it governs, answering: which test does this decision boundary apply to? The `lower tail` region with bounds 14 to 19 and critical value 44 applies to test `TES-2761`. The `two-tailed` region with bounds 20 to 37 and critical value 58 applies to test `TES-2769`. This perspective is essential for reviewing the decision criteria independently of the test metadata, allowing analysts to audit whether the region type and bounds are appropriate for the stated test type and significance level.

## View: Critical Region with Test Statistic

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

This view associates each critical region with the test statistic it evaluates, answering: which statistic is measured against this boundary? The `lower tail` region (14 to 19, critical value 44) is paired with statistic `extended-statisti-51` (observed value 24). The `upper tail` region (17 to 28, critical value 51) is paired with `integrated-statisti-52` (observed value 30). This join provides a direct comparison between the observed statistic and the rejection region, enabling a transparent check on whether the statistic falls within the critical zone and whether the recorded conclusion is consistent with that comparison.

## Synthesis

The hypothesis testing ecosystem is defined by the interlocking relationships between tests, hypotheses, statistics, parameters, and critical regions. Each hypothesis test serves as a decision node that aggregates information from multiple sources: the statistical hypotheses that frame the claims, the test statistic that summarizes the data, the population parameter that represents the truth, and the critical region that defines the rejection boundary. The many-to-many linkage between tests and hypotheses, captured in the `tests_hypothesises` table, reflects the reality that a single experiment often evaluates multiple claims simultaneously. The twelve analytical views provide complementary perspectives on these relationships, enabling practitioners to navigate the data from any entry point—whether starting from a test, a hypothesis, a statistic, a parameter, or a critical region—and trace the full chain of evidence to the recorded conclusion. This structure supports rigorous audit trails, facilitates post-hoc error analysis, and ensures that every decision can be reconstructed from the underlying records.