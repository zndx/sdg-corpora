CREATE TABLE caregiver_roles (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), adult_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE doc_event (id VARCHAR(255) NOT NULL, doc_event_id VARCHAR(255), system_id VARCHAR(255), encounter_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE pdf_export_job (id VARCHAR(255) NOT NULL, export_job_id VARCHAR(255), src_scan_id VARCHAR(255), output_doc_id VARCHAR(255), initiator_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE lect_sessions (id VARCHAR(255) NOT NULL, lect_id VARCHAR(255), resource_id VARCHAR(255), code_ref VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE young_res_roles (id VARCHAR(255) NOT NULL, young_res_role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE library_role_assignment (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), student_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE dispenser_sites (id VARCHAR(255) NOT NULL, stand_id VARCHAR(255), topping_id VARCHAR(255), location_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE child_designation (id VARCHAR(255) NOT NULL, designation_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE police_roles (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE web_project (id VARCHAR(255) NOT NULL, project_id VARCHAR(255), target_platform_id VARCHAR(255), tech_used_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE campaign_channel_map (id VARCHAR(255) NOT NULL, campaign_link_id VARCHAR(255), online_channel_id VARCHAR(255), offline_channel_id VARCHAR(255), unit_code VARCHAR(255), campaign_title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE election_records (id VARCHAR(255) NOT NULL, election_id VARCHAR(255), option_id VARCHAR(255), member_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE pension_election (id VARCHAR(255) NOT NULL, option_id VARCHAR(255), method VARCHAR(255), created_at VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE marital_cert (id VARCHAR(255) NOT NULL, marital_cert_id VARCHAR(255), marital_status_id VARCHAR(255), consent_reason_cd VARCHAR(255), char_encoding VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE benefit_election (id VARCHAR(255) NOT NULL, designation_id VARCHAR(255), review_cycle_days VARCHAR(255), scope VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE clinical_prog (id VARCHAR(255) NOT NULL, prog_id VARCHAR(255), tool_id VARCHAR(255), metric_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE track_req (id VARCHAR(255) NOT NULL, track_req_id VARCHAR(255), student_id VARCHAR(255), start_date VARCHAR(255), mandatory VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE officer_role (id VARCHAR(255) NOT NULL, officer_id VARCHAR(255), assignment_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE control_activity (id VARCHAR(255) NOT NULL, activity_id VARCHAR(255), program_id VARCHAR(255), street_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE test_run (id VARCHAR(255) NOT NULL, test_run_id VARCHAR(255), protocol_id VARCHAR(255), material_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE math_session (id VARCHAR(255) NOT NULL, math_session_id VARCHAR(255), topic_id VARCHAR(255), student_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE data_ctrl_role (id VARCHAR(255) NOT NULL, ctrl_role_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, func_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE data_processing_log (id VARCHAR(255) NOT NULL, proc_act_id VARCHAR(255), operation_id VARCHAR(255), target_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE strap_fix_evt (id VARCHAR(255) NOT NULL, fix_evt_id VARCHAR(255), strap_ref VARCHAR(255), floor_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ird_role (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), activity_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE regulatory_filing (id VARCHAR(255) NOT NULL, filing_id VARCHAR(255), regulator_id VARCHAR(255), report_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE health_record (id VARCHAR(255) NOT NULL, record_id VARCHAR(255), condition_id VARCHAR(255), client_id VARCHAR(255), encoding_type VARCHAR(255), record_title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE cc_role (id VARCHAR(255) NOT NULL, cc_role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE disclosure_case (id VARCHAR(255) NOT NULL, case_id VARCHAR(255), channel_id VARCHAR(255), submitter_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE discipline_cases (id VARCHAR(255) NOT NULL, case_id VARCHAR(255), asset_id VARCHAR(255), person_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE admin_role (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), staff_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE comp_coord (id VARCHAR(255) NOT NULL, coord_id VARCHAR(255), acad_rec_id VARCHAR(255), elig_check_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE credit_cert (id VARCHAR(255) NOT NULL, credit_cert_id VARCHAR(255), term_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE athlete_monitor_assignments (id VARCHAR(255) NOT NULL, assign_id VARCHAR(255), staff_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE agenda (id VARCHAR(255) NOT NULL, agenda_id VARCHAR(255), talk_id VARCHAR(255), title VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE sci_org (id VARCHAR(255) NOT NULL, org_id VARCHAR(255), journal_id VARCHAR(255), meeting_id VARCHAR(255), created_date VARCHAR(255), mime_type VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE donor_registry (id VARCHAR(255) NOT NULL, donor_id VARCHAR(255), contact_ref VARCHAR(255), display_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE donation_txn (id VARCHAR(255) NOT NULL, donation_id VARCHAR(255), donor_id VARCHAR(255), purpose_id VARCHAR(255), description VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mem_transfer (id VARCHAR(255) NOT NULL, transfer_id VARCHAR(255), mem_id VARCHAR(255), assignee_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE emp_retention_roles (id VARCHAR(255) NOT NULL, retention_role_id VARCHAR(255), inheres_in VARCHAR(255), transfer_auth_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mem_xfer_req (id VARCHAR(255) NOT NULL, xfer_req_id VARCHAR(255), submitting_dept_id VARCHAR(255), char_enc VARCHAR(255), lang_cd VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE care_plan (id VARCHAR(255) NOT NULL, care_plan_id VARCHAR(255), student_id VARCHAR(255), intervention_id VARCHAR(255), format_code VARCHAR(255), plan_title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE stu_prog_assignment (id VARCHAR(255) NOT NULL, enroll_id VARCHAR(255), student_id VARCHAR(255), program_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE prov_chg_req (id VARCHAR(255) NOT NULL, swap_id VARCHAR(255), cust_id VARCHAR(255), vendor_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ozone_session (id VARCHAR(255) NOT NULL, ozone_session_id VARCHAR(255), gas_blend_id VARCHAR(255), procedure_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE cloud_storage_assignments (id VARCHAR(255) NOT NULL, alloc_id VARCHAR(255), student_id VARCHAR(255), volume_id VARCHAR(255), unit VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE meas_capab (id VARCHAR(255) NOT NULL, capab_id VARCHAR(255), param_id VARCHAR(255), range_id VARCHAR(255), label VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE sec_incidents (id VARCHAR(255) NOT NULL, sec_inc_id VARCHAR(255), target_net_id VARCHAR(255), impact_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE med_inv (id VARCHAR(255) NOT NULL, inv_rec_id VARCHAR(255), med_asset_id VARCHAR(255), data_fmt VARCHAR(255), item_name VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE nurse_role (id VARCHAR(255) NOT NULL, nurse_id VARCHAR(255), provider_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE role_profiles (id VARCHAR(255) NOT NULL, profile_id VARCHAR(255), role_id VARCHAR(255), code_sys VARCHAR(255), label_txt VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ct_radiologist (id VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE imaging_core (id VARCHAR(255) NOT NULL, core_id VARCHAR(255), rel_0000115 VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE job_role (id VARCHAR(255) NOT NULL, job_role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE qual_sessions (id VARCHAR(255) NOT NULL, qual_id VARCHAR(255), session_id VARCHAR(255), practice_type VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE dns_abuse_case (id VARCHAR(255) NOT NULL, case_id VARCHAR(255), incident_id VARCHAR(255), registry_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE abuse_policy (id VARCHAR(255) NOT NULL, policy_id VARCHAR(255), abuse_event_ref VARCHAR(255), program_ref VARCHAR(255), priority VARCHAR(255), review_cycle_days VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE esg_fund_portfolio (id VARCHAR(255) NOT NULL, fund_portfolio_id VARCHAR(255), asset_id VARCHAR(255), portfolio_label VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE corp_reputation_impact (id VARCHAR(255) NOT NULL, rep_impact_id VARCHAR(255), decision_id VARCHAR(255), encoding_type VARCHAR(255), display_label VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE md_sim_run (id VARCHAR(255) NOT NULL, md_sim_id VARCHAR(255), software_id VARCHAR(255), target_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE sme_survey_matches (id VARCHAR(255) NOT NULL, dataset_id VARCHAR(255), source_id VARCHAR(255), char_encoding VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE gov_process (id VARCHAR(255) NOT NULL, process_id VARCHAR(255), budget_id VARCHAR(255), kpi_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE business_needs (id VARCHAR(255) NOT NULL, need_id VARCHAR(255), requestor_id VARCHAR(255), format_code VARCHAR(255), description VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE legal_matter (id VARCHAR(255) NOT NULL, matter_id VARCHAR(255), client_id VARCHAR(255), document_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE prog_req (id VARCHAR(255) NOT NULL, req_id VARCHAR(255), unit VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE cov_param (id VARCHAR(255) NOT NULL, cov_param_id VARCHAR(255), method_code VARCHAR(255), error_margin VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE genomic_analysis_program (id VARCHAR(255) NOT NULL, program_id VARCHAR(255), patient_id VARCHAR(255), model_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE genomic_test (id VARCHAR(255) NOT NULL, seq_test_id VARCHAR(255), sample_id VARCHAR(255), platform_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE health_profile (id VARCHAR(255) NOT NULL, profile_id VARCHAR(255), genomic_ref VARCHAR(255), imaging_ref VARCHAR(255), display_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE concept_process (id VARCHAR(255) NOT NULL, process_id VARCHAR(255), source_concept_id VARCHAR(255), target_concept_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE render_output (id VARCHAR(255) NOT NULL, render_id VARCHAR(255), concretizes VARCHAR(255) NOT NULL, realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE social_media_admin (id VARCHAR(255) NOT NULL, admin_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE social_reg (id VARCHAR(255) NOT NULL, reg_id VARCHAR(255), login_cred_id VARCHAR(255), officer_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE exec_position (id VARCHAR(255) NOT NULL, exec_role_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE fin_plan_cycle (id VARCHAR(255) NOT NULL, plan_cycle_id VARCHAR(255), exec_team_id VARCHAR(255), report_ref VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE exec_team (id VARCHAR(255) NOT NULL, exec_team_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, roster_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE risk_accept_eval (id VARCHAR(255) NOT NULL, eval_risk_id VARCHAR(255), risk_metric_id VARCHAR(255), sys_cond_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE certified_tester (id VARCHAR(255) NOT NULL, tester_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE cems_eval (id VARCHAR(255) NOT NULL, eval_id VARCHAR(255), monitor_id VARCHAR(255), method_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE field_equip_coord (id VARCHAR(255) NOT NULL, equip_coord_id VARCHAR(255), equip_ref VARCHAR(255), op_ref VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE test_unit_catalog (id VARCHAR(255) NOT NULL, catalog_id VARCHAR(255), emission_source_id VARCHAR(255), record_format VARCHAR(255), data_encoding VARCHAR(255), language_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE treatment_record (id VARCHAR(255) NOT NULL, treatment_id VARCHAR(255), child_id VARCHAR(255), outcome_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE stat_test (id VARCHAR(255) NOT NULL, hypo_test_id VARCHAR(255), test_stat_id VARCHAR(255), alpha_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE staff_smm_assignments (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE social_platform (id VARCHAR(255) NOT NULL, platform_id VARCHAR(255), service_type_id VARCHAR(255), method VARCHAR(255), uncertainty VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE enc_dim_spec (id VARCHAR(255) NOT NULL, dim_spec_id VARCHAR(255), width_mm VARCHAR(255), height_mm VARCHAR(255), unit_cd VARCHAR(255), spec_label VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE course (id VARCHAR(255) NOT NULL, course_id VARCHAR(255), rel_0000178 VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE staff_assignments (id VARCHAR(255) NOT NULL, assign_id VARCHAR(255), staff_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE flood_eval (id VARCHAR(255) NOT NULL, assessment_id VARCHAR(255), asset_id VARCHAR(255), data_source_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE auth_role_assign (id VARCHAR(255) NOT NULL, auth_role_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, transfer_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE reportable_disease_req (id VARCHAR(255) NOT NULL, notify_req_id VARCHAR(255), disclosure_subject VARCHAR(255), recipient_facility VARCHAR(255), valid_from VARCHAR(255), is_required VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE youth_care_sum (id VARCHAR(255) NOT NULL, care_summary_id VARCHAR(255), health_status VARCHAR(255), format_code VARCHAR(255), data_encoding VARCHAR(255), summary_label VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mentor_prog (id VARCHAR(255) NOT NULL, program_id VARCHAR(255), guided_role VARCHAR(255), coached_role VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE student_role (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), student_id VARCHAR(255), venture_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE program_track (id VARCHAR(255) NOT NULL, program_id VARCHAR(255), participant_id VARCHAR(255), focus_area VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE study_program (id VARCHAR(255) NOT NULL, program_id VARCHAR(255), course_id VARCHAR(255), career_path VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE emp_role_assignment (id VARCHAR(255) NOT NULL, position_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE team_eval_event (id VARCHAR(255) NOT NULL, eval_event_id VARCHAR(255), staff_id VARCHAR(255), result_id VARCHAR(255), objective_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE abuse_flags (id VARCHAR(255) NOT NULL, indicator_id VARCHAR(255), physical_form VARCHAR(255), uncertainty VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE safeguard_proc (id VARCHAR(255) NOT NULL, safeguard_proc_id VARCHAR(255), child_prot_team_id VARCHAR(255), referral_agency_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE legal_adv_role (id VARCHAR(255) NOT NULL, adv_role_id VARCHAR(255), legal_prof_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE txn_log (id VARCHAR(255) NOT NULL, txn_id VARCHAR(255), giver_id VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE growth_campaign (id VARCHAR(255) NOT NULL, campaign_id VARCHAR(255), region_id VARCHAR(255), plan_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE promo_schedule (id VARCHAR(255) NOT NULL, promo_id VARCHAR(255), min_order_qty VARCHAR(255), product_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE perf_eval (id VARCHAR(255) NOT NULL, eval_id VARCHAR(255), system_id VARCHAR(255), clinician_id VARCHAR(255), metric_code VARCHAR(255), eval_label VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE qi_presentation (id VARCHAR(255) NOT NULL, presentation_id VARCHAR(255), clinical_topic_id VARCHAR(255), framework_id VARCHAR(255), file_format VARCHAR(255), title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE energy_appliance (id VARCHAR(255) NOT NULL, appliance_id VARCHAR(255), component_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE anim_seq_build (id VARCHAR(255) NOT NULL, build_id VARCHAR(255), timeline_id VARCHAR(255), engine_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE case_review (id VARCHAR(255) NOT NULL, case_review_id VARCHAR(255), data_collection_id VARCHAR(255), analysis_method_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE forensic_analysis (id VARCHAR(255) NOT NULL, investigation_id VARCHAR(255), analyst_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE tech_service (id VARCHAR(255) NOT NULL, tech_service_id VARCHAR(255), provider_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_wavelength_variant (id VARCHAR(255) NOT NULL, wavelength_variant VARCHAR(255), "930nm_variant" VARCHAR(255), "940nm_variant" VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE auth_rep_role (id VARCHAR(255) NOT NULL, rep_role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE advice_sessions (id VARCHAR(255) NOT NULL, advice_id VARCHAR(255), product_id VARCHAR(255), client_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE disclosure_docs (id VARCHAR(255) NOT NULL, disclosure_id VARCHAR(255), fund_id VARCHAR(255), doc_format VARCHAR(255), title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE dev_rep_role (id VARCHAR(255) NOT NULL, dev_rep_role_id VARCHAR(255), agent_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE final_inspection (id VARCHAR(255) NOT NULL, inspection_id VARCHAR(255), asset_id VARCHAR(255), requirement_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE checklist_stage (id VARCHAR(255) NOT NULL, checklist_id VARCHAR(255), item_ref VARCHAR(255), char_set VARCHAR(255), checklist_name VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE role_assignment (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE supplier_assessment (id VARCHAR(255) NOT NULL, survey_id VARCHAR(255), vendor_id VARCHAR(255), trend_id VARCHAR(255), char_encoding VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE permit_oversight (id VARCHAR(255) NOT NULL, oversight_id VARCHAR(255), permit_decision_id VARCHAR(255), installation_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE fin_plan (id VARCHAR(255) NOT NULL, plan_id VARCHAR(255), org_unit_id VARCHAR(255), strategy_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE leadership_reqs (id VARCHAR(255) NOT NULL, min_years VARCHAR(255), created_at VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE fin_report (id VARCHAR(255) NOT NULL, report_id VARCHAR(255), financial_status_id VARCHAR(255), financial_strategy_id VARCHAR(255), content_format VARCHAR(255), title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE exec_dir_role (id VARCHAR(255) NOT NULL, exec_role_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE venue_audit (id VARCHAR(255) NOT NULL, venue_audit_id VARCHAR(255), facility_id VARCHAR(255), protocol_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mgr_roles (id VARCHAR(255) NOT NULL, mgr_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE weight_mgmt_exec (id VARCHAR(255) NOT NULL, exec_id VARCHAR(255), patient_id VARCHAR(255), advice_flag VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE clinical_monitor_sys (id VARCHAR(255) NOT NULL, monitor_sys_id VARCHAR(255), protocol_ref VARCHAR(255), metric_ref VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE patient_feedback (id VARCHAR(255) NOT NULL, feedback_id VARCHAR(255), quality_notes VARCHAR(255), service_context VARCHAR(255), feedback_title VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ambassador_assignments (id VARCHAR(255) NOT NULL, ambassador_role_id VARCHAR(255), physician_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE young_phys_elig (id VARCHAR(255) NOT NULL, elig_rule_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE cme_session (id VARCHAR(255) NOT NULL, session_id VARCHAR(255), topic_id VARCHAR(255), goal_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE crisis_event (id VARCHAR(255) NOT NULL, crisis_id VARCHAR(255), macro_trigger VARCHAR(255), phase_code VARCHAR(255), systemic_flag VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE tag_event (id VARCHAR(255) NOT NULL, event_id VARCHAR(255), target_id VARCHAR(255), tag_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE expedition (id VARCHAR(255) NOT NULL, expedition_id VARCHAR(255), crew_id VARCHAR(255), equipment_id VARCHAR(255), region_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE var_margin_rules (id VARCHAR(255) NOT NULL, vm_rule_id VARCHAR(255), collateral_process_id VARCHAR(255), compliance_audit_id VARCHAR(255), mandatory VARCHAR(255), review_interval_days VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE reg_role (id VARCHAR(255) NOT NULL, role_code VARCHAR(255), rel_0000054 VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE grp_surcharge_rule (id VARCHAR(255) NOT NULL, grp_surcharge_id VARCHAR(255), dimension_kind VARCHAR(255), uncertainty VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE svc_rate_config (id VARCHAR(255) NOT NULL, rate_pct VARCHAR(255), uncertainty VARCHAR(255), unit VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE emp_survey (id VARCHAR(255) NOT NULL, survey_id VARCHAR(255), culture_dim_id VARCHAR(255), health_metric_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE culture_dim (id VARCHAR(255) NOT NULL, dim_id VARCHAR(255), target_attr VARCHAR(255), method VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE award_cert (id VARCHAR(255) NOT NULL, award_id VARCHAR(255), awarding_org_id VARCHAR(255), compliance_std_id VARCHAR(255), valid_from VARCHAR(255), scope VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE corp_membership (id VARCHAR(255) NOT NULL, corp_mem_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE healer_roles (id VARCHAR(255) NOT NULL, healer_role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE ritual_event (id VARCHAR(255) NOT NULL, rite_id VARCHAR(255), sacred_item_id VARCHAR(255), target_state VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ceremony (id VARCHAR(255) NOT NULL, ceremony_id VARCHAR(255), participant_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE adult_parent_role (id VARCHAR(255) NOT NULL, parent_role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE pool_staff_roles (id VARCHAR(255) NOT NULL, staff_role_id VARCHAR(255), staff_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE pool_shift (id VARCHAR(255) NOT NULL, shift_id VARCHAR(255), lifeguard_id VARCHAR(255), pool_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE water_qual_runs (id VARCHAR(255) NOT NULL, monitor_run_id VARCHAR(255), ref_standard VARCHAR(255), target_param VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE temp_op_limits (id VARCHAR(255) NOT NULL, limit_id VARCHAR(255), method VARCHAR(255), recorded_at VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE attendance_log (id VARCHAR(255) NOT NULL, attendance_id VARCHAR(255), student_id VARCHAR(255), status_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE course_catalog (id VARCHAR(255) NOT NULL, course_id VARCHAR(255), assessment_ref VARCHAR(255), learner_id VARCHAR(255), format_code VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE assessment_std (id VARCHAR(255) NOT NULL, std_id VARCHAR(255), method_id VARCHAR(255), confidence VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE analysis_case (id VARCHAR(255) NOT NULL, case_id VARCHAR(255), threat_ref VARCHAR(255), assigned_officer VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE staff_position (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE admin_role_assign (id VARCHAR(255) NOT NULL, role_code VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE exec_role (id VARCHAR(255) NOT NULL, exec_role_id VARCHAR(255), exec_function_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE audit_roles (id VARCHAR(255) NOT NULL, audit_role_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mgmt_meeting (id VARCHAR(255) NOT NULL, meeting_id VARCHAR(255), attendee_id VARCHAR(255), decision_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE audit_div (id VARCHAR(255) NOT NULL, audit_div_id VARCHAR(255), cert_auditor_id VARCHAR(255), division_role VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE fine_events (id VARCHAR(255) NOT NULL, event_id VARCHAR(255), owner_id VARCHAR(255), violation_id VARCHAR(255), charset VARCHAR(255), description VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE insp_reports (id VARCHAR(255) NOT NULL, report_id VARCHAR(255), event_id VARCHAR(255), format_code VARCHAR(255), doc_title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE gov_role_2 (id VARCHAR(255) NOT NULL, position_id VARCHAR(255), dept_id VARCHAR(255), function_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE evac_kit (id VARCHAR(255) NOT NULL, evac_id VARCHAR(255), supply_id VARCHAR(255), deploy_type VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE evacuation_notice (id VARCHAR(255) NOT NULL, notice_id VARCHAR(255), hazard_id VARCHAR(255), authority_id VARCHAR(255), char_encoding VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE research_activity (id VARCHAR(255) NOT NULL, activity_id VARCHAR(255), geo_coords VARCHAR(255), researcher_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ddos_mitigation (id VARCHAR(255) NOT NULL, mitigation_id VARCHAR(255), attack_id VARCHAR(255), protected_asset_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE traffic_redirect (id VARCHAR(255) NOT NULL, redirect_id VARCHAR(255), scrub_center_id VARCHAR(255), customer_net_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE biz_roles (id VARCHAR(255) NOT NULL, biz_role_id VARCHAR(255), agent_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE biz_plans (id VARCHAR(255) NOT NULL, plan_id VARCHAR(255), scenario_id VARCHAR(255), funding_id VARCHAR(255), plan_title VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE venture_process (id VARCHAR(255) NOT NULL, venture_id VARCHAR(255), output_id VARCHAR(255), demand_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE audit_plan (id VARCHAR(255) NOT NULL, audit_plan_id VARCHAR(255), audit_goal_id VARCHAR(255), review_method_id VARCHAR(255), text_encoding VARCHAR(255), lang_iso VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE board_chair_roles (id VARCHAR(255) NOT NULL, chair_id VARCHAR(255), appointee_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE svc_registry (id VARCHAR(255) NOT NULL, svc_id VARCHAR(255), capability_id VARCHAR(255), tech_stack VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE secure_env (id VARCHAR(255) NOT NULL, secure_env_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE svc_admit (id VARCHAR(255) NOT NULL, svc_admit_id VARCHAR(255), call_req_id VARCHAR(255), admit_res_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE sla_definitions (id VARCHAR(255) NOT NULL, sla_id VARCHAR(255), provider_id VARCHAR(255), qos_policy_id VARCHAR(255), display_name VARCHAR(255), locale VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE net_res_path_map (id VARCHAR(255) NOT NULL, map_id VARCHAR(255), resource_id VARCHAR(255), path_id VARCHAR(255), dimension_kind VARCHAR(255), unit VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE adoption_petitioner (id VARCHAR(255) NOT NULL, petitioner_id VARCHAR(255), person_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE adoption_case (id VARCHAR(255) NOT NULL, adoption_case_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE adoption_app (id VARCHAR(255) NOT NULL, app_id VARCHAR(255), case_id VARCHAR(255), charset VARCHAR(255), form_title VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE analytics_job (id VARCHAR(255) NOT NULL, job_id VARCHAR(255), input_ref VARCHAR(255), output_ref VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE clin_algo (id VARCHAR(255) NOT NULL, clin_algo_id VARCHAR(255), method_id VARCHAR(255), display_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE care_provider_contract (id VARCHAR(255) NOT NULL, provider_contract_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE hss_issue (id VARCHAR(255) NOT NULL, issue_id VARCHAR(255), event_id VARCHAR(255), regulation_id VARCHAR(255), title VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE decision_role (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), borne_by VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE etym_mapping (id VARCHAR(255) NOT NULL, mapping_id VARCHAR(255), source_tribe_id VARCHAR(255), target_root_id VARCHAR(255), char_encoding VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE grad_elig_review (id VARCHAR(255) NOT NULL, review_id VARCHAR(255), program_id VARCHAR(255), student_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE residency_rules (id VARCHAR(255) NOT NULL, requirement_code VARCHAR(255), student_id VARCHAR(255), office_id VARCHAR(255), effective_from VARCHAR(255), review_cycle_days VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE waiver_cert (id VARCHAR(255) NOT NULL, cert_id VARCHAR(255), board_id VARCHAR(255), waiver_id VARCHAR(255), certified_at VARCHAR(255), label VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE meeting_agenda_item (id VARCHAR(255) NOT NULL, agenda_item_id VARCHAR(255), board_member_id VARCHAR(255), topic_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE care_programs (id VARCHAR(255) NOT NULL, program_id VARCHAR(255), patient_id VARCHAR(255), service_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE unaccompanied_minor_trip (id VARCHAR(255) NOT NULL, minor_trip_id VARCHAR(255), minor_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE route_stop (id VARCHAR(255) NOT NULL, stop_code VARCHAR(255), rel_0000124 VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE urine_drug_test (id VARCHAR(255) NOT NULL, screen_id VARCHAR(255), sample_id VARCHAR(255), compound_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE role_assignments (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE pay_method_cat (id VARCHAR(255) NOT NULL, method_cat_id VARCHAR(255), pay_type VARCHAR(255), dimension_kind VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE research_protocol (id VARCHAR(255) NOT NULL, protocol_id VARCHAR(255), method_id VARCHAR(255), question_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE nutri_ind (id VARCHAR(255) NOT NULL, nutri_ind_id VARCHAR(255), measure_val VARCHAR(255), unit VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE consent_record (id VARCHAR(255) NOT NULL, consent_id VARCHAR(255), participant_id VARCHAR(255), protocol_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE board_role (id VARCHAR(255) NOT NULL, board_role_id VARCHAR(255), holder_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE prop_assess_notice (id VARCHAR(255) NOT NULL, notice_id VARCHAR(255), approval_status VARCHAR(255), notice_text VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE ac_officer_role (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, activity_type VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE raffle_conductor_eligibility (id VARCHAR(255) NOT NULL, eligibility_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE export_job (id VARCHAR(255) NOT NULL, export_job_id VARCHAR(255), exported_data_id VARCHAR(255), api_ref VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE pat_edu_pkg (id VARCHAR(255) NOT NULL, pat_edu_pkg_id VARCHAR(255), bundle_type VARCHAR(255), use_case VARCHAR(255), display_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mount_config (id VARCHAR(255) NOT NULL, mount_cfg_id VARCHAR(255), instrument_id VARCHAR(255), mount_structure_id VARCHAR(255), method VARCHAR(255), unit VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE role_assignments_2 (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), inheres_in VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE kpi_limits (id VARCHAR(255) NOT NULL, kpi_limit_id VARCHAR(255), agent_id VARCHAR(255), metric_id VARCHAR(255), unit_cd VARCHAR(255), display_name VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE sales_wkly_rpt (id VARCHAR(255) NOT NULL, sales_rpt_id VARCHAR(255), tele_sales_id VARCHAR(255), reporting_period_id VARCHAR(255), period_type_cd VARCHAR(255), doc_title VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE clearing_broker_mandate (id VARCHAR(255) NOT NULL, clearing_role_id VARCHAR(255), customer_acct_id VARCHAR(255), realized_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE sec_system (id VARCHAR(255) NOT NULL, sec_system_id VARCHAR(255), component_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE dup_requests (id VARCHAR(255) NOT NULL, dup_req_id VARCHAR(255), requestor_id VARCHAR(255), source_doc_id VARCHAR(255), request_note VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE mail_dispatch (id VARCHAR(255) NOT NULL, dispatch_id VARCHAR(255), drop_site_id VARCHAR(255), sort_rule_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE referral_role_map (id VARCHAR(255) NOT NULL, role_id VARCHAR(255), participates_in VARCHAR(255) NOT NULL, process_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE survey_result (id VARCHAR(255) NOT NULL, finding_id VARCHAR(255), substance_cd VARCHAR(255), prevalence_pct VARCHAR(255), char_encoding VARCHAR(255), lang_cd VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE vehicle_propulsion (id VARCHAR(255) NOT NULL, power_type_cd VARCHAR(255), is_diesel VARCHAR(255), is_non_diesel VARCHAR(255), method VARCHAR(255), unit VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE breeding_app (id VARCHAR(255) NOT NULL, breeding_app_id VARCHAR(255), horse_id VARCHAR(255), app_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE meas_capability (id VARCHAR(255) NOT NULL, capability_id VARCHAR(255), param_id VARCHAR(255), range_id VARCHAR(255), display_name VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE debt_case (id VARCHAR(255) NOT NULL, case_id VARCHAR(255), client_id VARCHAR(255), issue_id VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE housing_policy_doc (id VARCHAR(255) NOT NULL, housing_policy_id VARCHAR(255), topic_code VARCHAR(255), char_encoding VARCHAR(255), lang_code VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_business_activity_process (id VARCHAR(255) NOT NULL, business_activity_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_business_decision (id VARCHAR(255) NOT NULL, business_decision VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_business_entity (id VARCHAR(255) NOT NULL, business_entity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_business_initiative (id VARCHAR(255) NOT NULL, business_initiative VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_calendar_product_specification (id VARCHAR(255) NOT NULL, calendar_product_specification VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_call_volume_metric (id VARCHAR(255) NOT NULL, call_volume_metric VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_cancer_patient (id VARCHAR(255) NOT NULL, cancer_patient VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_care_quality_assessment (id VARCHAR(255) NOT NULL, care_quality_assessment VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_certification_time (id VARCHAR(255) NOT NULL, certification_time VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_certified_internal_auditor (id VARCHAR(255) NOT NULL, certified_internal_auditor VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_chemical_installation (id VARCHAR(255) NOT NULL, chemical_installation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_child_protection_team (id VARCHAR(255) NOT NULL, child_protection_team VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_clearing_process (id VARCHAR(255) NOT NULL, clearing_process VARCHAR(255), involves_object VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_client (id VARCHAR(255) NOT NULL, client VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_client_profile (id VARCHAR(255) NOT NULL, client_profile VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_clinical_performance_data (id VARCHAR(255) NOT NULL, clinical_performance_data VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_clinical_system (id VARCHAR(255) NOT NULL, clinical_system VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_cloud_storage_volume (id VARCHAR(255) NOT NULL, cloud_storage_volume VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_collateral_exchange_process (id VARCHAR(255) NOT NULL, collateral_exchange_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_college_administration (id VARCHAR(255) NOT NULL, college_administration VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_college_community_member (id VARCHAR(255) NOT NULL, college_community_member VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_college_official (id VARCHAR(255) NOT NULL, college_official VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_community_healthcare_setting (id VARCHAR(255) NOT NULL, community_healthcare_setting VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_continuous_emissions_monitoring_system (id VARCHAR(255) NOT NULL, continuous_emissions_monitoring_system VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_copied_document (id VARCHAR(255) NOT NULL, copied_document VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_agent (id VARCHAR(255) NOT NULL, corporate_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_audit_function (id VARCHAR(255) NOT NULL, corporate_audit_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_coalition (id VARCHAR(255) NOT NULL, corporate_coalition VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_employee (id VARCHAR(255) NOT NULL, corporate_employee VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_reputation_metric (id VARCHAR(255) NOT NULL, corporate_reputation_metric VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_course_selection_set (id VARCHAR(255) NOT NULL, course_selection_set VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_court_document (id VARCHAR(255) NOT NULL, court_document VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_criminal_justice_system (id VARCHAR(255) NOT NULL, criminal_justice_system VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_cultural_attribute (id VARCHAR(255) NOT NULL, cultural_attribute VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_curriculum (id VARCHAR(255) NOT NULL, curriculum VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_customer_network (id VARCHAR(255) NOT NULL, customer_network VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_dish (id VARCHAR(255) NOT NULL, dish VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_district_employee (id VARCHAR(255) NOT NULL, district_employee VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_domestic_violence_victim_client (id VARCHAR(255) NOT NULL, domestic_violence_victim_client VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_donor (id VARCHAR(255) NOT NULL, donor VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_donor_agent (id VARCHAR(255) NOT NULL, donor_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_earth_observation_data (id VARCHAR(255) NOT NULL, earth_observation_data VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_economic_goods_and_services (id VARCHAR(255) NOT NULL, economic_goods_and_services VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_energy_saving_component (id VARCHAR(255) NOT NULL, energy_saving_component VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_ethical_investment_asset (id VARCHAR(255) NOT NULL, ethical_investment_asset VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_ethical_requirement (id VARCHAR(255) NOT NULL, ethical_requirement VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_evaluation_outcome (id VARCHAR(255) NOT NULL, evaluation_outcome VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_director_function (id VARCHAR(255) NOT NULL, executive_director_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_execution_function (id VARCHAR(255) NOT NULL, executive_execution_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_team (id VARCHAR(255) NOT NULL, executive_team VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_team_member (id VARCHAR(255) NOT NULL, executive_team_member VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_expedition_equipment (id VARCHAR(255) NOT NULL, expedition_equipment VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_expedition_participant (id VARCHAR(255) NOT NULL, expedition_participant VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_experienced_mentor (id VARCHAR(255) NOT NULL, experienced_mentor VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_export_execution (id VARCHAR(255) NOT NULL, export_execution VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_exported_data_artifact (id VARCHAR(255) NOT NULL, exported_data_artifact VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_external_agency (id VARCHAR(255) NOT NULL, external_agency VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_industrial_emission_source (id VARCHAR(255) NOT NULL, industrial_emission_source VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_information_capability (id VARCHAR(255) NOT NULL, information_capability VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_information_item (id VARCHAR(255) NOT NULL, information_item VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_information_system (id VARCHAR(255) NOT NULL, information_system VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_inspection_event (id VARCHAR(255) NOT NULL, inspection_event VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_intelligence_output (id VARCHAR(255) NOT NULL, intelligence_output VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_interdisciplinary_education (id VARCHAR(255) NOT NULL, interdisciplinary_education VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_investment_choice_decision (id VARCHAR(255) NOT NULL, investment_choice_decision VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_investor_funding_situation (id VARCHAR(255) NOT NULL, investor_funding_situation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_investor_relations_activity (id VARCHAR(255) NOT NULL, investor_relations_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_keyframe_timeline (id VARCHAR(255) NOT NULL, keyframe_timeline VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_lateral_restraint_strap (id VARCHAR(255) NOT NULL, lateral_restraint_strap VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_law_enforcement_agency (id VARCHAR(255) NOT NULL, law_enforcement_agency VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_marital_state (id VARCHAR(255) NOT NULL, marital_state VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_market_demand (id VARCHAR(255) NOT NULL, market_demand VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_market_trend (id VARCHAR(255) NOT NULL, market_trend VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_marketing_plan (id VARCHAR(255) NOT NULL, marketing_plan VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_mathematical_concept (id VARCHAR(255) NOT NULL, mathematical_concept VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_measurement_parameter (id VARCHAR(255) NOT NULL, measurement_parameter VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_member (id VARCHAR(255) NOT NULL, member VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_membership (id VARCHAR(255) NOT NULL, membership VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_minor_person (id VARCHAR(255) NOT NULL, minor_person VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_patient (id VARCHAR(255) NOT NULL, patient VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_pdf_document (id VARCHAR(255) NOT NULL, pdf_document VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_personal_data_record (id VARCHAR(255) NOT NULL, personal_data_record VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_policy_violation (id VARCHAR(255) NOT NULL, policy_violation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_practice_management_topic (id VARCHAR(255) NOT NULL, practice_management_topic VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_practice_session (id VARCHAR(255) NOT NULL, practice_session VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_predicate_concept (id VARCHAR(255) NOT NULL, predicate_concept VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prevalence_rate (id VARCHAR(255) NOT NULL, prevalence_rate VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_program_of_study (id VARCHAR(255) NOT NULL, program_of_study VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_property_owner (id VARCHAR(255) NOT NULL, property_owner VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_public_information_officer (id VARCHAR(255) NOT NULL, public_information_officer VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_qo_s_constraint (id VARCHAR(255) NOT NULL, qo_s_constraint VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_quality_improvement_framework (id VARCHAR(255) NOT NULL, quality_improvement_framework VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_quantitative_analytic_tool (id VARCHAR(255) NOT NULL, quantitative_analytic_tool VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_raffle_conducting_activity (id VARCHAR(255) NOT NULL, raffle_conducting_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_receiving_facility_staff (id VARCHAR(255) NOT NULL, receiving_facility_staff VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_recovered_state (id VARCHAR(255) NOT NULL, recovered_state VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_service_management_process (id VARCHAR(255) NOT NULL, service_management_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_service_performance_metric (id VARCHAR(255) NOT NULL, service_performance_metric VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_service_provider (id VARCHAR(255) NOT NULL, service_provider VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_service_provision_activity (id VARCHAR(255) NOT NULL, service_provision_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_service_request (id VARCHAR(255) NOT NULL, service_request VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_significance_level (id VARCHAR(255) NOT NULL, significance_level VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_simulation_software (id VARCHAR(255) NOT NULL, simulation_software VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_slavic_linguistic_root (id VARCHAR(255) NOT NULL, slavic_linguistic_root VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_social_harmony_restoration (id VARCHAR(255) NOT NULL, social_harmony_restoration VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_social_media_account_management_process_definition (id VARCHAR(255) NOT NULL, social_media_account_management_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_social_networking_service_type (id VARCHAR(255) NOT NULL, social_networking_service_type VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_social_services_department (id VARCHAR(255) NOT NULL, social_services_department VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_social_tag (id VARCHAR(255) NOT NULL, social_tag VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_software_interface (id VARCHAR(255) NOT NULL, software_interface VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_subject_concept (id VARCHAR(255) NOT NULL, subject_concept VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_target_material (id VARCHAR(255) NOT NULL, target_material VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_taxi_ride_process (id VARCHAR(255) NOT NULL, taxi_ride_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_team_function (id VARCHAR(255) NOT NULL, team_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_tele_sales_activity (id VARCHAR(255) NOT NULL, tele_sales_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_telescope_instrument_artifact (id VARCHAR(255) NOT NULL, telescope_instrument_artifact VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_test_statistic (id VARCHAR(255) NOT NULL, test_statistic VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_threat_information (id VARCHAR(255) NOT NULL, threat_information VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_agenda_subject (id VARCHAR(255) NOT NULL, agenda_subject VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_approval_recommendation (id VARCHAR(255) NOT NULL, approval_recommendation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_assessment_method (id VARCHAR(255) NOT NULL, assessment_method VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_assessment_participant (id VARCHAR(255) NOT NULL, assessment_participant VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_athletic_monitoring_activity (id VARCHAR(255) NOT NULL, athletic_monitoring_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_audit_objective (id VARCHAR(255) NOT NULL, audit_objective VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_authorized_entity (id VARCHAR(255) NOT NULL, authorized_entity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_autohemotherapy_procedure (id VARCHAR(255) NOT NULL, autohemotherapy_procedure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_automated_system (id VARCHAR(255) NOT NULL, automated_system VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_available_topping (id VARCHAR(255) NOT NULL, available_topping VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_board_member (id VARCHAR(255) NOT NULL, board_member VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_board_of_assessors_meeting (id VARCHAR(255) NOT NULL, board_of_assessors_meeting VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_board_of_equalization (id VARCHAR(255) NOT NULL, board_of_equalization VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_building_floor_structure (id VARCHAR(255) NOT NULL, building_floor_structure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_cyber_security_incident (id VARCHAR(255) NOT NULL, cyber_security_incident VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_data_collection_process (id VARCHAR(255) NOT NULL, data_collection_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_data_input (id VARCHAR(255) NOT NULL, data_input VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_decision_making_process_definition (id VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_degraded_system_condition (id VARCHAR(255) NOT NULL, degraded_system_condition VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_departing_employee (id VARCHAR(255) NOT NULL, departing_employee VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_geographic_region (id VARCHAR(255) NOT NULL, geographic_region VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_governance_function (id VARCHAR(255) NOT NULL, governance_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_h_s_s_s_e_q__situation (id VARCHAR(255) NOT NULL, h_s_s_s_e_q__situation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_health_care_summary (id VARCHAR(255) NOT NULL, health_care_summary VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_health_standard_compliance (id VARCHAR(255) NOT NULL, health_standard_compliance VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_healthcare_agent (id VARCHAR(255) NOT NULL, healthcare_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_law_enforcement_personnel (id VARCHAR(255) NOT NULL, law_enforcement_personnel VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_lecture_notes (id VARCHAR(255) NOT NULL, lecture_notes VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_legal_advertisement_activity (id VARCHAR(255) NOT NULL, legal_advertisement_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_legal_entity_or_person (id VARCHAR(255) NOT NULL, legal_entity_or_person VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_legal_professional (id VARCHAR(255) NOT NULL, legal_professional VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_legal_tech_solution_lab (id VARCHAR(255) NOT NULL, legal_tech_solution_lab VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_legislative_department (id VARCHAR(255) NOT NULL, legislative_department VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_lifeguard_staff (id VARCHAR(255) NOT NULL, lifeguard_staff VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_local_authority (id VARCHAR(255) NOT NULL, local_authority VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_login_credentials (id VARCHAR(255) NOT NULL, login_credentials VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_machine_learning_model (id VARCHAR(255) NOT NULL, machine_learning_model VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_mail_drop_location (id VARCHAR(255) NOT NULL, mail_drop_location VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_malnourished_child (id VARCHAR(255) NOT NULL, malnourished_child VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_monetary_amount (id VARCHAR(255) NOT NULL, monetary_amount VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_monitoring_protocol (id VARCHAR(255) NOT NULL, monitoring_protocol VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_municipal_pool_facility (id VARCHAR(255) NOT NULL, municipal_pool_facility VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_network_infrastructure (id VARCHAR(255) NOT NULL, network_infrastructure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_network_provider (id VARCHAR(255) NOT NULL, network_provider VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_network_resource (id VARCHAR(255) NOT NULL, network_resource VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_network_scrubbing_center (id VARCHAR(255) NOT NULL, network_scrubbing_center VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_non_diesel_powered_vehicle (id VARCHAR(255) NOT NULL, non_diesel_powered_vehicle VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_nonprofit_organization (id VARCHAR(255) NOT NULL, nonprofit_organization VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_referral_process (id VARCHAR(255) NOT NULL, referral_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_regulatory_authority (id VARCHAR(255) NOT NULL, regulatory_authority VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_regulatory_body (id VARCHAR(255) NOT NULL, regulatory_body VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_rendering_engine (id VARCHAR(255) NOT NULL, rendering_engine VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_rendering_environment_definition (id VARCHAR(255) NOT NULL, rendering_environment VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_reporting_channel (id VARCHAR(255) NOT NULL, reporting_channel VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_requested_provider_type (id VARCHAR(255) NOT NULL, requested_provider_type VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_requesting_client (id VARCHAR(255) NOT NULL, requesting_client VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_requesting_entity (id VARCHAR(255) NOT NULL, requesting_entity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_research_activity (id VARCHAR(255) NOT NULL, research_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_facility_infrastructure (id VARCHAR(255) NOT NULL, facility_infrastructure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_final_inspection_process (id VARCHAR(255) NOT NULL, final_inspection_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_financial_fund (id VARCHAR(255) NOT NULL, financial_fund VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_financial_management_process (id VARCHAR(255) NOT NULL, financial_management_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_financial_product (id VARCHAR(255) NOT NULL, financial_product VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_financial_report (id VARCHAR(255) NOT NULL, financial_report VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_financial_resource (id VARCHAR(255) NOT NULL, financial_resource VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_health_record_transfer_process (id VARCHAR(255) NOT NULL, health_record_transfer_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_healthcare_network_infrastructure (id VARCHAR(255) NOT NULL, healthcare_network_infrastructure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_healthcare_organization (id VARCHAR(255) NOT NULL, healthcare_organization VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_height_measurement (id VARCHAR(255) NOT NULL, height_measurement VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_horse_identity (id VARCHAR(255) NOT NULL, horse_identity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_housing_client (id VARCHAR(255) NOT NULL, housing_client VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_housing_debt_issue (id VARCHAR(255) NOT NULL, housing_debt_issue VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_housing_policy_topic (id VARCHAR(255) NOT NULL, housing_policy_topic VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_human_agent (id VARCHAR(255) NOT NULL, human_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_imaging_equipment (id VARCHAR(255) NOT NULL, imaging_equipment VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_independent_economic_agent (id VARCHAR(255) NOT NULL, independent_economic_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_individual (id VARCHAR(255) NOT NULL, individual VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_observatory_mounting_structure (id VARCHAR(255) NOT NULL, observatory_mounting_structure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_offline_channel (id VARCHAR(255) NOT NULL, offline_channel VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_online_channel (id VARCHAR(255) NOT NULL, online_channel VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_operational_disruption (id VARCHAR(255) NOT NULL, operational_disruption VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_operational_effectiveness (id VARCHAR(255) NOT NULL, operational_effectiveness VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_operational_equipment (id VARCHAR(255) NOT NULL, operational_equipment VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_operational_protocol (id VARCHAR(255) NOT NULL, operational_protocol VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_operational_unit (id VARCHAR(255) NOT NULL, operational_unit VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_order_constraint (id VARCHAR(255) NOT NULL, order_constraint VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organization_member (id VARCHAR(255) NOT NULL, organization_member VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organizational_agent (id VARCHAR(255) NOT NULL, organizational_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organizational_function (id VARCHAR(255) NOT NULL, organizational_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organizational_health_metric (id VARCHAR(255) NOT NULL, organizational_health_metric VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organizational_leadership_role (id VARCHAR(255) NOT NULL, organizational_leadership_role VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_ozone_oxygen_mixture (id VARCHAR(255) NOT NULL, ozone_oxygen_mixture VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_academic_degree (id VARCHAR(255) NOT NULL, academic_degree VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_calendar_product (id VARCHAR(255) NOT NULL, calendar_product VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_call_volume (id VARCHAR(255) NOT NULL, call_volume VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_child (id VARCHAR(255) NOT NULL, child VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_clinical_care (id VARCHAR(255) NOT NULL, clinical_care VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_communication_security_aspect (id VARCHAR(255) NOT NULL, communication_security_aspect VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_constructed_predicate (id VARCHAR(255) NOT NULL, constructed_predicate VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_continuous_emissions_monitoring_process (id VARCHAR(255) NOT NULL, continuous_emissions_monitoring_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_activity (id VARCHAR(255) NOT NULL, corporate_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_audit_process (id VARCHAR(255) NOT NULL, corporate_audit_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_employment_process (id VARCHAR(255) NOT NULL, corporate_employment_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_corporate_reputation (id VARCHAR(255) NOT NULL, corporate_reputation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_course (id VARCHAR(255) NOT NULL, course VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_criminal_justice_process (id VARCHAR(255) NOT NULL, criminal_justice_process VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_customer_device (id VARCHAR(255) NOT NULL, customer_device VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_database_container (id VARCHAR(255) NOT NULL, database_container VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_decision_action (id VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_decision_transition_action (id VARCHAR(255) NOT NULL, decision_transition_action VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_diagnostic_imaging (id VARCHAR(255) NOT NULL, diagnostic_imaging VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_ethical_investment (id VARCHAR(255) NOT NULL, ethical_investment VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_ethical_standard (id VARCHAR(255) NOT NULL, ethical_standard VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_direction (id VARCHAR(255) NOT NULL, executive_direction VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_implementation (id VARCHAR(255) NOT NULL, executive_implementation VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_executive_leadership_role (id VARCHAR(255) NOT NULL, executive_leadership_role VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_external_business_partner (id VARCHAR(255) NOT NULL, external_business_partner VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_financial_instrument (id VARCHAR(255) NOT NULL, financial_instrument VARCHAR(255), participates_in VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_financial_strategy_oversight (id VARCHAR(255) NOT NULL, financial_strategy_oversight VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_higher_education_institution (id VARCHAR(255) NOT NULL, higher_education_institution VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_institutional_investor (id VARCHAR(255) NOT NULL, institutional_investor VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_legal_proceeding (id VARCHAR(255) NOT NULL, legal_proceeding VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_network_user (id VARCHAR(255) NOT NULL, network_user VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_observation_function (id VARCHAR(255) NOT NULL, observation_function VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organization (id VARCHAR(255) NOT NULL, organization VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_organizational_culture (id VARCHAR(255) NOT NULL, organizational_culture VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_original_document (id VARCHAR(255) NOT NULL, original_document VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_pdf_format (id VARCHAR(255) NOT NULL, pdf_format VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_personally_identifiable_information (id VARCHAR(255) NOT NULL, personally_identifiable_information VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_population (id VARCHAR(255) NOT NULL, population VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_professional_experience (id VARCHAR(255) NOT NULL, professional_experience VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_qualification_level (id VARCHAR(255) NOT NULL, qualification_level VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_raffle (id VARCHAR(255) NOT NULL, raffle VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_age (id VARCHAR(255) NOT NULL, age VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_continuousmode (id VARCHAR(255) NOT NULL, continuous_mode VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_riskmanagementactivity (id VARCHAR(255) NOT NULL, risk_management_activity VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_chemical (id VARCHAR(255) NOT NULL, chemical VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_schoolsecuritypolicy (id VARCHAR(255) NOT NULL, school_security_policy VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_scientificorganization (id VARCHAR(255) NOT NULL, scientific_organization VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_servicelevelagreement (id VARCHAR(255) NOT NULL, service_level_agreement VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_stateaction (id VARCHAR(255) NOT NULL, state_action VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_tariffstructure (id VARCHAR(255) NOT NULL, tariff_structure VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_vulnerabilitystate (id VARCHAR(255) NOT NULL, vulnerability_state VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_skillimprovement (id VARCHAR(255) NOT NULL, skill_improvement VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_prim_socialnetworkingserviceusage (id VARCHAR(255) NOT NULL, social_networking_service_usage VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_board_member_role_realization (id VARCHAR(255) NOT NULL, board_member_role_realization VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_chief_compliance_officer_service_delivery_process (id VARCHAR(255) NOT NULL, chief_compliance_officer_service_delivery_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_college_administration_process (id VARCHAR(255) NOT NULL, college_administration_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_general_manager_function_execution (id VARCHAR(255) NOT NULL, general_manager_function_execution VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_legal_tech_service_delivery_process (id VARCHAR(255) NOT NULL, legal_tech_service_delivery_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_performance_based_care_delivery_process (id VARCHAR(255) NOT NULL, performance_based_care_delivery_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_police_patrol_process (id VARCHAR(255) NOT NULL, police_patrol_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_qualified_source_testing_process (id VARCHAR(255) NOT NULL, qualified_source_testing_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_clearing_broker_service_delivery_process (id VARCHAR(255) NOT NULL, clearing_broker_service_delivery_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_rights_exercise_process (id VARCHAR(255) NOT NULL, rights_exercise_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_authorized_entity_authorization_process (id VARCHAR(255) NOT NULL, authorized_entity_authorization_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_joint_board_chair_service_delivery_process (id VARCHAR(255) NOT NULL, joint_board_chair_service_delivery_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_social_media_account_management_process (id VARCHAR(255) NOT NULL, social_media_account_management_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_community_healthcare_service_delivery_process (id VARCHAR(255) NOT NULL, community_healthcare_service_delivery_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_decision_making_process (id VARCHAR(255) NOT NULL, decision_making_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_parenting_process (id VARCHAR(255) NOT NULL, parenting_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_rendering_environment (id VARCHAR(255) NOT NULL, rendering_environment VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_traditional_religious_healing_process (id VARCHAR(255) NOT NULL, traditional_religious_healing_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_organizational_leadership_process (id VARCHAR(255) NOT NULL, organizational_leadership_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_young_researcher_research_process (id VARCHAR(255) NOT NULL, young_researcher_research_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_review_panel_quorum (id VARCHAR(255) NOT NULL, review_panel_session VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_capacity_bounded_enrollment (id VARCHAR(255) NOT NULL, cohort_enrollment_process VARCHAR(255), participant VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_dual_custody_signoff (id VARCHAR(255) NOT NULL, dual_custody_signoff_process VARCHAR(255), participant VARCHAR(255) NOT NULL, realizes VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_bounded_committee_membership (id VARCHAR(255) NOT NULL, standing_committee_assembly VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_identifier_bearer_union (id VARCHAR(255) NOT NULL, registered_identifier_bearer VARCHAR(255), natural_person_registrant VARCHAR(255), registered_organization VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_notification_target_union (id VARCHAR(255) NOT NULL, compliance_notification_process VARCHAR(255), responsible_officer VARCHAR(255), delegated_agent VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_escalation_channel_union (id VARCHAR(255) NOT NULL, incident_escalation_process VARCHAR(255), supervisory_review VARCHAR(255), external_audit_review VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_scored_assessment_bounds (id VARCHAR(255) NOT NULL, scored_assessment_record VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_versioned_form_lineage (id VARCHAR(255) NOT NULL, versioned_intake_form VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_bounded_metric_series (id VARCHAR(255) NOT NULL, bounded_metric_series VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_restricted_participation_review (id VARCHAR(255) NOT NULL, accredited_review_process VARCHAR(255), participant VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_typed_realization_channel (id VARCHAR(255) NOT NULL, on_call_coverage_role VARCHAR(255), realized_in VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE t_custody_scope_typing (id VARCHAR(255) NOT NULL, archival_custody_process VARCHAR(255), participant VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE t_measured_series_reading (id VARCHAR(255) NOT NULL, measured_series_reading VARCHAR(255), PRIMARY KEY (id));

COMMENT ON TABLE caregiver_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"parenting_role"}';

COMMENT ON TABLE doc_event IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clinical_documentation_activity"}';

COMMENT ON TABLE pdf_export_job IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"pdf_export_process"}';

COMMENT ON TABLE lect_sessions IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"lecture_session"}';

COMMENT ON TABLE young_res_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"young_researcher_role"}';

COMMENT ON TABLE library_role_assignment IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"library_student_assistant_role"}';

COMMENT ON TABLE dispenser_sites IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"condiment_station"}';

COMMENT ON TABLE child_designation IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"indigenous_child_role"}';

COMMENT ON TABLE police_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"police_officer_role"}';

COMMENT ON TABLE web_project IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"responsive_website_development"}';

COMMENT ON TABLE campaign_channel_map IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"campaign_coordination"}';

COMMENT ON TABLE election_records IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"benefit_option_election"}';

COMMENT ON TABLE pension_election IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"retirement_benefit_option"}';

COMMENT ON TABLE marital_cert IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"marital_status_certification"}';

COMMENT ON TABLE benefit_election IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"beneficiary_designation"}';

COMMENT ON TABLE clinical_prog IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clinical_quality_improvement_program"}';

COMMENT ON TABLE track_req IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"law_and_society_track_requirement"}';

COMMENT ON TABLE officer_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"senior_animal_services_officer_role"}';

COMMENT ON TABLE control_activity IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"vector_control_activity"}';

COMMENT ON TABLE test_run IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"specification_testing_event"}';

COMMENT ON TABLE math_session IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"mathematical_learning_process"}';

COMMENT ON TABLE data_ctrl_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"data_controller_role"}';

COMMENT ON TABLE data_processing_log IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"personal_data_processing_activity"}';

COMMENT ON TABLE strap_fix_evt IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"strap_fixing_process"}';

COMMENT ON TABLE ird_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"investor_relations_director_role"}';

COMMENT ON TABLE regulatory_filing IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"corporate_information_disclosure_process"}';

COMMENT ON TABLE health_record IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"personal_health_record"}';

COMMENT ON TABLE cc_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"chief_compliance_officer_role"}';

COMMENT ON TABLE disclosure_case IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"protected_disclosure_process"}';

COMMENT ON TABLE discipline_cases IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"improper_conduct_event"}';

COMMENT ON TABLE admin_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"college_official_role"}';

COMMENT ON TABLE comp_coord IS '{"bfo_anchor":["bfo:0000023","cco:Role"],"family":"catalog","is_complex":true,"template_id":"compliance_coordinator_role"}';

COMMENT ON TABLE credit_cert IS '{"bfo_anchor":["bfo:0000015","bfo:0000057"],"family":"catalog","is_complex":true,"template_id":"credit_hour_certification_process"}';

COMMENT ON TABLE athlete_monitor_assignments IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"athletic_attendant_role"}';

COMMENT ON TABLE agenda IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"conference_programme"}';

COMMENT ON TABLE sci_org IS '{"bfo_anchor":["cco:Artifact"],"family":"catalog","is_complex":true,"template_id":"scientific_organization"}';

COMMENT ON TABLE donor_registry IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"donor_profile"}';

COMMENT ON TABLE donation_txn IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"donation_transaction_record"}';

COMMENT ON TABLE mem_transfer IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"membership_transfer_process"}';

COMMENT ON TABLE emp_retention_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"retaining_employee_role"}';

COMMENT ON TABLE mem_xfer_req IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"membership_transfer_request"}';

COMMENT ON TABLE care_plan IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"education_health_care_plan"}';

COMMENT ON TABLE stu_prog_assignment IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"educational_placement_process"}';

COMMENT ON TABLE prov_chg_req IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"provider_change_request_process"}';

COMMENT ON TABLE ozone_session IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ozone_therapy_session"}';

COMMENT ON TABLE cloud_storage_assignments IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"cloud_storage_allocation"}';

COMMENT ON TABLE meas_capab IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"measurement_capability"}';

COMMENT ON TABLE sec_incidents IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"cybersecurity_incident"}';

COMMENT ON TABLE med_inv IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"device_inventory_record"}';

COMMENT ON TABLE nurse_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"community_learning_disability_nurse"}';

COMMENT ON TABLE role_profiles IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"role_perception"}';

COMMENT ON TABLE ct_radiologist IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"cardiothoracic_radiologist_role"}';

COMMENT ON TABLE imaging_core IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"preclinical_imaging_core"}';

COMMENT ON TABLE job_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"general_manager_role"}';

COMMENT ON TABLE qual_sessions IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"quality_practice"}';

COMMENT ON TABLE dns_abuse_case IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"dns_abuse_study"}';

COMMENT ON TABLE abuse_policy IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"safeguard_measure"}';

COMMENT ON TABLE esg_fund_portfolio IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"responsible_investment_fund_collection"}';

COMMENT ON TABLE corp_reputation_impact IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"corporate_reputation_influence_situation"}';

COMMENT ON TABLE md_sim_run IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"molecular_dynamics_simulation_process"}';

COMMENT ON TABLE sme_survey_matches IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"matched_sme_dataset"}';

COMMENT ON TABLE gov_process IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"it_governance_process"}';

COMMENT ON TABLE business_needs IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"stakeholder_need"}';

COMMENT ON TABLE legal_matter IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"legal_advocacy_process"}';

COMMENT ON TABLE prog_req IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"academic_program_requirement"}';

COMMENT ON TABLE cov_param IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"sequencing_coverage_parameter"}';

COMMENT ON TABLE genomic_analysis_program IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clinical_genomic_analysis_program"}';

COMMENT ON TABLE genomic_test IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"genomic_sequencing_test"}';

COMMENT ON TABLE health_profile IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"personal_health_profile"}';

COMMENT ON TABLE concept_process IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"concept_construction_process"}';

COMMENT ON TABLE render_output IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"rendered_animation_artifact"}';

COMMENT ON TABLE social_media_admin IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"social_media_account_administrator"}';

COMMENT ON TABLE social_reg IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"social_media_account_registration"}';

COMMENT ON TABLE exec_position IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"chief_financial_officer_role"}';

COMMENT ON TABLE fin_plan_cycle IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_strategy_and_planning_process"}';

COMMENT ON TABLE exec_team IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"executive_team_roster"}';

COMMENT ON TABLE risk_accept_eval IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"risk_informed_acceptability_evaluation"}';

COMMENT ON TABLE certified_tester IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"qualified_source_testing_individual"}';

COMMENT ON TABLE cems_eval IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"continuous_emissions_monitoring_evaluation"}';

COMMENT ON TABLE field_equip_coord IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"field_equipment_coordination"}';

COMMENT ON TABLE test_unit_catalog IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"supervised_test_unit_catalog"}';

COMMENT ON TABLE treatment_record IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"malnutrition_treatment_process"}';

COMMENT ON TABLE stat_test IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"hypothesis_test"}';

COMMENT ON TABLE staff_smm_assignments IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"staff_social_media_account_administrator_role"}';

COMMENT ON TABLE social_platform IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"social_networking_service_platform"}';

COMMENT ON TABLE enc_dim_spec IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"back_shell_dimension_spec"}';

COMMENT ON TABLE course IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"menu_course"}';

COMMENT ON TABLE staff_assignments IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"service_staff_role"}';

COMMENT ON TABLE flood_eval IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"flood_asset_condition_assessment"}';

COMMENT ON TABLE auth_role_assign IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"record_authorization_role"}';

COMMENT ON TABLE reportable_disease_req IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"communicable_disease_notification_requirement"}';

COMMENT ON TABLE youth_care_sum IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"youth_health_care_summary"}';

COMMENT ON TABLE mentor_prog IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"mentorship_program"}';

COMMENT ON TABLE student_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"student_entrepreneur_role"}';

COMMENT ON TABLE program_track IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"incubation_program"}';

COMMENT ON TABLE study_program IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"academic_curriculum_program"}';

COMMENT ON TABLE emp_role_assignment IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"retail_leadership_team_member"}';

COMMENT ON TABLE team_eval_event IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"team_assessment_event"}';

COMMENT ON TABLE abuse_flags IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"abuse_indicator"}';

COMMENT ON TABLE safeguard_proc IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"safeguarding_report_process"}';

COMMENT ON TABLE legal_adv_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"legal_service_advertiser_role"}';

COMMENT ON TABLE txn_log IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"donation_event"}';

COMMENT ON TABLE growth_campaign IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"international_growth_initiative"}';

COMMENT ON TABLE promo_schedule IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"promotional_calendar_order"}';

COMMENT ON TABLE perf_eval IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"clinical_performance_data_evaluation"}';

COMMENT ON TABLE qi_presentation IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"quality_improvement_presentation"}';

COMMENT ON TABLE energy_appliance IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"energy_efficient_appliance"}';

COMMENT ON TABLE anim_seq_build IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"animation_sequence_creation"}';

COMMENT ON TABLE case_review IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"independent_committee_investigation"}';

COMMENT ON TABLE forensic_analysis IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"digital_forensic_analysis"}';

COMMENT ON TABLE tech_service IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"legal_tech_service_provision"}';

COMMENT ON TABLE t_wavelength_variant IS '{"bfo_anchor":["bfo:0000040"],"family":"catalog","is_complex":true,"template_id":"wavelength_variant"}';

COMMENT ON TABLE auth_rep_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"authorized_representative_role"}';

COMMENT ON TABLE advice_sessions IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_product_advice_service"}';

COMMENT ON TABLE disclosure_docs IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"product_disclosure_statement"}';

COMMENT ON TABLE dev_rep_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"developer_representative_role"}';

COMMENT ON TABLE final_inspection IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"final_construction_inspection_process"}';

COMMENT ON TABLE checklist_stage IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"stage_5_checklist"}';

COMMENT ON TABLE role_assignment IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"device_expert_role"}';

COMMENT ON TABLE supplier_assessment IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"supplier_landscape_survey"}';

COMMENT ON TABLE permit_oversight IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"environmental_permitting_supervision_activity"}';

COMMENT ON TABLE fin_plan IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_planning_process"}';

COMMENT ON TABLE leadership_reqs IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"leadership_experience_requirement"}';

COMMENT ON TABLE fin_report IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"financial_report_artifact"}';

COMMENT ON TABLE exec_dir_role IS '{"bfo_anchor":["bfo:0000023","bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"executive_director_role"}';

COMMENT ON TABLE venue_audit IS '{"bfo_anchor":["bfo:0000015","bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"venue_operations_oversight"}';

COMMENT ON TABLE mgr_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"registered_manager_role"}';

COMMENT ON TABLE weight_mgmt_exec IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"weight_reduction_service_execution"}';

COMMENT ON TABLE clinical_monitor_sys IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"clinical_efficacy_monitoring_system"}';

COMMENT ON TABLE patient_feedback IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"patient_feedback_record"}';

COMMENT ON TABLE ambassador_assignments IS '{"bfo_anchor":["bfo:0000023","cco:Role"],"family":"catalog","is_complex":true,"template_id":"young_physician_ambassador_role"}';

COMMENT ON TABLE young_phys_elig IS '{"bfo_anchor":["cco:DescriptiveICE","bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"young_physician_eligibility_constraint"}';

COMMENT ON TABLE cme_session IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"cme_seminar"}';

COMMENT ON TABLE crisis_event IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"financial_crisis_event"}';

COMMENT ON TABLE tag_event IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"social_tagging_process"}';

COMMENT ON TABLE expedition IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"arctic_expedition"}';

COMMENT ON TABLE var_margin_rules IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"variation_margin_rule_set"}';

COMMENT ON TABLE reg_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"recognition_manager_role"}';

COMMENT ON TABLE grp_surcharge_rule IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"small_group_surcharge_rule"}';

COMMENT ON TABLE svc_rate_config IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"service_charge_rate"}';

COMMENT ON TABLE emp_survey IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"employee_feedback_survey"}';

COMMENT ON TABLE culture_dim IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"workplace_culture_dimension"}';

COMMENT ON TABLE award_cert IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"top_workplace_award"}';

COMMENT ON TABLE corp_membership IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"b_corporation_member"}';

COMMENT ON TABLE healer_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"traditional_religious_healer_role"}';

COMMENT ON TABLE ritual_event IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ritual_act_to_restore_order"}';

COMMENT ON TABLE ceremony IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ancestor_veneration_ceremony"}';

COMMENT ON TABLE adult_parent_role IS '{"bfo_anchor":["bfo:0000002","bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"disabled_adult_parent_role"}';

COMMENT ON TABLE pool_staff_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"municipal_swimming_pool_assistant_manager"}';

COMMENT ON TABLE pool_shift IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"municipal_pool_operations_management_activity"}';

COMMENT ON TABLE water_qual_runs IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"water_quality_monitoring_activity"}';

COMMENT ON TABLE temp_op_limits IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"thermal_operating_range_constraint"}';

COMMENT ON TABLE attendance_log IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"attendance_tracking_process"}';

COMMENT ON TABLE course_catalog IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"educational_course"}';

COMMENT ON TABLE assessment_std IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"assessment_standard"}';

COMMENT ON TABLE analysis_case IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"intelligence_analysis_process"}';

COMMENT ON TABLE staff_position IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"faculty_member_role"}';

COMMENT ON TABLE admin_role_assign IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"student_conduct_administrator_role"}';

COMMENT ON TABLE exec_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"executive_officer_role"}';

COMMENT ON TABLE audit_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"board_of_auditors_role"}';

COMMENT ON TABLE mgmt_meeting IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"management_meeting_process"}';

COMMENT ON TABLE audit_div IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"internal_auditing_division"}';

COMMENT ON TABLE fine_events IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"fine_assessment_event"}';

COMMENT ON TABLE insp_reports IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"inspection_report"}';

COMMENT ON TABLE gov_role_2 IS '{"bfo_anchor":["bfo:0000023","cco:Agent","cco:Organization"],"family":"catalog","is_complex":true,"template_id":"secretary_role"}';

COMMENT ON TABLE evac_kit IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"emergency_supplies_kit"}';

COMMENT ON TABLE evacuation_notice IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"evacuation_instruction"}';

COMMENT ON TABLE research_activity IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"research_management_activity"}';

COMMENT ON TABLE ddos_mitigation IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"ddos_mitigation_process"}';

COMMENT ON TABLE traffic_redirect IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"clean_traffic_redirection"}';

COMMENT ON TABLE biz_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"entrepreneur_role"}';

COMMENT ON TABLE biz_plans IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"business_plan"}';

COMMENT ON TABLE venture_process IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"entrepreneurial_activity_process"}';

COMMENT ON TABLE audit_plan IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"internal_audit_strategy"}';

COMMENT ON TABLE board_chair_roles IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"joint_board_chair_role"}';

COMMENT ON TABLE svc_registry IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"information_service"}';

COMMENT ON TABLE secure_env IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"joint_information_environment"}';

COMMENT ON TABLE svc_admit IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"call_admission_control"}';

COMMENT ON TABLE sla_definitions IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"service_level_agreement"}';

COMMENT ON TABLE net_res_path_map IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"network_resource_mapping"}';

COMMENT ON TABLE adoption_petitioner IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"petitioner_role"}';

COMMENT ON TABLE adoption_case IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"adult_adoption_process"}';

COMMENT ON TABLE adoption_app IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"adoption_application_form"}';

COMMENT ON TABLE analytics_job IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"healthcare_analytics_process"}';

COMMENT ON TABLE clin_algo IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"clinical_intelligence_artifact"}';

COMMENT ON TABLE care_provider_contract IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"performance_based_care_provider_role"}';

COMMENT ON TABLE hss_issue IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"hssseq_issue_document"}';

COMMENT ON TABLE decision_role IS '{"bfo_anchor":["bfo:0000023","bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"decision_maker_role"}';

COMMENT ON TABLE etym_mapping IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"etymological_deciphering"}';

COMMENT ON TABLE grad_elig_review IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"graduation_eligibility_assessment"}';

COMMENT ON TABLE residency_rules IS '{"bfo_anchor":["cco:DirectiveICE"],"family":"catalog","is_complex":true,"template_id":"residency_requirement"}';

COMMENT ON TABLE waiver_cert IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"appeal_waiver_certification"}';

COMMENT ON TABLE meeting_agenda_item IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"board_meeting_agenda_item"}';

COMMENT ON TABLE care_programs IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"cancer_support_program"}';

COMMENT ON TABLE unaccompanied_minor_trip IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"unaccompanied_minor_role"}';

COMMENT ON TABLE route_stop IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"pick_drop_location"}';

COMMENT ON TABLE urine_drug_test IS '{"bfo_anchor":["bfo:0000002","bfo:0000015","cco:Process"],"family":"catalog","is_complex":true,"template_id":"urine_drug_screening_procedure"}';

COMMENT ON TABLE role_assignments IS '{"bfo_anchor":["bfo:0000004","bfo:0000023","cco:AgentRole"],"family":"catalog","is_complex":true,"template_id":"juvenile_offender_patient_role"}';

COMMENT ON TABLE pay_method_cat IS '{"bfo_anchor":["bfo:0000002","bfo:0000019","cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"payment_method_category"}';

COMMENT ON TABLE research_protocol IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"biocultural_research_design"}';

COMMENT ON TABLE nutri_ind IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":false,"template_id":"nutritional_status_indicator"}';

COMMENT ON TABLE consent_record IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"informed_consent_process"}';

COMMENT ON TABLE board_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"board_member_role"}';

COMMENT ON TABLE prop_assess_notice IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"property_assessment_notice"}';

COMMENT ON TABLE ac_officer_role IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"animal_control_officer_role"}';

COMMENT ON TABLE raffle_conductor_eligibility IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"eligible_raffle_conductor_role"}';

COMMENT ON TABLE export_job IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"data_export_process"}';

COMMENT ON TABLE pat_edu_pkg IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"patient_educational_content_package"}';

COMMENT ON TABLE mount_config IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"observatory_mounting_configuration"}';

COMMENT ON TABLE role_assignments_2 IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"telemarketer_sales_administrator_role"}';

COMMENT ON TABLE kpi_limits IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"telemarketing_kpi_constraint"}';

COMMENT ON TABLE sales_wkly_rpt IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"weekly_sales_report"}';

COMMENT ON TABLE clearing_broker_mandate IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"clearing_broker_role"}';

COMMENT ON TABLE sec_system IS '{"bfo_anchor":["bfo:0000004"],"family":"catalog","is_complex":true,"template_id":"security_infrastructure"}';

COMMENT ON TABLE dup_requests IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"duplicating_request"}';

COMMENT ON TABLE mail_dispatch IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"mail_dispatch_process"}';

COMMENT ON TABLE referral_role_map IS '{"bfo_anchor":["bfo:0000023"],"family":"catalog","is_complex":true,"template_id":"referral_source_role"}';

COMMENT ON TABLE survey_result IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"survey_finding"}';

COMMENT ON TABLE vehicle_propulsion IS '{"bfo_anchor":["cco:DescriptiveICE"],"family":"catalog","is_complex":true,"template_id":"vehicle_power_type"}';

COMMENT ON TABLE breeding_app IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"breeding_program_application"}';

COMMENT ON TABLE meas_capability IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":true,"template_id":"measurement_capability_profile"}';

COMMENT ON TABLE debt_case IS '{"bfo_anchor":["bfo:0000015"],"family":"catalog","is_complex":true,"template_id":"debt_casework_process"}';

COMMENT ON TABLE housing_policy_doc IS '{"bfo_anchor":["cco:InformationContentEntity"],"family":"catalog","is_complex":false,"template_id":"housing_policy_information"}';

COMMENT ON TABLE t_business_activity_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_activity_process"}';

COMMENT ON TABLE t_business_decision IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_decision"}';

COMMENT ON TABLE t_business_entity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_entity"}';

COMMENT ON TABLE t_business_initiative IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"business_initiative"}';

COMMENT ON TABLE t_calendar_product_specification IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"calendar_product_specification"}';

COMMENT ON TABLE t_call_volume_metric IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"call_volume_metric"}';

COMMENT ON TABLE t_cancer_patient IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cancer_patient"}';

COMMENT ON TABLE t_care_quality_assessment IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"care_quality_assessment"}';

COMMENT ON TABLE t_certification_time IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"certification_time"}';

COMMENT ON TABLE t_certified_internal_auditor IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"certified_internal_auditor"}';

COMMENT ON TABLE t_chemical_installation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"chemical_installation"}';

COMMENT ON TABLE t_child_protection_team IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"child_protection_team"}';

COMMENT ON TABLE t_clearing_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clearing_process"}';

COMMENT ON TABLE t_client IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"client"}';

COMMENT ON TABLE t_client_profile IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"client_profile"}';

COMMENT ON TABLE t_clinical_performance_data IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clinical_performance_data"}';

COMMENT ON TABLE t_clinical_system IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clinical_system"}';

COMMENT ON TABLE t_cloud_storage_volume IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cloud_storage_volume"}';

COMMENT ON TABLE t_collateral_exchange_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"collateral_exchange_process"}';

COMMENT ON TABLE t_college_administration IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"college_administration"}';

COMMENT ON TABLE t_college_community_member IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"college_community_member"}';

COMMENT ON TABLE t_college_official IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"college_official"}';

COMMENT ON TABLE t_community_healthcare_setting IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"community_healthcare_setting"}';

COMMENT ON TABLE t_continuous_emissions_monitoring_system IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"continuous_emissions_monitoring_system"}';

COMMENT ON TABLE t_copied_document IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"copied_document"}';

COMMENT ON TABLE t_corporate_agent IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_agent"}';

COMMENT ON TABLE t_corporate_audit_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_audit_function"}';

COMMENT ON TABLE t_corporate_coalition IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_coalition"}';

COMMENT ON TABLE t_corporate_employee IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_employee"}';

COMMENT ON TABLE t_corporate_reputation_metric IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_reputation_metric"}';

COMMENT ON TABLE t_course_selection_set IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"course_selection_set"}';

COMMENT ON TABLE t_court_document IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"court_document"}';

COMMENT ON TABLE t_criminal_justice_system IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"criminal_justice_system"}';

COMMENT ON TABLE t_cultural_attribute IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cultural_attribute"}';

COMMENT ON TABLE t_curriculum IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"curriculum"}';

COMMENT ON TABLE t_customer_network IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"customer_network"}';

COMMENT ON TABLE t_dish IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"dish"}';

COMMENT ON TABLE t_district_employee IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"district_employee"}';

COMMENT ON TABLE t_domestic_violence_victim_client IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"domestic_violence_victim_client"}';

COMMENT ON TABLE t_donor IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"donor"}';

COMMENT ON TABLE t_donor_agent IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"donor_agent"}';

COMMENT ON TABLE t_earth_observation_data IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"earth_observation_data"}';

COMMENT ON TABLE t_economic_goods_and_services IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"economic_goods_and_services"}';

COMMENT ON TABLE t_energy_saving_component IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"energy_saving_component"}';

COMMENT ON TABLE t_ethical_investment_asset IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_investment_asset"}';

COMMENT ON TABLE t_ethical_requirement IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_requirement"}';

COMMENT ON TABLE t_evaluation_outcome IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"evaluation_outcome"}';

COMMENT ON TABLE t_executive_director_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_director_function"}';

COMMENT ON TABLE t_executive_execution_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_execution_function"}';

COMMENT ON TABLE t_executive_team IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_team"}';

COMMENT ON TABLE t_executive_team_member IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_team_member"}';

COMMENT ON TABLE t_expedition_equipment IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"expedition_equipment"}';

COMMENT ON TABLE t_expedition_participant IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"expedition_participant"}';

COMMENT ON TABLE t_experienced_mentor IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"experienced_mentor"}';

COMMENT ON TABLE t_export_execution IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"export_execution"}';

COMMENT ON TABLE t_exported_data_artifact IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"exported_data_artifact"}';

COMMENT ON TABLE t_external_agency IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"external_agency"}';

COMMENT ON TABLE t_industrial_emission_source IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"industrial_emission_source"}';

COMMENT ON TABLE t_information_capability IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"information_capability"}';

COMMENT ON TABLE t_information_item IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"information_item"}';

COMMENT ON TABLE t_information_system IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"information_system"}';

COMMENT ON TABLE t_inspection_event IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"inspection_event"}';

COMMENT ON TABLE t_intelligence_output IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"intelligence_output"}';

COMMENT ON TABLE t_interdisciplinary_education IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"interdisciplinary_education"}';

COMMENT ON TABLE t_investment_choice_decision IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"investment_choice_decision"}';

COMMENT ON TABLE t_investor_funding_situation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"investor_funding_situation"}';

COMMENT ON TABLE t_investor_relations_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"investor_relations_activity"}';

COMMENT ON TABLE t_keyframe_timeline IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"keyframe_timeline"}';

COMMENT ON TABLE t_lateral_restraint_strap IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"lateral_restraint_strap"}';

COMMENT ON TABLE t_law_enforcement_agency IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"law_enforcement_agency"}';

COMMENT ON TABLE t_marital_state IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"marital_state"}';

COMMENT ON TABLE t_market_demand IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"market_demand"}';

COMMENT ON TABLE t_market_trend IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"market_trend"}';

COMMENT ON TABLE t_marketing_plan IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"marketing_plan"}';

COMMENT ON TABLE t_mathematical_concept IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"mathematical_concept"}';

COMMENT ON TABLE t_measurement_parameter IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"measurement_parameter"}';

COMMENT ON TABLE t_member IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"member"}';

COMMENT ON TABLE t_membership IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"membership"}';

COMMENT ON TABLE t_minor_person IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"minor_person"}';

COMMENT ON TABLE t_patient IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"patient"}';

COMMENT ON TABLE t_pdf_document IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"pdf_document"}';

COMMENT ON TABLE t_personal_data_record IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"personal_data_record"}';

COMMENT ON TABLE t_policy_violation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"policy_violation"}';

COMMENT ON TABLE t_practice_management_topic IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"practice_management_topic"}';

COMMENT ON TABLE t_practice_session IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"practice_session"}';

COMMENT ON TABLE t_predicate_concept IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"predicate_concept"}';

COMMENT ON TABLE t_prevalence_rate IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"prevalence_rate"}';

COMMENT ON TABLE t_program_of_study IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"program_of_study"}';

COMMENT ON TABLE t_property_owner IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"property_owner"}';

COMMENT ON TABLE t_public_information_officer IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"public_information_officer"}';

COMMENT ON TABLE t_qo_s_constraint IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"qo_s_constraint"}';

COMMENT ON TABLE t_quality_improvement_framework IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"quality_improvement_framework"}';

COMMENT ON TABLE t_quantitative_analytic_tool IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"quantitative_analytic_tool"}';

COMMENT ON TABLE t_raffle_conducting_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"raffle_conducting_activity"}';

COMMENT ON TABLE t_receiving_facility_staff IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"receiving_facility_staff"}';

COMMENT ON TABLE t_recovered_state IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"recovered_state"}';

COMMENT ON TABLE t_service_management_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_management_process"}';

COMMENT ON TABLE t_service_performance_metric IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_performance_metric"}';

COMMENT ON TABLE t_service_provider IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_provider"}';

COMMENT ON TABLE t_service_provision_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_provision_activity"}';

COMMENT ON TABLE t_service_request IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"service_request"}';

COMMENT ON TABLE t_significance_level IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"significance_level"}';

COMMENT ON TABLE t_simulation_software IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"simulation_software"}';

COMMENT ON TABLE t_slavic_linguistic_root IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"slavic_linguistic_root"}';

COMMENT ON TABLE t_social_harmony_restoration IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_harmony_restoration"}';

COMMENT ON TABLE t_social_media_account_management_process_definition IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_media_account_management_process_definition"}';

COMMENT ON TABLE t_social_networking_service_type IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_networking_service_type"}';

COMMENT ON TABLE t_social_services_department IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_services_department"}';

COMMENT ON TABLE t_social_tag IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"social_tag"}';

COMMENT ON TABLE t_software_interface IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"software_interface"}';

COMMENT ON TABLE t_subject_concept IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"subject_concept"}';

COMMENT ON TABLE t_target_material IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"target_material"}';

COMMENT ON TABLE t_taxi_ride_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"taxi_ride_process"}';

COMMENT ON TABLE t_team_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"team_function"}';

COMMENT ON TABLE t_tele_sales_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"tele_sales_activity"}';

COMMENT ON TABLE t_telescope_instrument_artifact IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"telescope_instrument_artifact"}';

COMMENT ON TABLE t_test_statistic IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"test_statistic"}';

COMMENT ON TABLE t_threat_information IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"threat_information"}';

COMMENT ON TABLE t_agenda_subject IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"agenda_subject"}';

COMMENT ON TABLE t_approval_recommendation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"approval_recommendation"}';

COMMENT ON TABLE t_assessment_method IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"assessment_method"}';

COMMENT ON TABLE t_assessment_participant IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"assessment_participant"}';

COMMENT ON TABLE t_athletic_monitoring_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"athletic_monitoring_activity"}';

COMMENT ON TABLE t_audit_objective IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"audit_objective"}';

COMMENT ON TABLE t_authorized_entity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"authorized_entity"}';

COMMENT ON TABLE t_autohemotherapy_procedure IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"autohemotherapy_procedure"}';

COMMENT ON TABLE t_automated_system IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"automated_system"}';

COMMENT ON TABLE t_available_topping IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"available_topping"}';

COMMENT ON TABLE t_board_member IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"board_member"}';

COMMENT ON TABLE t_board_of_assessors_meeting IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"board_of_assessors_meeting"}';

COMMENT ON TABLE t_board_of_equalization IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"board_of_equalization"}';

COMMENT ON TABLE t_building_floor_structure IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"building_floor_structure"}';

COMMENT ON TABLE t_cyber_security_incident IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"cyber_security_incident"}';

COMMENT ON TABLE t_data_collection_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"data_collection_process"}';

COMMENT ON TABLE t_data_input IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"data_input"}';

COMMENT ON TABLE t_decision_making_process_definition IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"decision_making_process_definition"}';

COMMENT ON TABLE t_degraded_system_condition IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"degraded_system_condition"}';

COMMENT ON TABLE t_departing_employee IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"departing_employee"}';

COMMENT ON TABLE t_geographic_region IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"geographic_region"}';

COMMENT ON TABLE t_governance_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"governance_function"}';

COMMENT ON TABLE t_h_s_s_s_e_q__situation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"h_s_s_s_e_q__situation"}';

COMMENT ON TABLE t_health_care_summary IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"health_care_summary"}';

COMMENT ON TABLE t_health_standard_compliance IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"health_standard_compliance"}';

COMMENT ON TABLE t_healthcare_agent IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"healthcare_agent"}';

COMMENT ON TABLE t_law_enforcement_personnel IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"law_enforcement_personnel"}';

COMMENT ON TABLE t_lecture_notes IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"lecture_notes"}';

COMMENT ON TABLE t_legal_advertisement_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_advertisement_activity"}';

COMMENT ON TABLE t_legal_entity_or_person IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_entity_or_person"}';

COMMENT ON TABLE t_legal_professional IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_professional"}';

COMMENT ON TABLE t_legal_tech_solution_lab IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_tech_solution_lab"}';

COMMENT ON TABLE t_legislative_department IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legislative_department"}';

COMMENT ON TABLE t_lifeguard_staff IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"lifeguard_staff"}';

COMMENT ON TABLE t_local_authority IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"local_authority"}';

COMMENT ON TABLE t_login_credentials IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"login_credentials"}';

COMMENT ON TABLE t_machine_learning_model IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"machine_learning_model"}';

COMMENT ON TABLE t_mail_drop_location IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"mail_drop_location"}';

COMMENT ON TABLE t_malnourished_child IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"malnourished_child"}';

COMMENT ON TABLE t_monetary_amount IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"monetary_amount"}';

COMMENT ON TABLE t_monitoring_protocol IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"monitoring_protocol"}';

COMMENT ON TABLE t_municipal_pool_facility IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"municipal_pool_facility"}';

COMMENT ON TABLE t_network_infrastructure IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_infrastructure"}';

COMMENT ON TABLE t_network_provider IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_provider"}';

COMMENT ON TABLE t_network_resource IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_resource"}';

COMMENT ON TABLE t_network_scrubbing_center IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_scrubbing_center"}';

COMMENT ON TABLE t_non_diesel_powered_vehicle IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"non_diesel_powered_vehicle"}';

COMMENT ON TABLE t_nonprofit_organization IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"nonprofit_organization"}';

COMMENT ON TABLE t_referral_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"referral_process"}';

COMMENT ON TABLE t_regulatory_authority IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"regulatory_authority"}';

COMMENT ON TABLE t_regulatory_body IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"regulatory_body"}';

COMMENT ON TABLE t_rendering_engine IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"rendering_engine"}';

COMMENT ON TABLE t_rendering_environment_definition IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"rendering_environment_definition"}';

COMMENT ON TABLE t_reporting_channel IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"reporting_channel"}';

COMMENT ON TABLE t_requested_provider_type IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"requested_provider_type"}';

COMMENT ON TABLE t_requesting_client IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"requesting_client"}';

COMMENT ON TABLE t_requesting_entity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"requesting_entity"}';

COMMENT ON TABLE t_research_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"research_activity"}';

COMMENT ON TABLE t_facility_infrastructure IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"facility_infrastructure"}';

COMMENT ON TABLE t_final_inspection_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"final_inspection_process"}';

COMMENT ON TABLE t_financial_fund IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_fund"}';

COMMENT ON TABLE t_financial_management_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_management_process"}';

COMMENT ON TABLE t_financial_product IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_product"}';

COMMENT ON TABLE t_financial_report IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_report"}';

COMMENT ON TABLE t_financial_resource IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_resource"}';

COMMENT ON TABLE t_health_record_transfer_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"health_record_transfer_process"}';

COMMENT ON TABLE t_healthcare_network_infrastructure IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"healthcare_network_infrastructure"}';

COMMENT ON TABLE t_healthcare_organization IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"healthcare_organization"}';

COMMENT ON TABLE t_height_measurement IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"height_measurement"}';

COMMENT ON TABLE t_horse_identity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"horse_identity"}';

COMMENT ON TABLE t_housing_client IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"housing_client"}';

COMMENT ON TABLE t_housing_debt_issue IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"housing_debt_issue"}';

COMMENT ON TABLE t_housing_policy_topic IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"housing_policy_topic"}';

COMMENT ON TABLE t_human_agent IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"human_agent"}';

COMMENT ON TABLE t_imaging_equipment IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"imaging_equipment"}';

COMMENT ON TABLE t_independent_economic_agent IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"independent_economic_agent"}';

COMMENT ON TABLE t_individual IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"individual"}';

COMMENT ON TABLE t_observatory_mounting_structure IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"observatory_mounting_structure"}';

COMMENT ON TABLE t_offline_channel IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"offline_channel"}';

COMMENT ON TABLE t_online_channel IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"online_channel"}';

COMMENT ON TABLE t_operational_disruption IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_disruption"}';

COMMENT ON TABLE t_operational_effectiveness IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_effectiveness"}';

COMMENT ON TABLE t_operational_equipment IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_equipment"}';

COMMENT ON TABLE t_operational_protocol IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_protocol"}';

COMMENT ON TABLE t_operational_unit IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"operational_unit"}';

COMMENT ON TABLE t_order_constraint IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"order_constraint"}';

COMMENT ON TABLE t_organization_member IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organization_member"}';

COMMENT ON TABLE t_organizational_agent IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_agent"}';

COMMENT ON TABLE t_organizational_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_function"}';

COMMENT ON TABLE t_organizational_health_metric IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_health_metric"}';

COMMENT ON TABLE t_organizational_leadership_role IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_leadership_role"}';

COMMENT ON TABLE t_ozone_oxygen_mixture IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ozone_oxygen_mixture"}';

COMMENT ON TABLE t_academic_degree IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"academic_degree"}';

COMMENT ON TABLE t_calendar_product IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"calendar_product"}';

COMMENT ON TABLE t_call_volume IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"call_volume"}';

COMMENT ON TABLE t_child IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"child"}';

COMMENT ON TABLE t_clinical_care IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"clinical_care"}';

COMMENT ON TABLE t_communication_security_aspect IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"communication_security_aspect"}';

COMMENT ON TABLE t_constructed_predicate IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"constructed_predicate"}';

COMMENT ON TABLE t_continuous_emissions_monitoring_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"continuous_emissions_monitoring_process"}';

COMMENT ON TABLE t_corporate_activity IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_activity"}';

COMMENT ON TABLE t_corporate_audit_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_audit_process"}';

COMMENT ON TABLE t_corporate_employment_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_employment_process"}';

COMMENT ON TABLE t_corporate_reputation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"corporate_reputation"}';

COMMENT ON TABLE t_course IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"course"}';

COMMENT ON TABLE t_criminal_justice_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"criminal_justice_process"}';

COMMENT ON TABLE t_customer_device IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"customer_device"}';

COMMENT ON TABLE t_database_container IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"database_container"}';

COMMENT ON TABLE t_decision_action IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"decision_action"}';

COMMENT ON TABLE t_decision_transition_action IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"decision_transition_action"}';

COMMENT ON TABLE t_diagnostic_imaging IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"diagnostic_imaging"}';

COMMENT ON TABLE t_ethical_investment IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_investment"}';

COMMENT ON TABLE t_ethical_standard IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"ethical_standard"}';

COMMENT ON TABLE t_executive_direction IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_direction"}';

COMMENT ON TABLE t_executive_implementation IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_implementation"}';

COMMENT ON TABLE t_executive_leadership_role IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"executive_leadership_role"}';

COMMENT ON TABLE t_external_business_partner IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"external_business_partner"}';

COMMENT ON TABLE t_financial_instrument IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_instrument"}';

COMMENT ON TABLE t_financial_strategy_oversight IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"financial_strategy_oversight"}';

COMMENT ON TABLE t_higher_education_institution IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"higher_education_institution"}';

COMMENT ON TABLE t_institutional_investor IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"institutional_investor"}';

COMMENT ON TABLE t_legal_proceeding IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"legal_proceeding"}';

COMMENT ON TABLE t_network_user IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"network_user"}';

COMMENT ON TABLE t_observation_function IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"observation_function"}';

COMMENT ON TABLE t_organization IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organization"}';

COMMENT ON TABLE t_organizational_culture IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"organizational_culture"}';

COMMENT ON TABLE t_original_document IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"original_document"}';

COMMENT ON TABLE t_pdf_format IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"pdf_format"}';

COMMENT ON TABLE t_personally_identifiable_information IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"personally_identifiable_information"}';

COMMENT ON TABLE t_population IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"population"}';

COMMENT ON TABLE t_professional_experience IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"professional_experience"}';

COMMENT ON TABLE t_qualification_level IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"qualification_level"}';

COMMENT ON TABLE t_raffle IS '{"bfo_anchor":[],"family":"catalog","is_complex":true,"template_id":"raffle"}';

COMMENT ON TABLE t_prim_age IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_age"}';

COMMENT ON TABLE t_prim_continuousmode IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_continuousmode"}';

COMMENT ON TABLE t_prim_riskmanagementactivity IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_riskmanagementactivity"}';

COMMENT ON TABLE t_prim_chemical IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_chemical"}';

COMMENT ON TABLE t_prim_schoolsecuritypolicy IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_schoolsecuritypolicy"}';

COMMENT ON TABLE t_prim_scientificorganization IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_scientificorganization"}';

COMMENT ON TABLE t_prim_servicelevelagreement IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_servicelevelagreement"}';

COMMENT ON TABLE t_prim_stateaction IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_stateaction"}';

COMMENT ON TABLE t_prim_tariffstructure IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_tariffstructure"}';

COMMENT ON TABLE t_prim_vulnerabilitystate IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_vulnerabilitystate"}';

COMMENT ON TABLE t_prim_skillimprovement IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_skillimprovement"}';

COMMENT ON TABLE t_prim_socialnetworkingserviceusage IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"prim_socialnetworkingserviceusage"}';

COMMENT ON TABLE t_board_member_role_realization IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"board_member_role_realization"}';

COMMENT ON TABLE t_chief_compliance_officer_service_delivery_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"chief_compliance_officer_service_delivery_process"}';

COMMENT ON TABLE t_college_administration_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"college_administration_process"}';

COMMENT ON TABLE t_general_manager_function_execution IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"general_manager_function_execution"}';

COMMENT ON TABLE t_legal_tech_service_delivery_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"legal_tech_service_delivery_process"}';

COMMENT ON TABLE t_performance_based_care_delivery_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"performance_based_care_delivery_process"}';

COMMENT ON TABLE t_police_patrol_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"police_patrol_process"}';

COMMENT ON TABLE t_qualified_source_testing_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"qualified_source_testing_process"}';

COMMENT ON TABLE t_clearing_broker_service_delivery_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"clearing_broker_service_delivery_process"}';

COMMENT ON TABLE t_rights_exercise_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"rights_exercise_process"}';

COMMENT ON TABLE t_authorized_entity_authorization_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"authorized_entity_authorization_process"}';

COMMENT ON TABLE t_joint_board_chair_service_delivery_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"joint_board_chair_service_delivery_process"}';

COMMENT ON TABLE t_social_media_account_management_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"social_media_account_management_process"}';

COMMENT ON TABLE t_community_healthcare_service_delivery_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"community_healthcare_service_delivery_process"}';

COMMENT ON TABLE t_decision_making_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"decision_making_process"}';

COMMENT ON TABLE t_parenting_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"parenting_process"}';

COMMENT ON TABLE t_rendering_environment IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"rendering_environment"}';

COMMENT ON TABLE t_traditional_religious_healing_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"traditional_religious_healing_process"}';

COMMENT ON TABLE t_organizational_leadership_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"organizational_leadership_process"}';

COMMENT ON TABLE t_young_researcher_research_process IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"young_researcher_research_process"}';

COMMENT ON TABLE t_review_panel_quorum IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"review_panel_quorum"}';

COMMENT ON TABLE t_capacity_bounded_enrollment IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"capacity_bounded_enrollment"}';

COMMENT ON TABLE t_dual_custody_signoff IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"dual_custody_signoff"}';

COMMENT ON TABLE t_bounded_committee_membership IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"bounded_committee_membership"}';

COMMENT ON TABLE t_identifier_bearer_union IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"identifier_bearer_union"}';

COMMENT ON TABLE t_notification_target_union IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"notification_target_union"}';

COMMENT ON TABLE t_escalation_channel_union IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"escalation_channel_union"}';

COMMENT ON TABLE t_scored_assessment_bounds IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"scored_assessment_bounds"}';

COMMENT ON TABLE t_versioned_form_lineage IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"versioned_form_lineage"}';

COMMENT ON TABLE t_bounded_metric_series IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"bounded_metric_series"}';

COMMENT ON TABLE t_restricted_participation_review IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"restricted_participation_review"}';

COMMENT ON TABLE t_typed_realization_channel IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"typed_realization_channel"}';

COMMENT ON TABLE t_custody_scope_typing IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"custody_scope_typing"}';

COMMENT ON TABLE t_measured_series_reading IS '{"bfo_anchor":[],"family":"catalog","is_complex":false,"template_id":"measured_series_reading"}';
