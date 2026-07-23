CREATE TABLE caregiver_roles (
  id VARCHAR(255),
  role_id VARCHAR(255),
  adult_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"parenting_role"}';

CREATE TABLE doc_event (
  id VARCHAR(255),
  doc_event_id VARCHAR(255),
  system_id VARCHAR(255),
  encounter_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clinical_documentation_activity"}';

CREATE TABLE pdf_export_job (
  id VARCHAR(255),
  export_job_id VARCHAR(255),
  src_scan_id VARCHAR(255),
  output_doc_id VARCHAR(255),
  initiator_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"pdf_export_process"}';

CREATE TABLE lect_sessions (
  id VARCHAR(255),
  lect_id VARCHAR(255),
  resource_id VARCHAR(255),
  code_ref VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"lecture_session"}';

CREATE TABLE young_res_roles (
  id VARCHAR(255),
  young_res_role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"young_researcher_role"}';

CREATE TABLE library_role_assignment (
  id VARCHAR(255),
  role_id VARCHAR(255),
  student_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"library_student_assistant_role"}';

CREATE TABLE dispenser_sites (
  id VARCHAR(255),
  stand_id VARCHAR(255),
  topping_id VARCHAR(255),
  location_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"condiment_station"}';

CREATE TABLE child_designation (
  id VARCHAR(255),
  designation_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"indigenous_child_role"}';

CREATE TABLE police_roles (
  id VARCHAR(255),
  role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"police_officer_role"}';

CREATE TABLE web_project (
  id VARCHAR(255),
  project_id VARCHAR(255),
  target_platform_id VARCHAR(255),
  tech_used_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"responsive_website_development"}';

CREATE TABLE campaign_channel_map (
  id VARCHAR(255),
  campaign_link_id VARCHAR(255),
  online_channel_id VARCHAR(255),
  offline_channel_id VARCHAR(255),
  unit_code VARCHAR(255),
  campaign_title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"campaign_coordination"}';

CREATE TABLE election_records (
  id VARCHAR(255),
  election_id VARCHAR(255),
  option_id VARCHAR(255),
  member_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"benefit_option_election"}';

CREATE TABLE pension_election (
  id VARCHAR(255),
  option_id VARCHAR(255),
  method VARCHAR(255),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"retirement_benefit_option"}';

CREATE TABLE marital_cert (
  id VARCHAR(255),
  marital_cert_id VARCHAR(255),
  marital_status_id VARCHAR(255),
  consent_reason_cd VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"marital_status_certification"}';

CREATE TABLE benefit_election (
  id VARCHAR(255),
  designation_id VARCHAR(255),
  review_cycle_days INTEGER,
  scope VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"beneficiary_designation"}';

CREATE TABLE clinical_prog (
  id VARCHAR(255),
  prog_id VARCHAR(255),
  tool_id VARCHAR(255),
  metric_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clinical_quality_improvement_program"}';

CREATE TABLE track_req (
  id VARCHAR(255),
  track_req_id VARCHAR(255),
  student_id VARCHAR(255),
  start_date DATE,
  mandatory BOOLEAN,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"law_and_society_track_requirement"}';

CREATE TABLE officer_role (
  id VARCHAR(255),
  officer_id VARCHAR(255),
  assignment_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"senior_animal_services_officer_role"}';

CREATE TABLE control_activity (
  id VARCHAR(255),
  activity_id VARCHAR(255),
  program_id VARCHAR(255),
  street_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"vector_control_activity"}';

CREATE TABLE test_run (
  id VARCHAR(255),
  test_run_id VARCHAR(255),
  protocol_id VARCHAR(255),
  material_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"specification_testing_event"}';

CREATE TABLE math_session (
  id VARCHAR(255),
  math_session_id VARCHAR(255),
  topic_id VARCHAR(255),
  student_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"mathematical_learning_process"}';

CREATE TABLE data_ctrl_role (
  id VARCHAR(255),
  ctrl_role_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  func_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"data_controller_role"}';

CREATE TABLE data_processing_log (
  id VARCHAR(255),
  proc_act_id VARCHAR(255),
  operation_id VARCHAR(255),
  target_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"personal_data_processing_activity"}';

CREATE TABLE strap_fix_evt (
  id VARCHAR(255),
  fix_evt_id VARCHAR(255),
  strap_ref VARCHAR(255),
  floor_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"strap_fixing_process"}';

CREATE TABLE ird_role (
  id VARCHAR(255),
  role_id VARCHAR(255),
  activity_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"investor_relations_director_role"}';

CREATE TABLE regulatory_filing (
  id VARCHAR(255),
  filing_id VARCHAR(255),
  regulator_id VARCHAR(255),
  report_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"corporate_information_disclosure_process"}';

CREATE TABLE health_record (
  id VARCHAR(255),
  record_id VARCHAR(255),
  condition_id VARCHAR(255),
  client_id VARCHAR(255),
  encoding_type VARCHAR(255),
  record_title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"personal_health_record"}';

CREATE TABLE cc_role (
  id VARCHAR(255),
  cc_role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"chief_compliance_officer_role"}';

CREATE TABLE disclosure_case (
  id VARCHAR(255),
  case_id VARCHAR(255),
  channel_id VARCHAR(255),
  submitter_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"protected_disclosure_process"}';

CREATE TABLE discipline_cases (
  id VARCHAR(255),
  case_id VARCHAR(255),
  asset_id VARCHAR(255),
  person_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"improper_conduct_event"}';

CREATE TABLE admin_role (
  id VARCHAR(255),
  role_id VARCHAR(255),
  staff_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"college_official_role"}';

CREATE TABLE comp_coord (
  id VARCHAR(255),
  coord_id VARCHAR(255),
  acad_rec_id VARCHAR(255),
  elig_check_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023","cco:Role"],"family":"catalog","is_complex":true,"template_id":"compliance_coordinator_role"}';

CREATE TABLE credit_cert (
  id VARCHAR(255),
  credit_cert_id VARCHAR(255),
  term_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015","bfo:0000057"],"family":"catalog","is_complex":true,"template_id":"credit_hour_certification_process"}';

CREATE TABLE athlete_monitor_assignments (
  id VARCHAR(255),
  assign_id VARCHAR(255),
  staff_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"athletic_attendant_role"}';

CREATE TABLE agenda (
  id VARCHAR(255),
  agenda_id VARCHAR(255),
  talk_id VARCHAR(255),
  title VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"conference_programme"}';

CREATE TABLE sci_org (
  id VARCHAR(255),
  org_id VARCHAR(255),
  journal_id VARCHAR(255),
  meeting_id VARCHAR(255),
  created_date DATE,
  mime_type VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"catalog","is_complex":true,"template_id":"scientific_organization"}';

CREATE TABLE donor_registry (
  id VARCHAR(255),
  donor_id VARCHAR(255),
  contact_ref VARCHAR(255),
  display_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"donor_profile"}';

CREATE TABLE donation_txn (
  id VARCHAR(255),
  donation_id VARCHAR(255),
  donor_id VARCHAR(255),
  purpose_id VARCHAR(255),
  description VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"donation_transaction_record"}';

CREATE TABLE mem_transfer (
  id VARCHAR(255),
  transfer_id VARCHAR(255),
  mem_id VARCHAR(255),
  assignee_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"membership_transfer_process"}';

CREATE TABLE emp_retention_roles (
  id VARCHAR(255),
  retention_role_id VARCHAR(255),
  inheres_in VARCHAR(255),
  transfer_auth_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"retaining_employee_role"}';

CREATE TABLE mem_xfer_req (
  id VARCHAR(255),
  xfer_req_id VARCHAR(255),
  submitting_dept_id VARCHAR(255),
  char_enc VARCHAR(255),
  lang_cd VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"membership_transfer_request"}';

CREATE TABLE care_plan (
  id VARCHAR(255),
  care_plan_id VARCHAR(255),
  student_id VARCHAR(255),
  intervention_id VARCHAR(255),
  format_code VARCHAR(255),
  plan_title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"education_health_care_plan"}';

CREATE TABLE stu_prog_assignment (
  id VARCHAR(255),
  enroll_id VARCHAR(255),
  student_id VARCHAR(255),
  program_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"educational_placement_process"}';

CREATE TABLE prov_chg_req (
  id VARCHAR(255),
  swap_id VARCHAR(255),
  cust_id VARCHAR(255),
  vendor_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"provider_change_request_process"}';

CREATE TABLE ozone_session (
  id VARCHAR(255),
  ozone_session_id VARCHAR(255),
  gas_blend_id VARCHAR(255),
  procedure_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ozone_therapy_session"}';

CREATE TABLE cloud_storage_assignments (
  id VARCHAR(255),
  alloc_id VARCHAR(255),
  student_id VARCHAR(255),
  volume_id VARCHAR(255),
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"cloud_storage_allocation"}';

CREATE TABLE meas_capab (
  id VARCHAR(255),
  capab_id VARCHAR(255),
  param_id VARCHAR(255),
  range_id VARCHAR(255),
  label VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"measurement_capability"}';

CREATE TABLE sec_incidents (
  id VARCHAR(255),
  sec_inc_id VARCHAR(255),
  target_net_id VARCHAR(255),
  impact_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"cybersecurity_incident"}';

CREATE TABLE med_inv (
  id VARCHAR(255),
  inv_rec_id VARCHAR(255),
  med_asset_id VARCHAR(255),
  data_fmt VARCHAR(255),
  item_name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"device_inventory_record"}';

CREATE TABLE nurse_role (
  id VARCHAR(255),
  nurse_id VARCHAR(255),
  provider_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"community_learning_disability_nurse"}';

CREATE TABLE role_profiles (
  id VARCHAR(255),
  profile_id VARCHAR(255),
  role_id VARCHAR(255),
  code_sys VARCHAR(255),
  label_txt VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"role_perception"}';

CREATE TABLE ct_radiologist (
  id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"cardiothoracic_radiologist_role"}';

CREATE TABLE imaging_core (
  id VARCHAR(255),
  core_id VARCHAR(255),
  rel_0000115 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"preclinical_imaging_core"}';

CREATE TABLE job_role (
  id VARCHAR(255),
  job_role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"general_manager_role"}';

CREATE TABLE qual_sessions (
  id VARCHAR(255),
  qual_id VARCHAR(255),
  session_id VARCHAR(255),
  practice_type VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"quality_practice"}';

CREATE TABLE dns_abuse_case (
  id VARCHAR(255),
  case_id VARCHAR(255),
  incident_id VARCHAR(255),
  registry_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"dns_abuse_study"}';

CREATE TABLE abuse_policy (
  id VARCHAR(255),
  policy_id VARCHAR(255),
  abuse_event_ref VARCHAR(255),
  program_ref VARCHAR(255),
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"safeguard_measure"}';

CREATE TABLE esg_fund_portfolio (
  id VARCHAR(255),
  fund_portfolio_id VARCHAR(255),
  asset_id VARCHAR(255),
  portfolio_label VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"responsible_investment_fund_collection"}';

CREATE TABLE corp_reputation_impact (
  id VARCHAR(255),
  rep_impact_id VARCHAR(255),
  decision_id VARCHAR(255),
  encoding_type VARCHAR(255),
  display_label VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"corporate_reputation_influence_situation"}';

CREATE TABLE md_sim_run (
  id VARCHAR(255),
  md_sim_id VARCHAR(255),
  software_id VARCHAR(255),
  target_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"molecular_dynamics_simulation_process"}';

CREATE TABLE sme_survey_matches (
  id VARCHAR(255),
  dataset_id VARCHAR(255),
  source_id VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"matched_sme_dataset"}';

CREATE TABLE gov_process (
  id VARCHAR(255),
  process_id VARCHAR(255),
  budget_id VARCHAR(255),
  kpi_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"it_governance_process"}';

CREATE TABLE business_needs (
  id VARCHAR(255),
  need_id VARCHAR(255),
  requestor_id VARCHAR(255),
  format_code VARCHAR(255),
  description VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"stakeholder_need"}';

CREATE TABLE legal_matter (
  id VARCHAR(255),
  matter_id VARCHAR(255),
  client_id VARCHAR(255),
  document_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"legal_advocacy_process"}';

CREATE TABLE prog_req (
  id VARCHAR(255),
  req_id VARCHAR(255),
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"academic_program_requirement"}';

CREATE TABLE cov_param (
  id VARCHAR(255),
  cov_param_id VARCHAR(255),
  method_code VARCHAR(255),
  error_margin DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"sequencing_coverage_parameter"}';

CREATE TABLE genomic_analysis_program (
  id VARCHAR(255),
  program_id VARCHAR(255),
  patient_id VARCHAR(255),
  model_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clinical_genomic_analysis_program"}';

CREATE TABLE genomic_test (
  id VARCHAR(255),
  seq_test_id VARCHAR(255),
  sample_id VARCHAR(255),
  platform_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"genomic_sequencing_test"}';

CREATE TABLE health_profile (
  id VARCHAR(255),
  profile_id VARCHAR(255),
  genomic_ref VARCHAR(255),
  imaging_ref VARCHAR(255),
  display_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"personal_health_profile"}';

CREATE TABLE concept_process (
  id VARCHAR(255),
  process_id VARCHAR(255),
  source_concept_id VARCHAR(255),
  target_concept_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"concept_construction_process"}';

CREATE TABLE render_output (
  id VARCHAR(255),
  render_id VARCHAR(255),
  concretizes VARCHAR(255) NOT NULL,
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"rendered_animation_artifact"}';

CREATE TABLE social_media_admin (
  id VARCHAR(255),
  admin_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"social_media_account_administrator"}';

CREATE TABLE social_reg (
  id VARCHAR(255),
  reg_id VARCHAR(255),
  login_cred_id VARCHAR(255),
  officer_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"social_media_account_registration"}';

CREATE TABLE exec_position (
  id VARCHAR(255),
  exec_role_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"chief_financial_officer_role"}';

CREATE TABLE fin_plan_cycle (
  id VARCHAR(255),
  plan_cycle_id VARCHAR(255),
  exec_team_id VARCHAR(255),
  report_ref VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_strategy_and_planning_process"}';

CREATE TABLE exec_team (
  id VARCHAR(255),
  exec_team_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  roster_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"executive_team_roster"}';

CREATE TABLE risk_accept_eval (
  id VARCHAR(255),
  eval_risk_id VARCHAR(255),
  risk_metric_id VARCHAR(255),
  sys_cond_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"risk_informed_acceptability_evaluation"}';

CREATE TABLE certified_tester (
  id VARCHAR(255),
  tester_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"qualified_source_testing_individual"}';

CREATE TABLE cems_eval (
  id VARCHAR(255),
  eval_id VARCHAR(255),
  monitor_id VARCHAR(255),
  method_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"continuous_emissions_monitoring_evaluation"}';

CREATE TABLE field_equip_coord (
  id VARCHAR(255),
  equip_coord_id VARCHAR(255),
  equip_ref VARCHAR(255),
  op_ref VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"field_equipment_coordination"}';

CREATE TABLE test_unit_catalog (
  id VARCHAR(255),
  catalog_id VARCHAR(255),
  emission_source_id VARCHAR(255),
  record_format VARCHAR(255),
  data_encoding VARCHAR(255),
  language_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"supervised_test_unit_catalog"}';

CREATE TABLE treatment_record (
  id VARCHAR(255),
  treatment_id VARCHAR(255),
  child_id VARCHAR(255),
  outcome_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"malnutrition_treatment_process"}';

CREATE TABLE stat_test (
  id VARCHAR(255),
  hypo_test_id VARCHAR(255),
  test_stat_id VARCHAR(255),
  alpha_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"hypothesis_test"}';

CREATE TABLE staff_smm_assignments (
  id VARCHAR(255),
  role_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"staff_social_media_account_administrator_role"}';

CREATE TABLE social_platform (
  id VARCHAR(255),
  platform_id VARCHAR(255),
  service_type_id VARCHAR(255),
  method VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"social_networking_service_platform"}';

CREATE TABLE enc_dim_spec (
  id VARCHAR(255),
  dim_spec_id VARCHAR(255),
  width_mm VARCHAR(255),
  height_mm VARCHAR(255),
  unit_cd VARCHAR(255),
  spec_label VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"back_shell_dimension_spec"}';

CREATE TABLE course (
  id VARCHAR(255),
  course_id VARCHAR(255),
  rel_0000178 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"menu_course"}';

CREATE TABLE staff_assignments (
  id VARCHAR(255),
  assign_id VARCHAR(255),
  staff_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"service_staff_role"}';

CREATE TABLE flood_eval (
  id VARCHAR(255),
  assessment_id VARCHAR(255),
  asset_id VARCHAR(255),
  data_source_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"flood_asset_condition_assessment"}';

CREATE TABLE auth_role_assign (
  id VARCHAR(255),
  auth_role_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  transfer_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"record_authorization_role"}';

CREATE TABLE reportable_disease_req (
  id VARCHAR(255),
  notify_req_id VARCHAR(255),
  disclosure_subject VARCHAR(255),
  recipient_facility VARCHAR(255),
  valid_from DATE,
  is_required BOOLEAN,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"communicable_disease_notification_requirement"}';

CREATE TABLE youth_care_sum (
  id VARCHAR(255),
  care_summary_id VARCHAR(255),
  health_status VARCHAR(255),
  format_code VARCHAR(255),
  data_encoding VARCHAR(255),
  summary_label VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"youth_health_care_summary"}';

CREATE TABLE mentor_prog (
  id VARCHAR(255),
  program_id VARCHAR(255),
  guided_role VARCHAR(255),
  coached_role VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"mentorship_program"}';

CREATE TABLE student_role (
  id VARCHAR(255),
  role_id VARCHAR(255),
  student_id VARCHAR(255),
  venture_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"student_entrepreneur_role"}';

CREATE TABLE program_track (
  id VARCHAR(255),
  program_id VARCHAR(255),
  participant_id VARCHAR(255),
  focus_area VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"incubation_program"}';

CREATE TABLE study_program (
  id VARCHAR(255),
  program_id VARCHAR(255),
  course_id VARCHAR(255),
  career_path VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"academic_curriculum_program"}';

CREATE TABLE emp_role_assignment (
  id VARCHAR(255),
  position_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"retail_leadership_team_member"}';

CREATE TABLE team_eval_event (
  id VARCHAR(255),
  eval_event_id VARCHAR(255),
  staff_id VARCHAR(255),
  result_id VARCHAR(255),
  objective_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"team_assessment_event"}';

CREATE TABLE abuse_flags (
  id VARCHAR(255),
  indicator_id VARCHAR(255),
  physical_form VARCHAR(255),
  uncertainty DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"abuse_indicator"}';

CREATE TABLE safeguard_proc (
  id VARCHAR(255),
  safeguard_proc_id VARCHAR(255),
  child_prot_team_id VARCHAR(255),
  referral_agency_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"safeguarding_report_process"}';

CREATE TABLE legal_adv_role (
  id VARCHAR(255),
  adv_role_id VARCHAR(255),
  legal_prof_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"legal_service_advertiser_role"}';

CREATE TABLE txn_log (
  id VARCHAR(255),
  txn_id VARCHAR(255),
  giver_id VARCHAR(255),
  value VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"donation_event"}';

CREATE TABLE growth_campaign (
  id VARCHAR(255),
  campaign_id VARCHAR(255),
  region_id VARCHAR(255),
  plan_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"international_growth_initiative"}';

CREATE TABLE promo_schedule (
  id VARCHAR(255),
  promo_id VARCHAR(255),
  min_order_qty VARCHAR(255),
  product_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"promotional_calendar_order"}';

CREATE TABLE perf_eval (
  id VARCHAR(255),
  eval_id VARCHAR(255),
  system_id VARCHAR(255),
  clinician_id VARCHAR(255),
  metric_code VARCHAR(255),
  eval_label VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"clinical_performance_data_evaluation"}';

CREATE TABLE qi_presentation (
  id VARCHAR(255),
  presentation_id VARCHAR(255),
  clinical_topic_id VARCHAR(255),
  framework_id VARCHAR(255),
  file_format VARCHAR(255),
  title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"quality_improvement_presentation"}';

CREATE TABLE energy_appliance (
  id VARCHAR(255),
  appliance_id VARCHAR(255),
  component_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"energy_efficient_appliance"}';

CREATE TABLE anim_seq_build (
  id VARCHAR(255),
  build_id VARCHAR(255),
  timeline_id VARCHAR(255),
  engine_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"animation_sequence_creation"}';

CREATE TABLE case_review (
  id VARCHAR(255),
  case_review_id VARCHAR(255),
  data_collection_id VARCHAR(255),
  analysis_method_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"independent_committee_investigation"}';

CREATE TABLE forensic_analysis (
  id VARCHAR(255),
  investigation_id VARCHAR(255),
  analyst_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"digital_forensic_analysis"}';

CREATE TABLE tech_service (
  id VARCHAR(255),
  tech_service_id VARCHAR(255),
  provider_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"legal_tech_service_provision"}';

CREATE TABLE t_wavelength_variant (
  id VARCHAR(255),
  wavelength_variant VARCHAR(255),
  930nm_variant VARCHAR(255),
  940nm_variant VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000040"],"family":"catalog","is_complex":true,"template_id":"wavelength_variant"}';

CREATE TABLE auth_rep_role (
  id VARCHAR(255),
  rep_role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"authorized_representative_role"}';

CREATE TABLE advice_sessions (
  id VARCHAR(255),
  advice_id VARCHAR(255),
  product_id VARCHAR(255),
  client_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_product_advice_service"}';

CREATE TABLE disclosure_docs (
  id VARCHAR(255),
  disclosure_id VARCHAR(255),
  fund_id VARCHAR(255),
  doc_format VARCHAR(255),
  title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"product_disclosure_statement"}';

CREATE TABLE dev_rep_role (
  id VARCHAR(255),
  dev_rep_role_id VARCHAR(255),
  agent_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"developer_representative_role"}';

CREATE TABLE final_inspection (
  id VARCHAR(255),
  inspection_id VARCHAR(255),
  asset_id VARCHAR(255),
  requirement_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"final_construction_inspection_process"}';

CREATE TABLE checklist_stage (
  id VARCHAR(255),
  checklist_id VARCHAR(255),
  item_ref VARCHAR(255),
  char_set VARCHAR(255),
  checklist_name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"stage_5_checklist"}';

CREATE TABLE role_assignment (
  id VARCHAR(255),
  role_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"device_expert_role"}';

CREATE TABLE supplier_assessment (
  id VARCHAR(255),
  survey_id VARCHAR(255),
  vendor_id VARCHAR(255),
  trend_id VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"supplier_landscape_survey"}';

CREATE TABLE permit_oversight (
  id VARCHAR(255),
  oversight_id VARCHAR(255),
  permit_decision_id VARCHAR(255),
  installation_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"environmental_permitting_supervision_activity"}';

CREATE TABLE fin_plan (
  id VARCHAR(255),
  plan_id VARCHAR(255),
  org_unit_id VARCHAR(255),
  strategy_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_planning_process"}';

CREATE TABLE leadership_reqs (
  id VARCHAR(255),
  min_years VARCHAR(255),
  created_at TIMESTAMP,
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"leadership_experience_requirement"}';

CREATE TABLE fin_report (
  id VARCHAR(255),
  report_id VARCHAR(255),
  financial_status_id VARCHAR(255),
  financial_strategy_id VARCHAR(255),
  content_format VARCHAR(255),
  title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"financial_report_artifact"}';

CREATE TABLE exec_dir_role (
  id VARCHAR(255),
  exec_role_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023","bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"executive_director_role"}';

CREATE TABLE venue_audit (
  id VARCHAR(255),
  venue_audit_id VARCHAR(255),
  facility_id VARCHAR(255),
  protocol_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015","bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"venue_operations_oversight"}';

CREATE TABLE mgr_roles (
  id VARCHAR(255),
  mgr_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"registered_manager_role"}';

CREATE TABLE weight_mgmt_exec (
  id VARCHAR(255),
  exec_id VARCHAR(255),
  patient_id VARCHAR(255),
  advice_flag VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"weight_reduction_service_execution"}';

CREATE TABLE clinical_monitor_sys (
  id VARCHAR(255),
  monitor_sys_id VARCHAR(255),
  protocol_ref VARCHAR(255),
  metric_ref VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"clinical_efficacy_monitoring_system"}';

CREATE TABLE patient_feedback (
  id VARCHAR(255),
  feedback_id VARCHAR(255),
  quality_notes VARCHAR(255),
  service_context VARCHAR(255),
  feedback_title VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"patient_feedback_record"}';

CREATE TABLE ambassador_assignments (
  id VARCHAR(255),
  ambassador_role_id VARCHAR(255),
  physician_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023","cco:Role"],"family":"catalog","is_complex":true,"template_id":"young_physician_ambassador_role"}';

CREATE TABLE young_phys_elig (
  id VARCHAR(255),
  elig_rule_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE","bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"young_physician_eligibility_constraint"}';

CREATE TABLE cme_session (
  id VARCHAR(255),
  session_id VARCHAR(255),
  topic_id VARCHAR(255),
  goal_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"cme_seminar"}';

CREATE TABLE crisis_event (
  id VARCHAR(255),
  crisis_id VARCHAR(255),
  macro_trigger VARCHAR(255),
  phase_code VARCHAR(255),
  systemic_flag VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_crisis_event"}';

CREATE TABLE tag_event (
  id VARCHAR(255),
  event_id VARCHAR(255),
  target_id VARCHAR(255),
  tag_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"social_tagging_process"}';

CREATE TABLE expedition (
  id VARCHAR(255),
  expedition_id VARCHAR(255),
  crew_id VARCHAR(255),
  equipment_id VARCHAR(255),
  region_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"arctic_expedition"}';

CREATE TABLE var_margin_rules (
  id VARCHAR(255),
  vm_rule_id VARCHAR(255),
  collateral_process_id VARCHAR(255),
  compliance_audit_id VARCHAR(255),
  mandatory BOOLEAN,
  review_interval_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"variation_margin_rule_set"}';

CREATE TABLE reg_role (
  id VARCHAR(255),
  role_code VARCHAR(255),
  rel_0000054 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"recognition_manager_role"}';

CREATE TABLE grp_surcharge_rule (
  id VARCHAR(255),
  grp_surcharge_id VARCHAR(255),
  dimension_kind VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"small_group_surcharge_rule"}';

CREATE TABLE svc_rate_config (
  id VARCHAR(255),
  rate_pct VARCHAR(255),
  uncertainty DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"service_charge_rate"}';

CREATE TABLE emp_survey (
  id VARCHAR(255),
  survey_id VARCHAR(255),
  culture_dim_id VARCHAR(255),
  health_metric_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"employee_feedback_survey"}';

CREATE TABLE culture_dim (
  id VARCHAR(255),
  dim_id VARCHAR(255),
  target_attr VARCHAR(255),
  method VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"workplace_culture_dimension"}';

CREATE TABLE award_cert (
  id VARCHAR(255),
  award_id VARCHAR(255),
  awarding_org_id VARCHAR(255),
  compliance_std_id VARCHAR(255),
  valid_from DATE,
  scope VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"top_workplace_award"}';

CREATE TABLE corp_membership (
  id VARCHAR(255),
  corp_mem_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"b_corporation_member"}';

CREATE TABLE healer_roles (
  id VARCHAR(255),
  healer_role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"traditional_religious_healer_role"}';

CREATE TABLE ritual_event (
  id VARCHAR(255),
  rite_id VARCHAR(255),
  sacred_item_id VARCHAR(255),
  target_state VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ritual_act_to_restore_order"}';

CREATE TABLE ceremony (
  id VARCHAR(255),
  ceremony_id VARCHAR(255),
  participant_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ancestor_veneration_ceremony"}';

CREATE TABLE adult_parent_role (
  id VARCHAR(255),
  parent_role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000002","bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"disabled_adult_parent_role"}';

CREATE TABLE pool_staff_roles (
  id VARCHAR(255),
  staff_role_id VARCHAR(255),
  staff_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"municipal_swimming_pool_assistant_manager"}';

CREATE TABLE pool_shift (
  id VARCHAR(255),
  shift_id VARCHAR(255),
  lifeguard_id VARCHAR(255),
  pool_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"municipal_pool_operations_management_activity"}';

CREATE TABLE water_qual_runs (
  id VARCHAR(255),
  monitor_run_id VARCHAR(255),
  ref_standard VARCHAR(255),
  target_param VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"water_quality_monitoring_activity"}';

CREATE TABLE temp_op_limits (
  id VARCHAR(255),
  limit_id VARCHAR(255),
  method VARCHAR(255),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"thermal_operating_range_constraint"}';

CREATE TABLE attendance_log (
  id VARCHAR(255),
  attendance_id VARCHAR(255),
  student_id VARCHAR(255),
  status_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"attendance_tracking_process"}';

CREATE TABLE course_catalog (
  id VARCHAR(255),
  course_id VARCHAR(255),
  assessment_ref VARCHAR(255),
  learner_id VARCHAR(255),
  format_code VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"educational_course"}';

CREATE TABLE assessment_std (
  id VARCHAR(255),
  std_id VARCHAR(255),
  method_id VARCHAR(255),
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"assessment_standard"}';

CREATE TABLE analysis_case (
  id VARCHAR(255),
  case_id VARCHAR(255),
  threat_ref VARCHAR(255),
  assigned_officer VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"intelligence_analysis_process"}';

CREATE TABLE staff_position (
  id VARCHAR(255),
  role_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"faculty_member_role"}';

CREATE TABLE admin_role_assign (
  id VARCHAR(255),
  role_code VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"student_conduct_administrator_role"}';

CREATE TABLE exec_role (
  id VARCHAR(255),
  exec_role_id VARCHAR(255),
  exec_function_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"executive_officer_role"}';

CREATE TABLE audit_roles (
  id VARCHAR(255),
  audit_role_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"board_of_auditors_role"}';

CREATE TABLE mgmt_meeting (
  id VARCHAR(255),
  meeting_id VARCHAR(255),
  attendee_id VARCHAR(255),
  decision_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"management_meeting_process"}';

CREATE TABLE audit_div (
  id VARCHAR(255),
  audit_div_id VARCHAR(255),
  cert_auditor_id VARCHAR(255),
  division_role VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"internal_auditing_division"}';

CREATE TABLE fine_events (
  id VARCHAR(255),
  event_id VARCHAR(255),
  owner_id VARCHAR(255),
  violation_id VARCHAR(255),
  charset VARCHAR(255),
  description VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"fine_assessment_event"}';

CREATE TABLE insp_reports (
  id VARCHAR(255),
  report_id VARCHAR(255),
  event_id VARCHAR(255),
  format_code VARCHAR(255),
  doc_title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"inspection_report"}';

CREATE TABLE gov_role_2 (
  id VARCHAR(255),
  position_id VARCHAR(255),
  dept_id VARCHAR(255),
  function_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023","cco:Agent","cco:Organization"],"family":"catalog","is_complex":true,"template_id":"secretary_role"}';

CREATE TABLE evac_kit (
  id VARCHAR(255),
  evac_id VARCHAR(255),
  supply_id VARCHAR(255),
  deploy_type VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"emergency_supplies_kit"}';

CREATE TABLE evacuation_notice (
  id VARCHAR(255),
  notice_id VARCHAR(255),
  hazard_id VARCHAR(255),
  authority_id VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"evacuation_instruction"}';

CREATE TABLE research_activity (
  id VARCHAR(255),
  activity_id VARCHAR(255),
  geo_coords VARCHAR(255),
  researcher_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"research_management_activity"}';

CREATE TABLE ddos_mitigation (
  id VARCHAR(255),
  mitigation_id VARCHAR(255),
  attack_id VARCHAR(255),
  protected_asset_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ddos_mitigation_process"}';

CREATE TABLE traffic_redirect (
  id VARCHAR(255),
  redirect_id VARCHAR(255),
  scrub_center_id VARCHAR(255),
  customer_net_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clean_traffic_redirection"}';

CREATE TABLE biz_roles (
  id VARCHAR(255),
  biz_role_id VARCHAR(255),
  agent_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"entrepreneur_role"}';

CREATE TABLE biz_plans (
  id VARCHAR(255),
  plan_id VARCHAR(255),
  scenario_id VARCHAR(255),
  funding_id VARCHAR(255),
  plan_title VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"business_plan"}';

CREATE TABLE venture_process (
  id VARCHAR(255),
  venture_id VARCHAR(255),
  output_id VARCHAR(255),
  demand_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"entrepreneurial_activity_process"}';

CREATE TABLE audit_plan (
  id VARCHAR(255),
  audit_plan_id VARCHAR(255),
  audit_goal_id VARCHAR(255),
  review_method_id VARCHAR(255),
  text_encoding VARCHAR(255),
  lang_iso VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"internal_audit_strategy"}';

CREATE TABLE board_chair_roles (
  id VARCHAR(255),
  chair_id VARCHAR(255),
  appointee_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"joint_board_chair_role"}';

CREATE TABLE svc_registry (
  id VARCHAR(255),
  svc_id VARCHAR(255),
  capability_id VARCHAR(255),
  tech_stack VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"information_service"}';

CREATE TABLE secure_env (
  id VARCHAR(255),
  secure_env_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"joint_information_environment"}';

CREATE TABLE svc_admit (
  id VARCHAR(255),
  svc_admit_id VARCHAR(255),
  call_req_id VARCHAR(255),
  admit_res_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"call_admission_control"}';

CREATE TABLE sla_definitions (
  id VARCHAR(255),
  sla_id VARCHAR(255),
  provider_id VARCHAR(255),
  qos_policy_id VARCHAR(255),
  display_name VARCHAR(255),
  locale VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"service_level_agreement"}';

CREATE TABLE net_res_path_map (
  id VARCHAR(255),
  map_id VARCHAR(255),
  resource_id VARCHAR(255),
  path_id VARCHAR(255),
  dimension_kind VARCHAR(255),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"network_resource_mapping"}';

CREATE TABLE adoption_petitioner (
  id VARCHAR(255),
  petitioner_id VARCHAR(255),
  person_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"petitioner_role"}';

CREATE TABLE adoption_case (
  id VARCHAR(255),
  adoption_case_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"adult_adoption_process"}';

CREATE TABLE adoption_app (
  id VARCHAR(255),
  app_id VARCHAR(255),
  case_id VARCHAR(255),
  charset VARCHAR(255),
  form_title VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"adoption_application_form"}';

CREATE TABLE analytics_job (
  id VARCHAR(255),
  job_id VARCHAR(255),
  input_ref VARCHAR(255),
  output_ref VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"healthcare_analytics_process"}';

CREATE TABLE clin_algo (
  id VARCHAR(255),
  clin_algo_id VARCHAR(255),
  method_id VARCHAR(255),
  display_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"clinical_intelligence_artifact"}';

CREATE TABLE care_provider_contract (
  id VARCHAR(255),
  provider_contract_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"performance_based_care_provider_role"}';

CREATE TABLE hss_issue (
  id VARCHAR(255),
  issue_id VARCHAR(255),
  event_id VARCHAR(255),
  regulation_id VARCHAR(255),
  title VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"hssseq_issue_document"}';

CREATE TABLE decision_role (
  id VARCHAR(255),
  role_id VARCHAR(255),
  borne_by VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023","bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"decision_maker_role"}';

CREATE TABLE etym_mapping (
  id VARCHAR(255),
  mapping_id VARCHAR(255),
  source_tribe_id VARCHAR(255),
  target_root_id VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"etymological_deciphering"}';

CREATE TABLE grad_elig_review (
  id VARCHAR(255),
  review_id VARCHAR(255),
  program_id VARCHAR(255),
  student_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"graduation_eligibility_assessment"}';

CREATE TABLE residency_rules (
  id VARCHAR(255),
  requirement_code VARCHAR(255),
  student_id VARCHAR(255),
  office_id VARCHAR(255),
  effective_from DATE,
  review_cycle_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"residency_requirement"}';

CREATE TABLE waiver_cert (
  id VARCHAR(255),
  cert_id VARCHAR(255),
  board_id VARCHAR(255),
  waiver_id VARCHAR(255),
  certified_at VARCHAR(255),
  label VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"appeal_waiver_certification"}';

CREATE TABLE meeting_agenda_item (
  id VARCHAR(255),
  agenda_item_id VARCHAR(255),
  board_member_id VARCHAR(255),
  topic_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"board_meeting_agenda_item"}';

CREATE TABLE care_programs (
  id VARCHAR(255),
  program_id VARCHAR(255),
  patient_id VARCHAR(255),
  service_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"cancer_support_program"}';

CREATE TABLE unaccompanied_minor_trip (
  id VARCHAR(255),
  minor_trip_id VARCHAR(255),
  minor_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"unaccompanied_minor_role"}';

CREATE TABLE route_stop (
  id VARCHAR(255),
  stop_code VARCHAR(255),
  rel_0000124 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"pick_drop_location"}';

CREATE TABLE urine_drug_test (
  id VARCHAR(255),
  screen_id VARCHAR(255),
  sample_id VARCHAR(255),
  compound_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000002","bfo:0000015","cco:Process"],"family":"catalog","is_complex":true,"template_id":"urine_drug_screening_procedure"}';

CREATE TABLE role_assignments (
  id VARCHAR(255),
  role_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004","bfo:0000023","cco:AgentRole"],"family":"catalog","is_complex":true,"template_id":"juvenile_offender_patient_role"}';

CREATE TABLE pay_method_cat (
  id VARCHAR(255),
  method_cat_id VARCHAR(255),
  pay_type VARCHAR(255),
  dimension_kind VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000002","bfo:0000019","cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"payment_method_category"}';

CREATE TABLE research_protocol (
  id VARCHAR(255),
  protocol_id VARCHAR(255),
  method_id VARCHAR(255),
  question_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"biocultural_research_design"}';

CREATE TABLE nutri_ind (
  id VARCHAR(255),
  nutri_ind_id VARCHAR(255),
  measure_val VARCHAR(255),
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"nutritional_status_indicator"}';

CREATE TABLE consent_record (
  id VARCHAR(255),
  consent_id VARCHAR(255),
  participant_id VARCHAR(255),
  protocol_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"informed_consent_process"}';

CREATE TABLE board_role (
  id VARCHAR(255),
  board_role_id VARCHAR(255),
  holder_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"board_member_role"}';

CREATE TABLE prop_assess_notice (
  id VARCHAR(255),
  notice_id VARCHAR(255),
  approval_status VARCHAR(255),
  notice_text VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"property_assessment_notice"}';

CREATE TABLE ac_officer_role (
  id VARCHAR(255),
  role_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  activity_type VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"animal_control_officer_role"}';

CREATE TABLE raffle_conductor_eligibility (
  id VARCHAR(255),
  eligibility_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"eligible_raffle_conductor_role"}';

CREATE TABLE export_job (
  id VARCHAR(255),
  export_job_id VARCHAR(255),
  exported_data_id VARCHAR(255),
  api_ref VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"data_export_process"}';

CREATE TABLE pat_edu_pkg (
  id VARCHAR(255),
  pat_edu_pkg_id VARCHAR(255),
  bundle_type VARCHAR(255),
  use_case VARCHAR(255),
  display_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"patient_educational_content_package"}';

CREATE TABLE mount_config (
  id VARCHAR(255),
  mount_cfg_id VARCHAR(255),
  instrument_id VARCHAR(255),
  mount_structure_id VARCHAR(255),
  method VARCHAR(255),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"observatory_mounting_configuration"}';

CREATE TABLE role_assignments_2 (
  id VARCHAR(255),
  role_id VARCHAR(255),
  inheres_in VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"telemarketer_sales_administrator_role"}';

CREATE TABLE kpi_limits (
  id VARCHAR(255),
  kpi_limit_id VARCHAR(255),
  agent_id VARCHAR(255),
  metric_id VARCHAR(255),
  unit_cd VARCHAR(255),
  display_name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"telemarketing_kpi_constraint"}';

CREATE TABLE sales_wkly_rpt (
  id VARCHAR(255),
  sales_rpt_id VARCHAR(255),
  tele_sales_id VARCHAR(255),
  reporting_period_id VARCHAR(255),
  period_type_cd VARCHAR(255),
  doc_title VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"weekly_sales_report"}';

CREATE TABLE clearing_broker_mandate (
  id VARCHAR(255),
  clearing_role_id VARCHAR(255),
  customer_acct_id VARCHAR(255),
  realized_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"clearing_broker_role"}';

CREATE TABLE sec_system (
  id VARCHAR(255),
  sec_system_id VARCHAR(255),
  component_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"security_infrastructure"}';

CREATE TABLE dup_requests (
  id VARCHAR(255),
  dup_req_id VARCHAR(255),
  requestor_id VARCHAR(255),
  source_doc_id VARCHAR(255),
  request_note VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"duplicating_request"}';

CREATE TABLE mail_dispatch (
  id VARCHAR(255),
  dispatch_id VARCHAR(255),
  drop_site_id VARCHAR(255),
  sort_rule_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"mail_dispatch_process"}';

CREATE TABLE referral_role_map (
  id VARCHAR(255),
  role_id VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  process_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"referral_source_role"}';

CREATE TABLE survey_result (
  id VARCHAR(255),
  finding_id VARCHAR(255),
  substance_cd VARCHAR(255),
  prevalence_pct VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_cd VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"survey_finding"}';

CREATE TABLE vehicle_propulsion (
  id VARCHAR(255),
  power_type_cd VARCHAR(255),
  is_diesel VARCHAR(255),
  is_non_diesel VARCHAR(255),
  method VARCHAR(255),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"vehicle_power_type"}';

CREATE TABLE breeding_app (
  id VARCHAR(255),
  breeding_app_id VARCHAR(255),
  horse_id VARCHAR(255),
  app_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"breeding_program_application"}';

CREATE TABLE meas_capability (
  id VARCHAR(255),
  capability_id VARCHAR(255),
  param_id VARCHAR(255),
  range_id VARCHAR(255),
  display_name VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"measurement_capability_profile"}';

CREATE TABLE debt_case (
  id VARCHAR(255),
  case_id VARCHAR(255),
  client_id VARCHAR(255),
  issue_id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"debt_casework_process"}';

CREATE TABLE housing_policy_doc (
  id VARCHAR(255),
  housing_policy_id VARCHAR(255),
  topic_code VARCHAR(255),
  char_encoding VARCHAR(255),
  lang_code VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"housing_policy_information"}';

CREATE TABLE t_business_activity_process (
  id VARCHAR(255),
  business_activity_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_activity_process"}';

CREATE TABLE t_business_decision (
  id VARCHAR(255),
  business_decision VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_decision"}';

CREATE TABLE t_business_entity (
  id VARCHAR(255),
  business_entity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_entity"}';

CREATE TABLE t_business_initiative (
  id VARCHAR(255),
  business_initiative VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_initiative"}';

CREATE TABLE t_calendar_product_specification (
  id VARCHAR(255),
  calendar_product_specification VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"calendar_product_specification"}';

CREATE TABLE t_call_volume_metric (
  id VARCHAR(255),
  call_volume_metric VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"call_volume_metric"}';

CREATE TABLE t_cancer_patient (
  id VARCHAR(255),
  cancer_patient VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cancer_patient"}';

CREATE TABLE t_care_quality_assessment (
  id VARCHAR(255),
  care_quality_assessment VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"care_quality_assessment"}';

CREATE TABLE t_certification_time (
  id VARCHAR(255),
  certification_time VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"certification_time"}';

CREATE TABLE t_certified_internal_auditor (
  id VARCHAR(255),
  certified_internal_auditor VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"certified_internal_auditor"}';

CREATE TABLE t_chemical_installation (
  id VARCHAR(255),
  chemical_installation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"chemical_installation"}';

CREATE TABLE t_child_protection_team (
  id VARCHAR(255),
  child_protection_team VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"child_protection_team"}';

CREATE TABLE t_clearing_process (
  id VARCHAR(255),
  clearing_process VARCHAR(255),
  involves_object VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clearing_process"}';

CREATE TABLE t_client (
  id VARCHAR(255),
  client VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"client"}';

CREATE TABLE t_client_profile (
  id VARCHAR(255),
  client_profile VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"client_profile"}';

CREATE TABLE t_clinical_performance_data (
  id VARCHAR(255),
  clinical_performance_data VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clinical_performance_data"}';

CREATE TABLE t_clinical_system (
  id VARCHAR(255),
  clinical_system VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clinical_system"}';

CREATE TABLE t_cloud_storage_volume (
  id VARCHAR(255),
  cloud_storage_volume VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cloud_storage_volume"}';

CREATE TABLE t_collateral_exchange_process (
  id VARCHAR(255),
  collateral_exchange_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"collateral_exchange_process"}';

CREATE TABLE t_college_administration (
  id VARCHAR(255),
  college_administration VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"college_administration"}';

CREATE TABLE t_college_community_member (
  id VARCHAR(255),
  college_community_member VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"college_community_member"}';

CREATE TABLE t_college_official (
  id VARCHAR(255),
  college_official VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"college_official"}';

CREATE TABLE t_community_healthcare_setting (
  id VARCHAR(255),
  community_healthcare_setting VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"community_healthcare_setting"}';

CREATE TABLE t_continuous_emissions_monitoring_system (
  id VARCHAR(255),
  continuous_emissions_monitoring_system VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"continuous_emissions_monitoring_system"}';

CREATE TABLE t_copied_document (
  id VARCHAR(255),
  copied_document VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"copied_document"}';

CREATE TABLE t_corporate_agent (
  id VARCHAR(255),
  corporate_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_agent"}';

CREATE TABLE t_corporate_audit_function (
  id VARCHAR(255),
  corporate_audit_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_audit_function"}';

CREATE TABLE t_corporate_coalition (
  id VARCHAR(255),
  corporate_coalition VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_coalition"}';

CREATE TABLE t_corporate_employee (
  id VARCHAR(255),
  corporate_employee VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_employee"}';

CREATE TABLE t_corporate_reputation_metric (
  id VARCHAR(255),
  corporate_reputation_metric VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_reputation_metric"}';

CREATE TABLE t_course_selection_set (
  id VARCHAR(255),
  course_selection_set VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"course_selection_set"}';

CREATE TABLE t_court_document (
  id VARCHAR(255),
  court_document VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"court_document"}';

CREATE TABLE t_criminal_justice_system (
  id VARCHAR(255),
  criminal_justice_system VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"criminal_justice_system"}';

CREATE TABLE t_cultural_attribute (
  id VARCHAR(255),
  cultural_attribute VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cultural_attribute"}';

CREATE TABLE t_curriculum (
  id VARCHAR(255),
  curriculum VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"curriculum"}';

CREATE TABLE t_customer_network (
  id VARCHAR(255),
  customer_network VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"customer_network"}';

CREATE TABLE t_dish (
  id VARCHAR(255),
  dish VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"dish"}';

CREATE TABLE t_district_employee (
  id VARCHAR(255),
  district_employee VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"district_employee"}';

CREATE TABLE t_domestic_violence_victim_client (
  id VARCHAR(255),
  domestic_violence_victim_client VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"domestic_violence_victim_client"}';

CREATE TABLE t_donor (
  id VARCHAR(255),
  donor VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"donor"}';

CREATE TABLE t_donor_agent (
  id VARCHAR(255),
  donor_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"donor_agent"}';

CREATE TABLE t_earth_observation_data (
  id VARCHAR(255),
  earth_observation_data VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"earth_observation_data"}';

CREATE TABLE t_economic_goods_and_services (
  id VARCHAR(255),
  economic_goods_and_services VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"economic_goods_and_services"}';

CREATE TABLE t_energy_saving_component (
  id VARCHAR(255),
  energy_saving_component VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"energy_saving_component"}';

CREATE TABLE t_ethical_investment_asset (
  id VARCHAR(255),
  ethical_investment_asset VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_investment_asset"}';

CREATE TABLE t_ethical_requirement (
  id VARCHAR(255),
  ethical_requirement VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_requirement"}';

CREATE TABLE t_evaluation_outcome (
  id VARCHAR(255),
  evaluation_outcome VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"evaluation_outcome"}';

CREATE TABLE t_executive_director_function (
  id VARCHAR(255),
  executive_director_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_director_function"}';

CREATE TABLE t_executive_execution_function (
  id VARCHAR(255),
  executive_execution_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_execution_function"}';

CREATE TABLE t_executive_team (
  id VARCHAR(255),
  executive_team VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_team"}';

CREATE TABLE t_executive_team_member (
  id VARCHAR(255),
  executive_team_member VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_team_member"}';

CREATE TABLE t_expedition_equipment (
  id VARCHAR(255),
  expedition_equipment VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"expedition_equipment"}';

CREATE TABLE t_expedition_participant (
  id VARCHAR(255),
  expedition_participant VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"expedition_participant"}';

CREATE TABLE t_experienced_mentor (
  id VARCHAR(255),
  experienced_mentor VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"experienced_mentor"}';

CREATE TABLE t_export_execution (
  id VARCHAR(255),
  export_execution VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"export_execution"}';

CREATE TABLE t_exported_data_artifact (
  id VARCHAR(255),
  exported_data_artifact VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"exported_data_artifact"}';

CREATE TABLE t_external_agency (
  id VARCHAR(255),
  external_agency VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"external_agency"}';

CREATE TABLE t_industrial_emission_source (
  id VARCHAR(255),
  industrial_emission_source VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"industrial_emission_source"}';

CREATE TABLE t_information_capability (
  id VARCHAR(255),
  information_capability VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"information_capability"}';

CREATE TABLE t_information_item (
  id VARCHAR(255),
  information_item VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"information_item"}';

CREATE TABLE t_information_system (
  id VARCHAR(255),
  information_system VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"information_system"}';

CREATE TABLE t_inspection_event (
  id VARCHAR(255),
  inspection_event VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"inspection_event"}';

CREATE TABLE t_intelligence_output (
  id VARCHAR(255),
  intelligence_output VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"intelligence_output"}';

CREATE TABLE t_interdisciplinary_education (
  id VARCHAR(255),
  interdisciplinary_education VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"interdisciplinary_education"}';

CREATE TABLE t_investment_choice_decision (
  id VARCHAR(255),
  investment_choice_decision VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"investment_choice_decision"}';

CREATE TABLE t_investor_funding_situation (
  id VARCHAR(255),
  investor_funding_situation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"investor_funding_situation"}';

CREATE TABLE t_investor_relations_activity (
  id VARCHAR(255),
  investor_relations_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"investor_relations_activity"}';

CREATE TABLE t_keyframe_timeline (
  id VARCHAR(255),
  keyframe_timeline VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"keyframe_timeline"}';

CREATE TABLE t_lateral_restraint_strap (
  id VARCHAR(255),
  lateral_restraint_strap VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"lateral_restraint_strap"}';

CREATE TABLE t_law_enforcement_agency (
  id VARCHAR(255),
  law_enforcement_agency VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"law_enforcement_agency"}';

CREATE TABLE t_marital_state (
  id VARCHAR(255),
  marital_state VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"marital_state"}';

CREATE TABLE t_market_demand (
  id VARCHAR(255),
  market_demand VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"market_demand"}';

CREATE TABLE t_market_trend (
  id VARCHAR(255),
  market_trend VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"market_trend"}';

CREATE TABLE t_marketing_plan (
  id VARCHAR(255),
  marketing_plan VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"marketing_plan"}';

CREATE TABLE t_mathematical_concept (
  id VARCHAR(255),
  mathematical_concept VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"mathematical_concept"}';

CREATE TABLE t_measurement_parameter (
  id VARCHAR(255),
  measurement_parameter VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"measurement_parameter"}';

CREATE TABLE t_member (
  id VARCHAR(255),
  member VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"member"}';

CREATE TABLE t_membership (
  id VARCHAR(255),
  membership VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"membership"}';

CREATE TABLE t_minor_person (
  id VARCHAR(255),
  minor_person VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"minor_person"}';

CREATE TABLE t_patient (
  id VARCHAR(255),
  patient VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"patient"}';

CREATE TABLE t_pdf_document (
  id VARCHAR(255),
  pdf_document VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"pdf_document"}';

CREATE TABLE t_personal_data_record (
  id VARCHAR(255),
  personal_data_record VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"personal_data_record"}';

CREATE TABLE t_policy_violation (
  id VARCHAR(255),
  policy_violation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"policy_violation"}';

CREATE TABLE t_practice_management_topic (
  id VARCHAR(255),
  practice_management_topic VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"practice_management_topic"}';

CREATE TABLE t_practice_session (
  id VARCHAR(255),
  practice_session VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"practice_session"}';

CREATE TABLE t_predicate_concept (
  id VARCHAR(255),
  predicate_concept VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"predicate_concept"}';

CREATE TABLE t_prevalence_rate (
  id VARCHAR(255),
  prevalence_rate VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"prevalence_rate"}';

CREATE TABLE t_program_of_study (
  id VARCHAR(255),
  program_of_study VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"program_of_study"}';

CREATE TABLE t_property_owner (
  id VARCHAR(255),
  property_owner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"property_owner"}';

CREATE TABLE t_public_information_officer (
  id VARCHAR(255),
  public_information_officer VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"public_information_officer"}';

CREATE TABLE t_qo_s_constraint (
  id VARCHAR(255),
  qo_s_constraint VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"qo_s_constraint"}';

CREATE TABLE t_quality_improvement_framework (
  id VARCHAR(255),
  quality_improvement_framework VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"quality_improvement_framework"}';

CREATE TABLE t_quantitative_analytic_tool (
  id VARCHAR(255),
  quantitative_analytic_tool VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"quantitative_analytic_tool"}';

CREATE TABLE t_raffle_conducting_activity (
  id VARCHAR(255),
  raffle_conducting_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"raffle_conducting_activity"}';

CREATE TABLE t_receiving_facility_staff (
  id VARCHAR(255),
  receiving_facility_staff VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"receiving_facility_staff"}';

CREATE TABLE t_recovered_state (
  id VARCHAR(255),
  recovered_state VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"recovered_state"}';

CREATE TABLE t_service_management_process (
  id VARCHAR(255),
  service_management_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_management_process"}';

CREATE TABLE t_service_performance_metric (
  id VARCHAR(255),
  service_performance_metric VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_performance_metric"}';

CREATE TABLE t_service_provider (
  id VARCHAR(255),
  service_provider VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_provider"}';

CREATE TABLE t_service_provision_activity (
  id VARCHAR(255),
  service_provision_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_provision_activity"}';

CREATE TABLE t_service_request (
  id VARCHAR(255),
  service_request VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_request"}';

CREATE TABLE t_significance_level (
  id VARCHAR(255),
  significance_level VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"significance_level"}';

CREATE TABLE t_simulation_software (
  id VARCHAR(255),
  simulation_software VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"simulation_software"}';

CREATE TABLE t_slavic_linguistic_root (
  id VARCHAR(255),
  slavic_linguistic_root VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"slavic_linguistic_root"}';

CREATE TABLE t_social_harmony_restoration (
  id VARCHAR(255),
  social_harmony_restoration VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_harmony_restoration"}';

CREATE TABLE t_social_media_account_management_process_definition (
  id VARCHAR(255),
  social_media_account_management_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_media_account_management_process_definition"}';

CREATE TABLE t_social_networking_service_type (
  id VARCHAR(255),
  social_networking_service_type VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_networking_service_type"}';

CREATE TABLE t_social_services_department (
  id VARCHAR(255),
  social_services_department VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_services_department"}';

CREATE TABLE t_social_tag (
  id VARCHAR(255),
  social_tag VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_tag"}';

CREATE TABLE t_software_interface (
  id VARCHAR(255),
  software_interface VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"software_interface"}';

CREATE TABLE t_subject_concept (
  id VARCHAR(255),
  subject_concept VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"subject_concept"}';

CREATE TABLE t_target_material (
  id VARCHAR(255),
  target_material VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"target_material"}';

CREATE TABLE t_taxi_ride_process (
  id VARCHAR(255),
  taxi_ride_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"taxi_ride_process"}';

CREATE TABLE t_team_function (
  id VARCHAR(255),
  team_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"team_function"}';

CREATE TABLE t_tele_sales_activity (
  id VARCHAR(255),
  tele_sales_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"tele_sales_activity"}';

CREATE TABLE t_telescope_instrument_artifact (
  id VARCHAR(255),
  telescope_instrument_artifact VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"telescope_instrument_artifact"}';

CREATE TABLE t_test_statistic (
  id VARCHAR(255),
  test_statistic VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"test_statistic"}';

CREATE TABLE t_threat_information (
  id VARCHAR(255),
  threat_information VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"threat_information"}';

CREATE TABLE t_agenda_subject (
  id VARCHAR(255),
  agenda_subject VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"agenda_subject"}';

CREATE TABLE t_approval_recommendation (
  id VARCHAR(255),
  approval_recommendation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"approval_recommendation"}';

CREATE TABLE t_assessment_method (
  id VARCHAR(255),
  assessment_method VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"assessment_method"}';

CREATE TABLE t_assessment_participant (
  id VARCHAR(255),
  assessment_participant VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"assessment_participant"}';

CREATE TABLE t_athletic_monitoring_activity (
  id VARCHAR(255),
  athletic_monitoring_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"athletic_monitoring_activity"}';

CREATE TABLE t_audit_objective (
  id VARCHAR(255),
  audit_objective VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"audit_objective"}';

CREATE TABLE t_authorized_entity (
  id VARCHAR(255),
  authorized_entity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"authorized_entity"}';

CREATE TABLE t_autohemotherapy_procedure (
  id VARCHAR(255),
  autohemotherapy_procedure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"autohemotherapy_procedure"}';

CREATE TABLE t_automated_system (
  id VARCHAR(255),
  automated_system VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"automated_system"}';

CREATE TABLE t_available_topping (
  id VARCHAR(255),
  available_topping VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"available_topping"}';

CREATE TABLE t_board_member (
  id VARCHAR(255),
  board_member VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"board_member"}';

CREATE TABLE t_board_of_assessors_meeting (
  id VARCHAR(255),
  board_of_assessors_meeting VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"board_of_assessors_meeting"}';

CREATE TABLE t_board_of_equalization (
  id VARCHAR(255),
  board_of_equalization VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"board_of_equalization"}';

CREATE TABLE t_building_floor_structure (
  id VARCHAR(255),
  building_floor_structure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"building_floor_structure"}';

CREATE TABLE t_cyber_security_incident (
  id VARCHAR(255),
  cyber_security_incident VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cyber_security_incident"}';

CREATE TABLE t_data_collection_process (
  id VARCHAR(255),
  data_collection_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"data_collection_process"}';

CREATE TABLE t_data_input (
  id VARCHAR(255),
  data_input VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"data_input"}';

CREATE TABLE t_decision_making_process_definition (
  id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"decision_making_process_definition"}';

CREATE TABLE t_degraded_system_condition (
  id VARCHAR(255),
  degraded_system_condition VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"degraded_system_condition"}';

CREATE TABLE t_departing_employee (
  id VARCHAR(255),
  departing_employee VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"departing_employee"}';

CREATE TABLE t_geographic_region (
  id VARCHAR(255),
  geographic_region VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"geographic_region"}';

CREATE TABLE t_governance_function (
  id VARCHAR(255),
  governance_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"governance_function"}';

CREATE TABLE t_h_s_s_s_e_q__situation (
  id VARCHAR(255),
  h_s_s_s_e_q__situation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"h_s_s_s_e_q__situation"}';

CREATE TABLE t_health_care_summary (
  id VARCHAR(255),
  health_care_summary VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"health_care_summary"}';

CREATE TABLE t_health_standard_compliance (
  id VARCHAR(255),
  health_standard_compliance VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"health_standard_compliance"}';

CREATE TABLE t_healthcare_agent (
  id VARCHAR(255),
  healthcare_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"healthcare_agent"}';

CREATE TABLE t_law_enforcement_personnel (
  id VARCHAR(255),
  law_enforcement_personnel VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"law_enforcement_personnel"}';

CREATE TABLE t_lecture_notes (
  id VARCHAR(255),
  lecture_notes VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"lecture_notes"}';

CREATE TABLE t_legal_advertisement_activity (
  id VARCHAR(255),
  legal_advertisement_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_advertisement_activity"}';

CREATE TABLE t_legal_entity_or_person (
  id VARCHAR(255),
  legal_entity_or_person VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_entity_or_person"}';

CREATE TABLE t_legal_professional (
  id VARCHAR(255),
  legal_professional VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_professional"}';

CREATE TABLE t_legal_tech_solution_lab (
  id VARCHAR(255),
  legal_tech_solution_lab VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_tech_solution_lab"}';

CREATE TABLE t_legislative_department (
  id VARCHAR(255),
  legislative_department VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legislative_department"}';

CREATE TABLE t_lifeguard_staff (
  id VARCHAR(255),
  lifeguard_staff VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"lifeguard_staff"}';

CREATE TABLE t_local_authority (
  id VARCHAR(255),
  local_authority VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"local_authority"}';

CREATE TABLE t_login_credentials (
  id VARCHAR(255),
  login_credentials VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"login_credentials"}';

CREATE TABLE t_machine_learning_model (
  id VARCHAR(255),
  machine_learning_model VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"machine_learning_model"}';

CREATE TABLE t_mail_drop_location (
  id VARCHAR(255),
  mail_drop_location VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"mail_drop_location"}';

CREATE TABLE t_malnourished_child (
  id VARCHAR(255),
  malnourished_child VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"malnourished_child"}';

CREATE TABLE t_monetary_amount (
  id VARCHAR(255),
  monetary_amount VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"monetary_amount"}';

CREATE TABLE t_monitoring_protocol (
  id VARCHAR(255),
  monitoring_protocol VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"monitoring_protocol"}';

CREATE TABLE t_municipal_pool_facility (
  id VARCHAR(255),
  municipal_pool_facility VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"municipal_pool_facility"}';

CREATE TABLE t_network_infrastructure (
  id VARCHAR(255),
  network_infrastructure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_infrastructure"}';

CREATE TABLE t_network_provider (
  id VARCHAR(255),
  network_provider VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_provider"}';

CREATE TABLE t_network_resource (
  id VARCHAR(255),
  network_resource VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_resource"}';

CREATE TABLE t_network_scrubbing_center (
  id VARCHAR(255),
  network_scrubbing_center VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_scrubbing_center"}';

CREATE TABLE t_non_diesel_powered_vehicle (
  id VARCHAR(255),
  non_diesel_powered_vehicle VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"non_diesel_powered_vehicle"}';

CREATE TABLE t_nonprofit_organization (
  id VARCHAR(255),
  nonprofit_organization VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"nonprofit_organization"}';

CREATE TABLE t_referral_process (
  id VARCHAR(255),
  referral_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"referral_process"}';

CREATE TABLE t_regulatory_authority (
  id VARCHAR(255),
  regulatory_authority VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"regulatory_authority"}';

CREATE TABLE t_regulatory_body (
  id VARCHAR(255),
  regulatory_body VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"regulatory_body"}';

CREATE TABLE t_rendering_engine (
  id VARCHAR(255),
  rendering_engine VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"rendering_engine"}';

CREATE TABLE t_rendering_environment_definition (
  id VARCHAR(255),
  rendering_environment VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"rendering_environment_definition"}';

CREATE TABLE t_reporting_channel (
  id VARCHAR(255),
  reporting_channel VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"reporting_channel"}';

CREATE TABLE t_requested_provider_type (
  id VARCHAR(255),
  requested_provider_type VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"requested_provider_type"}';

CREATE TABLE t_requesting_client (
  id VARCHAR(255),
  requesting_client VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"requesting_client"}';

CREATE TABLE t_requesting_entity (
  id VARCHAR(255),
  requesting_entity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"requesting_entity"}';

CREATE TABLE t_research_activity (
  id VARCHAR(255),
  research_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"research_activity"}';

CREATE TABLE t_facility_infrastructure (
  id VARCHAR(255),
  facility_infrastructure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"facility_infrastructure"}';

CREATE TABLE t_final_inspection_process (
  id VARCHAR(255),
  final_inspection_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"final_inspection_process"}';

CREATE TABLE t_financial_fund (
  id VARCHAR(255),
  financial_fund VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_fund"}';

CREATE TABLE t_financial_management_process (
  id VARCHAR(255),
  financial_management_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_management_process"}';

CREATE TABLE t_financial_product (
  id VARCHAR(255),
  financial_product VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_product"}';

CREATE TABLE t_financial_report (
  id VARCHAR(255),
  financial_report VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_report"}';

CREATE TABLE t_financial_resource (
  id VARCHAR(255),
  financial_resource VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_resource"}';

CREATE TABLE t_health_record_transfer_process (
  id VARCHAR(255),
  health_record_transfer_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"health_record_transfer_process"}';

CREATE TABLE t_healthcare_network_infrastructure (
  id VARCHAR(255),
  healthcare_network_infrastructure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"healthcare_network_infrastructure"}';

CREATE TABLE t_healthcare_organization (
  id VARCHAR(255),
  healthcare_organization VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"healthcare_organization"}';

CREATE TABLE t_height_measurement (
  id VARCHAR(255),
  height_measurement VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"height_measurement"}';

CREATE TABLE t_horse_identity (
  id VARCHAR(255),
  horse_identity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"horse_identity"}';

CREATE TABLE t_housing_client (
  id VARCHAR(255),
  housing_client VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"housing_client"}';

CREATE TABLE t_housing_debt_issue (
  id VARCHAR(255),
  housing_debt_issue VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"housing_debt_issue"}';

CREATE TABLE t_housing_policy_topic (
  id VARCHAR(255),
  housing_policy_topic VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"housing_policy_topic"}';

CREATE TABLE t_human_agent (
  id VARCHAR(255),
  human_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"human_agent"}';

CREATE TABLE t_imaging_equipment (
  id VARCHAR(255),
  imaging_equipment VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"imaging_equipment"}';

CREATE TABLE t_independent_economic_agent (
  id VARCHAR(255),
  independent_economic_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"independent_economic_agent"}';

CREATE TABLE t_individual (
  id VARCHAR(255),
  individual VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"individual"}';

CREATE TABLE t_observatory_mounting_structure (
  id VARCHAR(255),
  observatory_mounting_structure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"observatory_mounting_structure"}';

CREATE TABLE t_offline_channel (
  id VARCHAR(255),
  offline_channel VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"offline_channel"}';

CREATE TABLE t_online_channel (
  id VARCHAR(255),
  online_channel VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"online_channel"}';

CREATE TABLE t_operational_disruption (
  id VARCHAR(255),
  operational_disruption VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_disruption"}';

CREATE TABLE t_operational_effectiveness (
  id VARCHAR(255),
  operational_effectiveness VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_effectiveness"}';

CREATE TABLE t_operational_equipment (
  id VARCHAR(255),
  operational_equipment VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_equipment"}';

CREATE TABLE t_operational_protocol (
  id VARCHAR(255),
  operational_protocol VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_protocol"}';

CREATE TABLE t_operational_unit (
  id VARCHAR(255),
  operational_unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_unit"}';

CREATE TABLE t_order_constraint (
  id VARCHAR(255),
  order_constraint VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"order_constraint"}';

CREATE TABLE t_organization_member (
  id VARCHAR(255),
  organization_member VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organization_member"}';

CREATE TABLE t_organizational_agent (
  id VARCHAR(255),
  organizational_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_agent"}';

CREATE TABLE t_organizational_function (
  id VARCHAR(255),
  organizational_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_function"}';

CREATE TABLE t_organizational_health_metric (
  id VARCHAR(255),
  organizational_health_metric VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_health_metric"}';

CREATE TABLE t_organizational_leadership_role (
  id VARCHAR(255),
  organizational_leadership_role VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_leadership_role"}';

CREATE TABLE t_ozone_oxygen_mixture (
  id VARCHAR(255),
  ozone_oxygen_mixture VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ozone_oxygen_mixture"}';

CREATE TABLE t_academic_degree (
  id VARCHAR(255),
  academic_degree VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"academic_degree"}';

CREATE TABLE t_calendar_product (
  id VARCHAR(255),
  calendar_product VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"calendar_product"}';

CREATE TABLE t_call_volume (
  id VARCHAR(255),
  call_volume VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"call_volume"}';

CREATE TABLE t_child (
  id VARCHAR(255),
  child VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"child"}';

CREATE TABLE t_clinical_care (
  id VARCHAR(255),
  clinical_care VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clinical_care"}';

CREATE TABLE t_communication_security_aspect (
  id VARCHAR(255),
  communication_security_aspect VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"communication_security_aspect"}';

CREATE TABLE t_constructed_predicate (
  id VARCHAR(255),
  constructed_predicate VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"constructed_predicate"}';

CREATE TABLE t_continuous_emissions_monitoring_process (
  id VARCHAR(255),
  continuous_emissions_monitoring_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"continuous_emissions_monitoring_process"}';

CREATE TABLE t_corporate_activity (
  id VARCHAR(255),
  corporate_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_activity"}';

CREATE TABLE t_corporate_audit_process (
  id VARCHAR(255),
  corporate_audit_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_audit_process"}';

CREATE TABLE t_corporate_employment_process (
  id VARCHAR(255),
  corporate_employment_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_employment_process"}';

CREATE TABLE t_corporate_reputation (
  id VARCHAR(255),
  corporate_reputation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_reputation"}';

CREATE TABLE t_course (
  id VARCHAR(255),
  course VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"course"}';

CREATE TABLE t_criminal_justice_process (
  id VARCHAR(255),
  criminal_justice_process VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"criminal_justice_process"}';

CREATE TABLE t_customer_device (
  id VARCHAR(255),
  customer_device VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"customer_device"}';

CREATE TABLE t_database_container (
  id VARCHAR(255),
  database_container VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"database_container"}';

CREATE TABLE t_decision_action (
  id VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"decision_action"}';

CREATE TABLE t_decision_transition_action (
  id VARCHAR(255),
  decision_transition_action VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"decision_transition_action"}';

CREATE TABLE t_diagnostic_imaging (
  id VARCHAR(255),
  diagnostic_imaging VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"diagnostic_imaging"}';

CREATE TABLE t_ethical_investment (
  id VARCHAR(255),
  ethical_investment VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_investment"}';

CREATE TABLE t_ethical_standard (
  id VARCHAR(255),
  ethical_standard VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_standard"}';

CREATE TABLE t_executive_direction (
  id VARCHAR(255),
  executive_direction VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_direction"}';

CREATE TABLE t_executive_implementation (
  id VARCHAR(255),
  executive_implementation VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_implementation"}';

CREATE TABLE t_executive_leadership_role (
  id VARCHAR(255),
  executive_leadership_role VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_leadership_role"}';

CREATE TABLE t_external_business_partner (
  id VARCHAR(255),
  external_business_partner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"external_business_partner"}';

CREATE TABLE t_financial_instrument (
  id VARCHAR(255),
  financial_instrument VARCHAR(255),
  participates_in VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_instrument"}';

CREATE TABLE t_financial_strategy_oversight (
  id VARCHAR(255),
  financial_strategy_oversight VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_strategy_oversight"}';

CREATE TABLE t_higher_education_institution (
  id VARCHAR(255),
  higher_education_institution VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"higher_education_institution"}';

CREATE TABLE t_institutional_investor (
  id VARCHAR(255),
  institutional_investor VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"institutional_investor"}';

CREATE TABLE t_legal_proceeding (
  id VARCHAR(255),
  legal_proceeding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_proceeding"}';

CREATE TABLE t_network_user (
  id VARCHAR(255),
  network_user VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_user"}';

CREATE TABLE t_observation_function (
  id VARCHAR(255),
  observation_function VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"observation_function"}';

CREATE TABLE t_organization (
  id VARCHAR(255),
  organization VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organization"}';

CREATE TABLE t_organizational_culture (
  id VARCHAR(255),
  organizational_culture VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_culture"}';

CREATE TABLE t_original_document (
  id VARCHAR(255),
  original_document VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"original_document"}';

CREATE TABLE t_pdf_format (
  id VARCHAR(255),
  pdf_format VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"pdf_format"}';

CREATE TABLE t_personally_identifiable_information (
  id VARCHAR(255),
  personally_identifiable_information VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"personally_identifiable_information"}';

CREATE TABLE t_population (
  id VARCHAR(255),
  population VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"population"}';

CREATE TABLE t_professional_experience (
  id VARCHAR(255),
  professional_experience VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"professional_experience"}';

CREATE TABLE t_qualification_level (
  id VARCHAR(255),
  qualification_level VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"qualification_level"}';

CREATE TABLE t_raffle (
  id VARCHAR(255),
  raffle VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"raffle"}';

CREATE TABLE t_prim_age (
  id VARCHAR(255),
  age VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_age"}';

CREATE TABLE t_prim_continuousmode (
  id VARCHAR(255),
  continuous_mode VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_continuousmode"}';

CREATE TABLE t_prim_riskmanagementactivity (
  id VARCHAR(255),
  risk_management_activity VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_riskmanagementactivity"}';

CREATE TABLE t_prim_chemical (
  id VARCHAR(255),
  chemical VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_chemical"}';

CREATE TABLE t_prim_schoolsecuritypolicy (
  id VARCHAR(255),
  school_security_policy VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_schoolsecuritypolicy"}';

CREATE TABLE t_prim_scientificorganization (
  id VARCHAR(255),
  scientific_organization VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_scientificorganization"}';

CREATE TABLE t_prim_servicelevelagreement (
  id VARCHAR(255),
  service_level_agreement VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_servicelevelagreement"}';

CREATE TABLE t_prim_stateaction (
  id VARCHAR(255),
  state_action VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_stateaction"}';

CREATE TABLE t_prim_tariffstructure (
  id VARCHAR(255),
  tariff_structure VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_tariffstructure"}';

CREATE TABLE t_prim_vulnerabilitystate (
  id VARCHAR(255),
  vulnerability_state VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_vulnerabilitystate"}';

CREATE TABLE t_prim_skillimprovement (
  id VARCHAR(255),
  skill_improvement VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_skillimprovement"}';

CREATE TABLE t_prim_socialnetworkingserviceusage (
  id VARCHAR(255),
  social_networking_service_usage VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_socialnetworkingserviceusage"}';

CREATE TABLE t_board_member_role_realization (
  id VARCHAR(255),
  board_member_role_realization VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"board_member_role_realization"}';

CREATE TABLE t_chief_compliance_officer_service_delivery_process (
  id VARCHAR(255),
  chief_compliance_officer_service_delivery_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"chief_compliance_officer_service_delivery_process"}';

CREATE TABLE t_college_administration_process (
  id VARCHAR(255),
  college_administration_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"college_administration_process"}';

CREATE TABLE t_general_manager_function_execution (
  id VARCHAR(255),
  general_manager_function_execution VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"general_manager_function_execution"}';

CREATE TABLE t_legal_tech_service_delivery_process (
  id VARCHAR(255),
  legal_tech_service_delivery_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"legal_tech_service_delivery_process"}';

CREATE TABLE t_performance_based_care_delivery_process (
  id VARCHAR(255),
  performance_based_care_delivery_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"performance_based_care_delivery_process"}';

CREATE TABLE t_police_patrol_process (
  id VARCHAR(255),
  police_patrol_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"police_patrol_process"}';

CREATE TABLE t_qualified_source_testing_process (
  id VARCHAR(255),
  qualified_source_testing_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"qualified_source_testing_process"}';

CREATE TABLE t_clearing_broker_service_delivery_process (
  id VARCHAR(255),
  clearing_broker_service_delivery_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"clearing_broker_service_delivery_process"}';

CREATE TABLE t_rights_exercise_process (
  id VARCHAR(255),
  rights_exercise_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"rights_exercise_process"}';

CREATE TABLE t_authorized_entity_authorization_process (
  id VARCHAR(255),
  authorized_entity_authorization_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"authorized_entity_authorization_process"}';

CREATE TABLE t_joint_board_chair_service_delivery_process (
  id VARCHAR(255),
  joint_board_chair_service_delivery_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"joint_board_chair_service_delivery_process"}';

CREATE TABLE t_social_media_account_management_process (
  id VARCHAR(255),
  social_media_account_management_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"social_media_account_management_process"}';

CREATE TABLE t_community_healthcare_service_delivery_process (
  id VARCHAR(255),
  community_healthcare_service_delivery_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"community_healthcare_service_delivery_process"}';

CREATE TABLE t_decision_making_process (
  id VARCHAR(255),
  decision_making_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"decision_making_process"}';

CREATE TABLE t_parenting_process (
  id VARCHAR(255),
  parenting_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"parenting_process"}';

CREATE TABLE t_rendering_environment (
  id VARCHAR(255),
  rendering_environment VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"rendering_environment"}';

CREATE TABLE t_traditional_religious_healing_process (
  id VARCHAR(255),
  traditional_religious_healing_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"traditional_religious_healing_process"}';

CREATE TABLE t_organizational_leadership_process (
  id VARCHAR(255),
  organizational_leadership_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"organizational_leadership_process"}';

CREATE TABLE t_young_researcher_research_process (
  id VARCHAR(255),
  young_researcher_research_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"young_researcher_research_process"}';

CREATE TABLE t_review_panel_quorum (
  id VARCHAR(255),
  review_panel_session VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"review_panel_quorum"}';

CREATE TABLE t_capacity_bounded_enrollment (
  id VARCHAR(255),
  cohort_enrollment_process VARCHAR(255),
  participant VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"capacity_bounded_enrollment"}';

CREATE TABLE t_dual_custody_signoff (
  id VARCHAR(255),
  dual_custody_signoff_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  realizes VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"dual_custody_signoff"}';

CREATE TABLE t_bounded_committee_membership (
  id VARCHAR(255),
  standing_committee_assembly VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"bounded_committee_membership"}';

CREATE TABLE t_identifier_bearer_union (
  id VARCHAR(255),
  registered_identifier_bearer VARCHAR(255),
  natural_person_registrant VARCHAR(255),
  registered_organization VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"identifier_bearer_union"}';

CREATE TABLE t_notification_target_union (
  id VARCHAR(255),
  compliance_notification_process VARCHAR(255),
  responsible_officer VARCHAR(255),
  delegated_agent VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"notification_target_union"}';

CREATE TABLE t_escalation_channel_union (
  id VARCHAR(255),
  incident_escalation_process VARCHAR(255),
  supervisory_review VARCHAR(255),
  external_audit_review VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"escalation_channel_union"}';

CREATE TABLE t_scored_assessment_bounds (
  id VARCHAR(255),
  scored_assessment_record VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"scored_assessment_bounds"}';

CREATE TABLE t_versioned_form_lineage (
  id VARCHAR(255),
  versioned_intake_form VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"versioned_form_lineage"}';

CREATE TABLE t_bounded_metric_series (
  id VARCHAR(255),
  bounded_metric_series VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"bounded_metric_series"}';

CREATE TABLE t_restricted_participation_review (
  id VARCHAR(255),
  accredited_review_process VARCHAR(255),
  participant VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"restricted_participation_review"}';

CREATE TABLE t_typed_realization_channel (
  id VARCHAR(255),
  on_call_coverage_role VARCHAR(255),
  realized_in VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"typed_realization_channel"}';

CREATE TABLE t_custody_scope_typing (
  id VARCHAR(255),
  archival_custody_process VARCHAR(255),
  participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"custody_scope_typing"}';

CREATE TABLE t_measured_series_reading (
  id VARCHAR(255),
  measured_series_reading VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"measured_series_reading"}';
