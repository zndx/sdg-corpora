# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## ESG Metric
- **genus**: `cco:ont00000995`
- **definition**: A quantifiable measure of environmental, social, or governance performance tracked by the organization.
- **attributes**: metricId, metricName, category, standard, unitOfMeasure, isMaterial
- **relations**: reportedIn→ESG_Report, monitoredBy→ESG_Advisor

## ESG Report
- **genus**: `cco:ont00000995`
- **definition**: A formal document detailing the organization's ESG performance, material issues, and strategic initiatives.
- **attributes**: reportId, reportTitle, publicationDate, reportingPeriodStart, reportingPeriodEnd, status, sectorClassification
- **relations**: containsMetric→ESG_Metric, authoredBy→ESG_Advisor, approvedBy→Executive_Leader

## ESG Advisor
- **genus**: `bfo:0000002`
- **definition**: A staff member responsible for providing subject matter expertise, strategic guidance, and analysis on ESG matters.
- **attributes**: employeeId, jobTitle, department, salaryMin, salaryMax, contractType, startDate
- **relations**: reportsTo→Executive_Leader, monitors→ESG_Metric, authored→ESG_Report, specializesIn→ESG_Standard

## Executive Leader
- **genus**: `bfo:0000002`
- **definition**: A senior organizational role responsible for strategic oversight, approval of major reports, and cross-functional leadership.
- **attributes**: employeeId, jobTitle, department, hasDottedLineTo
- **relations**: supervises→ESG_Advisor, approves→ESG_Report, leads→ESG_Strategy

## ESG Strategy
- **genus**: `bfo:0000015`
- **definition**: A planned set of actions, programs, and initiatives designed to achieve specific environmental, social, and governance goals.
- **attributes**: strategyId, strategyName, status, targetCompletionDate, scope
- **relations**: drives→ESG_Metric, implementedBy→ESG_Advisor, oversightedBy→Executive_Leader, evaluates→ESG_Report

## ESG Standard
- **genus**: `cco:ont00000958`
- **definition**: A recognized framework, set of guidelines, or regulatory requirement used to structure ESG reporting and compliance.
- **attributes**: standardId, standardName, issuingBody, effectiveDate, jurisdiction
- **relations**: guides→ESG_Metric, monitoredBy→ESG_Advisor, compliesWith→ESG_Report
