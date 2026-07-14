# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## ESG Metric
- **genus**: `cco:ont00000995`
- **definition**: A quantifiable indicator or measurement used to assess Environmental, Social, and Governance performance and compliance.
- **attributes**: metric_id, metric_name, standard_framework, category, unit_of_measure, is_material
- **relations**: reportedIn→ESG_Report, measuredBy→ESG_Measurement

## ESG Measurement
- **genus**: `bfo:0000015`
- **definition**: A specific process or activity of collecting, recording, and quantifying data for a particular ESG metric at a given time.
- **attributes**: measurement_id, measurement_date, numeric_value, status, data_source
- **relations**: quantifies→ESG_Metric, conductedBy→ESG_Advisor

## ESG Report
- **genus**: `cco:ont00000958`
- **definition**: A formal document or dataset presenting an organization's ESG performance, metrics, and strategic analysis to stakeholders.
- **attributes**: report_id, report_title, publication_date, reporting_period_start, reporting_period_end, compliance_status
- **relations**: containsMetric→ESG_Metric, authoredBy→ESG_Advisor, governedBy→ESG_Strategy

## ESG Strategy
- **genus**: `cco:ont00000995`
- **definition**: A designed plan, policy, or set of commitments outlining an organization's approach to achieving specific ESG goals and standards.
- **attributes**: strategy_id, strategy_name, target_year, status, alignment_framework
- **relations**: targetsMetric→ESG_Metric, implementedBy→ESG_Advisor, monitors→Policy_Change

## Policy Change
- **genus**: `bfo:0000015`
- **definition**: A legislative, regulatory, or governmental update affecting ESG standards, reporting requirements, or operational compliance.
- **attributes**: policy_id, policy_title, issuing_jurisdiction, effective_date, impact_level
- **relations**: affects→ESG_Strategy, triggers→ESG_Measurement, analyzedBy→ESG_Advisor

## ESG Advisor
- **genus**: `bfo:0000002`
- **definition**: A human agent responsible for providing subject matter expertise, strategic guidance, and analysis on ESG matters within the organization.
- **attributes**: advisor_id, advisor_name, designation, years_experience, employment_status
- **relations**: leads→ESG_Strategy, authored→ESG_Report, conducts→ESG_Measurement, monitors→Policy_Change
