# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Hypothesis Test
- **genus**: `bfo:0000015`
- **definition**: A formal statistical procedure used to evaluate a claim about a population parameter by comparing observed data against a null hypothesis.
- **attributes**: testIdentifier, testType, significanceLevel, actualSignificanceLevel, conclusion, conclusionText
- **relations**: tests→StatisticalHypothesis, uses→TestStatistic, appliesTo→PopulationParameter, determines→CriticalRegion

## Statistical Hypothesis
- **genus**: `bfo:0000015`
- **definition**: A formal statement regarding the value of a population parameter, categorized as either a null hypothesis (assumed true) or an alternative hypothesis (contradicting the null).
- **attributes**: hypothesisType, parameterSymbol, operator, thresholdValue
- **relations**: isTestedIn→HypothesisTest, concerns→PopulationParameter

## Test Statistic
- **genus**: `bfo:0000015`
- **definition**: A numerical value calculated from sample data used to determine whether to reject the null hypothesis.
- **attributes**: statisticSymbol, observedValue, distributionModel, distributionParameter
- **relations**: isUsedIn→HypothesisTest, measures→PopulationParameter

## Population Parameter
- **genus**: `bfo:0000015`
- **definition**: A numerical characteristic of a population, such as a probability or proportion, that is the subject of statistical inference.
- **attributes**: parameterSymbol, parameterName, trueValue
- **relations**: isMeasuredBy→TestStatistic, isTestedIn→StatisticalHypothesis

## Critical Region
- **genus**: `bfo:0000015`
- **definition**: A set of values for the test statistic that leads to the rejection of the null hypothesis, determined by the significance level.
- **attributes**: regionType, lowerBound, upperBound, criticalValue
- **relations**: isDefinedBy→HypothesisTest, appliesTo→TestStatistic
