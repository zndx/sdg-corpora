INSERT INTO caregiver_roles (id, role_id, adult_id, realized_in) VALUES
  ('ROLE-0001', 'RespiteParent', 'CaseRef-A7F2', 'Realized In 01'),
  ('ROLE-0002', 'LegalGuardian', 'CaseRef-H8J9', 'Realized In 02'),
  ('ROLE-0003', 'LegalGuardian', 'CaseRef-D1E4', 'Realized In 03'),
  ('ROLE-0004', 'LegalGuardian', 'CaseRef-M4N5', 'Realized In 04'),
  ('ROLE-0005', 'CaseManager-Parent', 'CaseRef-H8J9', 'Realized In 05'),
  ('ROLE-0006', 'CaseManager-Parent', 'CaseRef-T1U2', 'Realized In 06');

INSERT INTO doc_event (id, doc_event_id, system_id, encounter_id) VALUES
  ('ACTI-0001', 'Allergy profile update', 'NextGen Practice', 'Emergency department triage'),
  ('ACTI-0002', 'Admission Note', 'Solace Care Interface', 'Urgent care referral'),
  ('ACTI-0003', 'Consultation Report', 'eCW Platform', 'Mental health intake interview'),
  ('ACTI-0004', 'Medication reconciliation review', 'CoreSync EHR Platform', 'Well Child Exam'),
  ('ACTI-0005', 'Operative Record', 'Nexus Clinical Gateway', 'Vaccination Drive'),
  ('ACTI-0006', 'Consent form verification', 'Orion Documentation Suite', 'Dialysis Session');

INSERT INTO pdf_export_job (id, export_job_id, src_scan_id, output_doc_id, initiator_id) VALUES
  ('PROC-0001', 'Records_Migration_Run', 'Map_Overlay_Scan', 'Specimen_Index_Output.pdf', 'qa_lead_martinez'),
  ('PROC-0002', 'Log_Aggregation_Run', 'Satellite_Mosaic', 'Final_Report_Digest.pdf', 'qa_lead_martinez'),
  ('PROC-0003', 'Verification_Export', 'Map_Overlay_Scan', 'Log_Summary_Digest.pdf', 'export_gateway'),
  ('PROC-0004', 'Log_Aggregation_Run', 'Handwritten_Logs', 'Survey_Archive_Index.pdf', 'etl_engine_core'),
  ('PROC-0005', 'Records_Migration_Run', 'Orbital_Drone_Set', 'Log_Summary_Digest.pdf', 'system_monitor');

INSERT INTO lect_sessions (id, lect_id, resource_id, code_ref) VALUES
  ('SESS-0001', 'CAUSAL-INFERENCE-LEC', 'Causal-Model-Diagram', 'Rule-Governance-Check'),
  ('SESS-0002', 'KPI-REPORTING-SESSION', 'Provenance-Trace-Log', 'Func-Lab-Cleanse'),
  ('SESS-0003', 'META-SCHEMA-WORKSHOP', 'ETL-Handout-2024', 'Proc-Sensor-Calibrate'),
  ('SESS-0004', 'DS402-Intro-ETL', 'Provenance-Trace-Log', 'Notebook-ETL-Pipeline.nb');

INSERT INTO young_res_roles (id, young_res_role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'JuniorPrincipalInvestigator', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'JuniorPrincipalInvestigator', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Research Associate', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'JuniorPrincipalInvestigator', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'Junior Lab Analyst', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'PhD Candidate', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'Junior Instrument Operator', 'Borne By 07', 'Realized In 07');

INSERT INTO library_role_assignment (id, role_id, student_id, realized_in) VALUES
  ('ROLE-0001', 'Interlibrary Courier', 'Mateo Silva', 'Realized In 01'),
  ('ROLE-0002', 'Stacks Re-shelver', 'Julian Ortiz', 'Realized In 02'),
  ('ROLE-0003', 'Research Help Desk', 'Julian Ortiz', 'Realized In 03'),
  ('ROLE-0004', 'Interlibrary Courier', 'Elias Vance', 'Realized In 04'),
  ('ROLE-0005', 'Study Room Coordinator', 'Elias Vance', 'Realized In 05'),
  ('ROLE-0006', 'Tech Support Liaison', 'Suki Tanaka', 'Realized In 06');

INSERT INTO dispenser_sites (id, stand_id, topping_id, location_id) VALUES
  ('STAT-0001', 'RanchSqueeze', 'HotSauce', 'EventSpaceEast'),
  ('STAT-0002', 'VinegarSpritz', 'RanchDressing', 'LabBreakArea'),
  ('STAT-0003', 'RelishTray', 'BBQGlaze', 'CafeteriaMainHall'),
  ('STAT-0004', 'KetchupDispenser', 'SpicyKetchup', 'DiningHallWest'),
  ('STAT-0005', 'KetchupDispenser', 'BBQGlaze', 'ConferenceSuiteA'),
  ('STAT-0006', 'BBQSauceCup', 'SweetChiliSauce', 'CateringUnitA'),
  ('STAT-0007', 'MayoPump', 'Sriracha', 'LabBreakArea');

INSERT INTO child_designation (id, designation_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'Aboriginal ward', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'Native youth', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Indigenous dependent', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'Indigenous dependent', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'Tribal minor', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'Aboriginal ward', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'First Nations ward', 'Borne By 07', 'Realized In 07');

INSERT INTO police_roles (id, role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'Bike Patrol Unit', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'Traffic Enforcement Lead', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Traffic Enforcement Lead', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'Bike Patrol Unit', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'Undercover Agent', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'Senior Patrol Officer', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'Bike Patrol Unit', 'Borne By 07', 'Realized In 07');

INSERT INTO web_project (id, project_id, target_platform_id, tech_used_id) VALUES
  ('DEVE-0001', 'TravelBookingPlatform', 'AngularMaterialUI', 'AdaptiveLayouts'),
  ('DEVE-0002', 'NewsMediaResponsiveBuild', 'WordPressCMS', 'ResponsiveTypography'),
  ('DEVE-0003', 'GovPortalMigration', 'JamstackRuntime', 'MediaQueryBreakpoints'),
  ('DEVE-0004', 'TravelBookingPlatform', 'Drupal9Core', 'AdaptiveLayouts'),
  ('DEVE-0005', 'ProjectAtlasLaunch', 'CustomNodeServer', 'ResponsiveImagesSrcset'),
  ('DEVE-0006', 'MobileFirstRetailSite', 'JamstackRuntime', 'ViewportUnits'),
  ('DEVE-0007', 'EdTechLearningHub', 'VueNuxtStack', 'ResponsiveImagesSrcset');

INSERT INTO campaign_channel_map (id, campaign_link_id, online_channel_id, offline_channel_id, unit_code, campaign_title) VALUES
  ('COOR-0001', 'Loyalty_Rewards_Update', 'Reddit_Promoted', 'In_Store_Display', 'latin1', 'Campaign Title 01'),
  ('COOR-0002', 'Holiday_Promo_24', 'Facebook_Ads', 'TV_Commercial', 'unicode', 'Campaign Title 02'),
  ('COOR-0003', 'Retargeting_Campaign_X', 'Reddit_Promoted', 'Direct_Mail', 'utf8', 'Campaign Title 03'),
  ('COOR-0004', 'Retargeting_Campaign_X', 'Email_Newsletter', 'Trade_Show_Booth', 'latin1', 'Campaign Title 04'),
  ('COOR-0005', 'Awareness_Push_99', 'Twitter_Boosted', 'Transit_Ads', 'unicode', 'Campaign Title 05'),
  ('COOR-0006', 'Flash_Sale_Network', 'Reddit_Promoted', 'Direct_Mail', 'latin1', 'Campaign Title 06');

INSERT INTO election_records (id, election_id, option_id, member_id) VALUES
  ('ELEC-0001', 'ELEC-2025-0042', 'Supplemental Acc', 'EMP-39104'),
  ('ELEC-0002', 'ELEC-2025-0901', 'Supplemental Acc', 'EMP-77162'),
  ('ELEC-0003', 'ELEC-2025-0672', 'Supplemental Acc', 'EMP-39104'),
  ('ELEC-0004', 'ELEC-2025-0491', 'Silver Vision Care', 'EMP-91735'),
  ('ELEC-0005', 'ELEC-2024-1102', 'Supplemental Acc', 'EMP-22880'),
  ('ELEC-0006', 'ELEC-2025-0118', '401K Match Max', 'EMP-66293'),
  ('ELEC-0007', 'ELEC-2025-0042', '401K Match Max', 'EMP-77162');

INSERT INTO pension_election (id, option_id, method, created_at) VALUES
  ('OPTI-0001', '100% Joint 10Y Certain', 'inferred', '2024-08-12T04:08:21'),
  ('OPTI-0002', 'Reduced Single Life', 'hybrid', '2024-10-03T00:03:50'),
  ('OPTI-0003', '100% Joint 15Y Certain', 'automated', '2024-12-22T04:55:34'),
  ('OPTI-0004', '100% Joint 10Y Certain', 'inferred', '2024-04-18T23:23:44'),
  ('OPTI-0005', 'Lump Sum', 'inferred', '2024-02-24T21:06:09'),
  ('OPTI-0006', '75% Joint and Survivor', 'inferred', '2023-09-19T13:43:34');

INSERT INTO marital_cert (id, marital_cert_id, marital_status_id, consent_reason_cd, char_encoding, lang_code) VALUES
  ('CERT-0001', 'DOC-STATUS-2201', 'domestic partnership', 'emergency provision', 'ascii', '7441147'),
  ('CERT-0002', 'OFF-WED-3380', 'civil union', 'statutory requirement', 'latin1', '778560'),
  ('CERT-0003', 'DOC-STATUS-2201', 'annulled', 'court order', 'latin1', 'b_VB-EC-0'),
  ('CERT-0004', 'MSC-2023-4491', 'legally separated', 'statutory requirement', 'latin1', '511'),
  ('CERT-0005', 'REG-MARR-5578', 'single', 'mutual agreement', 'latin1', '974943');

INSERT INTO benefit_election (id, designation_id, review_cycle_days, scope) VALUES
  ('DESI-0001', 'SurvivorAlloc-Nine', '982', 'team'),
  ('DESI-0002', 'SurvivorAlloc-Nine', '313', 'regional'),
  ('DESI-0003', 'EstateTrust-Ref80', '618', 'global'),
  ('DESI-0004', 'Rivera Family Trust', '101', 'regional'),
  ('DESI-0005', 'ContingentDesign-Seven', '661', 'local'),
  ('DESI-0006', 'James OConnell', '749', 'team');

INSERT INTO clinical_prog (id, prog_id, tool_id, metric_id) VALUES
  ('PROG-0001', 'Sepsis Protocol Redesign', 'Data Envelopment Analysis', 'VTE Prophylaxis Adherence'),
  ('PROG-0002', 'Medication Reconciliation Optimization', 'Failure Mode Effect Analyzer', 'Vaccination Coverage Percent'),
  ('PROG-0003', 'Sepsis Protocol Redesign', 'Logistic Regression Models', 'Mortality Rate Index'),
  ('PROG-0004', 'Sepsis Protocol Redesign', 'Process Mining Workflows', 'Readmission Frequency Count');

INSERT INTO track_req (id, track_req_id, student_id, start_date, mandatory) VALUES
  ('REQU-0001', 'Open Government Ordinance', 'Graduate Fellows', '2025-01-22', 'true'),
  ('REQU-0002', 'Equal Employment Code', 'Exchange Students', '2023-06-14', 'true'),
  ('REQU-0003', 'Title IX Guideline', 'Bar Exam Candidates', '2023-01-14', 'true'),
  ('REQU-0004', 'Data Protection Directive', 'Juris Doctor Cohort', '2023-06-26', 'false'),
  ('REQU-0005', 'Data Protection Directive', 'Juris Doctor Cohort', '2023-02-17', 'true'),
  ('REQU-0006', 'Open Government Ordinance', 'Graduate Fellows', '2023-03-18', 'false');

INSERT INTO officer_role (id, officer_id, assignment_id, participates_in) VALUES
  ('ROLE-0001', 'Shelter Operations Chief', 'Welfare Inspections', 'Participates In 01'),
  ('ROLE-0002', 'Director Municipal Canines', 'Stray Animal Retrieval', 'Participates In 02'),
  ('ROLE-0003', 'Animal Welfare Coordinator', 'Maple District', 'Participates In 03'),
  ('ROLE-0004', 'Municipal Animal Control Director', 'Impound Processing', 'Participates In 04');

INSERT INTO control_activity (id, activity_id, program_id, street_id) VALUES
  ('ACTI-0001', 'Simulium damnosum', 'Doxycycline Suppression', 'Elm Street Corridor'),
  ('ACTI-0002', 'Glossina morsitans', 'BioLarviciding', 'Cherry Blossom Circle'),
  ('ACTI-0003', 'Culex pipiens', 'Larval Source Reduction', 'Maple Avenue B4'),
  ('ACTI-0004', 'Culicoides impunctatus', 'Urban Fogging', 'Elm Street Corridor'),
  ('ACTI-0005', 'Culicoides impunctatus', 'Doxycycline Suppression', 'Elm Street Corridor'),
  ('ACTI-0006', 'Lutzomyia longipalpis', 'National Malaria Elimination', 'Cedar Lane Sector B'),
  ('ACTI-0007', 'Culicoides impunctatus', 'WNV Surveillance', 'Birchwood Terrace');

INSERT INTO test_run (id, test_run_id, protocol_id, material_id) VALUES
  ('EVEN-0001', 'NIST-Cal-44', 'ISO 17025 Calibration', 'Polyethylene Terephthalate'),
  ('EVEN-0002', 'FDA-Comp-Q3', 'AS 9100D Quality', 'Carbon Fiber Composite'),
  ('EVEN-0003', 'SAE-J1113-Review', 'AS 9100D Quality', 'Lithium Ion Cell Pack'),
  ('EVEN-0004', 'NIST-Cal-44', 'IEC 60529 IP Rating', 'Polyethylene Terephthalate'),
  ('EVEN-0005', 'EN-15085-Cert', 'SAE J1113 Corrosion', '6061 Aluminum Extrusion'),
  ('EVEN-0006', 'FDA-Comp-Q3', 'ISO 14001 Environmental', 'D70 Rubber O Ring'),
  ('EVEN-0007', 'IEEE-802.3-Val', 'IEEE 802.3 Ethernet', '12 Inch Silicon Wafer'),
  ('EVEN-0008', 'NIST-Cal-44', 'ASTM D638 Tensile', '6061 Aluminum Extrusion');

INSERT INTO math_session (id, math_session_id, topic_id, student_id) VALUES
  ('PROC-0001', 'Quadratic Formula Workshop', 'Polynomial Division', 'Maria Rossi'),
  ('PROC-0002', 'Algebra II Remediation', 'Graph Theory', 'Alex Chen'),
  ('PROC-0003', 'Geometry Proofs Course', 'Euclidean Geometry', 'Noah Williams'),
  ('PROC-0004', 'Calculus limit assessment', 'Prime Factorization', 'Postgraduate assistant Zeta'),
  ('PROC-0005', 'Discrete Math Seminar', 'Quadratic factorization', 'Graduate scholar Delta'),
  ('PROC-0006', 'Number Theory Tutorial', 'Prime Factorization', 'Peer tutor candidate');

INSERT INTO data_ctrl_role (id, ctrl_role_id, participates_in, func_id) VALUES
  ('ROLE-0001', 'Privacy Compliance Lead', 'Participates In 01', 'Network Access Control'),
  ('ROLE-0002', 'Chief Data Officer', 'Participates In 02', 'Marketing Campaign Tracking'),
  ('ROLE-0003', 'HR Information Steward', 'Participates In 03', 'Clinical Trial Database'),
  ('ROLE-0004', 'Marketing Analytics Director', 'Participates In 04', 'Legacy System Decommission');

INSERT INTO data_processing_log (id, proc_act_id, operation_id, target_id) VALUES
  ('ACTI-0001', 'User profile synchronization', 'API request handler', 'Browser session cookie'),
  ('ACTI-0002', 'Biometric authentication logging', 'Python ETL pipeline', 'Location tracking ping'),
  ('ACTI-0003', 'Marketing campaign tracking', 'Cloud storage indexer', 'Employee social security number'),
  ('ACTI-0004', 'Application login tracking', 'Data validation script', 'Customer email address');

INSERT INTO strap_fix_evt (id, fix_evt_id, strap_ref, floor_id) VALUES
  ('PROC-0001', 'NylonWebbing-50mm', 'StructuralBeam-44', 'CompositeDeck-8'),
  ('PROC-0002', 'HeavyDutyRatchetStrap', 'HVACUnit-440', 'CompositeDeck-8'),
  ('PROC-0003', 'SteelCableTie-300', 'StructuralBeam-44', 'StructuralColumn-12'),
  ('PROC-0004', '12mmPolyesterWebbing', 'PumpStation-3', 'AnchorBolt-M16');

INSERT INTO ird_role (id, role_id, activity_id) VALUES
  ('ROLE-0001', 'Kestrel Holdings', 'Fact Sheet Release'),
  ('ROLE-0002', 'Solstice Capital Group', 'Suspended'),
  ('ROLE-0003', 'Crestline Equity', 'Media Press Release'),
  ('ROLE-0004', 'Nexus Venture Fund', 'Fact Sheet Release'),
  ('ROLE-0005', 'Linda Zhang', 'Active'),
  ('ROLE-0006', 'Linda Zhang', 'Fact Sheet Release');

INSERT INTO regulatory_filing (id, filing_id, regulator_id, report_id) VALUES
  ('PROC-0001', 'Oakhaven Energy Partners', 'Public Market Integrity Office', 'Fiscal Cash Flow Ledger'),
  ('PROC-0002', 'Silica Ridge Mining', 'NYSE Listing', '10-Q Statement'),
  ('PROC-0003', 'Meridian BioSystems', 'Financial Standards Commission', 'Cash Flow Report'),
  ('PROC-0004', 'Oakhaven Energy Partners', 'Corporate Transparency Directorate', '10-K Filing'),
  ('PROC-0005', 'Meridian BioSystems', 'Securities Enforcement Bureau', 'Tax Liability Schedule Draft'),
  ('PROC-0006', 'Aethelgard Holdings', 'Regulatory Filing Authority', 'Auditor Opinion'),
  ('PROC-0007', 'Vanguard Steelworks Ltd', 'Global Audit Oversight Board', 'Interim Balance Sheet Revision'),
  ('PROC-0008', 'Silica Ridge Mining', 'ESMA Commission', '8-K Notice');

INSERT INTO health_record (id, record_id, condition_id, client_id, encoding_type, record_title) VALUES
  ('RECO-0001', 'CardiacMonitoring', 'COPDProgressive', 'ChenLAccount', 'ascii', 'Record Title 01'),
  ('RECO-0002', 'DermatologyNotes', 'Type2Diabetes', 'GarciaMRegistry', 'utf8', 'Record Title 02'),
  ('RECO-0003', 'ChronicCarePlan', 'AsthmaBronchial', 'SmithJProfile', 'utf8', 'Record Title 03'),
  ('RECO-0004', 'RespiratoryAssessment', 'AsthmaBronchial', 'LeeDPrimary', 'utf8', 'Record Title 04'),
  ('RECO-0005', 'ImmunizationLog', 'MigraineChronic', 'LeeDPrimary', 'latin1', 'Record Title 05'),
  ('RECO-0006', 'AnnualPhysicalCheck', 'PsoriasisPlaque', 'ChenLAccount', 'utf8', 'Record Title 06'),
  ('RECO-0007', 'RespiratoryAssessment', 'PsoriasisPlaque', 'DoeAClient', 'latin1', 'Record Title 07');

INSERT INTO cc_role (id, cc_role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'VP Institutional Oversight', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'Chief Governance Officer', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Chief Ethics Officer', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'CCO Health Systems', 'Borne By 04', 'Realized In 04');

INSERT INTO disclosure_case (id, case_id, channel_id, submitter_id) VALUES
  ('PROC-0001', 'Procurement Review Gamma', 'Designated Reporting Agent', 'Emily Watson'),
  ('PROC-0002', 'Workplace Harassment Claim 77B', 'Data Protection Officer', 'Lisa Anderson'),
  ('PROC-0003', 'Academic Integrity Case', 'HR Ethics Hotline', 'Registrar Linnea Kovic'),
  ('PROC-0004', 'Procurement Review Gamma', 'Ombuds Office', 'Ombudsperson Julian Varga'),
  ('PROC-0005', 'Procurement Fraud Investigation', 'Anonymous Reporting Line', 'Provost Arthur Pendelton'),
  ('PROC-0006', 'Research Misconduct Review', 'Compliance Mailbox', 'Dr. Alan Mercer');

INSERT INTO discipline_cases (id, case_id, asset_id, person_id) VALUES
  ('EVEN-0001', 'academic-integrity-hearing', 'peer-review-drafts', 'dept-chair-omar-jamil'),
  ('EVEN-0002', 'academic-integrity-hearing', 'server-access-keys', 'Faculty advisor'),
  ('EVEN-0003', 'Covert data export', 'simulation-license-keys', 'academic-advisor-tom-wells'),
  ('EVEN-0004', 'Stolen lab equipment', 'Confidential student records', 'Research assistant'),
  ('EVEN-0005', 'data-privacy-lapse', 'Academic database schema', 'visiting-scholar-fatima-alhassan'),
  ('EVEN-0006', 'academic-fraud-inquiry', 'simulation-license-keys', 'grad-assistant-derek-park'),
  ('EVEN-0007', 'Unauthorized citation use', 'field-sample-collections', 'Lab technician');

INSERT INTO admin_role (id, role_id, staff_id, realized_in) VALUES
  ('ROLE-0001', 'Imperial College London', 'C. A. Ndiaye', 'Realized In 01'),
  ('ROLE-0002', 'Brookhaven University', 'Mark D. Sullivan', 'Realized In 02'),
  ('ROLE-0003', 'Crestwood University', 'C. A. Ndiaye', 'Realized In 03'),
  ('ROLE-0004', 'MIT', 'C. A. Ndiaye', 'Realized In 04'),
  ('ROLE-0005', 'Crestview College', 'J. M. Chen', 'Realized In 05'),
  ('ROLE-0006', 'Eldridge University', 'Prof. David Okoro', 'Realized In 06'),
  ('ROLE-0007', 'University of British Columbia', 'Robert J. Hayes', 'Realized In 07'),
  ('ROLE-0008', 'Harvard University', 'Prof. David Okoro', 'Realized In 08');

INSERT INTO comp_coord (id, coord_id, acad_rec_id, elig_check_id) VALUES
  ('ROLE-0001', 'Quality Assurance Coordinator', 'Degree Verification Report', 'Scholarship Status Monitor'),
  ('ROLE-0002', 'Eligibility Verification Officer', 'Curriculum Completion Report', 'Probation Status Watcher'),
  ('ROLE-0003', 'Credential Verification Officer', 'GPA Threshold Check', 'Scholarship Status Monitor'),
  ('ROLE-0004', 'Quality Assurance Coordinator', 'Degree Audit Summary', 'Eligibility Threshold Alert');

INSERT INTO credit_cert (id, credit_cert_id, term_id) VALUES
  ('PROC-0001', 'Fall2022HourCert', 'AuditCompliance'),
  ('PROC-0002', 'Spring2024DegreeCheck', 'RegistrarAdmin'),
  ('PROC-0003', 'Summer2023HourAudit', 'BursarOffice'),
  ('PROC-0004', 'GraduateHourValidation', 'AcademicAdvisor');

INSERT INTO athlete_monitor_assignments (id, assign_id, staff_id, realized_in) VALUES
  ('ROLE-0001', 'ArenaCrewSupervisor', 'David Okoro', 'Realized In 01'),
  ('ROLE-0002', 'WeightRoomSupervisor', 'BenchMedicalAttendant', 'Realized In 02'),
  ('ROLE-0003', 'GymLoadCoordinator', 'SeniorFirstResponder', 'Realized In 03'),
  ('ROLE-0004', 'FieldSafetyWatcher', 'FieldSafetyOfficer', 'Realized In 04'),
  ('ROLE-0005', 'PitchSideMedicalLead', 'MedicalSupportCoordinator', 'Realized In 05'),
  ('ROLE-0006', 'YouthAthleticsChaperone', 'PerimeterSafetyLead', 'Realized In 06'),
  ('ROLE-0007', 'TrackFieldObserver', 'PerimeterSafetyLead', 'Realized In 07'),
  ('ROLE-0008', 'WeightRoomSupervisor', 'FieldSafetyOfficer', 'Realized In 08');

INSERT INTO agenda (id, agenda_id, talk_id, title, lang_code) VALUES
  ('PROG-0001', 'KDD', 'Transformer Models', 'Title 01', '112'),
  ('PROG-0002', 'PVLDB', 'Graph Neural Networks', 'Title 02', '2618572'),
  ('PROG-0003', 'OSDI', 'Attention Mechanisms', 'Title 03', '1996943'),
  ('PROG-0004', 'USENIX Security', 'Zero Knowledge Proofs', 'Title 04', 'coms2'),
  ('PROG-0005', 'SIGMOD', 'Transformer Models', 'Title 05', 'c74476ca-8fcc-11eb-924d-9cd76263cbd0'),
  ('PROG-0006', 'USENIX Security', 'Quantum Error Correction', 'Title 06', '3355788'),
  ('PROG-0007', 'ICML', 'Graph Neural Networks', 'Title 07', 'id_17');

INSERT INTO sci_org (id, org_id, journal_id, meeting_id, created_date, mime_type) VALUES
  ('ORGA-0001', 'IEEE', 'Journal American Chemistry', 'RSC Chemistry Conference', '2025-01-02', 'application/xml'),
  ('ORGA-0002', 'WHO', 'Physical Review Letters', 'RSC Chemistry Conference', '2023-09-08', 'application/octet-stream'),
  ('ORGA-0003', 'APS', 'Geophysical Research Letters', 'ACS National Meeting', '2024-06-25', 'application/xml'),
  ('ORGA-0004', 'AAAS', 'Proceedings IEEE', 'ACS National Meeting', '2023-08-19', 'text/csv'),
  ('ORGA-0005', 'AGU', 'Physical Review Letters', 'IEEE Robotics Conference', '2024-06-16', 'text/csv'),
  ('ORGA-0006', 'WHO', 'Journal American Chemistry', 'ACS National Meeting', '2024-11-07', 'application/octet-stream'),
  ('ORGA-0007', 'AGU', 'Geophysical Research Letters', 'APS March Meeting', '2025-03-04', 'text/plain'),
  ('ORGA-0008', 'Royal Society', 'Nature Communications', 'AGU Fall Meeting', '2025-05-05', 'application/avro');

INSERT INTO donor_registry (id, donor_id, contact_ref, display_name, lang_code) VALUES
  ('PROF-0001', 'NHS-Genomics-UK', 'earthdata@nasa.gov', 'Display Name 01', '727066'),
  ('PROF-0002', 'NASA-Earth-Data', 'cdhr@fda.gov', 'Display Name 02', 'receipt'),
  ('PROF-0003', 'CERN-Open-Data', 'dbgap@nih.gov', 'Display Name 03', '1336170'),
  ('PROF-0004', 'MIT-Data-Trust', 'genomics@mit.edu', 'Display Name 04', '4447021');

INSERT INTO donation_txn (id, donation_id, donor_id, purpose_id, description, lang_code) VALUES
  ('RECO-0001', 'DON-8812-A', 'Oakridge-Collective-LLC', 'Emergency Relief Fund', 'Description 01', 'default_chart_a_tax_15'),
  ('RECO-0002', 'PMT-2023-1105', 'Chen-Darius-Private', 'Capital-Expansion-Phase-2', 'Description 02', '2986247'),
  ('RECO-0003', 'TXN-8842-F', 'Smith Family Foundation', 'STEM Education Grant', 'Description 03', '5f9422fe-8fcd-11eb-924d-9cd76263cbd0'),
  ('RECO-0004', 'ANNUAL-FUND-DRIVE-22', 'Community Aid Network', 'Capital-Expansion-Phase-2', 'Description 04', '103189'),
  ('RECO-0005', 'ENDOWMENT-TRUST-4A', 'TechForward Alliance', 'Infrastructure-Upgrade-Grant', 'Description 05', '17618'),
  ('RECO-0006', 'REC-2024-0038', 'Caelum-Circle-Entity', 'Community-Outreach-Initiative', 'Description 06', '2e551b22-8fcc-11eb-924d-9cd76263cbd0');

INSERT INTO mem_transfer (id, transfer_id, mem_id, assignee_id) VALUES
  ('PROC-0001', 'Research-Grant-Transition', 'Research-Participant-Link', 'Backup-Server-Cluster'),
  ('PROC-0002', 'Inventory-Relocation-Event', 'Inventory-Owner-Tag', 'External-Partner-Node'),
  ('PROC-0003', 'Service-Access-Redirection', 'API-Access-Token', 'Backup-Server-Cluster'),
  ('PROC-0004', 'Dataset-Ownership-Revocation', 'Dataset-Curator-Tier', 'Security-Review-Board'),
  ('PROC-0005', 'Q3-2023-Asset-Handoff', 'Guest-Access-Right', 'External-Client-Portal'),
  ('PROC-0006', 'Dataset-Ownership-Revocation', 'Service-Consumer-Group', 'Regional-Office-ID');

INSERT INTO emp_retention_roles (id, retention_role_id, inheres_in, transfer_auth_id) VALUES
  ('ROLE-0001', 'Continuity Protocol Lead', 'Inheres In 01', 'Cross-Dept Token'),
  ('ROLE-0002', 'Persistent Record Steward', 'Inheres In 02', 'Legacy Migration Permit'),
  ('ROLE-0003', 'Longitudinal Data Guardian', 'Inheres In 03', 'Cross Dept Transfer'),
  ('ROLE-0004', 'Principal Research Scientist', 'Inheres In 04', 'Boundary Pass Grant'),
  ('ROLE-0005', 'Senior Security Analyst', 'Inheres In 05', 'Admin Override Protocol'),
  ('ROLE-0006', 'Provenance Archivist', 'Inheres In 06', 'Data Export Permission'),
  ('ROLE-0007', 'Continuity Protocol Lead', 'Inheres In 07', 'Secure Transfer Permit');

INSERT INTO mem_xfer_req (id, xfer_req_id, submitting_dept_id, char_enc, lang_cd) VALUES
  ('REQU-0001', 'SRV-MT-9901', 'Youth Development Agency', 'utf8', 'Lang Cd 01'),
  ('REQU-0002', 'MEM-REQ-4412', 'Health Insurance Board', 'latin1', 'Lang Cd 02'),
  ('REQU-0003', 'TRANSFER-774', 'Disability Access Commission', 'utf8', 'Lang Cd 03'),
  ('REQU-0004', 'DEPT-TRF-112', 'Disability Access Commission', 'ascii', 'Lang Cd 04'),
  ('REQU-0005', 'MEM-REQ-4412', 'Community Outreach Division', 'latin1', 'Lang Cd 05'),
  ('REQU-0006', 'SRV-REQ-667', 'Veteran Affairs Office', 'utf8', 'Lang Cd 06'),
  ('REQU-0007', 'SRV-REQ-667', 'Family Support Unit', 'latin1', 'Lang Cd 07'),
  ('REQU-0008', 'TRANSFER-774', 'Employment Services Team', 'latin1', 'Lang Cd 08');

INSERT INTO care_plan (id, care_plan_id, student_id, intervention_id, format_code, plan_title) VALUES
  ('PLAN-0001', 'Autism Communication Package', 'PROF-882X', 'Sensory Integration Program', 'unicode', 'Plan Title 01'),
  ('PLAN-0002', 'Individualized Growth Route', 'PUPIL-44910', 'Assistive Technology Access', 'unicode', 'Plan Title 02'),
  ('PLAN-0003', 'ADHD Focus Strategy', 'ID-LEA-00441', 'Sensory Integration Program', 'unicode', 'Plan Title 03'),
  ('PLAN-0004', 'ADHD Focus Strategy', 'ID-SEC-2214', 'Executive Function Coaching', 'unicode', 'Plan Title 04'),
  ('PLAN-0005', 'Multi-Sensory Learning Plan', 'REF-5519-ED', 'Behavior Intervention Plan', 'latin1', 'Plan Title 05'),
  ('PLAN-0006', 'Individualized Growth Route', 'ID-SEC-2214', 'Sensory Integration Program', 'unicode', 'Plan Title 06');

INSERT INTO stu_prog_assignment (id, enroll_id, student_id, program_id) VALUES
  ('PROC-0001', 'Credit Transfer Evaluation', 'Special Needs Recipient', 'PHY-GenScience'),
  ('PROC-0002', 'Dual Enrollment Review', 'STU-44921', 'CS-IntroPython'),
  ('PROC-0003', 'Language Proficiency Screening', 'T. Nakamura', 'Language Immersion Stream'),
  ('PROC-0004', 'AP Eligibility Assessment', 'STU-44921', 'Language Immersion Stream');

INSERT INTO prov_chg_req (id, swap_id, cust_id, vendor_id) VALUES
  ('PROC-0001', 'CertRotationProcess', 'DevOpsAutomation', 'ElasticsearchIndex'),
  ('PROC-0002', 'IngestionChangeRequest', 'DataEngPlatform', 'OAuth2Identity'),
  ('PROC-0003', 'RoutingChangeTask', 'MLInferenceService', 'S3Bucket'),
  ('PROC-0004', 'CertRotationProcess', 'DataQualityMonitor', 'PostgreSQLSource'),
  ('PROC-0005', 'PartitionRefreshJob', 'InfrastructureTeam', 'PostgreSQLSource');

INSERT INTO ozone_session (id, ozone_session_id, gas_blend_id, procedure_id) VALUES
  ('SESS-0001', 'OT-SPORTS-11', 'O3O2GasF', 'OzoneDermatology'),
  ('SESS-0002', 'OT-SPORTS-11', 'OzoneOxygen45pct', 'OzoneLumbar'),
  ('SESS-0003', 'OT-AUTO-HEMO-22', 'OzoneOxygen45pct', 'MajorOzoneHemo'),
  ('SESS-0004', 'OT-RUN-44B', 'OzoneGasBatch', 'MajorOzoneHemo'),
  ('SESS-0005', 'OT-RUN-44B', 'O3O2GasF', 'AutoHemoOzone'),
  ('SESS-0006', 'OT-CHRONIC-09', 'O3O2GasC', 'OzoneDermatology'),
  ('SESS-0007', 'OT-CHRONIC-09', 'O3O2Blend60pct', 'OzoneDermatology');

INSERT INTO cloud_storage_assignments (id, alloc_id, student_id, volume_id, unit, value) VALUES
  ('ALLO-0001', 'ALC-MIDTERM-12', 'STU-2023-1045', 'gcp-ssd-33', 'deg_C', '525.84'),
  ('ALLO-0002', 'ALC-2023-A4F', 'STU-2023-9034', 'vol-eu-west-2b', 'deg_C', '271.89'),
  ('ALLO-0003', 'ALC-2023-A4F', 'STU-2023-2187', 'vol-9f8g7h6i', 'nm', '376.33'),
  ('ALLO-0004', 'ALC-MIDTERM-12', 'STU-2023-4501', 'vol-eu-west-2b', 'mg/L', '775.40'),
  ('ALLO-0005', 'ALC-LAB3-03', 'STU-2023-3392', 'nfs-lab-03', 'mg/L', '291.29'),
  ('ALLO-0006', 'ALC-RES04B', 'STU-2023-5678', 's3-bucket-01', 'nm', '508.68');

INSERT INTO meas_capab (id, capab_id, param_id, range_id, label, lang_code) VALUES
  ('CAPA-0001', 'Gas Chromatography-MS', 'Pressure', '0-100 kPa', 'Label 01', '4060656'),
  ('CAPA-0002', 'Differential Scanning Calorimetry', 'Magnetic Field', '-40 to 85 C', 'Label 02', '325443'),
  ('CAPA-0003', 'Tensile Testing System', 'Refractive Index', '0-100 kPa', 'Label 03', 'en_US'),
  ('CAPA-0004', 'Inductively Coupled Plasma', 'Viscosity', '0-10000 lux', 'Label 04', '2933466'),
  ('CAPA-0005', 'pH Meter Calibration', 'Refractive Index', '0-100 kPa', 'Label 05', '4277018'),
  ('CAPA-0006', 'X-Ray Fluorescence Analyzer', 'Refractive Index', '-200 to 1000 F', 'Label 06', 'teamwork'),
  ('CAPA-0007', 'Inductively Coupled Plasma', 'Refractive Index', '-200 to 1000 F', 'Label 07', '68f46afd953b4de8824b596a1bff565c'),
  ('CAPA-0008', 'Thermal Conductivity Setup', 'Concentration', '10-500 mPa·s', 'Label 08', '24077793');

INSERT INTO sec_incidents (id, sec_inc_id, target_net_id, impact_id) VALUES
  ('INCI-0001', 'ColonialPipelineRansom', 'TelemedicineGateway', 'StaffAuthenticationFail'),
  ('INCI-0002', 'MarriottDataBreach', 'ClinicalDeviceNetwork', 'ServiceAvailabilityDrop'),
  ('INCI-0003', 'NotPetyaGlobal', 'BillingDatabase', 'EmergencyRoutingFailure'),
  ('INCI-0004', 'NotPetyaGlobal', 'ImagingArchiveServer', 'SurgicalProcedureCancel'),
  ('INCI-0005', 'WannaCryOutbreak', 'BillingDatabase', 'CriticalCareMonitorOffline'),
  ('INCI-0006', 'MiraiBotnetDDoS', 'HospitalEHRSystem', 'NetworkTrafficSpike'),
  ('INCI-0007', 'MiraiBotnetDDoS', 'HospitalEHRSystem', 'EmergencyRoutingFailure'),
  ('INCI-0008', 'EquifaxCreditLeak', 'HospitalEHRSystem', 'EmergencyRoutingFailure');

INSERT INTO med_inv (id, inv_rec_id, med_asset_id, data_fmt, item_name) VALUES
  ('RECO-0001', 'DEVICE-SNAP-6678', 'MRI-3T-Scanner', 'unicode', 'Item Name 01'),
  ('RECO-0002', 'INV-REC-8842', 'UltrasoundPro-700', 'latin1', 'Item Name 02'),
  ('RECO-0003', 'MED-REC-2215', 'Ventilator-CPAP-200', 'unicode', 'Item Name 03'),
  ('RECO-0004', 'PROV-REC-1127', 'UltrasoundPro-700', 'ascii', 'Item Name 04'),
  ('RECO-0005', 'PROV-REC-1127', 'Defibrillator-ACD-100', 'unicode', 'Item Name 05'),
  ('RECO-0006', 'ASSET-4421-INV', 'Ventilator-CPAP-200', 'unicode', 'Item Name 06'),
  ('RECO-0007', 'INV-REC-8842', 'SyringePump-500', 'ascii', 'Item Name 07'),
  ('RECO-0008', 'EQUIP-9903-LOG', 'ECG-Monitor-12L', 'ascii', 'Item Name 08');

INSERT INTO nurse_role (id, nurse_id, provider_id, realized_in) VALUES
  ('NURS-0001', 'Dr. A. Okafor', 'Community Psychiatric Nurse', 'Realized In 01'),
  ('NURS-0002', 'NHS-CLD-4482', 'Mental Health Nurse', 'Realized In 02'),
  ('NURS-0003', 'Team Lead Clarke', 'RNLD Specialist', 'Realized In 03'),
  ('NURS-0004', 'Elena Vasquez', 'Primary Care Physician', 'Realized In 04'),
  ('NURS-0005', 'Dr. A. Okafor', 'Speech and Language Therapist', 'Realized In 05'),
  ('NURS-0006', 'Cedarvale Disability Advisor', 'Advanced Clinical Practitioner', 'Realized In 06'),
  ('NURS-0007', 'R. K. Patel', 'HCPC Registered Nurse', 'Realized In 07'),
  ('NURS-0008', 'Oakridge Learning Support', 'Specialist Learning Disability Nurse', 'Realized In 08');

INSERT INTO role_profiles (id, profile_id, role_id, code_sys, label_txt) VALUES
  ('PERC-0001', 'Field Observation Lead', 'Functional Code Zeta', 'utf8', 'Label Txt 01'),
  ('PERC-0002', 'Telemetry Analyst', 'INC-RESP-PROTO', 'latin1', 'Label Txt 02'),
  ('PERC-0003', 'Calibration Protocol Lead', 'INC-RESP-PROTO', 'ascii', 'Label Txt 03'),
  ('PERC-0004', 'Data Lineage Tracker', 'SEC-CLEAR-ALPHA', 'unicode', 'Label Txt 04'),
  ('PERC-0005', 'Access Auditor', 'PIPE-OWNER-DEF', 'utf8', 'Label Txt 05');

INSERT INTO ct_radiologist (id) VALUES
  ('ROLE-0001'),
  ('ROLE-0002'),
  ('ROLE-0003'),
  ('ROLE-0004'),
  ('ROLE-0005'),
  ('ROLE-0006'),
  ('ROLE-0007');

INSERT INTO imaging_core (id, core_id, rel_0000115) VALUES
  ('CORE-0001', 'Pinehaven Scan Facility', 'Rel 0000115 01'),
  ('CORE-0002', 'Rodent Imaging Facility', 'Rel 0000115 02'),
  ('CORE-0003', 'Ashwood Research Imager', 'Rel 0000115 03'),
  ('CORE-0004', 'Translational MRI Center', 'Rel 0000115 04');

INSERT INTO job_role (id, job_role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'Supply Chain Command', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'Business Unit Lead', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Site Director', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'Strategic Planning Head', 'Borne By 04', 'Realized In 04');

INSERT INTO qual_sessions (id, qual_id, session_id, practice_type) VALUES
  ('PRAC-0001', 'Anomaly Threshold Scan', 'autumn reference test', 'volume capacity test'),
  ('PRAC-0002', 'Sensor Zeroing Routine', 'weekly calibration sweep', 'volume measurement cycle'),
  ('PRAC-0003', 'Chromatography Validation', 'biweekly baseline sweep', 'volume capacity test'),
  ('PRAC-0004', 'Anomaly Threshold Scan', 'autumn reference test', 'metric sampling pass'),
  ('PRAC-0005', 'Anomaly Threshold Scan', 'pre-shift sensor calibration', 'metric sampling pass'),
  ('PRAC-0006', 'Reference Material Run', 'biweekly baseline sweep', 'throughput stress trial'),
  ('PRAC-0007', 'Anomaly Threshold Scan', 'biweekly baseline sweep', 'throughput benchmark'),
  ('PRAC-0008', 'Baseline Drift Check', 'post-deploy stability trial', 'volume capacity test');

INSERT INTO dns_abuse_case (id, case_id, incident_id, registry_id) VALUES
  ('STUD-0001', 'Registrar Compliance Check', 'Malware Distribution', 'Trust Anchor Verification'),
  ('STUD-0002', 'Malvertising Domain Review', 'IDN Spoofing Incident', 'TLD Quality Review'),
  ('STUD-0003', 'Botnet C2 Tracking', 'Domain Hijack Incident', 'DNSSEC Enforcement Initiative'),
  ('STUD-0004', 'Credential Harvesting Audit', 'Ransomware Redirect Event', 'TLD Quality Review'),
  ('STUD-0005', 'Cloudflare Abuse Report', 'Credential Harvesting Burst', 'Trust Anchor Verification'),
  ('STUD-0006', 'Domain Lockdown Audit', 'Domain Squatting Incident', 'WHOIS Redaction Policy');

INSERT INTO abuse_policy (id, policy_id, abuse_event_ref, program_ref, priority, review_cycle_days) VALUES
  ('MEAS-0001', 'WHOIS Redaction', 'Cybersquatting Incidents', '.net Extension Management', '1', '531'),
  ('MEAS-0002', 'Certificate Transparency Logging', 'Search Engine Poisoning', '.com Registry Operations', '5', '140'),
  ('MEAS-0003', 'RDAP Privacy Shield', 'DNS Hijacking Events', 'Automated Provisioning System', '4', '148'),
  ('MEAS-0004', 'Domain Expiry Grace Period', 'Cybersquatting Incidents', 'Premium Domain Allocation', '4', '242');

INSERT INTO esg_fund_portfolio (id, fund_portfolio_id, asset_id, portfolio_label, lang_code) VALUES
  ('COLL-0001', 'Invesco QQQ', 'US TIPS', 'Portfolio Label 01', '7731872'),
  ('COLL-0002', 'Calvert Equity', 'BEP Renewables', 'Portfolio Label 02', '2839513'),
  ('COLL-0003', 'StateStreet Global', 'BEP Renewables', 'Portfolio Label 03', '4060655'),
  ('COLL-0004', 'Amundi MSCI', 'MSFT Common', 'Portfolio Label 04', '17254906'),
  ('COLL-0005', 'Invesco QQQ', 'VWS Wind', 'Portfolio Label 05', '9085263'),
  ('COLL-0006', 'SPDR Sustain', 'ORSTED A/S', 'Portfolio Label 06', '10336'),
  ('COLL-0007', 'Fidelity Sustainability', 'ORSTED A/S', 'Portfolio Label 07', '611510');

INSERT INTO corp_reputation_impact (id, rep_impact_id, decision_id, encoding_type, display_label) VALUES
  ('SITU-0001', 'Driftwood Transparency Statement', 'Venture Capital Round', 'latin1', 'Display Label 01'),
  ('SITU-0002', 'Solstice Community Report', 'Retail Investor Flow', 'unicode', 'Display Label 02'),
  ('SITU-0003', 'Aegis Compliance Audit', 'Green Bond Issuance', 'utf8', 'Display Label 03'),
  ('SITU-0004', 'Lumina Supply Chain Log', 'Debt Financing Round', 'unicode', 'Display Label 04'),
  ('SITU-0005', 'Solstice Community Report', 'Infrastructure Debt Placement', 'unicode', 'Display Label 05'),
  ('SITU-0006', 'Unilever NV', 'Strategic Minority Stake', 'latin1', 'Display Label 06');

INSERT INTO md_sim_run (id, md_sim_id, software_id, target_id) VALUES
  ('PROC-0001', 'AMBER Protein', 'NAMD 3.0', 'Microtubule Tubulin'),
  ('PROC-0002', 'CHARMM Lipid', 'Desmond 4.8', 'Insulin Hexamer'),
  ('PROC-0003', 'HOOMD Blue', 'NAMD 3.0', 'Ubiquitin K48'),
  ('PROC-0004', 'NPT Equilibration 48h', 'NAMD 3.0', 'Bovine Serum Albumin');

INSERT INTO sme_survey_matches (id, dataset_id, source_id, char_encoding, lang_code) VALUES
  ('DATA-0001', 'National_SME_Census_Link', 'Financial_Disclosure_Collection', 'latin1', '392491'),
  ('DATA-0002', 'Regional_SME_Match_2024', 'Business_Dynamics_Survey', 'utf8', 'c748a9ca-8fcc-11eb-924d-9cd76263cbd0'),
  ('DATA-0003', 'SME_Innovation_Panel_Data', 'Regional_Economic_Census', 'unicode', '157'),
  ('DATA-0004', 'Enterprise_Dynamics_Panel', 'National_Business_Survey', 'ascii', '5082977'),
  ('DATA-0005', 'Matched_SME_Track_2021', 'National_Business_Survey', 'utf8', '9085245'),
  ('DATA-0006', 'Enterprise_Dynamics_Panel', 'Annual_Survey_of_Finance', 'utf8', '9125637'),
  ('DATA-0007', 'SME_Panel_2023', 'Corporate_Panel_Program', 'unicode', '2933458');

INSERT INTO gov_process (id, process_id, budget_id, kpi_id) VALUES
  ('PROC-0001', 'Legacy Debt Management', 'Server Infrastructure Budget', 'Mean Time To Recovery'),
  ('PROC-0002', 'Legacy Debt Management', 'SaaS Subscription Pool', 'User Access Revocation Time'),
  ('PROC-0003', 'Software Licensing Audit', 'Cloud Subscription Pool', 'Application Deployment Frequency'),
  ('PROC-0004', 'IT Budget Allocation', 'Network Bandwidth Allocation', 'License Waste Percentage'),
  ('PROC-0005', 'Enterprise Architecture Review', 'Hardware Procurement Fund', 'User Access Revocation Time'),
  ('PROC-0006', 'Hardware Deprecation Schedule', 'Compliance Training Budget', 'Incident Resolution SLA');

INSERT INTO business_needs (id, need_id, requestor_id, format_code, description) VALUES
  ('NEED-0001', 'DataEngineer', 'DevOpsTeam', 'latin1', 'Description 01'),
  ('NEED-0002', 'RegulatoryCounsel', 'SecurityArchitect', 'latin1', 'Description 02'),
  ('NEED-0003', 'SecurityArchitect', 'DataGovernor', 'unicode', 'Description 03'),
  ('NEED-0004', 'RegulatoryCounsel', 'ProductManager', 'unicode', 'Description 04');

INSERT INTO legal_matter (id, matter_id, client_id, document_id) VALUES
  ('PROC-0001', 'CourtRepresentationPhase', 'DVCase112', 'ExhibitA1'),
  ('PROC-0002', 'VictimCompensationClaim', 'ClientID882', 'FinancialAffidavit'),
  ('PROC-0003', 'EmergencyReliefFiling', 'ClientID221', 'WitnessAffidavit'),
  ('PROC-0004', 'RestrainingOrderHearing', 'SurvivorRef77', 'VictimImpactStatement'),
  ('PROC-0005', 'VictimRightsCounsel', 'SurvivorCase22', 'VictimImpactStatement'),
  ('PROC-0006', 'RestrainingOrderHearing', 'SurvivorCase22', 'ProtectiveOrderDraft');

INSERT INTO prog_req (id, req_id, unit, value) VALUES
  ('REQU-0001', 'Major Prerequisite Sequence', 'ratio', '667.44'),
  ('REQU-0002', 'Foreign Language Proficiency', 'ms', '514.16'),
  ('REQU-0003', 'Senior Thesis Defense', 'nm', '296.32'),
  ('REQU-0004', 'General Education Core', 'mg/L', '276.82'),
  ('REQU-0005', 'Research Methods Seminar', 'ratio', '333.56');

INSERT INTO cov_param (id, cov_param_id, method_code, error_margin) VALUES
  ('PARA-0001', 'Targeted Region Beta', 'inferred', '271.08'),
  ('PARA-0002', 'Whole Genome 30x', 'inferred', '48.68'),
  ('PARA-0003', 'Viral Panel Coverage', 'hybrid', '776.15'),
  ('PARA-0004', 'Exon Panel Depth', 'hybrid', '14.41');

INSERT INTO genomic_analysis_program (id, program_id, patient_id, model_id) VALUES
  ('PROG-0001', 'Pharmacogenomic Dosing Protocol', 'Laboratory results archive', 'Gradient boosting regressor'),
  ('PROG-0002', 'Guardant360 CDx', 'HPO phenotype list', 'Support vector machine'),
  ('PROG-0003', 'Broad Institute Ga4gh', 'Problem list snapshot', 'Random forest classifier'),
  ('PROG-0004', 'Ambry Comprehensive', 'EHR longitudinal record', 'Support vector machine'),
  ('PROG-0005', 'Congenital Anomaly Mapping', 'FHIR patient bundle', 'Logistic Risk Predictor');

INSERT INTO genomic_test (id, seq_test_id, sample_id, platform_id) VALUES
  ('TEST-0001', 'BRCA1 BRCA2 Test', 'Amniotic Fluid', 'BasePulse X9'),
  ('TEST-0002', 'Pharmacogenomic Profiling', 'Peripheral Blood Sample', 'AxiomSeq N100'),
  ('TEST-0003', 'Mitochondrial Sequencing', 'Saliva Collection Kit', 'SeqCore Atlas'),
  ('TEST-0004', 'Mitochondrial Sequencing', 'Placental Tissue', 'HelioMapper Elite'),
  ('TEST-0005', 'Germline Mutation Assay', 'Plasma Cell Free DNA', 'StrandWeave Mini'),
  ('TEST-0006', 'HLA Typing Panel', 'Buccal Swab', 'Oxford Nanopore PromethION'),
  ('TEST-0007', 'Targeted Exome Panel', 'Formalin Fixed Paraffin Block', 'SeqCore Atlas');

INSERT INTO health_profile (id, profile_id, genomic_ref, imaging_ref, display_name, lang_code) VALUES
  ('PROF-0001', 'PROFILE-8821', 'PhyloScan-77', 'XRay-Chest-003', 'Display Name 01', '2002007020150'),
  ('PROF-0002', 'PHR-2023-0482', 'ExomeSeq-442', 'CT-Chest-114', 'Display Name 02', '4277035'),
  ('PROF-0003', 'PROF-00482', 'Panel-BRCA1', 'Angio-Coronary-19', 'Display Name 03', '2839516'),
  ('PROF-0004', 'EHR-PH-9921', 'Methylation-Array', 'Echo-Cardiac-77', 'Display Name 04', 'lu_tax_code_template_m34'),
  ('PROF-0005', 'PAT-7742-PROF', 'Panel-BRCA1', 'US-Abdomen-221', 'Display Name 05', '32816'),
  ('PROF-0006', 'EHR-PH-9921', 'NGS-WholeGenome', 'CT-Head-018', 'Display Name 06', '727043');

INSERT INTO concept_process (id, process_id, source_concept_id, target_concept_id) VALUES
  ('PROC-0001', 'TelemetryEventCategorization', 'BaselineNetworkPacket', 'EnrichedDataProfile'),
  ('PROC-0002', 'LabSpecimenClassification', 'BaselineNetworkPacket', 'ClassifiedPathogenStrain'),
  ('PROC-0003', 'RegulatoryTaxonomyDerivation', 'RawTelemetryStream', 'ExtractedAnomalyType'),
  ('PROC-0004', 'DataQualityRuleApplication', 'UnprocessedSignalWaveform', 'BinnedFrequencyRange'),
  ('PROC-0005', 'MetadataEnrichmentPipeline', 'PristineObservationRecord', 'DerivedQualityScore'),
  ('PROC-0006', 'PatientOutcomeClassification', 'PristineObservationRecord', 'CategorizedAlertClass');

INSERT INTO render_output (id, render_id, concretizes, realized_in) VALUES
  ('ARTI-0001', 'anim_bake_04_final', 'Concretizes 01', 'Realized In 01'),
  ('ARTI-0002', 'render_manifest_09', 'Concretizes 02', 'Realized In 02'),
  ('ARTI-0003', 'render_log_8812', 'Concretizes 03', 'Realized In 03'),
  ('ARTI-0004', 'geo_cache_stream_03', 'Concretizes 04', 'Realized In 04'),
  ('ARTI-0005', 'frame_sequence_11', 'Concretizes 05', 'Realized In 05');

INSERT INTO social_media_admin (id, admin_id, borne_by, realized_in) VALUES
  ('ADMI-0001', '@TransitInfo', 'Borne By 01', 'Realized In 01'),
  ('ADMI-0002', '@ParksMaint', 'Borne By 02', 'Realized In 02'),
  ('ADMI-0003', '@SchoolBoard', 'Borne By 03', 'Realized In 03'),
  ('ADMI-0004', '@EmergencyOps', 'Borne By 04', 'Realized In 04'),
  ('ADMI-0005', '@CityPlanning', 'Borne By 05', 'Realized In 05'),
  ('ADMI-0006', '@WasteMgmt', 'Borne By 06', 'Realized In 06'),
  ('ADMI-0007', '@TrafficAlerts', 'Borne By 07', 'Realized In 07'),
  ('ADMI-0008', '@TrafficAlerts', 'Borne By 08', 'Realized In 08');

INSERT INTO social_reg (id, reg_id, login_cred_id, officer_id) VALUES
  ('REGI-0001', 'REG-TU-2290', 'SSO Principal ID', 'Regulatory Comms Advisor'),
  ('REGI-0002', 'REG-VXR-8812', 'API Private Key', 'Brand Integrity Manager'),
  ('REGI-0003', 'REG-CBL-1147', 'API Private Key', 'Chief Communications Officer'),
  ('REGI-0004', 'REG-TU-2290', 'OAuth2 Client Creds', 'Regulatory Comms Advisor');

INSERT INTO exec_position (id, exec_role_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'LeadFiscalOfficer', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'Head of Corporate Finance', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'Director of Financial Planning', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'LeadFiscalOfficer', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'VP Finance', 'Inheres In 05', 'Realized In 05'),
  ('ROLE-0006', 'Chief Accounting Officer', 'Inheres In 06', 'Realized In 06');

INSERT INTO fin_plan_cycle (id, plan_cycle_id, exec_team_id, report_ref) VALUES
  ('PROC-0001', 'Dividend Policy Formulation', 'Budget Allocation Board', 'Liquidity Stress Test Report'),
  ('PROC-0002', 'Annual Capital Allocation', 'Budget Allocation Board', 'Budget Variance Analysis'),
  ('PROC-0003', 'Annual Capital Allocation', 'Executive Steering Group', 'Tax Liability Forecast'),
  ('PROC-0004', 'Annual Capital Allocation', 'Corporate Controller', 'Budget Variance Analysis'),
  ('PROC-0005', 'FY24 Capital Allocation', 'Corporate Controller', 'Debt Service Schedule'),
  ('PROC-0006', 'Long Term Growth Strategy', 'Finance Steering Committee', 'Five Year Cashflow Projection');

INSERT INTO exec_team (id, exec_team_id, participates_in, roster_name, lang_code) VALUES
  ('ROST-0001', 'Lyra Chen', 'Participates In 01', 'Roster Name 01', 'Cash'),
  ('ROST-0002', 'Felix Grant', 'Participates In 02', 'Roster Name 02', '39800611'),
  ('ROST-0003', 'Tobias Reed', 'Participates In 03', 'Roster Name 03', '3158135'),
  ('ROST-0004', 'Lyra Chen', 'Participates In 04', 'Roster Name 04', '790474'),
  ('ROST-0005', 'James Vance', 'Participates In 05', 'Roster Name 05', '7119774'),
  ('ROST-0006', 'Mira Vance', 'Participates In 06', 'Roster Name 06', '1186089'),
  ('ROST-0007', 'Elara Quinn', 'Participates In 07', 'Roster Name 07', '4060633'),
  ('ROST-0008', 'Imogen Shaw', 'Participates In 08', 'Roster Name 08', '15134');

INSERT INTO risk_accept_eval (id, eval_risk_id, risk_metric_id, sys_cond_id) VALUES
  ('EVAL-0001', 'CloudAvailabilityBreach', 'ConsequenceSeverityIndex', 'CoolingSystemOverheat'),
  ('EVAL-0002', 'NetworkPacketLoss', 'MeanTimeToRepair', 'MemoryLeak'),
  ('EVAL-0003', 'NetworkPacketLoss', 'ConsequenceSeverityIndex', 'DiskWriteLatency'),
  ('EVAL-0004', 'GridFrequencyDeviation', 'RiskPriorityNumber', 'SignalInterference');

INSERT INTO certified_tester (id, tester_id, borne_by, realized_in) VALUES
  ('INDI-0001', 'SamplingProtocolExpert', 'Borne By 01', 'Realized In 01'),
  ('INDI-0002', 'EmissionsMonitoringTechnician', 'Borne By 02', 'Realized In 02'),
  ('INDI-0003', 'FieldValidationEngineer', 'Borne By 03', 'Realized In 03'),
  ('INDI-0004', 'LeadEmissionTester', 'Borne By 04', 'Realized In 04'),
  ('INDI-0005', 'QualityAssuranceInspector', 'Borne By 05', 'Realized In 05'),
  ('INDI-0006', 'RemediationCoordinator', 'Borne By 06', 'Realized In 06'),
  ('INDI-0007', 'CertifiedLabAnalyst', 'Borne By 07', 'Realized In 07'),
  ('INDI-0008', 'SamplingProtocolExpert', 'Borne By 08', 'Realized In 08');

INSERT INTO cems_eval (id, eval_id, monitor_id, method_id) VALUES
  ('EVAL-0001', 'Refinery B Compliance Check', 'Incinerator-Flue-Analyzer', 'Dissolved-Oxygen-Winkler-Test'),
  ('EVAL-0002', 'Ironwood Stack Certification', 'Combustor-NOx-Relay', 'Gravimetric-Sulfate-Analysis'),
  ('EVAL-0003', 'Unit 3 Q4 Audit', 'Furnace-3-DEMS-Unit', 'Ion Selective Electrode'),
  ('EVAL-0004', 'Flue-Gas-Analyzer-Certification', 'Blast-Furnace-Particulate-Track', 'Spectrophotometric-Nitrate-Test'),
  ('EVAL-0005', 'Coastal Gen Assessment', 'Reactor Vent CEMS', 'Copper-Complexation-Assay'),
  ('EVAL-0006', 'Stack-4-Performance-Review', 'Flue Gas 1 CEMS', 'Ion-Exchange-Chromatography'),
  ('EVAL-0007', 'Q3-Stack-Validation', 'Furnace-3-DEMS-Unit', 'Gravimetric-Sulfate-Analysis');

INSERT INTO field_equip_coord (id, equip_coord_id, equip_ref, op_ref) VALUES
  ('COOR-0001', 'ServerRackReboot', 'SubseaCableReel', 'SyncEngineMaster'),
  ('COOR-0002', 'DeltaValveSync', 'ThermalImagerPortable', 'ControlRoomMain'),
  ('COOR-0003', 'DeltaValveSync', 'SensorArrayField', 'ControlRoomMain'),
  ('COOR-0004', 'CoastalNodeMaintenance', 'PumpStationPrimary', 'ControlRoomMain'),
  ('COOR-0005', 'PipelineLeakCheck', 'ValveActuatorDrive', 'CentralHubPrimary'),
  ('COOR-0006', 'BridgeSensorSync', 'SubseaCableReel', 'SyncEngineMaster');

INSERT INTO test_unit_catalog (id, catalog_id, emission_source_id, record_format, data_encoding, language_code) VALUES
  ('CATA-0001', 'Grid Emission Audit', 'Sand Blasting Booth', 'Control System Matrix', 'utf8', 'template_ivacode_pagata_20det15ind'),
  ('CATA-0002', 'Grid Emission Audit', 'Pulp Mill Kettle', 'Data Schema Blueprint', 'latin1', 'lu_tax_code_template_b_VB-EC-6'),
  ('CATA-0003', 'Facility Monitoring Ledger', 'Diesel Generator Set', 'Instrumentation Layout', 'latin1', '1889784'),
  ('CATA-0004', 'Regulatory Compliance Log', 'Coal Fired Boiler', 'Sensor Array Topology', 'utf8', '1336182');

INSERT INTO treatment_record (id, treatment_id, child_id, outcome_code) VALUES
  ('PROC-0001', 'REHYDRATION-STEP-T4U9', 'INDIVIDUAL-REF-F7G1', 'HYDRATION-RESTORED'),
  ('PROC-0002', 'THERAPEUTIC-MILK-R3S8', 'RECORD-ID-P1Q6', 'HYDRATION-RESTORED'),
  ('PROC-0003', 'SEVERE-ACUTE-H1J4', 'CASE-ID-X7Y2', 'METABOLIC-STABLE'),
  ('PROC-0004', 'PLASDOSE-INIT-P7Q1', 'SUBJECT-KEY-B6C9', 'BMI-RECOVERY-OK'),
  ('PROC-0005', 'PLASDOSE-INIT-P7Q1', 'CLIENT-ID-H3J8', 'METABOLIC-STABLE'),
  ('PROC-0006', 'NUTRIENT-REPLEN-M2N6', 'SUBJECT-KEY-B6C9', 'VITALS-REGULARIZED'),
  ('PROC-0007', 'NUTRIENT-REPLEN-M2N6', 'CASE-ID-X7Y2', 'NUTRIENT-EQUILIBRIUM');

INSERT INTO stat_test (id, hypo_test_id, test_stat_id, alpha_id) VALUES
  ('TEST-0001', 'Batch yield variance', 'Z-score standard normal', '0.01 stringent level'),
  ('TEST-0002', 'Churn probability threshold', 'Cohen effect size d', 'FDR q-value 0.10'),
  ('TEST-0003', 'Model accuracy baseline', 'Shapiro-Wilk normality', 'alpha 0.01 strict'),
  ('TEST-0004', 'Model accuracy baseline', 'F-test variance ratio', 'alpha 0.01 strict'),
  ('TEST-0005', 'Batch yield variance', 'Pearson correlation r', '0.05 conventional level'),
  ('TEST-0006', 'Sensor drift detection', 'Z-score standard normal', 'Holm-Bonferroni adjusted 0.01'),
  ('TEST-0007', 'Model accuracy baseline', 'F-test variance ratio', 'Holm-Bonferroni adjusted 0.01'),
  ('TEST-0008', 'Defect rate tolerance', 'Wilcoxon signed rank', 'alpha 0.01 strict');

INSERT INTO staff_smm_assignments (id, role_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'James Okafor', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'Sarah Lin', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'Community Engagement Officer', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'Public Affairs Liaison', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'Content Strategy Manager', 'Inheres In 05', 'Realized In 05'),
  ('ROLE-0006', 'Lead Platform Moderator', 'Inheres In 06', 'Realized In 06'),
  ('ROLE-0007', 'Digital Operations Supervisor', 'Inheres In 07', 'Realized In 07'),
  ('ROLE-0008', 'Digital Communications Specialist', 'Inheres In 08', 'Realized In 08');

INSERT INTO social_platform (id, platform_id, service_type_id, method, uncertainty) VALUES
  ('PLAT-0001', 'LuminaBridge', 'Microblogging', 'hybrid', '683.00'),
  ('PLAT-0002', 'LinkedIn', 'Photo Sharing', 'hybrid', '537.33'),
  ('PLAT-0003', 'Threads', 'Live Broadcasting', 'automated', '388.28'),
  ('PLAT-0004', 'Discord', 'local_community', 'automated', '543.72'),
  ('PLAT-0005', 'AetherConnect', 'dating_service', 'automated', '421.37'),
  ('PLAT-0006', 'Twitter', 'Professional Networking', 'manual', '888.78'),
  ('PLAT-0007', 'AetherConnect', 'Voice Chat', 'hybrid', '36.04');

INSERT INTO enc_dim_spec (id, dim_spec_id, width_mm, height_mm, unit_cd, spec_label) VALUES
  ('SPEC-0001', 'IEC-60804-1', '28.5mm', '1.625in', 'latin1', 'Spec Label 01'),
  ('SPEC-0002', 'Telcordia-GR-1221-CORE', '62mm', '44.5mm', 'utf8', 'Spec Label 02'),
  ('SPEC-0003', 'ANSI-C63.4-2014', '1.875in', '22.0mm', 'ascii', 'Spec Label 03'),
  ('SPEC-0004', 'IEC-60804-1', '50.8mm', '1.000in', 'latin1', 'Spec Label 04'),
  ('SPEC-0005', 'SAE-AS85045-Std', '3.000in', '0.500in', 'latin1', 'Spec Label 05'),
  ('SPEC-0006', 'EN-60529-IP67', '3.000in', '44.5mm', 'latin1', 'Spec Label 06'),
  ('SPEC-0007', 'DO-160G-Section21', '1.875in', '2.500in', 'latin1', 'Spec Label 07'),
  ('SPEC-0008', 'SAE-AS85045-Std', '45mm', '25.4mm', 'latin1', 'Spec Label 08');

INSERT INTO course (id, course_id, rel_0000178) VALUES
  ('COUR-0001', 'Summer Menu', 'Rel 0000178 01'),
  ('COUR-0002', 'Wine Flight', 'Rel 0000178 02'),
  ('COUR-0003', 'Holiday Feast', 'Rel 0000178 03'),
  ('COUR-0004', 'Seasonal Tasting', 'Rel 0000178 04'),
  ('COUR-0005', 'Brunch Combo', 'Rel 0000178 05'),
  ('COUR-0006', 'Dessert Assortment', 'Rel 0000178 06'),
  ('COUR-0007', 'Holiday Feast', 'Rel 0000178 07'),
  ('COUR-0008', 'Dessert Assortment', 'Rel 0000178 08');

INSERT INTO staff_assignments (id, assign_id, staff_id, realized_in) VALUES
  ('ROLE-0001', 'Sommelier', 'EMP-1154', 'Realized In 01'),
  ('ROLE-0002', 'SousChef', 'EMP-6275', 'Realized In 02'),
  ('ROLE-0003', 'LineCook', 'EMP-9033', 'Realized In 03'),
  ('ROLE-0004', 'Sommelier', 'EMP-7780', 'Realized In 04'),
  ('ROLE-0005', 'Sommelier', 'EMP-4821', 'Realized In 05');

INSERT INTO flood_eval (id, assessment_id, asset_id, data_source_id) VALUES
  ('ASSE-0001', 'CoastalSlough_Event', 'Steel Culvert', 'SAR imagery'),
  ('ASSE-0002', 'Rhine Flood Crisis', 'Embankment Dam', 'Synthetic Aperture'),
  ('ASSE-0003', 'TributaryCreek_Overflow', 'floodgate', 'SAR imagery'),
  ('ASSE-0004', 'HarborSlough_Flood', 'Stormwater Gantry', 'InSAR coherence'),
  ('ASSE-0005', 'MeadowCreek_Inundation', 'retention basin', 'Optical NDWI'),
  ('ASSE-0006', 'ValleyCreek_Rise', 'storm channel', 'SAR Interferometry'),
  ('ASSE-0007', 'HarborSlough_Flood', 'Sluice Gate', 'UAV photogrammetry');

INSERT INTO auth_role_assign (id, auth_role_id, participates_in, transfer_id) VALUES
  ('ROLE-0001', 'MinorGuardianProxy', 'Participates In 01', 'PatientPortalAuth'),
  ('ROLE-0002', 'TemporaryAccessToken', 'Participates In 02', 'InteropNetworkNode'),
  ('ROLE-0003', 'HIPAAReleaseAuth', 'Participates In 03', 'DataExchangeGateway'),
  ('ROLE-0004', 'MinorGuardianProxy', 'Participates In 04', 'AuditLogService'),
  ('ROLE-0005', 'EHRAccessClearance', 'Participates In 05', 'AuditLogService'),
  ('ROLE-0006', 'YouthMatureMinorConsent', 'Participates In 06', 'DataExchangeGateway'),
  ('ROLE-0007', 'DataSharingPermit', 'Participates In 07', 'PatientPortalAuth');

INSERT INTO reportable_disease_req (id, notify_req_id, disclosure_subject, recipient_facility, valid_from, is_required) VALUES
  ('REQU-0001', 'Pertussis Outbreak Report', 'Pathology Diagnostic Report', 'Medical Records Clerk', '2025-05-09', 'false'),
  ('REQU-0002', 'Pertussis Outbreak Report', 'Wellness Examination File', 'Infection Control Specialist', '2023-01-02', 'true'),
  ('REQU-0003', 'Syphilis Mandatory Filing', 'Pathology Diagnostic Report', 'Hospital Administrator', '2023-12-18', 'true'),
  ('REQU-0004', 'TB Notification Directive', 'Wellness Examination File', 'Case Management Coordinator', '2023-09-30', 'false'),
  ('REQU-0005', 'Syphilis Mandatory Filing', 'Treatment Plan Overview', 'Infection Control Specialist', '2023-05-13', 'false'),
  ('REQU-0006', 'Pertussis Outbreak Report', 'Inpatient Care Summary', 'Public Health Officer', '2024-03-07', 'true');

INSERT INTO youth_care_sum (id, care_summary_id, health_status, format_code, data_encoding, summary_label) VALUES
  ('SUMM-0001', 'REC-4419', 'Chronic disease transition plan', 'HL7 CDA R2', 'unicode', 'Summary Label 01'),
  ('SUMM-0002', 'PT-7731', 'Mental health baseline assessment', 'FHIR Observation Profile', 'latin1', 'Summary Label 02'),
  ('SUMM-0003', 'PT-7731', 'Mental health baseline assessment', 'HL7 V2.5.1 Message', 'latin1', 'Summary Label 03'),
  ('SUMM-0004', 'ID-99304', 'Growth deviation screening', 'CCDA v2.1', 'ascii', 'Summary Label 04');

INSERT INTO mentor_prog (id, program_id, guided_role, coached_role) VALUES
  ('PROG-0001', 'CyberSec Apprentices', 'Research PIs', 'PhD Candidates'),
  ('PROG-0002', 'TechBridge Fellows', 'Senior Data Architects', 'Innovation Lab Members'),
  ('PROG-0003', 'CyberSec Apprentices', 'Research PIs', 'MBA Candidates'),
  ('PROG-0004', 'FinTech Incubator', 'Venture Partners', 'Research Fellows');

INSERT INTO student_role (id, role_id, student_id, venture_id) VALUES
  ('ROLE-0001', 'STU-1123-J', 'REC-ACAD-9910', 'STP-FINLEAP'),
  ('ROLE-0002', 'Clara Jensen', 'REC-ACAD-1123', 'Solaris Tech'),
  ('ROLE-0003', 'STU-8890-T', 'REC-ACAD-5567', 'STP-DATAFORGE'),
  ('ROLE-0004', 'Clara Jensen', 'REC-ACAD-6678', 'ITR-AUTOROUTE'),
  ('ROLE-0005', 'Tariq Al-Farsi', 'REC-ACAD-5567', 'NutriGrow Inc'),
  ('ROLE-0006', 'STU-9910-L', 'REC-ACAD-2234', 'STP-FINLEAP'),
  ('ROLE-0007', 'STU-7702-R', 'REC-ACAD-3345', 'StreamLine Analytics');

INSERT INTO program_track (id, program_id, participant_id, focus_area) VALUES
  ('PROG-0001', 'Enzyme activation sequence', 'Growth substrate tray', 'Reagent procurement workflow'),
  ('PROG-0002', 'Enzyme activation sequence', 'Waste containment unit', 'Mentorship cohort lead'),
  ('PROG-0003', 'Enzyme activation sequence', 'Temperature probe cluster', 'Cross-lab sharing agreement'),
  ('PROG-0004', 'SignalPath Pilot', 'Cloud Infrastructure Dept', 'Container Orchestration'),
  ('PROG-0005', 'Quantum Sandbox Initiative', 'Culture medium reserve', 'Quality assurance checklist'),
  ('PROG-0006', 'Terraform Forge', 'Lead microbiologist', 'Quality assurance checklist'),
  ('PROG-0007', 'Enzyme activation sequence', 'Waste containment unit', 'Edge Inference Capabilities'),
  ('PROG-0008', 'Thermal stabilization trial', 'GPU Cluster Alpha', 'Automated Compliance Checks');

INSERT INTO study_program (id, program_id, course_id, career_path) VALUES
  ('PROG-0001', 'Neuroinformatics Core', 'Lab Observation Protocols', 'Metadata Management'),
  ('PROG-0002', 'Neuroinformatics Core', 'Teaching Consortium', 'Quantitative Reasoning'),
  ('PROG-0003', 'Biomaterials Engineering', 'Teaching Consortium', 'Data Literacy'),
  ('PROG-0004', 'Cognitive Robotics Minor', 'Seminar Series', 'Data Pipeline Engineering'),
  ('PROG-0005', 'Biomaterials Engineering', 'Departmental Board', 'Computational Modeling'),
  ('PROG-0006', 'Urban Ecology Track', 'API Design Seminar', 'Clinical Decision Making'),
  ('PROG-0007', 'Cognitive Robotics Minor', 'Data Quality Audit', 'Cross-Functional Collaboration'),
  ('PROG-0008', 'Marine Geophysics Major', 'Core Laboratory', 'Systems Thinking');

INSERT INTO emp_role_assignment (id, position_id, participates_in) VALUES
  ('MEMB-0001', 'VP Store Operations', 'Participates In 01'),
  ('MEMB-0002', 'Regional VP North', 'Participates In 02'),
  ('MEMB-0003', 'Head Loss Prevention', 'Participates In 03'),
  ('MEMB-0004', 'Head Customer Exp', 'Participates In 04'),
  ('MEMB-0005', 'Head Customer Exp', 'Participates In 05'),
  ('MEMB-0006', 'Director Visual Merch', 'Participates In 06');

INSERT INTO team_eval_event (id, eval_event_id, staff_id, result_id, objective_id) VALUES
  ('EVEN-0001', 'MLInfrastructure', 'ComplianceOfficer', 'EfficiencyMetrics', 'IncidentReduction'),
  ('EVEN-0002', 'SecurityCompliance', 'ScrumMaster', 'PerformanceDashboard', 'SecurityHardening'),
  ('EVEN-0003', 'SRETeamAlpha', 'SecurityAuditor', 'CodeQualityIndex', 'OperationalResilience'),
  ('EVEN-0004', 'MLInfrastructure', 'DevOpsCoordinator', 'TechnicalDebtReport', 'CostOptimization'),
  ('EVEN-0005', 'FrontendArchitecture', 'TechLead', 'RiskRegister', 'CostOptimization'),
  ('EVEN-0006', 'AnalyticsEngineering', 'DevOpsCoordinator', 'UptimeSLA', 'AutomationFirst'),
  ('EVEN-0007', 'DataPlatformSquad', 'ProductOwner', 'EfficiencyMetrics', 'OperationalResilience');

INSERT INTO abuse_flags (id, indicator_id, physical_form, uncertainty, value) VALUES
  ('INDI-0001', 'Brute force login', 'Registry modification', '170.46', '65.12'),
  ('INDI-0002', 'Brute force login', 'DNS tunnel traffic', '951.91', '408.60'),
  ('INDI-0003', 'DDoS flood', 'Unauthorized access token', '751.58', '931.67'),
  ('INDI-0004', 'Insider data theft', 'Suspicious log entry', '845.43', '683.22'),
  ('INDI-0005', 'Malware beaconing', 'Unauthorized access token', '186.46', '44.31'),
  ('INDI-0006', 'API rate limit bypass', 'Firewall alert', '268.75', '836.76'),
  ('INDI-0007', 'Phishing campaign', 'Network packet anomaly', '462.79', '901.17');

INSERT INTO safeguard_proc (id, safeguard_proc_id, child_prot_team_id, referral_agency_id) VALUES
  ('PROC-0001', 'MULTI-AGENCY-REF', 'NORTH-DISTRICT-CPT', 'EDUCATION-ATTENDANCE-UNIT'),
  ('PROC-0002', 'PUB-INTEREST-TEST', 'REGIONAL-PROTECT-OPS', 'COMMUNITY-REHAB-NET'),
  ('PROC-0003', 'SECTION-47-INV', 'REGIONAL-PROTECT-OPS', 'PROBATION-SERVICES'),
  ('PROC-0004', 'CRISIS-RESPONSE', 'REGIONAL-PROTECT-OPS', 'HEALTH-NURSING-TRUST'),
  ('PROC-0005', 'LADO-TRANSFER', 'RURAL-SAFETY-UNIT', 'EDUCATION-ATTENDANCE-UNIT'),
  ('PROC-0006', 'MULTI-AGENCY-REF', 'FAMILY-CRISIS-GRP', 'POLICE-CHILDREN-SVC'),
  ('PROC-0007', 'CRISIS-RESPONSE', 'ADULT-VULN-SQUAD', 'POLICE-CHILDREN-SVC'),
  ('PROC-0008', 'THRESHOLD-ASSESSMENT', 'ADULT-VULN-SQUAD', 'EDUCATION-ATTENDANCE-UNIT');

INSERT INTO legal_adv_role (id, adv_role_id, legal_prof_id, realized_in) VALUES
  ('ROLE-0001', 'Criminal Defense Pitch', 'Elena Rodriguez Counsel', 'Realized In 01'),
  ('ROLE-0002', 'Senior Partner Advertiser', 'James O''Connor Lawyer', 'Realized In 02'),
  ('ROLE-0003', 'Employment Law Sponsor', 'Robert Vance Counsel', 'Realized In 03'),
  ('ROLE-0004', 'Intellectual Property Pitch', 'Robert Vance Counsel', 'Realized In 04'),
  ('ROLE-0005', 'Family Law Advocate', 'James O''Connor Lawyer', 'Realized In 05'),
  ('ROLE-0006', 'Estate Planning Sponsor', 'Priya Patel Barrister', 'Realized In 06'),
  ('ROLE-0007', 'Personal Injury Promoter', 'Sarah Jenkins Attorney', 'Realized In 07'),
  ('ROLE-0008', 'Criminal Defense Pitch', 'James O''Connor Lawyer', 'Realized In 08');

INSERT INTO txn_log (id, txn_id, giver_id, value) VALUES
  ('EVEN-0001', 'Crowd-Alpha-Init', 'Aegis-Community-Fund', '5000.00 USD'),
  ('EVEN-0002', 'Community-Relief-Alpha', 'Global-Health-Foundation', '50.00 GBP'),
  ('EVEN-0003', 'Direct-Debit-Setup', 'Terra-Firma-Grounds', '$1,250.00'),
  ('EVEN-0004', 'Legacy-Bequest-Entry', 'Delta-Medical-Initiative', '$1,250.00'),
  ('EVEN-0005', 'Q3-Charity-Drive', 'Polaris-Research-Group', '$50,000'),
  ('EVEN-0006', 'Emergency-Relief-09', 'Veridian-Giving-Trust', '10000 JPY'),
  ('EVEN-0007', 'Fundraiser-2024-Grant', 'Summit-Charitable-Trust', 'AUD 3,400'),
  ('EVEN-0008', 'Community-Relief-Alpha', 'Harbor-View-Alliance', '500.00 EUR');

INSERT INTO growth_campaign (id, campaign_id, region_id, plan_id) VALUES
  ('INIT-0001', 'Latin America Supply Chain', 'Saharan Transition Zone', 'Joint Venture Licensing'),
  ('INIT-0002', 'Vector Alpha Growth', 'Atlantic Fringe', 'Customer Acquisition Funnel'),
  ('INIT-0003', 'Pinnacle Southeast Push', 'Andean Pact', 'Localized Content Campaign'),
  ('INIT-0004', 'Indo-Pacific Digital Push', 'Saharan Transition Zone', 'Joint Venture Licensing'),
  ('INIT-0005', 'Indo-Pacific Digital Push', 'Andean Pact', 'Customer Acquisition Funnel'),
  ('INIT-0006', 'Meridian CrossBorder', 'Benelux Region', 'Premium Brand Positioning'),
  ('INIT-0007', 'Latin America Supply Chain', 'Iberian Peninsula', 'Digital First Outreach');

INSERT INTO promo_schedule (id, promo_id, min_order_qty, product_id) VALUES
  ('ORDE-0001', 'SpringLaunchCycle', 'FourUnitMinimum', 'NewYearJournalBatch'),
  ('ORDE-0002', 'AutumnDiscountWave', 'MultiUnitFloor', 'SummerCoolerModel'),
  ('ORDE-0003', 'BackToSchoolBatch', 'BulkFiveConstraint', 'WinterCoatSKU'),
  ('ORDE-0004', 'SummerFlashCampaign', 'MultiUnitFloor', 'SummerCoolerModel'),
  ('ORDE-0005', 'AutumnDiscountWave', 'MultiUnitFloor', 'PreOrderTabletUnit'),
  ('ORDE-0006', 'PreSaleSchedule', 'MultiUnitFloor', 'FreshSunscreenStock'),
  ('ORDE-0007', 'HolidayBundleProcess', 'PackOfSixRequired', 'NewYearJournalBatch'),
  ('ORDE-0008', 'BlackFridayQueue', 'MultiUnitFloor', 'NewYearJournalBatch');

INSERT INTO perf_eval (id, eval_id, system_id, clinician_id, metric_code, eval_label) VALUES
  ('EVAL-0001', 'CP-DATA-7742', 'SiemensHealthineers', 'DrLindaZhao', 'unicode', 'Eval Label 01'),
  ('EVAL-0002', 'ClinPerf-2024-077', 'StrykerSurgiEye', 'RNMariaCosta', 'latin1', 'Eval Label 02'),
  ('EVAL-0003', 'CP-DATA-2023-118', 'CernerPowerChart', 'MDAishaPatel', 'unicode', 'Eval Label 03'),
  ('EVAL-0004', 'ClinPerf-2023-092', 'AllscriptsTouch', 'DrMarcusReed', 'latin1', 'Eval Label 04'),
  ('EVAL-0005', 'CP-EVAL-5592', 'AllscriptsTouch', 'MDAishaPatel', 'unicode', 'Eval Label 05'),
  ('EVAL-0006', 'ClinPerf-2024-033', 'MeditechExpanse', 'DrDavidKim', 'unicode', 'Eval Label 06'),
  ('EVAL-0007', 'ClinPerf-2024-033', 'MeditechExpanse', 'DrDavidKim', 'unicode', 'Eval Label 07');

INSERT INTO qi_presentation (id, presentation_id, clinical_topic_id, framework_id, file_format, title) VALUES
  ('PRES-0001', 'Hand Hygiene Compliance Drive', 'Geriatric medication interactions', 'IHI Improvement Model', 'latin1', 'Title 01'),
  ('PRES-0002', 'VTE Prophylaxis Review', 'Postpartum hemorrhage events', 'IHI Triple Aim Model', 'unicode', 'Title 02'),
  ('PRES-0003', 'Sepsis Bundle Compliance', 'Blood Transfusion Reactions', 'Baldrige Excellence', 'latin1', 'Title 03'),
  ('PRES-0004', 'VTE Prophylaxis Review', 'Diabetic ketoacidosis episodes', 'A3 Problem Solving', 'unicode', 'Title 04'),
  ('PRES-0005', 'Reducing SSI Rates', 'Hospital-Acquired Pressure Ulcers', 'Donabedian Structure Process', 'unicode', 'Title 05'),
  ('PRES-0006', 'Handoff Protocol Optimization', 'Medication Errors', 'A3 Problem Solving', 'latin1', 'Title 06'),
  ('PRES-0007', 'HAPU Prevention Protocol', 'Postpartum hemorrhage events', 'IHI Triple Aim Model', 'utf8', 'Title 07'),
  ('PRES-0008', 'Fall Risk Mitigation Plan', 'Pediatric asthma exacerbations', 'PDSA Cycle', 'latin1', 'Title 08');

INSERT INTO energy_appliance (id, appliance_id, component_id) VALUES
  ('APPL-0001', 'Tankless Water Heater', 'Variable Frequency Drive'),
  ('APPL-0002', 'Portable Air Conditioner', 'High Efficiency Motor'),
  ('APPL-0003', 'Front Load Washer', 'Magnetic Relay Switch'),
  ('APPL-0004', 'LED Panel 18W', 'Vacuum Glazing Pane'),
  ('APPL-0005', 'Commercial Refrigerator', 'High Efficiency Motor'),
  ('APPL-0006', 'LED Panel 18W', 'Condensate Pump'),
  ('APPL-0007', 'LED Panel 18W', 'Condensate Pump'),
  ('APPL-0008', 'Ground Source Heat Pump', 'High Efficiency Motor');

INSERT INTO anim_seq_build (id, build_id, timeline_id, engine_id) VALUES
  ('CREA-0001', 'ParticleBurstV2', 'PreciseMilliSecondCurve', 'LegacyOpenGL'),
  ('CREA-0002', 'ExhaustSmokeTrail', 'PreciseMilliSecondCurve', 'WebGL2Stream'),
  ('CREA-0003', 'NeonCityIntro', 'EasedMotionTrack', 'LegacyOpenGL'),
  ('CREA-0004', 'ExhaustSmokeTrail', 'LoopedSequenceA', 'WebGL2Stream'),
  ('CREA-0005', 'ParticleBurstV2', 'StaggeredKeyframes', 'OpenVDBRenderer'),
  ('CREA-0006', 'ParticleBurstV2', 'PreciseMilliSecondCurve', 'LegacyOpenGL'),
  ('CREA-0007', 'DroneFlightPath', 'LoopedSequenceA', 'SoftBodyRenderer');

INSERT INTO case_review (id, case_review_id, data_collection_id, analysis_method_id) VALUES
  ('INVE-0001', 'IEEE Ethics Review', 'Field Observation Log', 'Variance Threshold Testing'),
  ('INVE-0002', 'Atlas Structural Check', 'Vendor Contract Audit', 'Anomaly Baseline Comparison'),
  ('INVE-0003', 'Aegis Component Review', 'Field Observation Log', 'Anomaly Detection Scoring'),
  ('INVE-0004', 'DOE Nuclear Safety Audit', 'Vendor Contract Audit', 'Markov Chain Transition'),
  ('INVE-0005', 'NASA Challenger Commission', 'Digital Forensics Capture', 'Control Chart Analysis'),
  ('INVE-0006', 'Nexus Data Integrity Review', 'Telemetry Stream Capture', 'Variance Threshold Testing'),
  ('INVE-0007', 'FDA Safety Review', 'Multi-point Thermocouple Readings', 'Cohort Survival Modeling'),
  ('INVE-0008', 'Atlas Structural Check', 'Multi-point Thermocouple Readings', 'Cross-Reference Validation');

INSERT INTO forensic_analysis (id, investigation_id, analyst_id) VALUES
  ('ANAL-0001', 'Financial Database Query Trace', 'Hardware Forensics Technician'),
  ('ANAL-0002', 'Malware Payload Reverse Engineering', 'Lead Forensic Analyst'),
  ('ANAL-0003', 'Cloud Bucket Access Audit', 'Hardware Forensics Technician'),
  ('ANAL-0004', 'CASE-2024-0412', 'Legal E-Discovery Specialist');

INSERT INTO tech_service (id, tech_service_id, provider_id, realized_in) VALUES
  ('PROV-0001', 'Contract Lifecycle Rollout', 'Relativity Edge', 'Realized In 01'),
  ('PROV-0002', 'Compliance Automation Pilot', 'Harvey AI Support', 'Realized In 02'),
  ('PROV-0003', 'Paralegal Workflow Digitization', 'Evisort Global', 'Realized In 03'),
  ('PROV-0004', 'RegTech Integration', 'Thomson Reuters Legal', 'Realized In 04'),
  ('PROV-0005', 'Court Filing Automation', 'Bryter Operations', 'Realized In 05'),
  ('PROV-0006', 'RegTech Integration', 'Diligent Corporation', 'Realized In 06'),
  ('PROV-0007', 'Matter Management Upgrade', 'Thomson Reuters Legal', 'Realized In 07');

INSERT INTO t_wavelength_variant (id, wavelength_variant, `930nm_variant`, `940nm_variant`) VALUES
  ('VARI-0001', 'Lumina-930C', '930Nm Variant 01', '940Nm Variant 01'),
  ('VARI-0002', 'Vector-940H', '930Nm Variant 02', '940Nm Variant 02'),
  ('VARI-0003', 'Photon-930G', '930Nm Variant 03', '940Nm Variant 03'),
  ('VARI-0004', 'Flux-930I', '930Nm Variant 04', '940Nm Variant 04'),
  ('VARI-0005', 'Helios-930E', '930Nm Variant 05', '940Nm Variant 05'),
  ('VARI-0006', 'Apex-940B', '930Nm Variant 06', '940Nm Variant 06'),
  ('VARI-0007', 'OptiWave-940', '930Nm Variant 07', '940Nm Variant 07');

INSERT INTO auth_rep_role (id, rep_role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'AuthorizedSigner', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'PortfolioManager', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'EscrowAgent', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'CorporateSecretary', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'ProxyVoter', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'EscrowAgent', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'AuthorizedSigner', 'Borne By 07', 'Realized In 07');

INSERT INTO advice_sessions (id, advice_id, product_id, client_id) VALUES
  ('SERV-0001', 'Superannuation_Retirement_Plan', 'Health Insurance Premium', 'Individual_Account_Prime'),
  ('SERV-0002', 'ESG_Investment_Strategy', 'Variable_Life_Insurance', 'C. Lee Trust'),
  ('SERV-0003', 'Retirement Income Review', 'Cryptocurrency_Futures_Fund', 'A. Chen Family Trust'),
  ('SERV-0004', 'Superannuation_Retirement_Plan', 'Government Bond Series', 'Small_Business_Entity'),
  ('SERV-0005', 'Estate_Planning_Consultation', 'Robo_Advisor_Allocation', 'Retiree_Demographic_Group');

INSERT INTO disclosure_docs (id, disclosure_id, fund_id, doc_format, title) VALUES
  ('STAT-0001', 'High Yield Municipal Bond', 'Schwab US Dividend Equity', 'unicode', 'Title 01'),
  ('STAT-0002', 'Conservative Income Portfolio', 'Fidelity Contrafund', 'utf8', 'Title 02'),
  ('STAT-0003', 'Balanced Retirement Strategy', 'T. Rowe Price Blue Chip', 'latin1', 'Title 03'),
  ('STAT-0004', 'Emerging Markets Debt Fund', 'PIMCO Total Return', 'ascii', 'Title 04'),
  ('STAT-0005', 'High Yield Municipal Bond', 'PIMCO Total Return', 'utf8', 'Title 05'),
  ('STAT-0006', 'Conservative Income Portfolio', 'JPMorgan Emerging Markets', 'ascii', 'Title 06'),
  ('STAT-0007', 'Emerging Markets Debt Fund', 'BlackRock Global Allocation', 'latin1', 'Title 07');

INSERT INTO dev_rep_role (id, dev_rep_role_id, agent_id, realized_in) VALUES
  ('ROLE-0001', 'Quality Assurance Rep', 'AGT-3N9P', 'Realized In 01'),
  ('ROLE-0002', 'Code Review Lead', 'Core Platform Team', 'Realized In 02'),
  ('ROLE-0003', 'Technical Lead', 'AGT-2D8C', 'Realized In 03'),
  ('ROLE-0004', 'Release Authorization Lead', 'AGT-0J7M', 'Realized In 04'),
  ('ROLE-0005', 'Quality Engineering Coordinator', 'Lin Wei', 'Realized In 05');

INSERT INTO final_inspection (id, inspection_id, asset_id, requirement_id) VALUES
  ('PROC-0001', 'Substation Final Review', 'Main 24-inch Water Main', 'FEMA Flood Zone B3'),
  ('PROC-0002', 'Downtown Grid Commissioning', 'Main 24-inch Water Main', 'NFPA 70 Article 230'),
  ('PROC-0003', 'Downtown Grid Commissioning', 'Valve Manifold Station', 'ISO 9001 Clause 8.6'),
  ('PROC-0004', 'Metro Line 4 Commissioning', 'Emergency Power Feed', 'FEMA Flood Zone B3'),
  ('PROC-0005', 'North District Fiber Audit', 'Substation Transformer Bank', 'NFPA 70 Article 230');

INSERT INTO checklist_stage (id, checklist_id, item_ref, char_set, checklist_name) VALUES
  ('CHEC-0001', 'Cryogenic Tank Pressurization', 'Harness insulation resistance test', 'latin1', 'Checklist Name 01'),
  ('CHEC-0002', 'Structural Fastener Torque', 'Cable harness routing verification', 'ascii', 'Checklist Name 02'),
  ('CHEC-0003', 'Flight Software Load', 'Connector pin alignment check', 'ascii', 'Checklist Name 03'),
  ('CHEC-0004', 'Ground Support Interface', 'Harness insulation resistance test', 'utf8', 'Checklist Name 04'),
  ('CHEC-0005', 'Pre-Integration Verification', 'Grounding strap continuity test', 'ascii', 'Checklist Name 05');

INSERT INTO role_assignment (id, role_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'MassSpec-QExactive', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'Laser-Interfer', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'MassSpec-QExactive', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'MRI-7T-Scanner', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'CryoEM-Talos', 'Inheres In 05', 'Realized In 05'),
  ('ROLE-0006', 'NMR-600MHz', 'Inheres In 06', 'Realized In 06'),
  ('ROLE-0007', 'SEM-TitanKrios', 'Inheres In 07', 'Realized In 07'),
  ('ROLE-0008', 'SEM-TitanKrios', 'Inheres In 08', 'Realized In 08');

INSERT INTO supplier_assessment (id, survey_id, vendor_id, trend_id, char_encoding, lang_code) VALUES
  ('SURV-0001', 'Apex Composites', 'Horizon Freight', 'E-commerce Fulfillment Growth', 'ascii', '3990174'),
  ('SURV-0002', 'Global Logistics Inc', 'pharmaceutical_contractors', 'Raw Material Inflation', 'unicode', '224'),
  ('SURV-0003', 'Sterling Alloys', 'Quantum Batteries', 'Green Certification Mandates', 'unicode', '6564384'),
  ('SURV-0004', 'Global Logistics Inc', 'Terra Minerals', 'Semiconductor Shortage', 'utf8', '6926373'),
  ('SURV-0005', 'Vanguard Metals', 'Apex Robotics', 'autonomous_truck_deployment', 'ascii', '168558');

INSERT INTO permit_oversight (id, oversight_id, permit_decision_id, installation_id) VALUES
  ('ACTI-0001', 'Chemical Storage Audit', 'NPDES Outfall Authorization', 'Pharmaceutical Lab Annex'),
  ('ACTI-0002', 'Midyear Site Audit', 'Effluent Limit Approval', 'Ammonia Synthesis Complex'),
  ('ACTI-0003', 'Annual Permit Verification', 'VOC Emission Waiver', 'Polymer Processing Plant'),
  ('ACTI-0004', 'Chemical Storage Audit', 'Stormwater Discharge Permit', 'Heavy Oil Terminal'),
  ('ACTI-0005', 'Air Quality Compliance Check', 'Soil Remediation Order', 'Chlorine Generation Unit'),
  ('ACTI-0006', 'Chemical Storage Audit', 'Stormwater Discharge Permit', 'Heavy Oil Terminal');

INSERT INTO fin_plan (id, plan_id, org_unit_id, strategy_id) VALUES
  ('PROC-0001', 'Working_Capital_Optimization', 'Liquidity management unit', 'Revenue_Growth_Strategy'),
  ('PROC-0002', 'Pension_Fund_Rebalancing', 'Audit_Committee', 'ESG_Compliance_Mandate'),
  ('PROC-0003', 'Series B funding round', 'FP_Analysis_Team', 'Asset Revaluation Schedule'),
  ('PROC-0004', 'Merger_Finance_Alignment', 'External_Auditors', 'Shareholder_Return_Maximization');

INSERT INTO leadership_reqs (id, min_years, created_at, value) VALUES
  ('REQU-0001', '4.5', '2024-10-12T19:07:36', '76.95'),
  ('REQU-0002', '12.5', '2024-03-28T01:53:19', '965.44'),
  ('REQU-0003', '9.5', '2024-10-19T03:31:57', '38.01'),
  ('REQU-0004', '5.0', '2023-03-08T12:08:00', '598.44');

INSERT INTO fin_report (id, report_id, financial_status_id, financial_strategy_id, content_format, title) VALUES
  ('ARTI-0001', 'Q3 Fiscal Reconciliation', 'Revenue Decline', 'Equity Divestment Path', 'unicode', 'Title 01'),
  ('ARTI-0002', 'Solstice Cash Flow', 'Operating Margin Trajectory', 'Tax Efficiency Protocol', 'unicode', 'Title 02'),
  ('ARTI-0003', 'Solstice Cash Flow', 'Solvency Margin Threshold', 'Equity Divestment Path', 'unicode', 'Title 03'),
  ('ARTI-0004', 'Q2 Segment Breakdown', 'Quarterly Earnings Baseline', 'Divestiture Roadmap', 'latin1', 'Title 04'),
  ('ARTI-0005', 'Vanguard Tax Deduction', 'Solvency Threshold', 'Divestiture Roadmap', 'latin1', 'Title 05'),
  ('ARTI-0006', 'Treasury Liquidity Report', 'Revenue Decline', 'Debt Refinancing Initiative', 'ascii', 'Title 06'),
  ('ARTI-0007', 'Q2 Segment Breakdown', 'Working Capital Position', 'Treasury Hedging Policy', 'ascii', 'Title 07'),
  ('ARTI-0008', 'Vanguard Tax Deduction', 'Solvency Threshold', 'Portfolio Rebalancing Strategy', 'unicode', 'Title 08');

INSERT INTO exec_dir_role (id, exec_role_id) VALUES
  ('ROLE-0001', 'Head of Data Governance'),
  ('ROLE-0002', 'Managing Partner'),
  ('ROLE-0003', 'Chief Telemetry Director'),
  ('ROLE-0004', 'VP of Product Strategy'),
  ('ROLE-0005', 'Managing Partner'),
  ('ROLE-0006', 'Director of Operations'),
  ('ROLE-0007', 'Executive Director of Research'),
  ('ROLE-0008', 'Lead Process Governance Officer');

INSERT INTO venue_audit (id, venue_audit_id, facility_id, protocol_id) VALUES
  ('OVER-0001', 'Meridian Conference Center', 'Fire Suppression Network', 'Bag Check Procedure'),
  ('OVER-0002', 'Wembley Stadium', 'Access Control Gate', 'Waste Disposal Logging'),
  ('OVER-0003', 'Wembley Stadium', 'Fiber Optic Backbone Core', 'Electrical Load Testing'),
  ('OVER-0004', 'Oakhaven Logistics Depot', 'Central Water Treatment Plant', 'Backup Power Transfer'),
  ('OVER-0005', 'Riverton Event Arena', 'Industrial Cooling Tower 2', 'Crowd Evacuation Plan'),
  ('OVER-0006', 'Summit Medical Center', 'Water Treatment Plant', 'Waste Disposal Logging');

INSERT INTO mgr_roles (id, mgr_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'DATA_PIPELINE_OWNER', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'FACILITY_CHIEF_ENGINEER', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'Emergency Response Coordinator', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'Plant Operations Manager', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'ANALYTICS_STEWARD_PRIME', 'Inheres In 05', 'Realized In 05');

INSERT INTO weight_mgmt_exec (id, exec_id, patient_id, advice_flag) VALUES
  ('EXEC-0001', 'BATCH-INSULIN-3312', 'MRN-6604', 'PROTO-KETO-7'),
  ('EXEC-0002', 'EXEC-DEFICIT-6604', 'ID-9934', 'PLAN-MED-9'),
  ('EXEC-0003', 'CLIN-TRACK-7731', 'MRN-8821', 'RDN-0024'),
  ('EXEC-0004', 'PROC-NUTR-4491', 'PAT-2210', 'MOD-CAL-5'),
  ('EXEC-0005', 'CLIN-TRACK-7731', 'PT-0049', 'RDN-0024'),
  ('EXEC-0006', 'CLIN-TRACK-7731', 'ID-9934', 'PLAN-MED-9');

INSERT INTO clinical_monitor_sys (id, monitor_sys_id, protocol_ref, metric_ref) VALUES
  ('SYST-0001', 'ClinTrak', 'CAP Accreditation Standard', 'Patient Reported Outcome'),
  ('SYST-0002', 'Medidata Rave', 'DLT Monitoring Plan', 'Time to Therapeutic Threshold'),
  ('SYST-0003', 'OnCore', 'STARD 2015 Guidelines', 'Subject Enrollment Velocity'),
  ('SYST-0004', 'Solace BioMonitor Array', 'Lab QC Protocol', 'Subject Enrollment Velocity'),
  ('SYST-0005', 'Oakridge Telemetry Hub', 'Vital Signs Tracking SOP', 'Recovery Time Baseline'),
  ('SYST-0006', 'Aethelgard Efficacy Node', 'Vital Signs Tracking SOP', 'Data Quality Index'),
  ('SYST-0007', 'Stratum Clinical Mesh', 'DLT Monitoring Plan', 'Integration Throughput'),
  ('SYST-0008', 'Kestrel Efficacy Cluster', 'Efficacy Endpoint Registry', 'Audit Trail Coverage');

INSERT INTO patient_feedback (id, feedback_id, quality_notes, service_context, feedback_title, lang_code) VALUES
  ('RECO-0001', 'MRS-ELARA-VANCE', 'Discharge-Clarity-Survey', 'Maternity-Labor-Delivery', 'Feedback Title 01', 'id_1'),
  ('RECO-0002', 'T-MARTIN-55', 'Wait-Time-Evaluation', 'Telehealth-Neurology-Consult', 'Feedback Title 02', '2106711'),
  ('RECO-0003', 'T-MARTIN-55', 'NABH-Accreditation-Check', 'Oncology-Chemotherapy-Infusion', 'Feedback Title 03', 'L313'),
  ('RECO-0004', 'K-REYES-99', 'NABH-Accreditation-Check', 'ER-Triage-Wait', 'Feedback Title 04', '1996914'),
  ('RECO-0005', 'T-MARTIN-55', 'Clinical-Excellence-Rating', 'Outpatient-Cardiology-Visit', 'Feedback Title 05', '4447034'),
  ('RECO-0006', 'A-CHEN-02', 'HCAHPS-Survey-Q4', 'Physical-Therapy-Rehab-Session', 'Feedback Title 06', 'account_pymes_691'),
  ('RECO-0007', 'JSMITH-7742', 'NABH-Accreditation-Check', 'Urgent-Care-Fever-Case', 'Feedback Title 07', '5917286');

INSERT INTO ambassador_assignments (id, ambassador_role_id, physician_id, realized_in) VALUES
  ('ROLE-0001', 'Health Policy Fellow', 'DR-CB-1105', 'Realized In 01'),
  ('ROLE-0002', 'Junior Clinical Director', 'DR-SR-2291', 'Realized In 02'),
  ('ROLE-0003', 'Student Physician Advocate', 'DR-MW-7730', 'Realized In 03'),
  ('ROLE-0004', 'Junior Care Ambassador', 'DR-CB-1105', 'Realized In 04'),
  ('ROLE-0005', 'Resident Health Envoy', 'DR-LN-5519', 'Realized In 05'),
  ('ROLE-0006', 'Junior Care Ambassador', 'DR-SA-2204', 'Realized In 06'),
  ('ROLE-0007', 'Junior Clinical Director', 'DR-MT-3341', 'Realized In 07'),
  ('ROLE-0008', 'Clinical Outreach Coordinator', 'DR-SR-2291', 'Realized In 08');

INSERT INTO young_phys_elig (id, elig_rule_id) VALUES
  ('CONS-0001', 'JUNIOR_ATTENDING_SECOND'),
  ('CONS-0002', 'RESIDENCY_WAIVER_ALPHA'),
  ('CONS-0003', 'FELLOW_INCENTIVE_PREMIUM'),
  ('CONS-0004', 'FELLOWSHIP_RAMP_UP_PRIMARY'),
  ('CONS-0005', 'RESIDENCY_WAIVER_ALPHA');

INSERT INTO cme_session (id, session_id, topic_id, goal_id) VALUES
  ('SEMI-0001', 'Oncology Clinical Review', 'Telehealth Deployment', 'Develop Leadership Skills'),
  ('SEMI-0002', 'Opioid Safety Summit', 'Electronic Health Record Integration', 'Clinical Skill Enhancement'),
  ('SEMI-0003', 'Annual Cardiology Update', 'Malpractice Risk Reduction', 'Update Pharmacology Knowledge'),
  ('SEMI-0004', 'Lab QA Workshop', 'Malpractice Risk Reduction', 'Enhance Diagnostic Accuracy'),
  ('SEMI-0005', 'Infection Control Update', 'Staff Scheduling Optimization', 'Optimize Clinical Workflow'),
  ('SEMI-0006', 'Emergency Medicine Advances', 'Scheduling Efficiency', 'Continuing Education Credits');

INSERT INTO crisis_event (id, crisis_id, macro_trigger, phase_code, systemic_flag) VALUES
  ('EVEN-0001', 'Lehman Contagion Wave', 'Liquidity Freeze', 'Pre-Crisis Expansion', 'Market Circuit Breaker Trigger'),
  ('EVEN-0002', 'Japanese Asset Collapse', 'Currency Peg Breaks', 'Liquidity Contraction', 'Currency Devaluation Event'),
  ('EVEN-0003', 'CRE Market Wipeout', 'Liquidity Freeze', 'Pre-Crisis Expansion', 'Exchange Trading Suspension'),
  ('EVEN-0004', 'Black Monday Flash Crash', 'Housing Market Collapse', 'Post-Crash Recovery', 'Currency Devaluation Event'),
  ('EVEN-0005', '2008 Global Liquidity Shock', 'Excessive Leverage', 'Market Panic Period', 'Interbank Payment Halt'),
  ('EVEN-0006', 'Japanese Asset Collapse', 'Currency Peg Breaks', 'Deflationary Spiral', 'Exchange Trading Suspension');

INSERT INTO tag_event (id, event_id, target_id, tag_id) VALUES
  ('PROC-0001', 'Flickr photo tagging session', 'question_3918274', 'issue_bug_critical'),
  ('PROC-0002', 'Reddit post labeling campaign', 'tumblr_post_2849103', 'keyword_quantum_computing'),
  ('PROC-0003', 'StackOverflow question tagging wave', 'doi_10_1234_abstract', 'tag_python_pandas'),
  ('PROC-0004', 'Tumblr tag migration event', 'question_3918274', 'hashtag_climate_action'),
  ('PROC-0005', 'StackOverflow question tagging wave', 'bookmark_http_example', 'keyword_quantum_computing');

INSERT INTO expedition (id, expedition_id, crew_id, equipment_id, region_id) VALUES
  ('EXPE-0001', 'Mission CryoDrift Alpha', 'Ice Core Analysts', 'Meteorological Buoy', 'Kaelen Fjord Basin'),
  ('EXPE-0002', 'Nansen Ice Drift', 'Expedition Commander', 'Multi-Parameter Probe', 'Beaufort Sea'),
  ('EXPE-0003', 'Bering Strait Survey', 'Base Camp Engineer', 'Icebreaker Yamal', 'Beaufort Sea'),
  ('EXPE-0004', 'Survey Meridian Grid', 'Survival Logistics Coordinator', 'Thermal Imaging Array', 'Fram Strait'),
  ('EXPE-0005', 'Sverdrup Greenland', 'Survival Logistics Coordinator', 'Autonomous Drone X7', 'Laptev Sea'),
  ('EXPE-0006', 'Fram Expedition', 'Polar Biologists', 'Katabatic Weather Station', 'Nordmark Tundra Plateau');

INSERT INTO var_margin_rules (id, vm_rule_id, collateral_process_id, compliance_audit_id, mandatory, review_interval_days) VALUES
  ('SET-0001', 'EnergyGasVM', 'CrossBorderCollateral', 'ISAE3402Audit', 'true', '191'),
  ('SET-0002', 'FixedIncomeVM', 'CCP_CollateralFlow', 'FCA_PrudentialAudit', 'false', '95'),
  ('SET-0003', 'EnergyGasVM', 'ISO20022_Collateral', 'OCC_SupervisoryReview', 'false', '201'),
  ('SET-0004', 'EquitySingleStockVM', 'RealTimeSettlementFlow', 'MiCA_ComplianceCheck', 'false', '12'),
  ('SET-0005', 'CommodityPowerVM', 'SFTR_CollateralProtocol', 'ISAE3402Audit', 'false', '686'),
  ('SET-0006', 'EquitySingleStockVM', 'AutomatedRebalancing', 'MAS_ComplianceAudit', 'false', '510'),
  ('SET-0007', 'FixedIncomeVM', 'FMI_CollateralNetting', 'DORA_TechnicalAudit', 'false', '985');

INSERT INTO reg_role (id, role_code, rel_0000054) VALUES
  ('ROLE-0001', 'CE Mark Registration', 'Rel 0000054 01'),
  ('ROLE-0002', 'FDA 510k Clearance', 'Rel 0000054 02'),
  ('ROLE-0003', 'EU MDR Declaration', 'Rel 0000054 03'),
  ('ROLE-0004', 'CE Mark Registration', 'Rel 0000054 04');

INSERT INTO grp_surcharge_rule (id, grp_surcharge_id, dimension_kind, uncertainty) VALUES
  ('RULE-0001', 'MicroBatchFee', 'length', '127.15'),
  ('RULE-0002', 'LabCohortRate', 'count', '384.18'),
  ('RULE-0003', 'MicroBatchFee', 'mass', '630.73'),
  ('RULE-0004', 'TransitGroupFee', 'mass', '476.77'),
  ('RULE-0005', 'PeakGroupCap', 'length', '650.53'),
  ('RULE-0006', 'LabCohortRate', 'count', '131.83'),
  ('RULE-0007', 'TransitGroupFee', 'time', '25.37');

INSERT INTO svc_rate_config (id, rate_pct, uncertainty, unit) VALUES
  ('RATE-0001', 'Data Pipeline', '443.85', 'ms'),
  ('RATE-0002', 'Backup Vault', '375.34', 'm/s'),
  ('RATE-0003', 'Backup Vault', '989.75', 'mg/L'),
  ('RATE-0004', 'Compute Cluster', '554.73', 'm/s'),
  ('RATE-0005', 'Backup Vault', '132.46', 'ms');

INSERT INTO emp_survey (id, survey_id, culture_dim_id, health_metric_id) VALUES
  ('SURV-0001', 'STF-3319', 'Psychological Safety', 'Resource adequacy rating'),
  ('SURV-0002', 'RCD-1183', 'innovation tolerance', 'Leadership trust score'),
  ('SURV-0003', 'DAT-0037', 'cross-functional collaboration', 'Work-life balance rating'),
  ('SURV-0004', 'RCD-1183', 'Psychological Safety', 'Psychological safety index'),
  ('SURV-0005', 'LOG-5548', 'accountability standards', 'training completion'),
  ('SURV-0006', 'USR-7704', 'Team Cohesion', 'Inclusion sentiment score');

INSERT INTO culture_dim (id, dim_id, target_attr, method, value) VALUES
  ('DIME-0001', 'Aegis Operations Center', 'diversity inclusion', 'hybrid', '161.30'),
  ('DIME-0002', 'Horizon Logistics Depot', 'Mentorship Depth', 'automated', '247.03'),
  ('DIME-0003', 'Aegis Operations Center', 'employee autonomy', 'automated', '7.65'),
  ('DIME-0004', 'Meridian Field Office', 'knowledge sharing', 'automated', '290.57');

INSERT INTO award_cert (id, award_id, awarding_org_id, compliance_std_id, valid_from, scope) VALUES
  ('AWAR-0001', 'Great Place to Work', 'Great Place Institute', 'CDC Safety', '2023-02-22', 'team'),
  ('AWAR-0002', 'Great Place to Work', 'Built In', 'NFPA 70E', '2023-02-09', 'team'),
  ('AWAR-0003', 'Fortune 100 Best', 'Great Place Institute', 'NIOSH Guidelines', '2024-11-02', 'regional'),
  ('AWAR-0004', 'Top Employer', 'Indeed Labs', 'OSHA 300 Log', '2024-06-13', 'regional'),
  ('AWAR-0005', 'Top Employer', 'SHRM', 'OSHA 300 Log', '2024-02-20', 'global'),
  ('AWAR-0006', 'Inc. Best Work', 'Glassdoor Inc', 'HIPAA Privacy', '2023-09-20', 'global');

INSERT INTO corp_membership (id, corp_mem_id) VALUES
  ('MEMB-0001', 'Pinnacle Energy'),
  ('MEMB-0002', 'Meridian Corp'),
  ('MEMB-0003', 'Vanguard Logistics Network'),
  ('MEMB-0004', 'Horizon Data Infrastructure'),
  ('MEMB-0005', 'Solstice Energy Partners'),
  ('MEMB-0006', 'Solstice Tech');

INSERT INTO healer_roles (id, healer_role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'dream interpretation elder', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'ancestral spirit medium', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'fire ceremony guide', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'Bone Doctor', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'Obeah Man', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'Medicine Man', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'Spirit Medium', 'Borne By 07', 'Realized In 07');

INSERT INTO ritual_event (id, rite_id, sacred_item_id, target_state) VALUES
  ('ORDE-0001', 'Ancestral Binding Pact', 'Bronze Incense Burner', 'Conflict De-escalation Phase'),
  ('ORDE-0002', 'Bridge Crossing Rite', 'Obsidian Sacrificial Blade', 'Boundary Line Stabilization'),
  ('ORDE-0003', 'Hearth Fire Renewal', 'Embroidered Linen Banner', 'Boundary Line Stabilization'),
  ('ORDE-0004', 'Solstice Reconciliation', 'Bronze Incense Burner', 'Shared Water Rights Agreement'),
  ('ORDE-0005', 'Ancestral Binding Pact', 'Glass Oil Lamp', 'Village Cohesion Index'),
  ('ORDE-0006', 'Bridge Crossing Rite', 'Bronze Incense Burner', 'Mutual Recognition Protocol'),
  ('ORDE-0007', 'Solstice Reconciliation', 'Iron Key Fragment', 'Cultural Continuity Restoration');

INSERT INTO ceremony (id, ceremony_id, participant_id) VALUES
  ('CERE-0001', 'GoryoEshiCeremony', 'RitualChanterKim'),
  ('CERE-0002', 'QingMingRite2024', 'BlessingDistributor'),
  ('CERE-0003', 'SinhalaPoyaMemorial', 'AltarPreparer'),
  ('CERE-0004', 'QingMingRite2024', 'AltarPreparer'),
  ('CERE-0005', 'WuiSaiBakJit2023', 'IncenseBearerLee'),
  ('CERE-0006', 'DuanwuAncestorRitual', 'BlessingDistributor'),
  ('CERE-0007', 'WuiSaiBakJit2023', 'CeremonialChef'),
  ('CERE-0008', 'ChuseokAncestralRitual', 'BlessingDistributor');

INSERT INTO adult_parent_role (id, parent_role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'SUPPORT-UNIT-447', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'SUPPORT-UNIT-447', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'SUPPORT-UNIT-447', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'DIS-ADULT-339', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'HOME-ROLE-995', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'FAM-CARE-553', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'DIS-ADULT-339', 'Borne By 07', 'Realized In 07'),
  ('ROLE-0008', 'SUPPORT-UNIT-447', 'Borne By 08', 'Realized In 08');

INSERT INTO pool_staff_roles (id, staff_role_id, staff_id, realized_in) VALUES
  ('MANA-0001', 'David Okoro', 'John Miller', 'Realized In 01'),
  ('MANA-0002', 'David Okoro', 'Rachel Green', 'Realized In 02'),
  ('MANA-0003', 'Municipal Aquatics Lead', '3319-M', 'Realized In 03'),
  ('MANA-0004', 'Facility Operations Asst', 'Lisa Park', 'Realized In 04'),
  ('MANA-0005', 'Municipal Pool Supervisor', 'Mercer L.', 'Realized In 05'),
  ('MANA-0006', 'Aquatics Deputy Lead', '3319-M', 'Realized In 06'),
  ('MANA-0007', 'Pool Safety Coordinator', 'Kevin O''Brien', 'Realized In 07'),
  ('MANA-0008', 'Marcus Johnson', '7721-P', 'Realized In 08');

INSERT INTO pool_shift (id, shift_id, lifeguard_id, pool_id) VALUES
  ('ACTI-0001', 'Post-Storm Drain Clearing', 'Water Safety Officer Kim', 'Riverside Outdoor Complex'),
  ('ACTI-0002', 'Daily Depth Check', 'Dive Instructor Vance', 'Pinecrest Family Center'),
  ('ACTI-0003', 'Heat Wave Protocol Activation', 'Water Safety Officer Kim', 'Westend Leisure Center'),
  ('ACTI-0004', 'Deck Inspection Schedule', 'Dive Instructor Vance', 'Southgate Community Pool'),
  ('ACTI-0005', 'Staff Scheduling Sync', 'Shift Lead Carter', 'Westend Leisure Center'),
  ('ACTI-0006', 'Heat Wave Protocol Activation', 'Shift Lead Carter', 'Riverside Outdoor Complex'),
  ('ACTI-0007', 'Staff Scheduling Sync', 'Head Guard Miller', 'Southgate Community Pool'),
  ('ACTI-0008', 'Staff Scheduling Sync', 'Junior Attendant Ross', 'Central District Natatorium');

INSERT INTO water_qual_runs (id, monitor_run_id, ref_standard, target_param) VALUES
  ('ACTI-0001', 'Puget Seagrass Network', 'DOH Recreational Criteria', 'pH Concentration'),
  ('ACTI-0002', 'Great Lakes Eutrophication', 'DOH Recreational Criteria', 'Alkalinity ppm'),
  ('ACTI-0003', 'Tahoe Clarity Assessment', 'DOH Recreational Criteria', 'Temperature Celsius'),
  ('ACTI-0004', 'Great Lakes Eutrophication', 'CDC Pool Protocol', 'Turbidity NTU'),
  ('ACTI-0005', 'Great Lakes Eutrophication', 'ASTM D516', 'Dissolved Oxygen mgL'),
  ('ACTI-0006', 'Delaware Pathogen Screening', 'DOH Recreational Criteria', 'Total Coliform Count'),
  ('ACTI-0007', 'Delaware Pathogen Screening', 'DOH Recreational Criteria', 'Total Coliform Count');

INSERT INTO temp_op_limits (id, limit_id, method, recorded_at) VALUES
  ('CONS-0001', 'Cryogenic Pump Thermal Envelope', 'hybrid', '2023-02-25T10:11:16'),
  ('CONS-0002', 'Chemical Reactor Exotherm Cap', 'manual', '2023-12-21T13:00:13'),
  ('CONS-0003', 'Liquid Nitrogen Storage Limit', 'inferred', '2024-04-08T23:40:26'),
  ('CONS-0004', 'High-Pressure Vessel Max Temp', 'automated', '2025-03-18T00:25:55');

INSERT INTO attendance_log (id, attendance_id, student_id, status_code) VALUES
  ('PROC-0001', 'PortalCheckinLive', 'Mentor552', 'BehavioralFlag'),
  ('PROC-0002', 'FieldTripRoster', 'GuestSpeaker42', 'WeeklyComplianceReport'),
  ('PROC-0003', 'LectureHallBScan', 'DeanOfStudents', 'FullAttendanceBadge'),
  ('PROC-0004', 'PhysicsWeeklyHeadcount', 'AlumniObserver11', 'VerificationReceipt'),
  ('PROC-0005', 'FallSemesterRoll', 'LabAssistant09', 'WeeklyComplianceReport'),
  ('PROC-0006', 'PortalCheckinLive', 'TA_WangLin', 'PartialCreditVoucher');

INSERT INTO course_catalog (id, course_id, assessment_ref, learner_id, format_code, lang_code) VALUES
  ('COUR-0001', 'Digital Logic Design', 'Proficiency Band Alignment', 'James Vance', 'ascii', '693fde70-8fcc-11eb-924d-9cd76263cbd0'),
  ('COUR-0002', 'Linear Algebra', 'Credential Benchmark Index', 'David Rodriguez', 'unicode', '4277026'),
  ('COUR-0003', 'Environmental Science', 'State Science Standard', 'Undergraduate Scholar', 'utf8', '6564399'),
  ('COUR-0004', 'Digital Logic Design', 'Cambridge Biology', 'Certificate Track Learner', 'ascii', 'gd_acc_260002'),
  ('COUR-0005', 'Intro to Python', 'Cambridge Biology', 'Visiting Academic Fellow', 'unicode', '884356'),
  ('COUR-0006', 'Intro to Python', 'Next Gen History', 'Postdoctoral Candidate', 'unicode', '1186102'),
  ('COUR-0007', 'Microeconomics Fundamentals', 'Skill Validation Rubric', 'Postdoctoral Candidate', 'latin1', 'ar_001'),
  ('COUR-0008', 'Environmental Science', 'State Science Standard', 'David Rodriguez', 'latin1', '2087731');

INSERT INTO assessment_std (id, std_id, method_id, confidence, value) VALUES
  ('STAN-0001', 'Cryogenic Seal Verification', 'Performance Benchmark Suite', '0.726', '83.57'),
  ('STAN-0002', 'COBIT 5 Control Review', 'Sensor Calibration Matrix', '0.101', '108.01'),
  ('STAN-0003', 'COBIT 5 Control Review', 'Performance Benchmark Suite', '0.888', '527.63'),
  ('STAN-0004', 'COBIT 5 Control Review', 'Mass Spectrometry Run', '0.211', '250.30');

INSERT INTO analysis_case (id, case_id, threat_ref, assigned_officer) VALUES
  ('PROC-0001', 'SIGINT fusion', 'Red team report', 'Digital evidence technician'),
  ('PROC-0002', 'OSINT scraping', 'Geopolitical briefing', 'Counterterrorism analyst'),
  ('PROC-0003', 'MASINT calibration', 'Hostile drone telemetry', 'Homicide investigator'),
  ('PROC-0004', 'COMINT intercept', 'Phishing campaign logs', 'Digital evidence technician'),
  ('PROC-0005', 'NATINT collation', 'Sanctions list update', 'SWAT commander'),
  ('PROC-0006', 'MASINT calibration', 'Sanctions list update', 'Patrol officer'),
  ('PROC-0007', 'COMINT intercept', 'Illicit financial flow', 'Lead detective'),
  ('PROC-0008', 'COMINT intercept', 'Red team report', 'Homicide investigator');

INSERT INTO staff_position (id, role_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'Adjunct Professor', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'Graduate Mentor', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'Research Fellow', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'Associate Professor', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'Senior Academic', 'Inheres In 05', 'Realized In 05'),
  ('ROLE-0006', 'Senior Lecturer', 'Inheres In 06', 'Realized In 06'),
  ('ROLE-0007', 'Research Fellow', 'Inheres In 07', 'Realized In 07'),
  ('ROLE-0008', 'Tenured Lecturer', 'Inheres In 08', 'Realized In 08');

INSERT INTO admin_role_assign (id, role_code, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'Priya Patel', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'STU-1143', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'Liam Foster', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'STU-0094', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'STU-9927', 'Inheres In 05', 'Realized In 05');

INSERT INTO exec_role (id, exec_role_id, exec_function_id) VALUES
  ('ROLE-0001', 'President', 'Human Capital Management'),
  ('ROLE-0002', 'Chief Executive', 'Quality Control Standard'),
  ('ROLE-0003', 'President', 'Provenance Audit Trail'),
  ('ROLE-0004', 'COO', 'Data Retention Schedule'),
  ('ROLE-0005', 'Managing Director', 'Technology Strategy'),
  ('ROLE-0006', 'Director of Strategy', 'Execution Function Alpha');

INSERT INTO audit_roles (id, audit_role_id) VALUES
  ('ROLE-0001', 'Americas Governance Panel'),
  ('ROLE-0002', 'Compliance Review Group'),
  ('ROLE-0003', 'Statutory Audit Panel'),
  ('ROLE-0004', 'Americas Governance Panel');

INSERT INTO mgmt_meeting (id, meeting_id, attendee_id, decision_id) VALUES
  ('PROC-0001', 'Executive Budget Review', 'Engineering Principal', 'Res_Audit_Mercer'),
  ('PROC-0002', 'Supply Chain Coordination', 'Agent_C_Thorne', 'Risk Mitigation Protocol'),
  ('PROC-0003', 'Supply Chain Coordination', 'Sales Executive', 'Risk Mitigation Protocol'),
  ('PROC-0004', 'Leadership Onboarding Cycle', 'Sec_P_Castro', 'Aud_Cert_Mukhtar');

INSERT INTO audit_div (id, audit_div_id, cert_auditor_id, division_role) VALUES
  ('DIVI-0001', 'Global Audit Operations', 'CIA-3318', 'FinancialReconciliation'),
  ('DIVI-0002', 'OperationalAuditBranch', 'LeadIA-77B', 'Remediation Tracking'),
  ('DIVI-0003', 'OperationalAuditBranch', 'CIA-5509', 'Fraud Detection'),
  ('DIVI-0004', 'Audit Management Center', 'CertOps-88C', 'Remediation Tracking'),
  ('DIVI-0005', 'Operational Integrity Team', 'CertOps-88C', 'DataIntegrityAudit');

INSERT INTO fine_events (id, event_id, owner_id, violation_id, charset, description) VALUES
  ('EVEN-0001', 'Fine-Order-994', 'Cedar-Commercial-Group', 'Code-88-B', 'ascii', 'Description 01'),
  ('EVEN-0002', 'Penalty-Record-773', 'Apex-Properties', 'Zoning-Section-4.2', 'unicode', 'Description 02'),
  ('EVEN-0003', 'Compliance-Notice-225', 'North-Regional-Utility', 'Zoning-Section-4.2', 'utf8', 'Description 03'),
  ('EVEN-0004', 'Fine-Order-994', 'Harbor-Port-Authority', 'Permit-Expiry-2023', 'unicode', 'Description 04'),
  ('EVEN-0005', 'Notice-4402', 'Ironwood-Management', 'Environmental-Breach-12', 'utf8', 'Description 05');

INSERT INTO insp_reports (id, report_id, event_id, format_code, doc_title) VALUES
  ('REPO-0001', 'Pipe Weld Verification', 'Thermal_Imaging_Pack.zip', 'unicode', 'Doc Title 01'),
  ('REPO-0002', 'Facility B Q3 Audit', 'Audit_Trail_Export.json', 'ascii', 'Doc Title 02'),
  ('REPO-0003', 'HVAC Maintenance Check', 'OSHA_Standard_1910', 'utf8', 'Doc Title 03'),
  ('REPO-0004', 'Data Center Walkthrough', 'Test_Result_Sheet_11B', 'latin1', 'Doc Title 04'),
  ('REPO-0005', 'Lab Protocol Review', 'Thermal_Imaging_Pack.zip', 'latin1', 'Doc Title 05'),
  ('REPO-0006', 'Facility B Q3 Audit', 'Compliance_Matrix_v4.2', 'utf8', 'Doc Title 06'),
  ('REPO-0007', 'Lab Protocol Review', 'Maintenance_WorkOrder_882', 'utf8', 'Doc Title 07');

INSERT INTO gov_role_2 (id, position_id, dept_id, function_id) VALUES
  ('ROLE-0001', 'Chief Clerk', 'State Ethics Commission', 'Staff Coordination'),
  ('ROLE-0002', 'Secretary Administrative Services', 'Corrections Division', 'Legislative Drafting'),
  ('ROLE-0003', 'Chief Secretary Regulatory Affairs', 'Council on Aging', 'Session Documentation'),
  ('ROLE-0004', 'Deputy Secretary Procurement', 'Administrative Support Office', 'Legislative Liaison'),
  ('ROLE-0005', 'Assistant Director', 'Legislative Affairs Office', 'Legislative Drafting'),
  ('ROLE-0006', 'Cabinet Secretary', 'Labor Standards Division', 'Session Documentation'),
  ('ROLE-0007', 'Division Director', 'Regional Transit Authority', 'Staff Coordination');

INSERT INTO evac_kit (id, evac_id, supply_id, deploy_type) VALUES
  ('KIT-0001', 'Wilderness First Aid Kit', 'Bandage Roll', 'Tornado Sheltering'),
  ('KIT-0002', 'Wildfire Evacuation Pack', 'Multi-tool Pliers', 'Wildfire Evacuation'),
  ('KIT-0003', 'Family Survival Kit', 'N95 Respirator', 'Medical Triage Support'),
  ('KIT-0004', 'CERT First Aid Kit', 'Mosquito Repellent', 'Tornado Sheltering'),
  ('KIT-0005', 'Hurricane Preparedness Box', 'Bandage Roll', 'Medical Triage Support'),
  ('KIT-0006', 'CERT First Aid Kit', 'Mosquito Repellent', 'Flood Rescue'),
  ('KIT-0007', 'Wilderness First Aid Kit', 'Whistle', 'Earthquake Response'),
  ('KIT-0008', 'Hurricane Preparedness Box', 'Glow Stick', 'Power Outage Backup');

INSERT INTO evacuation_notice (id, notice_id, hazard_id, authority_id, char_encoding, lang_code) VALUES
  ('INST-0001', 'Coastal Flood Warning Directive', 'Magnitude 6.8 Earthquake', 'City Public Safety Office', 'utf8', '1889764'),
  ('INST-0002', 'Coastal Flood Warning Directive', 'Wildfire Perimeter Expansion', 'State Homeland Security', 'utf8', 'eb56fb15-2499-4b47-b59d-8319ca5ad273'),
  ('INST-0003', 'Shelter-in-Place Order', 'Chemical Cloud Release', 'State Homeland Security', 'unicode', '8350035'),
  ('INST-0004', 'River Overflow Protocol', 'River Stage Exceedance', 'Municipal Fire Department', 'latin1', '884359'),
  ('INST-0005', 'Hurricane Path Alert', 'Nuclear Plant Coolant Loss', 'City Public Safety Office', 'latin1', 'ChIJYRd8uPtt5kcRunQjrWb4IKs'),
  ('INST-0006', 'Volcanic Ash Dispersal Order', 'River Stage Exceedance', 'State Homeland Security', 'ascii', '19526306'),
  ('INST-0007', 'Industrial Spill Evacuation', 'Toxic Gas Leak', 'Regional Transit Authority', 'latin1', '392479');

INSERT INTO research_activity (id, activity_id, geo_coords, researcher_id) VALUES
  ('ACTI-0001', 'Compliance Audit Cycle', 'Central Core Facility', 'PI Jennifer Walsh'),
  ('ACTI-0002', 'Q3 Grant Submission', 'Particle Lab 9', 'Adjunct Marcus Webb'),
  ('ACTI-0003', 'Milestone Assessment Report', 'Version-2.4.1', 'Postdoc Sarah Lin'),
  ('ACTI-0004', 'Phase II Protocol Registration', 'Oceanography Deck B', 'Postdoc Lena Rostova'),
  ('ACTI-0005', 'Grant Renewal Filing', 'Phase-III-Checkpoint', 'Research Coordinator Tom'),
  ('ACTI-0006', 'Q3 Grant Submission', 'West Campus Annex', 'Dr. Elias Vance'),
  ('ACTI-0007', 'Ethics Committee Submission', 'MilestoneRef-09', 'Fellow S. Al-Jaber');

INSERT INTO ddos_mitigation (id, mitigation_id, attack_id, protected_asset_id) VALUES
  ('PROC-0001', 'RateLimitOverride', 'CiscoDDoSDefend', 'on-prem-router-3'),
  ('PROC-0002', 'GeoBlockExecute', 'AzureDDoSProtection', 'vpn-tunnel-42'),
  ('PROC-0003', 'AnycastRedirection', 'AkamaiProlexic', 'vpn-tunnel-42'),
  ('PROC-0004', 'SandboxIsolation', 'CiscoDDoSDefend', 'on-prem-router-3'),
  ('PROC-0005', 'EdgeCacheFailover', 'IstioTrafficPolicy', 'vpn-tunnel-42');

INSERT INTO traffic_redirect (id, redirect_id, scrub_center_id, customer_net_id, participates_in) VALUES
  ('REDI-0001', 'Anomaly Reroute Exercise', 'AWS us-east-1 Scrubber', 'Spotify US-East VPC', 'Participates In 01'),
  ('REDI-0002', 'DDoS Mitigation Campaign', 'Quartz BGP Exchange', 'AS64512 FinCorp', 'Participates In 02'),
  ('REDI-0003', 'BGP Reroute Operation', 'AWS us-east-1 Scrubber', 'Zenith Routing Domain', 'Participates In 03'),
  ('REDI-0004', 'Project CleanSweep', 'Zenith Scrubbing Nexus', 'Spotify US-East VPC', 'Participates In 04'),
  ('REDI-0005', 'Route Optimization Run', 'Akamai Frankfurt DC', 'Prism Cloud Fabric', 'Participates In 05'),
  ('REDI-0006', 'Operation ShieldFall', 'Aegis Scrubbing Hub', 'Cobalt Edge Gateway', 'Participates In 06'),
  ('REDI-0007', 'Clean Pipe Activation', 'Meridian Filter Plant', 'Zenith Routing Domain', 'Participates In 07');

INSERT INTO biz_roles (id, biz_role_id, agent_id, realized_in) VALUES
  ('ROLE-0001', 'VentureLead', 'Ironclad Security Inc', 'Realized In 01'),
  ('ROLE-0002', 'StartupOperator', 'Crescent Capital Group', 'Realized In 02'),
  ('ROLE-0003', 'Jonas Bergström', 'Ironclad Security Inc', 'Realized In 03'),
  ('ROLE-0004', 'CommercialFounder', 'Meridian Logistics Inc', 'Realized In 04'),
  ('ROLE-0005', 'ChiefCommercialOperator', 'Sterling Ventures Inc', 'Realized In 05');

INSERT INTO biz_plans (id, plan_id, scenario_id, funding_id, plan_title, lang_code) VALUES
  ('PLAN-0001', 'Meridian Agriculture', 'Technology Migration Path', 'Mezzanine Financing', 'Plan Title 01', '1186098'),
  ('PLAN-0002', 'Kestrel Biotech', 'Technology Migration Path', 'Convertible Note Offering', 'Plan Title 02', '9568441'),
  ('PLAN-0003', 'Kestrel Biotech', 'Global Distribution Network', 'Corporate Venture Capital', 'Plan Title 03', 'a0002992-9bac-11eb-a8a2-19ed5c03f8d3'),
  ('PLAN-0004', 'Cobalt Mining Co', 'Cloud Migration Initiative', 'Series A Equity Round', 'Plan Title 04', 'b10c552a-8fcd-11eb-924d-9cd76263cbd0'),
  ('PLAN-0005', 'Meridian Health', 'Market Expansion Phase', 'Government Grant Program', 'Plan Title 05', 'm_I');

INSERT INTO venture_process (id, venture_id, output_id, demand_id) VALUES
  ('PROC-0001', 'Microbrewery Expansion', 'Clean Energy', 'Energy Transition'),
  ('PROC-0002', 'Fintech API Rollout', 'CustomSoftwareModule', 'IndustrialProcurement'),
  ('PROC-0003', 'Green Hydrogen Venture', 'HealthcareConsulting', 'On-demand Delivery'),
  ('PROC-0004', 'InnovationSprint', 'LogisticsNetwork', 'Remote Work Tools'),
  ('PROC-0005', 'Carbon Credit Marketplace', 'Carbon Offsets', 'GovernmentContracting');

INSERT INTO audit_plan (id, audit_plan_id, audit_goal_id, review_method_id, text_encoding, lang_iso) VALUES
  ('STRA-0001', 'Lab Safety Protocol', 'Control Environment Maturity', 'Traceability Matrix', 'unicode', 'Lang Iso 01'),
  ('STRA-0002', 'Procurement Cycle Check', 'Policy Adherence', 'Systematic Evidence Gathering', 'latin1', 'Lang Iso 02'),
  ('STRA-0003', 'Cloud Security Check', 'Security Posture', 'Traceability Matrix', 'utf8', 'Lang Iso 03'),
  ('STRA-0004', 'Annual IT Compliance', 'Data Integrity', 'Structured Sampling Protocol', 'unicode', 'Lang Iso 04'),
  ('STRA-0005', 'Data Privacy Alignment', 'Regulatory Compliance Alignment', 'Cross-Functional Review Cycle', 'ascii', 'Lang Iso 05'),
  ('STRA-0006', 'Access Control Review', 'Reporting Accuracy', 'Risk-Based Sampling', 'utf8', 'Lang Iso 06'),
  ('STRA-0007', 'Access Control Review', 'Asset Safeguarding', 'Control Self-Assessment', 'utf8', 'Lang Iso 07');

INSERT INTO board_chair_roles (id, chair_id, appointee_id, realized_in) VALUES
  ('ROLE-0001', 'Corporate Ethics Chair', 'Fatima N. Al-Rashid', 'Realized In 01'),
  ('ROLE-0002', 'Concurrent Director Post', 'Sarah J. Okonkwo', 'Realized In 02'),
  ('ROLE-0003', 'Dual Director Appointment', 'Thomas E. Wright', 'Realized In 03'),
  ('ROLE-0004', 'Co-Chair Strategic Seat', 'Lead Arbiter Juno Park', 'Realized In 04'),
  ('ROLE-0005', 'Energy Sector Board Co-Chair', 'Chair Elara Vance', 'Realized In 05');

INSERT INTO svc_registry (id, svc_id, capability_id, tech_stack) VALUES
  ('SERV-0001', 'PubMed Search Endpoint', 'SecureQueryExecution', 'WebSocketStream'),
  ('SERV-0002', 'WHO Disease Outbreak News', 'RealTimeTelemetryFetch', 'OpenAPI3Specification'),
  ('SERV-0003', 'USGS National Water System', 'HistoricalDataRetrieval', 'OAuth2BearerAuth'),
  ('SERV-0004', 'USGS National Water System', 'FileFormatConversion', 'OpenAPI3Specification'),
  ('SERV-0005', 'CDC Health Data Hub', 'UserAuthenticationService', 'OAuth2BearerAuth');

INSERT INTO secure_env (id, secure_env_id) VALUES
  ('ENVI-0001', '4447012'),
  ('ENVI-0002', '0d2dc636-46ee-43d4-b5d7-3473697452b9'),
  ('ENVI-0003', '9424912'),
  ('ENVI-0004', 'id_19'),
  ('ENVI-0005', '99574');

INSERT INTO svc_admit (id, svc_admit_id, call_req_id, admit_res_id) VALUES
  ('CONT-0001', 'Emergency-911-Alpha', 'RAN-Allocator', 'Throttle-Bandwidth'),
  ('CONT-0002', 'IoT-Telemetry-9', 'Session-Border-Controller', 'Deny-Full-Capacity'),
  ('CONT-0003', 'Circuit-Switch-11', 'Media-Gateway-Controller', 'Grant-Priority'),
  ('CONT-0004', 'Data-Packet-Burst', 'Traffic-Classifier', 'Queue-Wait-Next'),
  ('CONT-0005', 'IoT-Telemetry-9', 'Media-Gateway-Controller', 'Accept-Call');

INSERT INTO sla_definitions (id, sla_id, provider_id, qos_policy_id, display_name, locale) VALUES
  ('AGRE-0001', 'ManagedSDWANEdge', 'CenturyLinkBusiness', 'BandwidthGuaranteed1Gbps', 'Display Name 01', 'Locale 01'),
  ('AGRE-0002', 'IoTTelemetryStream', 'BTGroupNetwork', 'ThroughputMin500Mbps', 'Display Name 02', 'Locale 02'),
  ('AGRE-0003', 'Private5GCoreSlice', 'LumenTechOps', 'LatencyUnder50ms', 'Display Name 03', 'Locale 03'),
  ('AGRE-0004', 'CarrierGradeVoice', 'DeutscheTelekom', 'LatencyUnder50ms', 'Display Name 04', 'Locale 04'),
  ('AGRE-0005', 'ManagedSDWANEdge', 'AT&TGlobal', 'LatencyUnder50ms', 'Display Name 05', 'Locale 05');

INSERT INTO net_res_path_map (id, map_id, resource_id, path_id, dimension_kind, unit) VALUES
  ('MAPP-0001', 'MetroEdge-7', 'F5BigIP-Cluster', 'Path-VLAN-100', 'length', 'nm'),
  ('MAPP-0002', 'CloudVPC-East1', 'HPEProCurve-Switch', 'Link-DC-Pod12', 'time', 'count'),
  ('MAPP-0003', 'Rack-B2-TopSpine', 'JuniperMX240-Edge', 'Path-VLAN-100', 'time', 'deg_C'),
  ('MAPP-0004', 'Rack-B2-TopSpine', 'ArubaAP530-A', 'Link-MetroFiber-Loop', 'mass', 'count'),
  ('MAPP-0005', 'Pod-Alpha-Link', 'PaloAltoPA520-FW', 'Link-MetroFiber-Loop', 'length', 'ratio');

INSERT INTO adoption_petitioner (id, petitioner_id, person_id, realized_in) VALUES
  ('ROLE-0001', 'PET-ADOPT-8892', 'David Okoro', 'Realized In 01'),
  ('ROLE-0002', 'PET-ADOPT-7741', 'David Okoro', 'Realized In 02'),
  ('ROLE-0003', 'PET-ADOPT-8830', 'James Miller', 'Realized In 03'),
  ('ROLE-0004', 'Emancipation Record', 'David Okoro', 'Realized In 04'),
  ('ROLE-0005', 'PET-ADOPT-1105', 'Lena Kowalski', 'Realized In 05'),
  ('ROLE-0006', 'Legal Next Of Kin File', 'James Miller', 'Realized In 06'),
  ('ROLE-0007', 'PET-ADOPT-6683', 'David Okoro', 'Realized In 07');

INSERT INTO adoption_case (id, adoption_case_id) VALUES
  ('PROC-0001', 'Chancery 2021-66'),
  ('PROC-0002', 'Case 5590-L'),
  ('PROC-0003', 'PROC-ID-559A'),
  ('PROC-0004', 'ADOPT-PROC-882X'),
  ('PROC-0005', 'Docket 88B-2022'),
  ('PROC-0006', 'Ref A492-Adopt');

INSERT INTO adoption_app (id, app_id, case_id, charset, form_title) VALUES
  ('FORM-0001', 'APP-ADOPT-901', 'Proc-Adopt-Final-99', 'ascii', 'Form Title 01'),
  ('FORM-0002', 'ADF-2023-0841', 'AdultAdopt-Init-2024', 'latin1', 'Form Title 02'),
  ('FORM-0003', 'DOC-ADM-9912', 'AdultAdopt-2023-01', 'ascii', 'Form Title 03'),
  ('FORM-0004', 'ADF-2023-0841', 'AdultAdopt-2023-01', 'utf8', 'Form Title 04'),
  ('FORM-0005', 'ADOPT-APP-2024', 'AdultAdopt-2023-01', 'unicode', 'Form Title 05'),
  ('FORM-0006', 'CASE-REQ-334', 'AdultAdopt-Verification-77', 'ascii', 'Form Title 06');

INSERT INTO analytics_job (id, job_id, input_ref, output_ref) VALUES
  ('PROC-0001', 'Clinical Trial Matching', 'Patient Survey Responses', 'Diagnostic Probability Maps'),
  ('PROC-0002', 'Sepsis Onset Detection', 'Wearable Sensor Feeds', 'Risk Stratification Scores'),
  ('PROC-0003', 'Imaging Modality Optimization', 'Laboratory Result Streams', 'Treatment Efficacy Indices'),
  ('PROC-0004', 'Clinical Trial Matching', 'Medication Administration Logs', 'Risk Stratification Scores');

INSERT INTO clin_algo (id, clin_algo_id, method_id, display_name, lang_code) VALUES
  ('ARTI-0001', 'Sepsis Early Warning Score', 'Cox proportional hazards', 'Display Name 01', '619'),
  ('ARTI-0002', 'APACHE II Index', 'logistic regression', 'Display Name 02', '168561'),
  ('ARTI-0003', 'HEART Pathway', 'survival analysis model', 'Display Name 03', 'ChIJdfw5jThu5kcR8_Gs6ChXwCA'),
  ('ARTI-0004', 'qSOFA Screening Tool', 'support vector machine', 'Display Name 04', '9246335'),
  ('ARTI-0005', 'Sepsis Early Warning Score', 'survival analysis model', 'Display Name 05', 'state_uk_27'),
  ('ARTI-0006', 'qSOFA Screening Tool', 'decision tree algorithm', 'Display Name 06', '32807');

INSERT INTO care_provider_contract (id, provider_contract_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'Primary Care Physician Group', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'Accountable Care Organization', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Federally Qualified Health Center', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'Specialty Care Network', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'Patient Centered Medical Home', 'Borne By 05', 'Realized In 05');

INSERT INTO hss_issue (id, issue_id, event_id, regulation_id, title, lang_code) VALUES
  ('DOCU-0001', 'Emissions Non-Compliance Notice', 'Unauthorized access log', 'REACH chemical registration', 'Title 01', '6511'),
  ('DOCU-0002', 'Workplace Injury Investigation', 'Unauthorized access log', 'REACH chemical registration', 'Title 02', '505977'),
  ('DOCU-0003', 'Waste Management Deviation Report', 'Conveyor belt shear hazard', 'DOT hazardous materials transport', 'Title 03', '103185'),
  ('DOCU-0004', 'Workplace Injury Investigation', 'Conveyor belt shear hazard', 'ISO 14001 clause seven', 'Title 04', 'e926c98c-8fb3-11eb-924d-9cd76263cbd0'),
  ('DOCU-0005', 'Equipment Calibration Failure', 'Radioactive waste storage breach', 'REACH chemical registration', 'Title 05', '4210'),
  ('DOCU-0006', 'Occupational Health Screening', 'Conveyor belt shear hazard', 'ISO 14001 clause seven', 'Title 06', 'Serial'),
  ('DOCU-0007', 'Security Breach Assessment', 'Unauthorized access log', 'REACH chemical registration', 'Title 07', 'lu_tax_code_template_m_I_2_6_b');

INSERT INTO decision_role (id, role_id, borne_by, realized_in) VALUES
  ('ROLE-0001', 'Lead Instrumentation Auditor', 'Borne By 01', 'Realized In 01'),
  ('ROLE-0002', 'Quality Oversight Coordinator', 'Borne By 02', 'Realized In 02'),
  ('ROLE-0003', 'Lead Instrumentation Auditor', 'Borne By 03', 'Realized In 03'),
  ('ROLE-0004', 'Quality Oversight Coordinator', 'Borne By 04', 'Realized In 04'),
  ('ROLE-0005', 'Shift Control Supervisor', 'Borne By 05', 'Realized In 05'),
  ('ROLE-0006', 'System Access Arbiter', 'Borne By 06', 'Realized In 06'),
  ('ROLE-0007', 'Chief Data Officer', 'Borne By 07', 'Realized In 07'),
  ('ROLE-0008', 'Calibration Authority', 'Borne By 08', 'Realized In 08');

INSERT INTO etym_mapping (id, mapping_id, source_tribe_id, target_root_id, char_encoding, lang_code) VALUES
  ('DECI-0001', 'Arverni_PhoneticShift', 'Segusiavi', 'SerdceRoot', 'latin1', '12875266'),
  ('DECI-0002', 'Lingones_MorphemeLink', 'Boii', 'ClovekRoot', 'ascii', 'account_pymes_663'),
  ('DECI-0003', 'Treveri_GaelicBridge', 'Senedones', 'SerdceRoot', 'latin1', '19508914'),
  ('DECI-0004', 'Treveri_GaelicBridge', 'Senedones', 'KorenRoot', 'utf8', '278d845c-8fc0-11eb-924d-9cd76263cbd0'),
  ('DECI-0005', 'Lingones_MorphemeLink', 'Rauraci', 'RekaRoot', 'ascii', 'cd28f198-8fb2-11eb-924d-9cd76263cbd0'),
  ('DECI-0006', 'Segusiavi_ConsonantTie', 'Senedones', 'SerdceRoot', 'ascii', 'state_uk_4');

INSERT INTO grad_elig_review (id, review_id, program_id, student_id) VALUES
  ('ASSE-0001', 'Spring2023SeniorAudit', 'MBAmbientComputing', 'STU-3327-XY'),
  ('ASSE-0002', 'Fall2022CohortReview', 'BAHistory', 'STU-0094-DE'),
  ('ASSE-0003', 'Fall2024FinalEval', 'BSElectricalEng', 'STU-1105-BC'),
  ('ASSE-0004', 'ClassOf2025Review', 'MSDataEngineering', 'STU-4438-VW'),
  ('ASSE-0005', 'Fall2024FinalEval', 'MAEconomics', 'STU-8842-JK');

INSERT INTO residency_rules (id, requirement_code, student_id, office_id, effective_from, review_cycle_days) VALUES
  ('REQU-0001', 'MBA Campus Immersion', 'Dual Degree Participants', 'Registrar Records Division', '2023-12-03', '974'),
  ('REQU-0002', 'MBA Campus Immersion', 'First-Year Doctoral Candidates', 'Tuition Residency Board', '2023-12-12', '885'),
  ('REQU-0003', 'MA Studio Critique', 'First-Year Doctoral Candidates', 'Office of Graduate Studies', '2023-11-22', '501'),
  ('REQU-0004', 'MA Studio Critique', 'Full-Time MEng Students', 'Housing & Residential Life', '2024-06-06', '306'),
  ('REQU-0005', 'EdD Field Seminar', 'International Graduate Fellows', 'Academic Policy Committee', '2023-04-27', '846'),
  ('REQU-0006', 'BS Lab Intensive', 'Capstone Project Teams', 'Student Affairs Compliance', '2024-07-17', '771'),
  ('REQU-0007', 'BS Lab Intensive', 'International Graduate Fellows', 'Student Conduct Office', '2025-01-02', '90');

INSERT INTO waiver_cert (id, cert_id, board_id, waiver_id, certified_at, label, lang_code) VALUES
  ('CERT-0001', 'AWC-0481', 'District 4 Board Session', 'Valley School District', '2023-12-12T08:00:00Z', 'Label 01', '7119770'),
  ('CERT-0002', 'AWC-0144', 'State Revenue Commission', 'Harbor Freight Co', '2023-08-22T16:45:00Z', 'Label 02', '9568455'),
  ('CERT-0003', 'AWC-0337', 'Municipal Appeals Committee', 'Summit Energy Corp', '2024-04-15T15:35:00Z', 'Label 03', '1186106'),
  ('CERT-0004', 'AWC-0883', 'Regional Assessment Panel', 'Harbor Freight Co', '2024-04-15T15:35:00Z', 'Label 04', '974920'),
  ('CERT-0005', 'AWC-0144', 'State Licensing Board', 'Greenfield Utilities', '2023-08-22T16:45:00Z', 'Label 05', 'id_22'),
  ('CERT-0006', 'AWC-0915', 'District 4 Board Session', 'Valley School District', '2023-10-09T10:10:00Z', 'Label 06', '6564374'),
  ('CERT-0007', 'AWC-0662', 'State Revenue Commission', 'Greenfield Utilities', '2024-04-15T15:35:00Z', 'Label 07', 'diplomatic-sensitivity');

INSERT INTO meeting_agenda_item (id, agenda_item_id, board_member_id, topic_id) VALUES
  ('ITEM-0001', 'Cybersecurity Audit', 'Sarah Lin', 'Vendor Contract Renewal'),
  ('ITEM-0002', 'Strategy Alignment', 'James Thorne', 'Executive Bonus Structure'),
  ('ITEM-0003', 'CEO Succession Plan', 'James Thorne', 'Capital Allocation'),
  ('ITEM-0004', 'Strategy Alignment', 'James Thorne', 'Annual Strategy'),
  ('ITEM-0005', 'Merger Proposal', 'Priya Mehta', 'Environmental Impact Report'),
  ('ITEM-0006', 'Merger Proposal', 'Natalie Cruz', 'Audit Findings');

INSERT INTO care_programs (id, program_id, patient_id, service_id) VALUES
  ('PROG-0001', 'Non-Small Cell Lung Cancer', 'Young Adult Recipient', 'Psychosocial Support Group'),
  ('PROG-0002', 'Pediatric Leukemia', 'Pediatric Oncology Patient', 'Financial Assistance Counseling'),
  ('PROG-0003', 'Breast Carcinoma', 'Palliative Care Candidate', 'Financial Assistance Counseling'),
  ('PROG-0004', 'Stage III Colon Cancer', 'Geriatric Cancer Survivor', 'Palliative Care Navigation'),
  ('PROG-0005', 'Head Neck Carcinoma', 'Pediatric Oncology Patient', 'Survivorship Care Planning'),
  ('PROG-0006', 'Pediatric Leukemia', 'Palliative Care Candidate', 'Psychosocial Support Group'),
  ('PROG-0007', 'Pediatric Leukemia', 'Clinical Trial Enrollee', 'Oncology Social Work');

INSERT INTO unaccompanied_minor_trip (id, minor_trip_id, minor_id, realized_in) VALUES
  ('ROLE-0001', 'WardTravel-331', 'Youth-Record-3344', 'Realized In 01'),
  ('ROLE-0002', 'UM-Case-8842', 'Minor-File-2276', 'Realized In 02'),
  ('ROLE-0003', 'MinorTravel-661', 'Minor-File-2276', 'Realized In 03'),
  ('ROLE-0004', 'TaxiEscort-992', 'Ward-File-2283', 'Realized In 04'),
  ('ROLE-0005', 'TransitWard-55', 'Minor-Case-5542', 'Realized In 05'),
  ('ROLE-0006', 'UnaccEscort-887', 'Youth-Record-3344', 'Realized In 06'),
  ('ROLE-0007', 'MinorGuard-7719', 'Minor-Person-4491', 'Realized In 07');

INSERT INTO route_stop (id, stop_code, rel_0000124) VALUES
  ('LOCA-0001', 'Freight Yard Track 9', 'Rel 0000124 01'),
  ('LOCA-0002', 'Station Platform 3', 'Rel 0000124 02'),
  ('LOCA-0003', 'Hub Chicago South', 'Rel 0000124 03'),
  ('LOCA-0004', 'Intermodal Terminal 2', 'Rel 0000124 04'),
  ('LOCA-0005', 'Warehouse Zone B', 'Rel 0000124 05'),
  ('LOCA-0006', 'Hub Chicago South', 'Rel 0000124 06');

INSERT INTO urine_drug_test (id, screen_id, sample_id, compound_id) VALUES
  ('PROC-0001', 'Barbiturate Screen', 'Adulteration Test Cup', 'Oxycodone'),
  ('PROC-0002', 'Opiate Immunoassay', 'Sterile Urine Cup', 'Oxycodone'),
  ('PROC-0003', 'Opioid Confirmation', 'FDA Specimen Container', 'Methamphetamine'),
  ('PROC-0004', 'SAMHSA-5 Panel', '100mL Specimen Vial', 'THC-COOH'),
  ('PROC-0005', 'Methamphetamine Screen', 'Drug Screen Kit', 'Amphetamine'),
  ('PROC-0006', 'SAMHSA-5 Panel', 'Preservative Vial', 'Amphetamine'),
  ('PROC-0007', 'Cocaine Metabolite Panel', 'Child-Resistant Bottle', 'Oxycodone');

INSERT INTO role_assignments (id, role_id) VALUES
  ('ROLE-0001', 'COURT-7742'),
  ('ROLE-0002', 'D-7731-OC'),
  ('ROLE-0003', 'DET-2023-11'),
  ('ROLE-0004', 'DET-2023-11'),
  ('ROLE-0005', 'MIN-8814-CR'),
  ('ROLE-0006', 'DET-2023-11');

INSERT INTO pay_method_cat (id, method_cat_id, pay_type, dimension_kind, value) VALUES
  ('CATE-0001', 'Cash Advance', 'Standing Order', 'count', '10.35'),
  ('CATE-0002', 'Credit Card', 'Instant', 'length', '326.11'),
  ('CATE-0003', 'Direct Debit', 'One Time', 'mass', '712.75'),
  ('CATE-0004', 'Check Payment', 'Automated', 'length', '629.31'),
  ('CATE-0005', 'Direct Debit', 'Automated', 'count', '736.26'),
  ('CATE-0006', 'Buy Now Pay Later', 'Standing Order', 'temperature', '783.40'),
  ('CATE-0007', 'Direct Debit', 'Batch', 'time', '104.17');

INSERT INTO research_protocol (id, protocol_id, method_id, question_id) VALUES
  ('DESI-0001', 'Andean Potato Nutrition Project', 'Maternal Milk Sampling', 'Cultural Infant Feeding'),
  ('DESI-0002', 'Hmong Postpartum Diet Analysis', 'Structured Dietary Recall', 'Indigenous Crop Resilience'),
  ('DESI-0003', 'Maasai Micronutrient Survey', 'Stable Carbon Analysis', 'Heavy Metal Accumulation'),
  ('DESI-0004', 'Sahel Child Stunting Cohort', 'Stable Carbon Analysis', 'Indigenous Crop Resilience'),
  ('DESI-0005', 'Hmong Postpartum Diet Analysis', 'Structured Dietary Recall', 'Dietary Shifts and Diabetes');

INSERT INTO nutri_ind (id, nutri_ind_id, measure_val, unit, value) VALUES
  ('INDI-0001', 'Zinc serum concentration', '15.2 mg/dL', 'count', '215.19'),
  ('INDI-0002', 'Plasma retinol level', 'deficient category', 'mg/L', '928.46'),
  ('INDI-0003', 'Hemoglobin A1c level', '<2.0 g/dL', 'kg', '857.00'),
  ('INDI-0004', 'Dietary diversity score', 'deficient category', 'ratio', '800.58'),
  ('INDI-0005', 'MUAC measurement', 'low category', 'nm', '248.99'),
  ('INDI-0006', 'Plasma retinol level', 'normal range', 'm/s', '646.34'),
  ('INDI-0007', 'Weight-for-height z-score', '18.5 kg/m2', 'count', '435.20');

INSERT INTO consent_record (id, consent_id, participant_id, protocol_id) VALUES
  ('PROC-0001', 'Pediatric Assent Form', 'Paper Form Review', 'HIPAA Privacy Standard'),
  ('PROC-0002', 'Longitudinal Study Consent', 'Nurse Counseling Session', 'Common Rule Compliance'),
  ('PROC-0003', 'Pediatric Assent Form', 'Digital Signature Pad', 'National Health Ethics'),
  ('PROC-0004', 'Biobank Enrollment Consent', 'Paper Form Review', 'National Health Ethics');

INSERT INTO board_role (id, board_role_id, holder_id, realized_in) VALUES
  ('ROLE-0001', 'Provenance Tracking Council', 'Lead Research Scientist', 'Realized In 01'),
  ('ROLE-0002', 'Strategic Planning Group', 'Observatory Director', 'Realized In 02'),
  ('ROLE-0003', 'Lab Quality Council', 'Lead Research Scientist', 'Realized In 03'),
  ('ROLE-0004', 'Telemetry Review Panel', 'Medical Director', 'Realized In 04');

INSERT INTO prop_assess_notice (id, notice_id, approval_status, notice_text, lang_code) VALUES
  ('NOTI-0001', 'Parcel 77D Northpoint', 'Planning Commission', 'Notice Text 01', 'lu_tax_code_template_m14'),
  ('NOTI-0002', '8800 Commerce Drive', 'District Valuation Board', 'Notice Text 02', '605961'),
  ('NOTI-0003', 'Unit 402 Harborview', 'Valuation Review Commission', 'Notice Text 03', '25a77d4360b649cabf445d6bfef346db'),
  ('NOTI-0004', 'Plot 5C Ashwood', 'State Tax Commission', 'Notice Text 04', 'ChIJ306QwPtt5kcRyHWX6_lwXg0'),
  ('NOTI-0005', 'Parcel 77D Northpoint', 'Zoning Board', 'Notice Text 05', 'account_pymes_2405'),
  ('NOTI-0006', 'Parcel 77D Northpoint', 'Municipal Review Committee', 'Notice Text 06', 'BJGopher'),
  ('NOTI-0007', '95 Harbor View Lane', 'Tax Review Committee', 'Notice Text 07', 'ca6f5634-8fcd-11eb-924d-9cd76263cbd0'),
  ('NOTI-0008', 'Parcel 44B-9', 'Assessment Appeals Panel', 'Notice Text 08', '9246317');

INSERT INTO ac_officer_role (id, role_id, participates_in, activity_type) VALUES
  ('ROLE-0001', 'FeralCatTask-9', 'Participates In 01', 'ImpoundManagement'),
  ('ROLE-0002', 'FeralCatTask-9', 'Participates In 02', 'QuarantineEnforcement'),
  ('ROLE-0003', 'CountyAC-118', 'Participates In 03', 'NuisanceAbatement'),
  ('ROLE-0004', 'LivestockGuard-22', 'Participates In 04', 'ZoningViolation'),
  ('ROLE-0005', 'BiteResponse-01', 'Participates In 05', 'LitterControl');

INSERT INTO raffle_conductor_eligibility (id, eligibility_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'Nonprofit Grant Administrator', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'Nonprofit Grant Administrator', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'Volunteer Coordination Lead', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'Charity Raffle Coordinator', 'Inheres In 04', 'Realized In 04'),
  ('ROLE-0005', 'Revenue Distribution Chair', 'Inheres In 05', 'Realized In 05');

INSERT INTO export_job (id, export_job_id, exported_data_id, api_ref) VALUES
  ('PROC-0001', 'daily_delta_sync', 'telemetry_bundle.zip', 'GraphQL_resolver'),
  ('PROC-0002', 'adhoc_analytics_pull', 'customer_profile.csv', 'GraphQL_resolver'),
  ('PROC-0003', 'streaming_parquet_rollup', 'compliance_report.pdf', 'SFTP_v3.1'),
  ('PROC-0004', 'streaming_parquet_rollup', 'regulatory_filing.xml', 'SFTP_v3.1');

INSERT INTO pat_edu_pkg (id, pat_edu_pkg_id, bundle_type, use_case, display_name, lang_code) VALUES
  ('PACK-0001', 'ID-9921X', 'Omeprazole Acid Reflux', 'Discharge Planning', 'Display Name 01', '2087747'),
  ('PACK-0002', 'MRN-10293847', 'Lisinopril 10mg Guide', 'Allergy Education', 'Display Name 02', '69440'),
  ('PACK-0003', 'ENC-4410', 'Prednisone Steroid Course', 'Pediatric Dosing Guidance', 'Display Name 03', '4277023'),
  ('PACK-0004', 'SUBJ-00492', 'Atorvastatin Lipid Profile', 'Postoperative Recovery', 'Display Name 04', '10445627'),
  ('PACK-0005', 'PT-883471', 'Lisinopril 10mg Guide', 'Dosage Instruction', 'Display Name 05', '10207149'),
  ('PACK-0006', 'PT-772104', 'Insulin Glargine Usage', 'Preoperative Preparation', 'Display Name 06', '605942'),
  ('PACK-0007', 'MRN-5567821', 'Sertraline 50mg Outline', 'Allergy Education', 'Display Name 07', '20261515'),
  ('PACK-0008', 'PT-883471', 'Clopidogrel Platelet Therapy', 'Dosing Instructions', 'Display Name 08', '3717623');

INSERT INTO mount_config (id, mount_cfg_id, instrument_id, mount_structure_id, method, unit) VALUES
  ('CONF-0001', 'Sloan_Digital_Mount', 'NIRC2', 'Equatorial_Tracker_B', 'hybrid', 'count'),
  ('CONF-0002', 'Sloan_Digital_Mount', 'MOSFIRE', 'Meridian_Plate_Delta', 'hybrid', 'ratio'),
  ('CONF-0003', 'La_Silla_Echelle_Setup', 'NIRC2', 'German_Revolver_Z', 'manual', 'kg'),
  ('CONF-0004', 'MaunaKea_NIRSpec_Dock', 'IRAC', 'Instrument_Pier_12', 'automated', 'ratio');

INSERT INTO role_assignments_2 (id, role_id, inheres_in, realized_in) VALUES
  ('ROLE-0001', 'ElenaRostova', 'Inheres In 01', 'Realized In 01'),
  ('ROLE-0002', 'ClaraVega', 'Inheres In 02', 'Realized In 02'),
  ('ROLE-0003', 'NiaDesai', 'Inheres In 03', 'Realized In 03'),
  ('ROLE-0004', 'SarahLin', 'Inheres In 04', 'Realized In 04');

INSERT INTO kpi_limits (id, kpi_limit_id, agent_id, metric_id, unit_cd, display_name) VALUES
  ('CONS-0001', 'OutboundCallMinThreshold', 'LeadQualificationRep', 'PeakHourThroughput', 'utf8', 'Display Name 01'),
  ('CONS-0002', 'DNDOptOutLimit', 'DialerOperator', 'CallDropPercentage', 'utf8', 'Display Name 02'),
  ('CONS-0003', 'CallDurationMin', 'OutboundAgentLead', 'SuccessfulConnectRate', 'ascii', 'Display Name 03'),
  ('CONS-0004', 'ComplianceHoldLimit', 'CampaignManager', 'SuccessfulConnectRate', 'ascii', 'Display Name 04'),
  ('CONS-0005', 'FirstContactResolutionFloor', 'DialerOperator', 'TotalOutboundDials', 'utf8', 'Display Name 05'),
  ('CONS-0006', 'ConversionTargetFloor', 'ListManagementAnalyst', 'LiveConversationRate', 'latin1', 'Display Name 06'),
  ('CONS-0007', 'ComplianceHoldLimit', 'SalesCoordinator', 'DailyCallVolume', 'latin1', 'Display Name 07'),
  ('CONS-0008', 'ConversionTargetFloor', 'InboundScheduler', 'SuccessfulConnectRate', 'utf8', 'Display Name 08');

INSERT INTO sales_wkly_rpt (id, sales_rpt_id, tele_sales_id, reporting_period_id, period_type_cd, doc_title, lang_code) VALUES
  ('REPO-0001', 'EXPORT-11W04', 'Retention-Call-Campaign', 'WEEK-44-2024', 'Month-End-Window', 'Doc Title 01', '9568453'),
  ('REPO-0002', 'DASH-TELE-Q4', 'SUPPORT-RENEWAL', 'FISC-Q4-2024', 'ROLLING-7D', 'Doc Title 02', '10449531'),
  ('REPO-0003', 'Q3-Tele-Sales-12', 'INBOUND-INQ-11', 'NOV-WK03', 'ISO-Week-Format', 'Doc Title 03', '69423'),
  ('REPO-0004', 'SNAP-NOV-W03', 'Outbound-Call-Drive', 'H2-2023-Block', 'MARKETING-WK', 'Doc Title 04', '7119788'),
  ('REPO-0005', 'AUDIT-LOG-1152', 'SUPPORT-RENEWAL', 'CYCLE-11A-24', 'Trailing-30-Day', 'Doc Title 05', 'PHR-101');

INSERT INTO clearing_broker_mandate (id, clearing_role_id, customer_acct_id, realized_in) VALUES
  ('ROLE-0001', 'PrimeClearingDesk', 'RetailAcct7734', 'Realized In 01'),
  ('ROLE-0002', 'MarginClearingSpecialist', 'FamilyOfficeDE', 'Realized In 02'),
  ('ROLE-0003', 'ClearingHouseProxy', 'CorporateTreasuryUS', 'Realized In 03'),
  ('ROLE-0004', 'ClearingHouseProxy', 'Acct-8842901', 'Realized In 04');

INSERT INTO sec_system (id, sec_system_id, component_id) VALUES
  ('INFR-0001', 'Identity Provider Federation', 'OAuth 2.0 Authorization Server'),
  ('INFR-0002', 'Zero Trust Architecture', 'Mandatory Access Control'),
  ('INFR-0003', 'Privileged Access Management Console', 'Policy Enforcement Point'),
  ('INFR-0004', 'Multi-Factor Authentication Array', 'RBAC Policy Engine'),
  ('INFR-0005', 'Hardware Security Module Pool', 'ABAC Rule Processor'),
  ('INFR-0006', 'Security Operations Center Platform', 'Token Validation Engine'),
  ('INFR-0007', 'Cloud Security Posture Management', 'Access Control List Manager'),
  ('INFR-0008', 'Hardware Security Module Pool', 'RBAC Policy Engine');

INSERT INTO dup_requests (id, dup_req_id, requestor_id, source_doc_id, request_note, lang_code) VALUES
  ('REQU-0001', 'ALT-7723-SEC', 'TelemetrySupervisor', 'Calibration Log', 'Request Note 01', 'id_25'),
  ('REQU-0002', 'PRM-0056-GEN', 'ProtocolReviewBoard', 'Reference Standard', 'Request Note 02', 'ChIJe0zpU4Bt5kcR4t9EwgzhF0U'),
  ('REQU-0003', 'REF-4401-PRM', 'compliance-officer', 'Calibration Log', 'Request Note 03', '99752'),
  ('REQU-0004', 'Gov-Report-Dup', 'DataCustodianLead', 'inventory-manual', 'Request Note 04', '32822'),
  ('REQU-0005', 'CLN-2247-LAB', 'devops-pipeline', 'telemetry-archive', 'Request Note 05', 'a4e3c328-8fb9-11eb-924d-9cd76263cbd0');

INSERT INTO mail_dispatch (id, dispatch_id, drop_site_id, sort_rule_id) VALUES
  ('PROC-0001', 'Regional Sort Express', 'Facility Delta', 'Local Route'),
  ('PROC-0002', 'Route Alpha Dispatch', 'Sort Center Five', 'Fragile Mark'),
  ('PROC-0003', 'Route Alpha Dispatch', 'Bay Twelve Loading', 'Fragile Mark'),
  ('PROC-0004', 'Local Drop Standard', 'Station Seven West', 'International Zone');

INSERT INTO referral_role_map (id, role_id, participates_in, process_id) VALUES
  ('ROLE-0001', 'Victim Advocate', 'Participates In 01', 'Mental Health Triage'),
  ('ROLE-0002', 'Bail Bond Agent', 'Participates In 02', 'Diversion Program Enrollment'),
  ('ROLE-0003', 'Community Liaison', 'Participates In 03', 'Mental Health Triage'),
  ('ROLE-0004', 'Court Clerk', 'Participates In 04', 'Victim Impact Notification'),
  ('ROLE-0005', 'Public Defender', 'Participates In 05', 'Diversion Program Enrollment'),
  ('ROLE-0006', 'Court Clerk', 'Participates In 06', 'Diversion Program Enrollment'),
  ('ROLE-0007', 'Court Clerk', 'Participates In 07', 'Court Ordered Counseling'),
  ('ROLE-0008', 'Public Defender', 'Participates In 08', 'Court Ordered Counseling');

INSERT INTO survey_result (id, finding_id, substance_cd, prevalence_pct, char_encoding, lang_cd) VALUES
  ('FIND-0001', 'National Nutritional Audit', 'Caffeine', 'Point Prevalence Metric', 'utf8', 'Lang Cd 01'),
  ('FIND-0002', 'BRFSS State', 'Nicotine', 'Period Prevalence Count', 'latin1', 'Lang Cd 02'),
  ('FIND-0003', 'BRFSS State', 'Vitamin D', 'Weighted Population Rate', 'ascii', 'Lang Cd 03'),
  ('FIND-0004', 'FDA Pesticide Residue', 'Ethanol', 'Age-Adjusted Prevalence', 'utf8', 'Lang Cd 04');

INSERT INTO vehicle_propulsion (id, power_type_cd, is_diesel, is_non_diesel, method, unit) VALUES
  ('TYPE-0001', 'solar_power', 'diesel_locomotive', 'hybrid_sedan', 'inferred', 'mg/L'),
  ('TYPE-0002', 'hybrid_propulsion', 'diesel_rig', 'electric_van', 'hybrid', 'deg_C'),
  ('TYPE-0003', 'turbojet_power', 'diesel_rig', 'hydrogen_bus', 'automated', 'nm'),
  ('TYPE-0004', 'ethanol_flex', 'diesel_barge', 'solar_vehicle', 'hybrid', 'nm'),
  ('TYPE-0005', 'plug_in_hybrid', 'diesel_tanker', 'gasoline_cruiser', 'hybrid', 'deg_C'),
  ('TYPE-0006', 'plug_in_hybrid', 'class_8_truck', 'electric_truck', 'manual', 'count');

INSERT INTO breeding_app (id, breeding_app_id, horse_id, app_name, lang_code) VALUES
  ('APPL-0001', 'APPREG-4412', 'STALLIONREG-441', 'App Name 01', '330'),
  ('APPL-0002', 'EQGEN-APP-334', 'APPHS-99281', 'App Name 02', '57e47252-8fcd-11eb-924d-9cd76263cbd0'),
  ('APPL-0003', 'SHELFORD-SPRING-2024', 'JCK-2024-5591', 'App Name 03', '99762'),
  ('APPL-0004', 'BPA-2024-0892', 'STALLIONREG-441', 'App Name 04', '6564400'),
  ('APPL-0005', 'BPA-2024-0892', 'APPHS-99281', 'App Name 05', '1437601'),
  ('APPL-0006', 'BREEDQ3-2024', 'EQSHELFORD-221', 'App Name 06', '168554');

INSERT INTO meas_capability (id, capability_id, param_id, range_id, display_name, lang_code) VALUES
  ('PROF-0001', 'Mass Flow Controller Setup', 'Differential Pressure', '10 to 95 pct', 'Display Name 01', '9424934'),
  ('PROF-0002', 'Particle Counter Model 5', 'PM2.5 Particulate Count', '0.5 to 500 mcg/m3', 'Display Name 02', 'Pelanggan'),
  ('PROF-0003', 'XRF Field Survey Protocol', 'Ambient Temperature', '0.5 to 500 mcg/m3', 'Display Name 03', '338541'),
  ('PROF-0004', 'XRF Field Survey Protocol', 'Relative Humidity', '10 to 95 pct', 'Display Name 04', '5f90765e-8fcd-11eb-924d-9cd76263cbd0'),
  ('PROF-0005', 'UV-Vis Spectral Calibration', 'Input Voltage', '2 to 12 pH', 'Display Name 05', 'gd_taxr_3'),
  ('PROF-0006', 'FTIR Gas Analysis Profile', 'Input Voltage', '1 to 50 L/min', 'Display Name 06', 'level-1'),
  ('PROF-0007', 'Particle Counter Model 5', 'Solution pH Level', '0.1 to 10 bar', 'Display Name 07', '4463650'),
  ('PROF-0008', 'Oscilloscope 1GHz Bandwidth', 'Relative Humidity', '2 to 12 pH', 'Display Name 08', '1450651');

INSERT INTO debt_case (id, case_id, client_id, issue_id) VALUES
  ('PROC-0001', 'Eviction Prevention Protocol', 'Brown Longterm Renter', 'HousingBenefitLag'),
  ('PROC-0002', 'UtilityArrears-Int', 'Smith Household', 'PropertyTaxLien'),
  ('PROC-0003', 'Mortgage Default Intervention', 'Rodriguez Senior Household', 'UtilityOverdue-23'),
  ('PROC-0004', 'Property Tax Lien Clearance', 'TEN-7721', 'CouncilTaxDefault'),
  ('PROC-0005', 'Tenant Debt Mediation', 'Williams Single Occupant', 'LeaseFeeUnpaid'),
  ('PROC-0006', 'MortgageDelinq-Phase2', 'HOU-4491', 'Mortgage Payment Default'),
  ('PROC-0007', 'LeaseDefault-Proc05', 'Taylor Disabled Client', 'PropertyTaxLien');

INSERT INTO housing_policy_doc (id, housing_policy_id, topic_code, char_encoding, lang_code) VALUES
  ('INFO-0001', 'Rent Control Amendment', 'Property Tax Assessments', 'latin1', '5f93e294-8fcd-11eb-924d-9cd76263cbd0'),
  ('INFO-0002', 'Land Trust Charter', 'Emergency Shelter', 'latin1', '0470021411'),
  ('INFO-0003', 'First Buyer Credit Program', 'Tenant Eviction Rates', 'ascii', '168556'),
  ('INFO-0004', 'Eviction Moratorium', 'Affordability Metrics', 'unicode', '89511'),
  ('INFO-0005', 'Housing Voucher Rule', 'Tenant Eviction Rates', 'utf8', 'lu_tax_code_template_m09');

INSERT INTO t_business_activity_process (id, business_activity_process) VALUES
  ('PROC-0001', 'Business Activity Process 01'),
  ('PROC-0002', 'Business Activity Process 02'),
  ('PROC-0003', 'Business Activity Process 03'),
  ('PROC-0004', 'Business Activity Process 04'),
  ('PROC-0005', 'Business Activity Process 05');

INSERT INTO t_business_decision (id, business_decision) VALUES
  ('DECI-0001', 'Business Decision 01'),
  ('DECI-0002', 'Business Decision 02'),
  ('DECI-0003', 'Business Decision 03'),
  ('DECI-0004', 'Business Decision 04'),
  ('DECI-0005', 'Business Decision 05'),
  ('DECI-0006', 'Business Decision 06'),
  ('DECI-0007', 'Business Decision 07'),
  ('DECI-0008', 'Business Decision 08');

INSERT INTO t_business_entity (id, business_entity) VALUES
  ('ENTI-0001', 'Business Entity 01'),
  ('ENTI-0002', 'Business Entity 02'),
  ('ENTI-0003', 'Business Entity 03'),
  ('ENTI-0004', 'Business Entity 04'),
  ('ENTI-0005', 'Business Entity 05'),
  ('ENTI-0006', 'Business Entity 06'),
  ('ENTI-0007', 'Business Entity 07');

INSERT INTO t_business_initiative (id, business_initiative) VALUES
  ('INIT-0001', 'Business Initiative 01'),
  ('INIT-0002', 'Business Initiative 02'),
  ('INIT-0003', 'Business Initiative 03'),
  ('INIT-0004', 'Business Initiative 04'),
  ('INIT-0005', 'Business Initiative 05'),
  ('INIT-0006', 'Business Initiative 06'),
  ('INIT-0007', 'Business Initiative 07'),
  ('INIT-0008', 'Business Initiative 08');

INSERT INTO t_calendar_product_specification (id, calendar_product_specification) VALUES
  ('SPEC-0001', 'Calendar Product Specification 01'),
  ('SPEC-0002', 'Calendar Product Specification 02'),
  ('SPEC-0003', 'Calendar Product Specification 03'),
  ('SPEC-0004', 'Calendar Product Specification 04'),
  ('SPEC-0005', 'Calendar Product Specification 05'),
  ('SPEC-0006', 'Calendar Product Specification 06');

INSERT INTO t_call_volume_metric (id, call_volume_metric) VALUES
  ('METR-0001', 'Call Volume Metric 01'),
  ('METR-0002', 'Call Volume Metric 02'),
  ('METR-0003', 'Call Volume Metric 03'),
  ('METR-0004', 'Call Volume Metric 04'),
  ('METR-0005', 'Call Volume Metric 05'),
  ('METR-0006', 'Call Volume Metric 06'),
  ('METR-0007', 'Call Volume Metric 07'),
  ('METR-0008', 'Call Volume Metric 08');

INSERT INTO t_cancer_patient (id, cancer_patient) VALUES
  ('PATI-0001', 'Cancer Patient 01'),
  ('PATI-0002', 'Cancer Patient 02'),
  ('PATI-0003', 'Cancer Patient 03'),
  ('PATI-0004', 'Cancer Patient 04'),
  ('PATI-0005', 'Cancer Patient 05'),
  ('PATI-0006', 'Cancer Patient 06'),
  ('PATI-0007', 'Cancer Patient 07');

INSERT INTO t_care_quality_assessment (id, care_quality_assessment) VALUES
  ('ASSE-0001', 'Care Quality Assessment 01'),
  ('ASSE-0002', 'Care Quality Assessment 02'),
  ('ASSE-0003', 'Care Quality Assessment 03'),
  ('ASSE-0004', 'Care Quality Assessment 04');

INSERT INTO t_certification_time (id, certification_time) VALUES
  ('TIME-0001', 'Certification Time 01'),
  ('TIME-0002', 'Certification Time 02'),
  ('TIME-0003', 'Certification Time 03'),
  ('TIME-0004', 'Certification Time 04'),
  ('TIME-0005', 'Certification Time 05'),
  ('TIME-0006', 'Certification Time 06');

INSERT INTO t_certified_internal_auditor (id, certified_internal_auditor) VALUES
  ('AUDI-0001', 'Certified Internal Auditor 01'),
  ('AUDI-0002', 'Certified Internal Auditor 02'),
  ('AUDI-0003', 'Certified Internal Auditor 03'),
  ('AUDI-0004', 'Certified Internal Auditor 04'),
  ('AUDI-0005', 'Certified Internal Auditor 05'),
  ('AUDI-0006', 'Certified Internal Auditor 06'),
  ('AUDI-0007', 'Certified Internal Auditor 07');

INSERT INTO t_chemical_installation (id, chemical_installation) VALUES
  ('INST-0001', 'Chemical Installation 01'),
  ('INST-0002', 'Chemical Installation 02'),
  ('INST-0003', 'Chemical Installation 03'),
  ('INST-0004', 'Chemical Installation 04'),
  ('INST-0005', 'Chemical Installation 05'),
  ('INST-0006', 'Chemical Installation 06'),
  ('INST-0007', 'Chemical Installation 07'),
  ('INST-0008', 'Chemical Installation 08');

INSERT INTO t_child_protection_team (id, child_protection_team) VALUES
  ('TEAM-0001', 'Child Protection Team 01'),
  ('TEAM-0002', 'Child Protection Team 02'),
  ('TEAM-0003', 'Child Protection Team 03'),
  ('TEAM-0004', 'Child Protection Team 04');

INSERT INTO t_clearing_process (id, clearing_process, involves_object) VALUES
  ('PROC-0001', 'Clearing Process 01', 'Involves Object 01'),
  ('PROC-0002', 'Clearing Process 02', 'Involves Object 02'),
  ('PROC-0003', 'Clearing Process 03', 'Involves Object 03'),
  ('PROC-0004', 'Clearing Process 04', 'Involves Object 04'),
  ('PROC-0005', 'Clearing Process 05', 'Involves Object 05'),
  ('PROC-0006', 'Clearing Process 06', 'Involves Object 06');

INSERT INTO t_client (id, client) VALUES
  ('CLIE-0001', 'Janice Johnston'),
  ('CLIE-0002', 'April Snyder'),
  ('CLIE-0003', 'Fredrik Backman'),
  ('CLIE-0004', 'Is Self Action'),
  ('CLIE-0005', 'Jorge Sullivan');

INSERT INTO t_client_profile (id, client_profile) VALUES
  ('PROF-0001', 'Stephanie Sutton'),
  ('PROF-0002', 'Kimberly Maynard'),
  ('PROF-0003', 'Michael Young'),
  ('PROF-0004', 'Jorge Sullivan'),
  ('PROF-0005', 'Kenneth Robbins'),
  ('PROF-0006', 'Samantha Mullen'),
  ('PROF-0007', 'Linda Nguyen');

INSERT INTO t_clinical_performance_data (id, clinical_performance_data) VALUES
  ('DATA-0001', 'Clinical Performance Data 01'),
  ('DATA-0002', 'Clinical Performance Data 02'),
  ('DATA-0003', 'Clinical Performance Data 03'),
  ('DATA-0004', 'Clinical Performance Data 04');

INSERT INTO t_clinical_system (id, clinical_system) VALUES
  ('SYST-0001', 'Clinical System 01'),
  ('SYST-0002', 'Clinical System 02'),
  ('SYST-0003', 'Clinical System 03'),
  ('SYST-0004', 'Clinical System 04'),
  ('SYST-0005', 'Clinical System 05');

INSERT INTO t_cloud_storage_volume (id, cloud_storage_volume) VALUES
  ('VOLU-0001', 'Cloud Storage Volume 01'),
  ('VOLU-0002', 'Cloud Storage Volume 02'),
  ('VOLU-0003', 'Cloud Storage Volume 03'),
  ('VOLU-0004', 'Cloud Storage Volume 04');

INSERT INTO t_collateral_exchange_process (id, collateral_exchange_process) VALUES
  ('PROC-0001', 'Collateral Exchange Process 01'),
  ('PROC-0002', 'Collateral Exchange Process 02'),
  ('PROC-0003', 'Collateral Exchange Process 03'),
  ('PROC-0004', 'Collateral Exchange Process 04'),
  ('PROC-0005', 'Collateral Exchange Process 05'),
  ('PROC-0006', 'Collateral Exchange Process 06'),
  ('PROC-0007', 'Collateral Exchange Process 07');

INSERT INTO t_college_administration (id, college_administration) VALUES
  ('ADMI-0001', 'College Administration 01'),
  ('ADMI-0002', 'College Administration 02'),
  ('ADMI-0003', 'College Administration 03'),
  ('ADMI-0004', 'College Administration 04'),
  ('ADMI-0005', 'College Administration 05');

INSERT INTO t_college_community_member (id, college_community_member) VALUES
  ('MEMB-0001', 'College Community Member 01'),
  ('MEMB-0002', 'College Community Member 02'),
  ('MEMB-0003', 'College Community Member 03'),
  ('MEMB-0004', 'College Community Member 04');

INSERT INTO t_college_official (id, college_official) VALUES
  ('OFFI-0001', 'College Official 01'),
  ('OFFI-0002', 'College Official 02'),
  ('OFFI-0003', 'College Official 03'),
  ('OFFI-0004', 'College Official 04'),
  ('OFFI-0005', 'College Official 05'),
  ('OFFI-0006', 'College Official 06'),
  ('OFFI-0007', 'College Official 07');

INSERT INTO t_community_healthcare_setting (id, community_healthcare_setting) VALUES
  ('SETT-0001', 'Community Healthcare Setting 01'),
  ('SETT-0002', 'Community Healthcare Setting 02'),
  ('SETT-0003', 'Community Healthcare Setting 03'),
  ('SETT-0004', 'Community Healthcare Setting 04'),
  ('SETT-0005', 'Community Healthcare Setting 05');

INSERT INTO t_continuous_emissions_monitoring_system (id, continuous_emissions_monitoring_system) VALUES
  ('SYST-0001', 'Continuous Emissions Monitoring System 01'),
  ('SYST-0002', 'Continuous Emissions Monitoring System 02'),
  ('SYST-0003', 'Continuous Emissions Monitoring System 03'),
  ('SYST-0004', 'Continuous Emissions Monitoring System 04'),
  ('SYST-0005', 'Continuous Emissions Monitoring System 05');

INSERT INTO t_copied_document (id, copied_document) VALUES
  ('DOCU-0001', 'Copied Document 01'),
  ('DOCU-0002', 'Copied Document 02'),
  ('DOCU-0003', 'Copied Document 03'),
  ('DOCU-0004', 'Copied Document 04'),
  ('DOCU-0005', 'Copied Document 05');

INSERT INTO t_corporate_agent (id, corporate_agent) VALUES
  ('AGEN-0001', 'Corporate Agent 01'),
  ('AGEN-0002', 'Corporate Agent 02'),
  ('AGEN-0003', 'Corporate Agent 03'),
  ('AGEN-0004', 'Corporate Agent 04'),
  ('AGEN-0005', 'Corporate Agent 05'),
  ('AGEN-0006', 'Corporate Agent 06'),
  ('AGEN-0007', 'Corporate Agent 07');

INSERT INTO t_corporate_audit_function (id, corporate_audit_function) VALUES
  ('FUNC-0001', 'Corporate Audit Function 01'),
  ('FUNC-0002', 'Corporate Audit Function 02'),
  ('FUNC-0003', 'Corporate Audit Function 03'),
  ('FUNC-0004', 'Corporate Audit Function 04');

INSERT INTO t_corporate_coalition (id, corporate_coalition) VALUES
  ('COAL-0001', 'Corporate Coalition 01'),
  ('COAL-0002', 'Corporate Coalition 02'),
  ('COAL-0003', 'Corporate Coalition 03'),
  ('COAL-0004', 'Corporate Coalition 04'),
  ('COAL-0005', 'Corporate Coalition 05'),
  ('COAL-0006', 'Corporate Coalition 06');

INSERT INTO t_corporate_employee (id, corporate_employee) VALUES
  ('EMPL-0001', 'Cheryl Bradley'),
  ('EMPL-0002', 'Nathaniel Hood'),
  ('EMPL-0003', 'Thomas Shannon'),
  ('EMPL-0004', 'Tasha Rodriguez'),
  ('EMPL-0005', 'Ralph Waldo Emerson'),
  ('EMPL-0006', 'Wesley Stewart'),
  ('EMPL-0007', 'Walter Pratt'),
  ('EMPL-0008', 'Cheryl Bradley');

INSERT INTO t_corporate_reputation_metric (id, corporate_reputation_metric) VALUES
  ('METR-0001', 'Corporate Reputation Metric 01'),
  ('METR-0002', 'Corporate Reputation Metric 02'),
  ('METR-0003', 'Corporate Reputation Metric 03'),
  ('METR-0004', 'Corporate Reputation Metric 04'),
  ('METR-0005', 'Corporate Reputation Metric 05'),
  ('METR-0006', 'Corporate Reputation Metric 06'),
  ('METR-0007', 'Corporate Reputation Metric 07'),
  ('METR-0008', 'Corporate Reputation Metric 08');

INSERT INTO t_course_selection_set (id, course_selection_set) VALUES
  ('SET-0001', 'Course Selection Set 01'),
  ('SET-0002', 'Course Selection Set 02'),
  ('SET-0003', 'Course Selection Set 03'),
  ('SET-0004', 'Course Selection Set 04'),
  ('SET-0005', 'Course Selection Set 05');

INSERT INTO t_court_document (id, court_document) VALUES
  ('DOCU-0001', 'Court Document 01'),
  ('DOCU-0002', 'Court Document 02'),
  ('DOCU-0003', 'Court Document 03'),
  ('DOCU-0004', 'Court Document 04'),
  ('DOCU-0005', 'Court Document 05');

INSERT INTO t_criminal_justice_system (id, criminal_justice_system) VALUES
  ('SYST-0001', 'Criminal Justice System 01'),
  ('SYST-0002', 'Criminal Justice System 02'),
  ('SYST-0003', 'Criminal Justice System 03'),
  ('SYST-0004', 'Criminal Justice System 04'),
  ('SYST-0005', 'Criminal Justice System 05');

INSERT INTO t_cultural_attribute (id, cultural_attribute) VALUES
  ('ATTR-0001', 'Cultural Attribute 01'),
  ('ATTR-0002', 'Cultural Attribute 02'),
  ('ATTR-0003', 'Cultural Attribute 03'),
  ('ATTR-0004', 'Cultural Attribute 04'),
  ('ATTR-0005', 'Cultural Attribute 05'),
  ('ATTR-0006', 'Cultural Attribute 06'),
  ('ATTR-0007', 'Cultural Attribute 07'),
  ('ATTR-0008', 'Cultural Attribute 08');

INSERT INTO t_curriculum (id, curriculum) VALUES
  ('CURR-0001', 'Curriculum 01'),
  ('CURR-0002', 'Curriculum 02'),
  ('CURR-0003', 'Curriculum 03'),
  ('CURR-0004', 'Curriculum 04'),
  ('CURR-0005', 'Curriculum 05');

INSERT INTO t_customer_network (id, customer_network) VALUES
  ('NETW-0001', 'Rachael Marsh'),
  ('NETW-0002', 'Alexandria Pugh'),
  ('NETW-0003', 'Kimberly Smith'),
  ('NETW-0004', 'Andrew Sweeney'),
  ('NETW-0005', 'Dana Nguyen'),
  ('NETW-0006', 'Allen Saunders'),
  ('NETW-0007', 'Sean Green');

INSERT INTO t_dish (id, dish) VALUES
  ('DISH-0001', 'Dish 01'),
  ('DISH-0002', 'Dish 02'),
  ('DISH-0003', 'Dish 03'),
  ('DISH-0004', 'Dish 04'),
  ('DISH-0005', 'Dish 05'),
  ('DISH-0006', 'Dish 06');

INSERT INTO t_district_employee (id, district_employee) VALUES
  ('EMPL-0001', 'Carrie Vasquez'),
  ('EMPL-0002', 'Peter Montgomery'),
  ('EMPL-0003', 'Timothy Tucker'),
  ('EMPL-0004', 'Janice Johnston'),
  ('EMPL-0005', 'Cheryl Bradley');

INSERT INTO t_domestic_violence_victim_client (id, domestic_violence_victim_client) VALUES
  ('CLIE-0001', 'Mary Alvarez'),
  ('CLIE-0002', 'Brian Santiago'),
  ('CLIE-0003', 'Sean Green'),
  ('CLIE-0004', 'Rachel Davis');

INSERT INTO t_donor (id, donor) VALUES
  ('DONO-0001', 'Donor 01'),
  ('DONO-0002', 'Donor 02'),
  ('DONO-0003', 'Donor 03'),
  ('DONO-0004', 'Donor 04'),
  ('DONO-0005', 'Donor 05'),
  ('DONO-0006', 'Donor 06');

INSERT INTO t_donor_agent (id, donor_agent) VALUES
  ('AGEN-0001', 'Donor Agent 01'),
  ('AGEN-0002', 'Donor Agent 02'),
  ('AGEN-0003', 'Donor Agent 03'),
  ('AGEN-0004', 'Donor Agent 04'),
  ('AGEN-0005', 'Donor Agent 05'),
  ('AGEN-0006', 'Donor Agent 06'),
  ('AGEN-0007', 'Donor Agent 07');

INSERT INTO t_earth_observation_data (id, earth_observation_data) VALUES
  ('DATA-0001', 'Earth Observation Data 01'),
  ('DATA-0002', 'Earth Observation Data 02'),
  ('DATA-0003', 'Earth Observation Data 03'),
  ('DATA-0004', 'Earth Observation Data 04'),
  ('DATA-0005', 'Earth Observation Data 05'),
  ('DATA-0006', 'Earth Observation Data 06'),
  ('DATA-0007', 'Earth Observation Data 07');

INSERT INTO t_economic_goods_and_services (id, economic_goods_and_services) VALUES
  ('SERV-0001', 'Economic Goods And Services 01'),
  ('SERV-0002', 'Economic Goods And Services 02'),
  ('SERV-0003', 'Economic Goods And Services 03'),
  ('SERV-0004', 'Economic Goods And Services 04'),
  ('SERV-0005', 'Economic Goods And Services 05'),
  ('SERV-0006', 'Economic Goods And Services 06'),
  ('SERV-0007', 'Economic Goods And Services 07');

INSERT INTO t_energy_saving_component (id, energy_saving_component) VALUES
  ('COMP-0001', 'Energy Saving Component 01'),
  ('COMP-0002', 'Energy Saving Component 02'),
  ('COMP-0003', 'Energy Saving Component 03'),
  ('COMP-0004', 'Energy Saving Component 04'),
  ('COMP-0005', 'Energy Saving Component 05');

INSERT INTO t_ethical_investment_asset (id, ethical_investment_asset) VALUES
  ('ASSE-0001', 'Ethical Investment Asset 01'),
  ('ASSE-0002', 'Ethical Investment Asset 02'),
  ('ASSE-0003', 'Ethical Investment Asset 03'),
  ('ASSE-0004', 'Ethical Investment Asset 04');

INSERT INTO t_ethical_requirement (id, ethical_requirement) VALUES
  ('REQU-0001', 'Ethical Requirement 01'),
  ('REQU-0002', 'Ethical Requirement 02'),
  ('REQU-0003', 'Ethical Requirement 03'),
  ('REQU-0004', 'Ethical Requirement 04'),
  ('REQU-0005', 'Ethical Requirement 05'),
  ('REQU-0006', 'Ethical Requirement 06');

INSERT INTO t_evaluation_outcome (id, evaluation_outcome) VALUES
  ('OUTC-0001', 'Evaluation Outcome 01'),
  ('OUTC-0002', 'Evaluation Outcome 02'),
  ('OUTC-0003', 'Evaluation Outcome 03'),
  ('OUTC-0004', 'Evaluation Outcome 04'),
  ('OUTC-0005', 'Evaluation Outcome 05'),
  ('OUTC-0006', 'Evaluation Outcome 06'),
  ('OUTC-0007', 'Evaluation Outcome 07'),
  ('OUTC-0008', 'Evaluation Outcome 08');

INSERT INTO t_executive_director_function (id, executive_director_function) VALUES
  ('FUNC-0001', 'Executive Director Function 01'),
  ('FUNC-0002', 'Executive Director Function 02'),
  ('FUNC-0003', 'Executive Director Function 03'),
  ('FUNC-0004', 'Executive Director Function 04'),
  ('FUNC-0005', 'Executive Director Function 05');

INSERT INTO t_executive_execution_function (id, executive_execution_function) VALUES
  ('FUNC-0001', 'Executive Execution Function 01'),
  ('FUNC-0002', 'Executive Execution Function 02'),
  ('FUNC-0003', 'Executive Execution Function 03'),
  ('FUNC-0004', 'Executive Execution Function 04'),
  ('FUNC-0005', 'Executive Execution Function 05'),
  ('FUNC-0006', 'Executive Execution Function 06'),
  ('FUNC-0007', 'Executive Execution Function 07');

INSERT INTO t_executive_team (id, executive_team) VALUES
  ('TEAM-0001', 'Executive Team 01'),
  ('TEAM-0002', 'Executive Team 02'),
  ('TEAM-0003', 'Executive Team 03'),
  ('TEAM-0004', 'Executive Team 04');

INSERT INTO t_executive_team_member (id, executive_team_member) VALUES
  ('MEMB-0001', 'Executive Team Member 01'),
  ('MEMB-0002', 'Executive Team Member 02'),
  ('MEMB-0003', 'Executive Team Member 03'),
  ('MEMB-0004', 'Executive Team Member 04'),
  ('MEMB-0005', 'Executive Team Member 05');

INSERT INTO t_expedition_equipment (id, expedition_equipment) VALUES
  ('EQUI-0001', 'Expedition Equipment 01'),
  ('EQUI-0002', 'Expedition Equipment 02'),
  ('EQUI-0003', 'Expedition Equipment 03'),
  ('EQUI-0004', 'Expedition Equipment 04'),
  ('EQUI-0005', 'Expedition Equipment 05'),
  ('EQUI-0006', 'Expedition Equipment 06');

INSERT INTO t_expedition_participant (id, expedition_participant) VALUES
  ('PART-0001', 'Expedition Participant 01'),
  ('PART-0002', 'Expedition Participant 02'),
  ('PART-0003', 'Expedition Participant 03'),
  ('PART-0004', 'Expedition Participant 04'),
  ('PART-0005', 'Expedition Participant 05'),
  ('PART-0006', 'Expedition Participant 06'),
  ('PART-0007', 'Expedition Participant 07'),
  ('PART-0008', 'Expedition Participant 08');

INSERT INTO t_experienced_mentor (id, experienced_mentor) VALUES
  ('MENT-0001', 'Experienced Mentor 01'),
  ('MENT-0002', 'Experienced Mentor 02'),
  ('MENT-0003', 'Experienced Mentor 03'),
  ('MENT-0004', 'Experienced Mentor 04'),
  ('MENT-0005', 'Experienced Mentor 05');

INSERT INTO t_export_execution (id, export_execution) VALUES
  ('EXEC-0001', 'Export Execution 01'),
  ('EXEC-0002', 'Export Execution 02'),
  ('EXEC-0003', 'Export Execution 03'),
  ('EXEC-0004', 'Export Execution 04');

INSERT INTO t_exported_data_artifact (id, exported_data_artifact) VALUES
  ('ARTI-0001', 'Exported Data Artifact 01'),
  ('ARTI-0002', 'Exported Data Artifact 02'),
  ('ARTI-0003', 'Exported Data Artifact 03'),
  ('ARTI-0004', 'Exported Data Artifact 04'),
  ('ARTI-0005', 'Exported Data Artifact 05'),
  ('ARTI-0006', 'Exported Data Artifact 06');

INSERT INTO t_external_agency (id, external_agency) VALUES
  ('AGEN-0001', 'Prichard Committee for Academic Excellence'),
  ('AGEN-0002', 'Java Card Forum'),
  ('AGEN-0003', 'Standard Chartered'),
  ('AGEN-0004', 'American Express'),
  ('AGEN-0005', 'Atlantic Richfield'),
  ('AGEN-0006', 'SAP SE'),
  ('AGEN-0007', 'E3 Alliance');

INSERT INTO t_industrial_emission_source (id, industrial_emission_source) VALUES
  ('SOUR-0001', 'Industrial Emission Source 01'),
  ('SOUR-0002', 'Industrial Emission Source 02'),
  ('SOUR-0003', 'Industrial Emission Source 03'),
  ('SOUR-0004', 'Industrial Emission Source 04');

INSERT INTO t_information_capability (id, information_capability) VALUES
  ('CAPA-0001', 'Information Capability 01'),
  ('CAPA-0002', 'Information Capability 02'),
  ('CAPA-0003', 'Information Capability 03'),
  ('CAPA-0004', 'Information Capability 04'),
  ('CAPA-0005', 'Information Capability 05'),
  ('CAPA-0006', 'Information Capability 06'),
  ('CAPA-0007', 'Information Capability 07');

INSERT INTO t_information_item (id, information_item) VALUES
  ('ITEM-0001', 'Information Item 01'),
  ('ITEM-0002', 'Information Item 02'),
  ('ITEM-0003', 'Information Item 03'),
  ('ITEM-0004', 'Information Item 04'),
  ('ITEM-0005', 'Information Item 05'),
  ('ITEM-0006', 'Information Item 06'),
  ('ITEM-0007', 'Information Item 07'),
  ('ITEM-0008', 'Information Item 08');

INSERT INTO t_information_system (id, information_system) VALUES
  ('SYST-0001', 'Information System 01'),
  ('SYST-0002', 'Information System 02'),
  ('SYST-0003', 'Information System 03'),
  ('SYST-0004', 'Information System 04');

INSERT INTO t_inspection_event (id, inspection_event) VALUES
  ('EVEN-0001', 'Inspection Event 01'),
  ('EVEN-0002', 'Inspection Event 02'),
  ('EVEN-0003', 'Inspection Event 03'),
  ('EVEN-0004', 'Inspection Event 04');

INSERT INTO t_intelligence_output (id, intelligence_output) VALUES
  ('OUTP-0001', 'Intelligence Output 01'),
  ('OUTP-0002', 'Intelligence Output 02'),
  ('OUTP-0003', 'Intelligence Output 03'),
  ('OUTP-0004', 'Intelligence Output 04'),
  ('OUTP-0005', 'Intelligence Output 05'),
  ('OUTP-0006', 'Intelligence Output 06'),
  ('OUTP-0007', 'Intelligence Output 07'),
  ('OUTP-0008', 'Intelligence Output 08');

INSERT INTO t_interdisciplinary_education (id, interdisciplinary_education) VALUES
  ('EDUC-0001', 'Interdisciplinary Education 01'),
  ('EDUC-0002', 'Interdisciplinary Education 02'),
  ('EDUC-0003', 'Interdisciplinary Education 03'),
  ('EDUC-0004', 'Interdisciplinary Education 04'),
  ('EDUC-0005', 'Interdisciplinary Education 05'),
  ('EDUC-0006', 'Interdisciplinary Education 06'),
  ('EDUC-0007', 'Interdisciplinary Education 07'),
  ('EDUC-0008', 'Interdisciplinary Education 08');

INSERT INTO t_investment_choice_decision (id, investment_choice_decision) VALUES
  ('DECI-0001', 'Investment Choice Decision 01'),
  ('DECI-0002', 'Investment Choice Decision 02'),
  ('DECI-0003', 'Investment Choice Decision 03'),
  ('DECI-0004', 'Investment Choice Decision 04'),
  ('DECI-0005', 'Investment Choice Decision 05'),
  ('DECI-0006', 'Investment Choice Decision 06'),
  ('DECI-0007', 'Investment Choice Decision 07');

INSERT INTO t_investor_funding_situation (id, investor_funding_situation) VALUES
  ('SITU-0001', 'Investor Funding Situation 01'),
  ('SITU-0002', 'Investor Funding Situation 02'),
  ('SITU-0003', 'Investor Funding Situation 03'),
  ('SITU-0004', 'Investor Funding Situation 04'),
  ('SITU-0005', 'Investor Funding Situation 05');

INSERT INTO t_investor_relations_activity (id, investor_relations_activity) VALUES
  ('ACTI-0001', 'Investor Relations Activity 01'),
  ('ACTI-0002', 'Investor Relations Activity 02'),
  ('ACTI-0003', 'Investor Relations Activity 03'),
  ('ACTI-0004', 'Investor Relations Activity 04'),
  ('ACTI-0005', 'Investor Relations Activity 05'),
  ('ACTI-0006', 'Investor Relations Activity 06');

INSERT INTO t_keyframe_timeline (id, keyframe_timeline) VALUES
  ('TIME-0001', 'Keyframe Timeline 01'),
  ('TIME-0002', 'Keyframe Timeline 02'),
  ('TIME-0003', 'Keyframe Timeline 03'),
  ('TIME-0004', 'Keyframe Timeline 04'),
  ('TIME-0005', 'Keyframe Timeline 05'),
  ('TIME-0006', 'Keyframe Timeline 06'),
  ('TIME-0007', 'Keyframe Timeline 07');

INSERT INTO t_lateral_restraint_strap (id, lateral_restraint_strap) VALUES
  ('STRA-0001', 'Lateral Restraint Strap 01'),
  ('STRA-0002', 'Lateral Restraint Strap 02'),
  ('STRA-0003', 'Lateral Restraint Strap 03'),
  ('STRA-0004', 'Lateral Restraint Strap 04');

INSERT INTO t_law_enforcement_agency (id, law_enforcement_agency) VALUES
  ('AGEN-0001', 'TDS TODOS DATA SYSTEM AB'),
  ('AGEN-0002', 'Royal Dutch Shell'),
  ('AGEN-0003', 'Mondragon Corporation'),
  ('AGEN-0004', 'Educational Policy Improvement Center');

INSERT INTO t_marital_state (id, marital_state) VALUES
  ('STAT-0001', 'Marital State 01'),
  ('STAT-0002', 'Marital State 02'),
  ('STAT-0003', 'Marital State 03'),
  ('STAT-0004', 'Marital State 04'),
  ('STAT-0005', 'Marital State 05'),
  ('STAT-0006', 'Marital State 06'),
  ('STAT-0007', 'Marital State 07'),
  ('STAT-0008', 'Marital State 08');

INSERT INTO t_market_demand (id, market_demand) VALUES
  ('DEMA-0001', 'Market Demand 01'),
  ('DEMA-0002', 'Market Demand 02'),
  ('DEMA-0003', 'Market Demand 03'),
  ('DEMA-0004', 'Market Demand 04'),
  ('DEMA-0005', 'Market Demand 05'),
  ('DEMA-0006', 'Market Demand 06');

INSERT INTO t_market_trend (id, market_trend) VALUES
  ('TREN-0001', 'Market Trend 01'),
  ('TREN-0002', 'Market Trend 02'),
  ('TREN-0003', 'Market Trend 03'),
  ('TREN-0004', 'Market Trend 04'),
  ('TREN-0005', 'Market Trend 05');

INSERT INTO t_marketing_plan (id, marketing_plan) VALUES
  ('PLAN-0001', 'Marketing Plan 01'),
  ('PLAN-0002', 'Marketing Plan 02'),
  ('PLAN-0003', 'Marketing Plan 03'),
  ('PLAN-0004', 'Marketing Plan 04'),
  ('PLAN-0005', 'Marketing Plan 05'),
  ('PLAN-0006', 'Marketing Plan 06'),
  ('PLAN-0007', 'Marketing Plan 07');

INSERT INTO t_mathematical_concept (id, mathematical_concept) VALUES
  ('CONC-0001', 'Mathematical Concept 01'),
  ('CONC-0002', 'Mathematical Concept 02'),
  ('CONC-0003', 'Mathematical Concept 03'),
  ('CONC-0004', 'Mathematical Concept 04'),
  ('CONC-0005', 'Mathematical Concept 05'),
  ('CONC-0006', 'Mathematical Concept 06');

INSERT INTO t_measurement_parameter (id, measurement_parameter) VALUES
  ('PARA-0001', 'Measurement Parameter 01'),
  ('PARA-0002', 'Measurement Parameter 02'),
  ('PARA-0003', 'Measurement Parameter 03'),
  ('PARA-0004', 'Measurement Parameter 04'),
  ('PARA-0005', 'Measurement Parameter 05'),
  ('PARA-0006', 'Measurement Parameter 06'),
  ('PARA-0007', 'Measurement Parameter 07'),
  ('PARA-0008', 'Measurement Parameter 08');

INSERT INTO t_member (id, member) VALUES
  ('MEMB-0001', 'Member 01'),
  ('MEMB-0002', 'Member 02'),
  ('MEMB-0003', 'Member 03'),
  ('MEMB-0004', 'Member 04'),
  ('MEMB-0005', 'Member 05'),
  ('MEMB-0006', 'Member 06');

INSERT INTO t_membership (id, membership) VALUES
  ('MEMB-0001', 'Membership 01'),
  ('MEMB-0002', 'Membership 02'),
  ('MEMB-0003', 'Membership 03'),
  ('MEMB-0004', 'Membership 04'),
  ('MEMB-0005', 'Membership 05');

INSERT INTO t_minor_person (id, minor_person) VALUES
  ('PERS-0001', 'Lisa Myers'),
  ('PERS-0002', 'Elizabeth Bonilla'),
  ('PERS-0003', 'Sarah Villanueva'),
  ('PERS-0004', 'Laura Hart'),
  ('PERS-0005', 'Stephanie Collins');

INSERT INTO t_patient (id, patient) VALUES
  ('PATI-0001', 'Patient 01'),
  ('PATI-0002', 'Patient 02'),
  ('PATI-0003', 'Patient 03'),
  ('PATI-0004', 'Patient 04'),
  ('PATI-0005', 'Patient 05'),
  ('PATI-0006', 'Patient 06');

INSERT INTO t_pdf_document (id, pdf_document) VALUES
  ('DOCU-0001', 'Pdf Document 01'),
  ('DOCU-0002', 'Pdf Document 02'),
  ('DOCU-0003', 'Pdf Document 03'),
  ('DOCU-0004', 'Pdf Document 04'),
  ('DOCU-0005', 'Pdf Document 05'),
  ('DOCU-0006', 'Pdf Document 06');

INSERT INTO t_personal_data_record (id, personal_data_record) VALUES
  ('RECO-0001', 'Personal Data Record 01'),
  ('RECO-0002', 'Personal Data Record 02'),
  ('RECO-0003', 'Personal Data Record 03'),
  ('RECO-0004', 'Personal Data Record 04'),
  ('RECO-0005', 'Personal Data Record 05'),
  ('RECO-0006', 'Personal Data Record 06'),
  ('RECO-0007', 'Personal Data Record 07');

INSERT INTO t_policy_violation (id, policy_violation) VALUES
  ('VIOL-0001', 'Policy Violation 01'),
  ('VIOL-0002', 'Policy Violation 02'),
  ('VIOL-0003', 'Policy Violation 03'),
  ('VIOL-0004', 'Policy Violation 04'),
  ('VIOL-0005', 'Policy Violation 05');

INSERT INTO t_practice_management_topic (id, practice_management_topic) VALUES
  ('TOPI-0001', 'Practice Management Topic 01'),
  ('TOPI-0002', 'Practice Management Topic 02'),
  ('TOPI-0003', 'Practice Management Topic 03'),
  ('TOPI-0004', 'Practice Management Topic 04'),
  ('TOPI-0005', 'Practice Management Topic 05'),
  ('TOPI-0006', 'Practice Management Topic 06'),
  ('TOPI-0007', 'Practice Management Topic 07'),
  ('TOPI-0008', 'Practice Management Topic 08');

INSERT INTO t_practice_session (id, practice_session) VALUES
  ('SESS-0001', 'Practice Session 01'),
  ('SESS-0002', 'Practice Session 02'),
  ('SESS-0003', 'Practice Session 03'),
  ('SESS-0004', 'Practice Session 04'),
  ('SESS-0005', 'Practice Session 05');

INSERT INTO t_predicate_concept (id, predicate_concept) VALUES
  ('CONC-0001', 'Predicate Concept 01'),
  ('CONC-0002', 'Predicate Concept 02'),
  ('CONC-0003', 'Predicate Concept 03'),
  ('CONC-0004', 'Predicate Concept 04');

INSERT INTO t_prevalence_rate (id, prevalence_rate) VALUES
  ('RATE-0001', 'Prevalence Rate 01'),
  ('RATE-0002', 'Prevalence Rate 02'),
  ('RATE-0003', 'Prevalence Rate 03'),
  ('RATE-0004', 'Prevalence Rate 04'),
  ('RATE-0005', 'Prevalence Rate 05'),
  ('RATE-0006', 'Prevalence Rate 06'),
  ('RATE-0007', 'Prevalence Rate 07'),
  ('RATE-0008', 'Prevalence Rate 08');

INSERT INTO t_program_of_study (id, program_of_study) VALUES
  ('STUD-0001', 'Program Of Study 01'),
  ('STUD-0002', 'Program Of Study 02'),
  ('STUD-0003', 'Program Of Study 03'),
  ('STUD-0004', 'Program Of Study 04'),
  ('STUD-0005', 'Program Of Study 05'),
  ('STUD-0006', 'Program Of Study 06'),
  ('STUD-0007', 'Program Of Study 07');

INSERT INTO t_property_owner (id, property_owner) VALUES
  ('OWNE-0001', 'Stephanie Collins'),
  ('OWNE-0002', 'Rebekah Mueller'),
  ('OWNE-0003', 'Robert Pace'),
  ('OWNE-0004', 'Jennifer Morales'),
  ('OWNE-0005', 'Fernando Boyd');

INSERT INTO t_public_information_officer (id, public_information_officer) VALUES
  ('OFFI-0001', 'Public Information Officer 01'),
  ('OFFI-0002', 'Public Information Officer 02'),
  ('OFFI-0003', 'Public Information Officer 03'),
  ('OFFI-0004', 'Public Information Officer 04');

INSERT INTO t_qo_s_constraint (id, qo_s_constraint) VALUES
  ('CONS-0001', 'Qo S Constraint 01'),
  ('CONS-0002', 'Qo S Constraint 02'),
  ('CONS-0003', 'Qo S Constraint 03'),
  ('CONS-0004', 'Qo S Constraint 04'),
  ('CONS-0005', 'Qo S Constraint 05');

INSERT INTO t_quality_improvement_framework (id, quality_improvement_framework) VALUES
  ('FRAM-0001', 'Quality Improvement Framework 01'),
  ('FRAM-0002', 'Quality Improvement Framework 02'),
  ('FRAM-0003', 'Quality Improvement Framework 03'),
  ('FRAM-0004', 'Quality Improvement Framework 04'),
  ('FRAM-0005', 'Quality Improvement Framework 05'),
  ('FRAM-0006', 'Quality Improvement Framework 06');

INSERT INTO t_quantitative_analytic_tool (id, quantitative_analytic_tool) VALUES
  ('TOOL-0001', 'Quantitative Analytic Tool 01'),
  ('TOOL-0002', 'Quantitative Analytic Tool 02'),
  ('TOOL-0003', 'Quantitative Analytic Tool 03'),
  ('TOOL-0004', 'Quantitative Analytic Tool 04'),
  ('TOOL-0005', 'Quantitative Analytic Tool 05');

INSERT INTO t_raffle_conducting_activity (id, raffle_conducting_activity) VALUES
  ('ACTI-0001', 'Raffle Conducting Activity 01'),
  ('ACTI-0002', 'Raffle Conducting Activity 02'),
  ('ACTI-0003', 'Raffle Conducting Activity 03'),
  ('ACTI-0004', 'Raffle Conducting Activity 04'),
  ('ACTI-0005', 'Raffle Conducting Activity 05'),
  ('ACTI-0006', 'Raffle Conducting Activity 06'),
  ('ACTI-0007', 'Raffle Conducting Activity 07');

INSERT INTO t_receiving_facility_staff (id, receiving_facility_staff) VALUES
  ('STAF-0001', 'Receiving Facility Staff 01'),
  ('STAF-0002', 'Receiving Facility Staff 02'),
  ('STAF-0003', 'Receiving Facility Staff 03'),
  ('STAF-0004', 'Receiving Facility Staff 04'),
  ('STAF-0005', 'Receiving Facility Staff 05'),
  ('STAF-0006', 'Receiving Facility Staff 06');

INSERT INTO t_recovered_state (id, recovered_state) VALUES
  ('STAT-0001', 'Recovered State 01'),
  ('STAT-0002', 'Recovered State 02'),
  ('STAT-0003', 'Recovered State 03'),
  ('STAT-0004', 'Recovered State 04'),
  ('STAT-0005', 'Recovered State 05');

INSERT INTO t_service_management_process (id, service_management_process) VALUES
  ('PROC-0001', 'Service Management Process 01'),
  ('PROC-0002', 'Service Management Process 02'),
  ('PROC-0003', 'Service Management Process 03'),
  ('PROC-0004', 'Service Management Process 04'),
  ('PROC-0005', 'Service Management Process 05');

INSERT INTO t_service_performance_metric (id, service_performance_metric) VALUES
  ('METR-0001', 'Service Performance Metric 01'),
  ('METR-0002', 'Service Performance Metric 02'),
  ('METR-0003', 'Service Performance Metric 03'),
  ('METR-0004', 'Service Performance Metric 04'),
  ('METR-0005', 'Service Performance Metric 05');

INSERT INTO t_service_provider (id, service_provider) VALUES
  ('PROV-0001', 'Service Provider 01'),
  ('PROV-0002', 'Service Provider 02'),
  ('PROV-0003', 'Service Provider 03'),
  ('PROV-0004', 'Service Provider 04');

INSERT INTO t_service_provision_activity (id, service_provision_activity) VALUES
  ('ACTI-0001', 'Service Provision Activity 01'),
  ('ACTI-0002', 'Service Provision Activity 02'),
  ('ACTI-0003', 'Service Provision Activity 03'),
  ('ACTI-0004', 'Service Provision Activity 04'),
  ('ACTI-0005', 'Service Provision Activity 05'),
  ('ACTI-0006', 'Service Provision Activity 06'),
  ('ACTI-0007', 'Service Provision Activity 07');

INSERT INTO t_service_request (id, service_request) VALUES
  ('REQU-0001', 'Service Request 01'),
  ('REQU-0002', 'Service Request 02'),
  ('REQU-0003', 'Service Request 03'),
  ('REQU-0004', 'Service Request 04'),
  ('REQU-0005', 'Service Request 05');

INSERT INTO t_significance_level (id, significance_level) VALUES
  ('LEVE-0001', 'Significance Level 01'),
  ('LEVE-0002', 'Significance Level 02'),
  ('LEVE-0003', 'Significance Level 03'),
  ('LEVE-0004', 'Significance Level 04'),
  ('LEVE-0005', 'Significance Level 05'),
  ('LEVE-0006', 'Significance Level 06');

INSERT INTO t_simulation_software (id, simulation_software) VALUES
  ('SOFT-0001', 'Simulation Software 01'),
  ('SOFT-0002', 'Simulation Software 02'),
  ('SOFT-0003', 'Simulation Software 03'),
  ('SOFT-0004', 'Simulation Software 04'),
  ('SOFT-0005', 'Simulation Software 05'),
  ('SOFT-0006', 'Simulation Software 06'),
  ('SOFT-0007', 'Simulation Software 07'),
  ('SOFT-0008', 'Simulation Software 08');

INSERT INTO t_slavic_linguistic_root (id, slavic_linguistic_root) VALUES
  ('ROOT-0001', 'Slavic Linguistic Root 01'),
  ('ROOT-0002', 'Slavic Linguistic Root 02'),
  ('ROOT-0003', 'Slavic Linguistic Root 03'),
  ('ROOT-0004', 'Slavic Linguistic Root 04'),
  ('ROOT-0005', 'Slavic Linguistic Root 05'),
  ('ROOT-0006', 'Slavic Linguistic Root 06'),
  ('ROOT-0007', 'Slavic Linguistic Root 07'),
  ('ROOT-0008', 'Slavic Linguistic Root 08');

INSERT INTO t_social_harmony_restoration (id, social_harmony_restoration) VALUES
  ('REST-0001', 'Social Harmony Restoration 01'),
  ('REST-0002', 'Social Harmony Restoration 02'),
  ('REST-0003', 'Social Harmony Restoration 03'),
  ('REST-0004', 'Social Harmony Restoration 04'),
  ('REST-0005', 'Social Harmony Restoration 05');

INSERT INTO t_social_media_account_management_process_definition (id, social_media_account_management_process) VALUES
  ('DEFI-0001', 'Social Media Account Management Process 01'),
  ('DEFI-0002', 'Social Media Account Management Process 02'),
  ('DEFI-0003', 'Social Media Account Management Process 03'),
  ('DEFI-0004', 'Social Media Account Management Process 04'),
  ('DEFI-0005', 'Social Media Account Management Process 05'),
  ('DEFI-0006', 'Social Media Account Management Process 06');

INSERT INTO t_social_networking_service_type (id, social_networking_service_type) VALUES
  ('TYPE-0001', 'Social Networking Service Type 01'),
  ('TYPE-0002', 'Social Networking Service Type 02'),
  ('TYPE-0003', 'Social Networking Service Type 03'),
  ('TYPE-0004', 'Social Networking Service Type 04'),
  ('TYPE-0005', 'Social Networking Service Type 05');

INSERT INTO t_social_services_department (id, social_services_department) VALUES
  ('DEPA-0001', 'Social Services Department 01'),
  ('DEPA-0002', 'Social Services Department 02'),
  ('DEPA-0003', 'Social Services Department 03'),
  ('DEPA-0004', 'Social Services Department 04'),
  ('DEPA-0005', 'Social Services Department 05'),
  ('DEPA-0006', 'Social Services Department 06');

INSERT INTO t_social_tag (id, social_tag) VALUES
  ('TAG-0001', 'Social Tag 01'),
  ('TAG-0002', 'Social Tag 02'),
  ('TAG-0003', 'Social Tag 03'),
  ('TAG-0004', 'Social Tag 04'),
  ('TAG-0005', 'Social Tag 05'),
  ('TAG-0006', 'Social Tag 06');

INSERT INTO t_software_interface (id, software_interface) VALUES
  ('INTE-0001', 'Software Interface 01'),
  ('INTE-0002', 'Software Interface 02'),
  ('INTE-0003', 'Software Interface 03'),
  ('INTE-0004', 'Software Interface 04'),
  ('INTE-0005', 'Software Interface 05');

INSERT INTO t_subject_concept (id, subject_concept) VALUES
  ('CONC-0001', 'Subject Concept 01'),
  ('CONC-0002', 'Subject Concept 02'),
  ('CONC-0003', 'Subject Concept 03'),
  ('CONC-0004', 'Subject Concept 04'),
  ('CONC-0005', 'Subject Concept 05');

INSERT INTO t_target_material (id, target_material) VALUES
  ('MATE-0001', 'Target Material 01'),
  ('MATE-0002', 'Target Material 02'),
  ('MATE-0003', 'Target Material 03'),
  ('MATE-0004', 'Target Material 04');

INSERT INTO t_taxi_ride_process (id, taxi_ride_process) VALUES
  ('PROC-0001', 'Taxi Ride Process 01'),
  ('PROC-0002', 'Taxi Ride Process 02'),
  ('PROC-0003', 'Taxi Ride Process 03'),
  ('PROC-0004', 'Taxi Ride Process 04'),
  ('PROC-0005', 'Taxi Ride Process 05'),
  ('PROC-0006', 'Taxi Ride Process 06'),
  ('PROC-0007', 'Taxi Ride Process 07');

INSERT INTO t_team_function (id, team_function) VALUES
  ('FUNC-0001', 'Team Function 01'),
  ('FUNC-0002', 'Team Function 02'),
  ('FUNC-0003', 'Team Function 03'),
  ('FUNC-0004', 'Team Function 04'),
  ('FUNC-0005', 'Team Function 05');

INSERT INTO t_tele_sales_activity (id, tele_sales_activity) VALUES
  ('ACTI-0001', 'Tele Sales Activity 01'),
  ('ACTI-0002', 'Tele Sales Activity 02'),
  ('ACTI-0003', 'Tele Sales Activity 03'),
  ('ACTI-0004', 'Tele Sales Activity 04'),
  ('ACTI-0005', 'Tele Sales Activity 05'),
  ('ACTI-0006', 'Tele Sales Activity 06'),
  ('ACTI-0007', 'Tele Sales Activity 07'),
  ('ACTI-0008', 'Tele Sales Activity 08');

INSERT INTO t_telescope_instrument_artifact (id, telescope_instrument_artifact) VALUES
  ('ARTI-0001', 'Telescope Instrument Artifact 01'),
  ('ARTI-0002', 'Telescope Instrument Artifact 02'),
  ('ARTI-0003', 'Telescope Instrument Artifact 03'),
  ('ARTI-0004', 'Telescope Instrument Artifact 04'),
  ('ARTI-0005', 'Telescope Instrument Artifact 05'),
  ('ARTI-0006', 'Telescope Instrument Artifact 06');

INSERT INTO t_test_statistic (id, test_statistic) VALUES
  ('STAT-0001', 'Test Statistic 01'),
  ('STAT-0002', 'Test Statistic 02'),
  ('STAT-0003', 'Test Statistic 03'),
  ('STAT-0004', 'Test Statistic 04');

INSERT INTO t_threat_information (id, threat_information) VALUES
  ('INFO-0001', 'Threat Information 01'),
  ('INFO-0002', 'Threat Information 02'),
  ('INFO-0003', 'Threat Information 03'),
  ('INFO-0004', 'Threat Information 04'),
  ('INFO-0005', 'Threat Information 05');

INSERT INTO t_agenda_subject (id, agenda_subject) VALUES
  ('SUBJ-0001', 'Agenda Subject 01'),
  ('SUBJ-0002', 'Agenda Subject 02'),
  ('SUBJ-0003', 'Agenda Subject 03'),
  ('SUBJ-0004', 'Agenda Subject 04'),
  ('SUBJ-0005', 'Agenda Subject 05'),
  ('SUBJ-0006', 'Agenda Subject 06');

INSERT INTO t_approval_recommendation (id, approval_recommendation) VALUES
  ('RECO-0001', 'Approval Recommendation 01'),
  ('RECO-0002', 'Approval Recommendation 02'),
  ('RECO-0003', 'Approval Recommendation 03'),
  ('RECO-0004', 'Approval Recommendation 04'),
  ('RECO-0005', 'Approval Recommendation 05'),
  ('RECO-0006', 'Approval Recommendation 06');

INSERT INTO t_assessment_method (id, assessment_method) VALUES
  ('METH-0001', 'Assessment Method 01'),
  ('METH-0002', 'Assessment Method 02'),
  ('METH-0003', 'Assessment Method 03'),
  ('METH-0004', 'Assessment Method 04'),
  ('METH-0005', 'Assessment Method 05'),
  ('METH-0006', 'Assessment Method 06'),
  ('METH-0007', 'Assessment Method 07'),
  ('METH-0008', 'Assessment Method 08');

INSERT INTO t_assessment_participant (id, assessment_participant) VALUES
  ('PART-0001', 'Assessment Participant 01'),
  ('PART-0002', 'Assessment Participant 02'),
  ('PART-0003', 'Assessment Participant 03'),
  ('PART-0004', 'Assessment Participant 04'),
  ('PART-0005', 'Assessment Participant 05'),
  ('PART-0006', 'Assessment Participant 06'),
  ('PART-0007', 'Assessment Participant 07'),
  ('PART-0008', 'Assessment Participant 08');

INSERT INTO t_athletic_monitoring_activity (id, athletic_monitoring_activity) VALUES
  ('ACTI-0001', 'Athletic Monitoring Activity 01'),
  ('ACTI-0002', 'Athletic Monitoring Activity 02'),
  ('ACTI-0003', 'Athletic Monitoring Activity 03'),
  ('ACTI-0004', 'Athletic Monitoring Activity 04'),
  ('ACTI-0005', 'Athletic Monitoring Activity 05');

INSERT INTO t_audit_objective (id, audit_objective) VALUES
  ('OBJE-0001', 'Audit Objective 01'),
  ('OBJE-0002', 'Audit Objective 02'),
  ('OBJE-0003', 'Audit Objective 03'),
  ('OBJE-0004', 'Audit Objective 04');

INSERT INTO t_authorized_entity (id, authorized_entity) VALUES
  ('ENTI-0001', 'Authorized Entity 01'),
  ('ENTI-0002', 'Authorized Entity 02'),
  ('ENTI-0003', 'Authorized Entity 03'),
  ('ENTI-0004', 'Authorized Entity 04'),
  ('ENTI-0005', 'Authorized Entity 05'),
  ('ENTI-0006', 'Authorized Entity 06'),
  ('ENTI-0007', 'Authorized Entity 07'),
  ('ENTI-0008', 'Authorized Entity 08');

INSERT INTO t_autohemotherapy_procedure (id, autohemotherapy_procedure) VALUES
  ('PROC-0001', 'Autohemotherapy Procedure 01'),
  ('PROC-0002', 'Autohemotherapy Procedure 02'),
  ('PROC-0003', 'Autohemotherapy Procedure 03'),
  ('PROC-0004', 'Autohemotherapy Procedure 04'),
  ('PROC-0005', 'Autohemotherapy Procedure 05'),
  ('PROC-0006', 'Autohemotherapy Procedure 06'),
  ('PROC-0007', 'Autohemotherapy Procedure 07'),
  ('PROC-0008', 'Autohemotherapy Procedure 08');

INSERT INTO t_automated_system (id, automated_system) VALUES
  ('SYST-0001', 'Automated System 01'),
  ('SYST-0002', 'Automated System 02'),
  ('SYST-0003', 'Automated System 03'),
  ('SYST-0004', 'Automated System 04'),
  ('SYST-0005', 'Automated System 05'),
  ('SYST-0006', 'Automated System 06'),
  ('SYST-0007', 'Automated System 07'),
  ('SYST-0008', 'Automated System 08');

INSERT INTO t_available_topping (id, available_topping) VALUES
  ('TOPP-0001', 'Available Topping 01'),
  ('TOPP-0002', 'Available Topping 02'),
  ('TOPP-0003', 'Available Topping 03'),
  ('TOPP-0004', 'Available Topping 04');

INSERT INTO t_board_member (id, board_member) VALUES
  ('MEMB-0001', 'Board Member 01'),
  ('MEMB-0002', 'Board Member 02'),
  ('MEMB-0003', 'Board Member 03'),
  ('MEMB-0004', 'Board Member 04'),
  ('MEMB-0005', 'Board Member 05');

INSERT INTO t_board_of_assessors_meeting (id, board_of_assessors_meeting) VALUES
  ('MEET-0001', 'Board Of Assessors Meeting 01'),
  ('MEET-0002', 'Board Of Assessors Meeting 02'),
  ('MEET-0003', 'Board Of Assessors Meeting 03'),
  ('MEET-0004', 'Board Of Assessors Meeting 04'),
  ('MEET-0005', 'Board Of Assessors Meeting 05'),
  ('MEET-0006', 'Board Of Assessors Meeting 06');

INSERT INTO t_board_of_equalization (id, board_of_equalization) VALUES
  ('EQUA-0001', 'Board Of Equalization 01'),
  ('EQUA-0002', 'Board Of Equalization 02'),
  ('EQUA-0003', 'Board Of Equalization 03'),
  ('EQUA-0004', 'Board Of Equalization 04');

INSERT INTO t_building_floor_structure (id, building_floor_structure) VALUES
  ('STRU-0001', 'Building Floor Structure 01'),
  ('STRU-0002', 'Building Floor Structure 02'),
  ('STRU-0003', 'Building Floor Structure 03'),
  ('STRU-0004', 'Building Floor Structure 04'),
  ('STRU-0005', 'Building Floor Structure 05'),
  ('STRU-0006', 'Building Floor Structure 06'),
  ('STRU-0007', 'Building Floor Structure 07'),
  ('STRU-0008', 'Building Floor Structure 08');

INSERT INTO t_cyber_security_incident (id, cyber_security_incident) VALUES
  ('INCI-0001', 'Cyber Security Incident 01'),
  ('INCI-0002', 'Cyber Security Incident 02'),
  ('INCI-0003', 'Cyber Security Incident 03'),
  ('INCI-0004', 'Cyber Security Incident 04'),
  ('INCI-0005', 'Cyber Security Incident 05'),
  ('INCI-0006', 'Cyber Security Incident 06'),
  ('INCI-0007', 'Cyber Security Incident 07'),
  ('INCI-0008', 'Cyber Security Incident 08');

INSERT INTO t_data_collection_process (id, data_collection_process) VALUES
  ('PROC-0001', 'Data Collection Process 01'),
  ('PROC-0002', 'Data Collection Process 02'),
  ('PROC-0003', 'Data Collection Process 03'),
  ('PROC-0004', 'Data Collection Process 04'),
  ('PROC-0005', 'Data Collection Process 05'),
  ('PROC-0006', 'Data Collection Process 06'),
  ('PROC-0007', 'Data Collection Process 07'),
  ('PROC-0008', 'Data Collection Process 08');

INSERT INTO t_data_input (id, data_input) VALUES
  ('INPU-0001', 'Data Input 01'),
  ('INPU-0002', 'Data Input 02'),
  ('INPU-0003', 'Data Input 03'),
  ('INPU-0004', 'Data Input 04'),
  ('INPU-0005', 'Data Input 05'),
  ('INPU-0006', 'Data Input 06'),
  ('INPU-0007', 'Data Input 07'),
  ('INPU-0008', 'Data Input 08');

INSERT INTO t_decision_making_process_definition (id) VALUES
  ('DEFI-0001'),
  ('DEFI-0002'),
  ('DEFI-0003'),
  ('DEFI-0004'),
  ('DEFI-0005'),
  ('DEFI-0006'),
  ('DEFI-0007');

INSERT INTO t_degraded_system_condition (id, degraded_system_condition) VALUES
  ('COND-0001', 'Degraded System Condition 01'),
  ('COND-0002', 'Degraded System Condition 02'),
  ('COND-0003', 'Degraded System Condition 03'),
  ('COND-0004', 'Degraded System Condition 04'),
  ('COND-0005', 'Degraded System Condition 05'),
  ('COND-0006', 'Degraded System Condition 06');

INSERT INTO t_departing_employee (id, departing_employee) VALUES
  ('EMPL-0001', 'Brooke Estrada'),
  ('EMPL-0002', 'Brian Hamilton'),
  ('EMPL-0003', 'Michelle Kelley'),
  ('EMPL-0004', 'April Snyder'),
  ('EMPL-0005', 'Brian Hamilton');

INSERT INTO t_geographic_region (id, geographic_region) VALUES
  ('REGI-0001', 'Geographic Region 01'),
  ('REGI-0002', 'Geographic Region 02'),
  ('REGI-0003', 'Geographic Region 03'),
  ('REGI-0004', 'Geographic Region 04'),
  ('REGI-0005', 'Geographic Region 05'),
  ('REGI-0006', 'Geographic Region 06'),
  ('REGI-0007', 'Geographic Region 07'),
  ('REGI-0008', 'Geographic Region 08');

INSERT INTO t_governance_function (id, governance_function) VALUES
  ('FUNC-0001', 'Governance Function 01'),
  ('FUNC-0002', 'Governance Function 02'),
  ('FUNC-0003', 'Governance Function 03'),
  ('FUNC-0004', 'Governance Function 04'),
  ('FUNC-0005', 'Governance Function 05'),
  ('FUNC-0006', 'Governance Function 06');

INSERT INTO t_h_s_s_s_e_q__situation (id, h_s_s_s_e_q__situation) VALUES
  ('SITU-0001', 'H S S S E Q  Situation 01'),
  ('SITU-0002', 'H S S S E Q  Situation 02'),
  ('SITU-0003', 'H S S S E Q  Situation 03'),
  ('SITU-0004', 'H S S S E Q  Situation 04');

INSERT INTO t_health_care_summary (id, health_care_summary) VALUES
  ('SUMM-0001', 'Health Care Summary 01'),
  ('SUMM-0002', 'Health Care Summary 02'),
  ('SUMM-0003', 'Health Care Summary 03'),
  ('SUMM-0004', 'Health Care Summary 04'),
  ('SUMM-0005', 'Health Care Summary 05');

INSERT INTO t_health_standard_compliance (id, health_standard_compliance) VALUES
  ('COMP-0001', 'Health Standard Compliance 01'),
  ('COMP-0002', 'Health Standard Compliance 02'),
  ('COMP-0003', 'Health Standard Compliance 03'),
  ('COMP-0004', 'Health Standard Compliance 04'),
  ('COMP-0005', 'Health Standard Compliance 05');

INSERT INTO t_healthcare_agent (id, healthcare_agent) VALUES
  ('AGEN-0001', 'Healthcare Agent 01'),
  ('AGEN-0002', 'Healthcare Agent 02'),
  ('AGEN-0003', 'Healthcare Agent 03'),
  ('AGEN-0004', 'Healthcare Agent 04');

INSERT INTO t_law_enforcement_personnel (id, law_enforcement_personnel) VALUES
  ('PERS-0001', 'Law Enforcement Personnel 01'),
  ('PERS-0002', 'Law Enforcement Personnel 02'),
  ('PERS-0003', 'Law Enforcement Personnel 03'),
  ('PERS-0004', 'Law Enforcement Personnel 04'),
  ('PERS-0005', 'Law Enforcement Personnel 05'),
  ('PERS-0006', 'Law Enforcement Personnel 06'),
  ('PERS-0007', 'Law Enforcement Personnel 07');

INSERT INTO t_lecture_notes (id, lecture_notes) VALUES
  ('NOTE-0001', 'Lecture Notes 01'),
  ('NOTE-0002', 'Lecture Notes 02'),
  ('NOTE-0003', 'Lecture Notes 03'),
  ('NOTE-0004', 'Lecture Notes 04');

INSERT INTO t_legal_advertisement_activity (id, legal_advertisement_activity) VALUES
  ('ACTI-0001', 'Legal Advertisement Activity 01'),
  ('ACTI-0002', 'Legal Advertisement Activity 02'),
  ('ACTI-0003', 'Legal Advertisement Activity 03'),
  ('ACTI-0004', 'Legal Advertisement Activity 04'),
  ('ACTI-0005', 'Legal Advertisement Activity 05'),
  ('ACTI-0006', 'Legal Advertisement Activity 06'),
  ('ACTI-0007', 'Legal Advertisement Activity 07'),
  ('ACTI-0008', 'Legal Advertisement Activity 08');

INSERT INTO t_legal_entity_or_person (id, legal_entity_or_person) VALUES
  ('PERS-0001', 'Mary Alvarez'),
  ('PERS-0002', 'Casey Vasquez'),
  ('PERS-0003', 'Dana Nguyen'),
  ('PERS-0004', 'Misty Ramsey'),
  ('PERS-0005', 'Brian Hamilton'),
  ('PERS-0006', 'Jorge Sullivan');

INSERT INTO t_legal_professional (id, legal_professional) VALUES
  ('PROF-0001', 'Legal Professional 01'),
  ('PROF-0002', 'Legal Professional 02'),
  ('PROF-0003', 'Legal Professional 03'),
  ('PROF-0004', 'Legal Professional 04');

INSERT INTO t_legal_tech_solution_lab (id, legal_tech_solution_lab) VALUES
  ('LAB-0001', 'Legal Tech Solution Lab 01'),
  ('LAB-0002', 'Legal Tech Solution Lab 02'),
  ('LAB-0003', 'Legal Tech Solution Lab 03'),
  ('LAB-0004', 'Legal Tech Solution Lab 04'),
  ('LAB-0005', 'Legal Tech Solution Lab 05');

INSERT INTO t_legislative_department (id, legislative_department) VALUES
  ('DEPA-0001', 'Legislative Department 01'),
  ('DEPA-0002', 'Legislative Department 02'),
  ('DEPA-0003', 'Legislative Department 03'),
  ('DEPA-0004', 'Legislative Department 04'),
  ('DEPA-0005', 'Legislative Department 05'),
  ('DEPA-0006', 'Legislative Department 06'),
  ('DEPA-0007', 'Legislative Department 07');

INSERT INTO t_lifeguard_staff (id, lifeguard_staff) VALUES
  ('STAF-0001', 'Lifeguard Staff 01'),
  ('STAF-0002', 'Lifeguard Staff 02'),
  ('STAF-0003', 'Lifeguard Staff 03'),
  ('STAF-0004', 'Lifeguard Staff 04'),
  ('STAF-0005', 'Lifeguard Staff 05');

INSERT INTO t_local_authority (id, local_authority) VALUES
  ('AUTH-0001', 'Local Authority 01'),
  ('AUTH-0002', 'Local Authority 02'),
  ('AUTH-0003', 'Local Authority 03'),
  ('AUTH-0004', 'Local Authority 04'),
  ('AUTH-0005', 'Local Authority 05'),
  ('AUTH-0006', 'Local Authority 06');

INSERT INTO t_login_credentials (id, login_credentials) VALUES
  ('CRED-0001', 'Login Credentials 01'),
  ('CRED-0002', 'Login Credentials 02'),
  ('CRED-0003', 'Login Credentials 03'),
  ('CRED-0004', 'Login Credentials 04');

INSERT INTO t_machine_learning_model (id, machine_learning_model) VALUES
  ('MODE-0001', 'Machine Learning Model 01'),
  ('MODE-0002', 'Machine Learning Model 02'),
  ('MODE-0003', 'Machine Learning Model 03'),
  ('MODE-0004', 'Machine Learning Model 04'),
  ('MODE-0005', 'Machine Learning Model 05'),
  ('MODE-0006', 'Machine Learning Model 06');

INSERT INTO t_mail_drop_location (id, mail_drop_location) VALUES
  ('LOCA-0001', 'Mail Drop Location 01'),
  ('LOCA-0002', 'Mail Drop Location 02'),
  ('LOCA-0003', 'Mail Drop Location 03'),
  ('LOCA-0004', 'Mail Drop Location 04'),
  ('LOCA-0005', 'Mail Drop Location 05'),
  ('LOCA-0006', 'Mail Drop Location 06'),
  ('LOCA-0007', 'Mail Drop Location 07'),
  ('LOCA-0008', 'Mail Drop Location 08');

INSERT INTO t_malnourished_child (id, malnourished_child) VALUES
  ('CHIL-0001', 'Malnourished Child 01'),
  ('CHIL-0002', 'Malnourished Child 02'),
  ('CHIL-0003', 'Malnourished Child 03'),
  ('CHIL-0004', 'Malnourished Child 04'),
  ('CHIL-0005', 'Malnourished Child 05'),
  ('CHIL-0006', 'Malnourished Child 06'),
  ('CHIL-0007', 'Malnourished Child 07');

INSERT INTO t_monetary_amount (id, monetary_amount) VALUES
  ('AMOU-0001', 'Monetary Amount 01'),
  ('AMOU-0002', 'Monetary Amount 02'),
  ('AMOU-0003', 'Monetary Amount 03'),
  ('AMOU-0004', 'Monetary Amount 04'),
  ('AMOU-0005', 'Monetary Amount 05');

INSERT INTO t_monitoring_protocol (id, monitoring_protocol) VALUES
  ('PROT-0001', 'Monitoring Protocol 01'),
  ('PROT-0002', 'Monitoring Protocol 02'),
  ('PROT-0003', 'Monitoring Protocol 03'),
  ('PROT-0004', 'Monitoring Protocol 04'),
  ('PROT-0005', 'Monitoring Protocol 05'),
  ('PROT-0006', 'Monitoring Protocol 06'),
  ('PROT-0007', 'Monitoring Protocol 07');

INSERT INTO t_municipal_pool_facility (id, municipal_pool_facility) VALUES
  ('FACI-0001', 'Municipal Pool Facility 01'),
  ('FACI-0002', 'Municipal Pool Facility 02'),
  ('FACI-0003', 'Municipal Pool Facility 03'),
  ('FACI-0004', 'Municipal Pool Facility 04'),
  ('FACI-0005', 'Municipal Pool Facility 05');

INSERT INTO t_network_infrastructure (id, network_infrastructure) VALUES
  ('INFR-0001', 'Network Infrastructure 01'),
  ('INFR-0002', 'Network Infrastructure 02'),
  ('INFR-0003', 'Network Infrastructure 03'),
  ('INFR-0004', 'Network Infrastructure 04');

INSERT INTO t_network_provider (id, network_provider) VALUES
  ('PROV-0001', 'Network Provider 01'),
  ('PROV-0002', 'Network Provider 02'),
  ('PROV-0003', 'Network Provider 03'),
  ('PROV-0004', 'Network Provider 04'),
  ('PROV-0005', 'Network Provider 05'),
  ('PROV-0006', 'Network Provider 06'),
  ('PROV-0007', 'Network Provider 07'),
  ('PROV-0008', 'Network Provider 08');

INSERT INTO t_network_resource (id, network_resource) VALUES
  ('RESO-0001', 'Network Resource 01'),
  ('RESO-0002', 'Network Resource 02'),
  ('RESO-0003', 'Network Resource 03'),
  ('RESO-0004', 'Network Resource 04'),
  ('RESO-0005', 'Network Resource 05'),
  ('RESO-0006', 'Network Resource 06'),
  ('RESO-0007', 'Network Resource 07'),
  ('RESO-0008', 'Network Resource 08');

INSERT INTO t_network_scrubbing_center (id, network_scrubbing_center) VALUES
  ('CENT-0001', 'Network Scrubbing Center 01'),
  ('CENT-0002', 'Network Scrubbing Center 02'),
  ('CENT-0003', 'Network Scrubbing Center 03'),
  ('CENT-0004', 'Network Scrubbing Center 04'),
  ('CENT-0005', 'Network Scrubbing Center 05'),
  ('CENT-0006', 'Network Scrubbing Center 06'),
  ('CENT-0007', 'Network Scrubbing Center 07'),
  ('CENT-0008', 'Network Scrubbing Center 08');

INSERT INTO t_non_diesel_powered_vehicle (id, non_diesel_powered_vehicle) VALUES
  ('VEHI-0001', 'Non Diesel Powered Vehicle 01'),
  ('VEHI-0002', 'Non Diesel Powered Vehicle 02'),
  ('VEHI-0003', 'Non Diesel Powered Vehicle 03'),
  ('VEHI-0004', 'Non Diesel Powered Vehicle 04'),
  ('VEHI-0005', 'Non Diesel Powered Vehicle 05'),
  ('VEHI-0006', 'Non Diesel Powered Vehicle 06'),
  ('VEHI-0007', 'Non Diesel Powered Vehicle 07');

INSERT INTO t_nonprofit_organization (id, nonprofit_organization) VALUES
  ('ORGA-0001', 'Microsoft Corporation'),
  ('ORGA-0002', 'Diners Club International Ltd.'),
  ('ORGA-0003', 'American International Group'),
  ('ORGA-0004', 'Aspire Public Schools'),
  ('ORGA-0005', 'Education Equality Project'),
  ('ORGA-0006', 'Senseonics Holdings Inc.'),
  ('ORGA-0007', 'Microsoft Corporation');

INSERT INTO t_referral_process (id, referral_process) VALUES
  ('PROC-0001', 'Referral Process 01'),
  ('PROC-0002', 'Referral Process 02'),
  ('PROC-0003', 'Referral Process 03'),
  ('PROC-0004', 'Referral Process 04'),
  ('PROC-0005', 'Referral Process 05'),
  ('PROC-0006', 'Referral Process 06'),
  ('PROC-0007', 'Referral Process 07');

INSERT INTO t_regulatory_authority (id, regulatory_authority) VALUES
  ('AUTH-0001', 'Regulatory Authority 01'),
  ('AUTH-0002', 'Regulatory Authority 02'),
  ('AUTH-0003', 'Regulatory Authority 03'),
  ('AUTH-0004', 'Regulatory Authority 04');

INSERT INTO t_regulatory_body (id, regulatory_body) VALUES
  ('BODY-0001', 'Regulatory Body 01'),
  ('BODY-0002', 'Regulatory Body 02'),
  ('BODY-0003', 'Regulatory Body 03'),
  ('BODY-0004', 'Regulatory Body 04');

INSERT INTO t_rendering_engine (id, rendering_engine) VALUES
  ('ENGI-0001', 'Rendering Engine 01'),
  ('ENGI-0002', 'Rendering Engine 02'),
  ('ENGI-0003', 'Rendering Engine 03'),
  ('ENGI-0004', 'Rendering Engine 04'),
  ('ENGI-0005', 'Rendering Engine 05'),
  ('ENGI-0006', 'Rendering Engine 06'),
  ('ENGI-0007', 'Rendering Engine 07');

INSERT INTO t_rendering_environment_definition (id, rendering_environment) VALUES
  ('DEFI-0001', 'Rendering Environment 01'),
  ('DEFI-0002', 'Rendering Environment 02'),
  ('DEFI-0003', 'Rendering Environment 03'),
  ('DEFI-0004', 'Rendering Environment 04'),
  ('DEFI-0005', 'Rendering Environment 05'),
  ('DEFI-0006', 'Rendering Environment 06'),
  ('DEFI-0007', 'Rendering Environment 07');

INSERT INTO t_reporting_channel (id, reporting_channel) VALUES
  ('CHAN-0001', 'Reporting Channel 01'),
  ('CHAN-0002', 'Reporting Channel 02'),
  ('CHAN-0003', 'Reporting Channel 03'),
  ('CHAN-0004', 'Reporting Channel 04'),
  ('CHAN-0005', 'Reporting Channel 05'),
  ('CHAN-0006', 'Reporting Channel 06'),
  ('CHAN-0007', 'Reporting Channel 07'),
  ('CHAN-0008', 'Reporting Channel 08');

INSERT INTO t_requested_provider_type (id, requested_provider_type) VALUES
  ('TYPE-0001', 'Requested Provider Type 01'),
  ('TYPE-0002', 'Requested Provider Type 02'),
  ('TYPE-0003', 'Requested Provider Type 03'),
  ('TYPE-0004', 'Requested Provider Type 04'),
  ('TYPE-0005', 'Requested Provider Type 05'),
  ('TYPE-0006', 'Requested Provider Type 06'),
  ('TYPE-0007', 'Requested Provider Type 07'),
  ('TYPE-0008', 'Requested Provider Type 08');

INSERT INTO t_requesting_client (id, requesting_client) VALUES
  ('CLIE-0001', 'Sean Green'),
  ('CLIE-0002', 'Michelle Kelley'),
  ('CLIE-0003', 'Elizabeth Woods'),
  ('CLIE-0004', 'Ian Bell');

INSERT INTO t_requesting_entity (id, requesting_entity) VALUES
  ('ENTI-0001', 'Requesting Entity 01'),
  ('ENTI-0002', 'Requesting Entity 02'),
  ('ENTI-0003', 'Requesting Entity 03'),
  ('ENTI-0004', 'Requesting Entity 04'),
  ('ENTI-0005', 'Requesting Entity 05'),
  ('ENTI-0006', 'Requesting Entity 06');

INSERT INTO t_research_activity (id, research_activity) VALUES
  ('ACTI-0001', 'Research Activity 01'),
  ('ACTI-0002', 'Research Activity 02'),
  ('ACTI-0003', 'Research Activity 03'),
  ('ACTI-0004', 'Research Activity 04'),
  ('ACTI-0005', 'Research Activity 05'),
  ('ACTI-0006', 'Research Activity 06');

INSERT INTO t_facility_infrastructure (id, facility_infrastructure) VALUES
  ('INFR-0001', 'Facility Infrastructure 01'),
  ('INFR-0002', 'Facility Infrastructure 02'),
  ('INFR-0003', 'Facility Infrastructure 03'),
  ('INFR-0004', 'Facility Infrastructure 04'),
  ('INFR-0005', 'Facility Infrastructure 05'),
  ('INFR-0006', 'Facility Infrastructure 06'),
  ('INFR-0007', 'Facility Infrastructure 07'),
  ('INFR-0008', 'Facility Infrastructure 08');

INSERT INTO t_final_inspection_process (id, final_inspection_process) VALUES
  ('PROC-0001', 'Final Inspection Process 01'),
  ('PROC-0002', 'Final Inspection Process 02'),
  ('PROC-0003', 'Final Inspection Process 03'),
  ('PROC-0004', 'Final Inspection Process 04'),
  ('PROC-0005', 'Final Inspection Process 05'),
  ('PROC-0006', 'Final Inspection Process 06');

INSERT INTO t_financial_fund (id, financial_fund) VALUES
  ('FUND-0001', 'Financial Fund 01'),
  ('FUND-0002', 'Financial Fund 02'),
  ('FUND-0003', 'Financial Fund 03'),
  ('FUND-0004', 'Financial Fund 04'),
  ('FUND-0005', 'Financial Fund 05'),
  ('FUND-0006', 'Financial Fund 06'),
  ('FUND-0007', 'Financial Fund 07'),
  ('FUND-0008', 'Financial Fund 08');

INSERT INTO t_financial_management_process (id, financial_management_process) VALUES
  ('PROC-0001', 'Financial Management Process 01'),
  ('PROC-0002', 'Financial Management Process 02'),
  ('PROC-0003', 'Financial Management Process 03'),
  ('PROC-0004', 'Financial Management Process 04'),
  ('PROC-0005', 'Financial Management Process 05');

INSERT INTO t_financial_product (id, financial_product) VALUES
  ('PROD-0001', 'Financial Product 01'),
  ('PROD-0002', 'Financial Product 02'),
  ('PROD-0003', 'Financial Product 03'),
  ('PROD-0004', 'Financial Product 04');

INSERT INTO t_financial_report (id, financial_report) VALUES
  ('REPO-0001', 'Financial Report 01'),
  ('REPO-0002', 'Financial Report 02'),
  ('REPO-0003', 'Financial Report 03'),
  ('REPO-0004', 'Financial Report 04'),
  ('REPO-0005', 'Financial Report 05'),
  ('REPO-0006', 'Financial Report 06'),
  ('REPO-0007', 'Financial Report 07'),
  ('REPO-0008', 'Financial Report 08');

INSERT INTO t_financial_resource (id, financial_resource) VALUES
  ('RESO-0001', 'Financial Resource 01'),
  ('RESO-0002', 'Financial Resource 02'),
  ('RESO-0003', 'Financial Resource 03'),
  ('RESO-0004', 'Financial Resource 04'),
  ('RESO-0005', 'Financial Resource 05'),
  ('RESO-0006', 'Financial Resource 06');

INSERT INTO t_health_record_transfer_process (id, health_record_transfer_process) VALUES
  ('PROC-0001', 'Health Record Transfer Process 01'),
  ('PROC-0002', 'Health Record Transfer Process 02'),
  ('PROC-0003', 'Health Record Transfer Process 03'),
  ('PROC-0004', 'Health Record Transfer Process 04'),
  ('PROC-0005', 'Health Record Transfer Process 05'),
  ('PROC-0006', 'Health Record Transfer Process 06'),
  ('PROC-0007', 'Health Record Transfer Process 07'),
  ('PROC-0008', 'Health Record Transfer Process 08');

INSERT INTO t_healthcare_network_infrastructure (id, healthcare_network_infrastructure) VALUES
  ('INFR-0001', 'Healthcare Network Infrastructure 01'),
  ('INFR-0002', 'Healthcare Network Infrastructure 02'),
  ('INFR-0003', 'Healthcare Network Infrastructure 03'),
  ('INFR-0004', 'Healthcare Network Infrastructure 04'),
  ('INFR-0005', 'Healthcare Network Infrastructure 05'),
  ('INFR-0006', 'Healthcare Network Infrastructure 06'),
  ('INFR-0007', 'Healthcare Network Infrastructure 07'),
  ('INFR-0008', 'Healthcare Network Infrastructure 08');

INSERT INTO t_healthcare_organization (id, healthcare_organization) VALUES
  ('ORGA-0001', 'Interac Association'),
  ('ORGA-0002', 'Standard Chartered'),
  ('ORGA-0003', 'Standard Bank'),
  ('ORGA-0004', 'General Motors'),
  ('ORGA-0005', 'Feedback Rating'),
  ('ORGA-0006', 'Canoo Inc.');

INSERT INTO t_height_measurement (id, height_measurement) VALUES
  ('MEAS-0001', 'Height Measurement 01'),
  ('MEAS-0002', 'Height Measurement 02'),
  ('MEAS-0003', 'Height Measurement 03'),
  ('MEAS-0004', 'Height Measurement 04');

INSERT INTO t_horse_identity (id, horse_identity) VALUES
  ('IDEN-0001', 'Horse Identity 01'),
  ('IDEN-0002', 'Horse Identity 02'),
  ('IDEN-0003', 'Horse Identity 03'),
  ('IDEN-0004', 'Horse Identity 04'),
  ('IDEN-0005', 'Horse Identity 05'),
  ('IDEN-0006', 'Horse Identity 06');

INSERT INTO t_housing_client (id, housing_client) VALUES
  ('CLIE-0001', 'Kimberly Myers'),
  ('CLIE-0002', 'Theodore Mcgrath'),
  ('CLIE-0003', 'Sean Green'),
  ('CLIE-0004', 'Clinton Gonzalez'),
  ('CLIE-0005', 'Daryl Humphrey');

INSERT INTO t_housing_debt_issue (id, housing_debt_issue) VALUES
  ('ISSU-0001', 'Housing Debt Issue 01'),
  ('ISSU-0002', 'Housing Debt Issue 02'),
  ('ISSU-0003', 'Housing Debt Issue 03'),
  ('ISSU-0004', 'Housing Debt Issue 04'),
  ('ISSU-0005', 'Housing Debt Issue 05'),
  ('ISSU-0006', 'Housing Debt Issue 06');

INSERT INTO t_housing_policy_topic (id, housing_policy_topic) VALUES
  ('TOPI-0001', 'Housing Policy Topic 01'),
  ('TOPI-0002', 'Housing Policy Topic 02'),
  ('TOPI-0003', 'Housing Policy Topic 03'),
  ('TOPI-0004', 'Housing Policy Topic 04'),
  ('TOPI-0005', 'Housing Policy Topic 05'),
  ('TOPI-0006', 'Housing Policy Topic 06');

INSERT INTO t_human_agent (id, human_agent) VALUES
  ('AGEN-0001', 'Human Agent 01'),
  ('AGEN-0002', 'Human Agent 02'),
  ('AGEN-0003', 'Human Agent 03'),
  ('AGEN-0004', 'Human Agent 04');

INSERT INTO t_imaging_equipment (id, imaging_equipment) VALUES
  ('EQUI-0001', 'Imaging Equipment 01'),
  ('EQUI-0002', 'Imaging Equipment 02'),
  ('EQUI-0003', 'Imaging Equipment 03'),
  ('EQUI-0004', 'Imaging Equipment 04');

INSERT INTO t_independent_economic_agent (id, independent_economic_agent) VALUES
  ('AGEN-0001', 'Independent Economic Agent 01'),
  ('AGEN-0002', 'Independent Economic Agent 02'),
  ('AGEN-0003', 'Independent Economic Agent 03'),
  ('AGEN-0004', 'Independent Economic Agent 04'),
  ('AGEN-0005', 'Independent Economic Agent 05'),
  ('AGEN-0006', 'Independent Economic Agent 06'),
  ('AGEN-0007', 'Independent Economic Agent 07'),
  ('AGEN-0008', 'Independent Economic Agent 08');

INSERT INTO t_individual (id, individual) VALUES
  ('INDI-0001', 'Individual 01'),
  ('INDI-0002', 'Individual 02'),
  ('INDI-0003', 'Individual 03'),
  ('INDI-0004', 'Individual 04'),
  ('INDI-0005', 'Individual 05'),
  ('INDI-0006', 'Individual 06');

INSERT INTO t_observatory_mounting_structure (id, observatory_mounting_structure) VALUES
  ('STRU-0001', 'Observatory Mounting Structure 01'),
  ('STRU-0002', 'Observatory Mounting Structure 02'),
  ('STRU-0003', 'Observatory Mounting Structure 03'),
  ('STRU-0004', 'Observatory Mounting Structure 04'),
  ('STRU-0005', 'Observatory Mounting Structure 05'),
  ('STRU-0006', 'Observatory Mounting Structure 06'),
  ('STRU-0007', 'Observatory Mounting Structure 07');

INSERT INTO t_offline_channel (id, offline_channel) VALUES
  ('CHAN-0001', 'Offline Channel 01'),
  ('CHAN-0002', 'Offline Channel 02'),
  ('CHAN-0003', 'Offline Channel 03'),
  ('CHAN-0004', 'Offline Channel 04'),
  ('CHAN-0005', 'Offline Channel 05'),
  ('CHAN-0006', 'Offline Channel 06');

INSERT INTO t_online_channel (id, online_channel) VALUES
  ('CHAN-0001', 'Online Channel 01'),
  ('CHAN-0002', 'Online Channel 02'),
  ('CHAN-0003', 'Online Channel 03'),
  ('CHAN-0004', 'Online Channel 04'),
  ('CHAN-0005', 'Online Channel 05');

INSERT INTO t_operational_disruption (id, operational_disruption) VALUES
  ('DISR-0001', 'Operational Disruption 01'),
  ('DISR-0002', 'Operational Disruption 02'),
  ('DISR-0003', 'Operational Disruption 03'),
  ('DISR-0004', 'Operational Disruption 04'),
  ('DISR-0005', 'Operational Disruption 05'),
  ('DISR-0006', 'Operational Disruption 06'),
  ('DISR-0007', 'Operational Disruption 07');

INSERT INTO t_operational_effectiveness (id, operational_effectiveness) VALUES
  ('EFFE-0001', 'Operational Effectiveness 01'),
  ('EFFE-0002', 'Operational Effectiveness 02'),
  ('EFFE-0003', 'Operational Effectiveness 03'),
  ('EFFE-0004', 'Operational Effectiveness 04'),
  ('EFFE-0005', 'Operational Effectiveness 05'),
  ('EFFE-0006', 'Operational Effectiveness 06'),
  ('EFFE-0007', 'Operational Effectiveness 07'),
  ('EFFE-0008', 'Operational Effectiveness 08');

INSERT INTO t_operational_equipment (id, operational_equipment) VALUES
  ('EQUI-0001', 'Operational Equipment 01'),
  ('EQUI-0002', 'Operational Equipment 02'),
  ('EQUI-0003', 'Operational Equipment 03'),
  ('EQUI-0004', 'Operational Equipment 04'),
  ('EQUI-0005', 'Operational Equipment 05'),
  ('EQUI-0006', 'Operational Equipment 06'),
  ('EQUI-0007', 'Operational Equipment 07'),
  ('EQUI-0008', 'Operational Equipment 08');

INSERT INTO t_operational_protocol (id, operational_protocol) VALUES
  ('PROT-0001', 'Operational Protocol 01'),
  ('PROT-0002', 'Operational Protocol 02'),
  ('PROT-0003', 'Operational Protocol 03'),
  ('PROT-0004', 'Operational Protocol 04'),
  ('PROT-0005', 'Operational Protocol 05');

INSERT INTO t_operational_unit (id, operational_unit) VALUES
  ('UNIT-0001', 'Operational Unit 01'),
  ('UNIT-0002', 'Operational Unit 02'),
  ('UNIT-0003', 'Operational Unit 03'),
  ('UNIT-0004', 'Operational Unit 04'),
  ('UNIT-0005', 'Operational Unit 05'),
  ('UNIT-0006', 'Operational Unit 06');

INSERT INTO t_order_constraint (id, order_constraint) VALUES
  ('CONS-0001', 'Order Constraint 01'),
  ('CONS-0002', 'Order Constraint 02'),
  ('CONS-0003', 'Order Constraint 03'),
  ('CONS-0004', 'Order Constraint 04'),
  ('CONS-0005', 'Order Constraint 05'),
  ('CONS-0006', 'Order Constraint 06');

INSERT INTO t_organization_member (id, organization_member) VALUES
  ('MEMB-0001', 'Denver School of Science and Technology Inc.'),
  ('MEMB-0002', 'CGI Group'),
  ('MEMB-0003', 'DBS Bank Limited'),
  ('MEMB-0004', 'Grant Type'),
  ('MEMB-0005', 'Senseonics Holdings Inc.'),
  ('MEMB-0006', 'General Motors');

INSERT INTO t_organizational_agent (id, organizational_agent) VALUES
  ('AGEN-0001', 'Organizational Agent 01'),
  ('AGEN-0002', 'Organizational Agent 02'),
  ('AGEN-0003', 'Organizational Agent 03'),
  ('AGEN-0004', 'Organizational Agent 04'),
  ('AGEN-0005', 'Organizational Agent 05'),
  ('AGEN-0006', 'Organizational Agent 06'),
  ('AGEN-0007', 'Organizational Agent 07'),
  ('AGEN-0008', 'Organizational Agent 08');

INSERT INTO t_organizational_function (id, organizational_function) VALUES
  ('FUNC-0001', 'Organizational Function 01'),
  ('FUNC-0002', 'Organizational Function 02'),
  ('FUNC-0003', 'Organizational Function 03'),
  ('FUNC-0004', 'Organizational Function 04'),
  ('FUNC-0005', 'Organizational Function 05'),
  ('FUNC-0006', 'Organizational Function 06'),
  ('FUNC-0007', 'Organizational Function 07');

INSERT INTO t_organizational_health_metric (id, organizational_health_metric) VALUES
  ('METR-0001', 'Organizational Health Metric 01'),
  ('METR-0002', 'Organizational Health Metric 02'),
  ('METR-0003', 'Organizational Health Metric 03'),
  ('METR-0004', 'Organizational Health Metric 04'),
  ('METR-0005', 'Organizational Health Metric 05'),
  ('METR-0006', 'Organizational Health Metric 06'),
  ('METR-0007', 'Organizational Health Metric 07'),
  ('METR-0008', 'Organizational Health Metric 08');

INSERT INTO t_organizational_leadership_role (id, organizational_leadership_role) VALUES
  ('ROLE-0001', 'Organizational Leadership Role 01'),
  ('ROLE-0002', 'Organizational Leadership Role 02'),
  ('ROLE-0003', 'Organizational Leadership Role 03'),
  ('ROLE-0004', 'Organizational Leadership Role 04'),
  ('ROLE-0005', 'Organizational Leadership Role 05'),
  ('ROLE-0006', 'Organizational Leadership Role 06'),
  ('ROLE-0007', 'Organizational Leadership Role 07');

INSERT INTO t_ozone_oxygen_mixture (id, ozone_oxygen_mixture) VALUES
  ('MIXT-0001', 'Ozone Oxygen Mixture 01'),
  ('MIXT-0002', 'Ozone Oxygen Mixture 02'),
  ('MIXT-0003', 'Ozone Oxygen Mixture 03'),
  ('MIXT-0004', 'Ozone Oxygen Mixture 04');

INSERT INTO t_academic_degree (id, academic_degree) VALUES
  ('DEGR-0001', 'Academic Degree 01'),
  ('DEGR-0002', 'Academic Degree 02'),
  ('DEGR-0003', 'Academic Degree 03'),
  ('DEGR-0004', 'Academic Degree 04'),
  ('DEGR-0005', 'Academic Degree 05'),
  ('DEGR-0006', 'Academic Degree 06');

INSERT INTO t_calendar_product (id, calendar_product) VALUES
  ('PROD-0001', 'Calendar Product 01'),
  ('PROD-0002', 'Calendar Product 02'),
  ('PROD-0003', 'Calendar Product 03'),
  ('PROD-0004', 'Calendar Product 04'),
  ('PROD-0005', 'Calendar Product 05');

INSERT INTO t_call_volume (id, call_volume) VALUES
  ('VOLU-0001', 'Call Volume 01'),
  ('VOLU-0002', 'Call Volume 02'),
  ('VOLU-0003', 'Call Volume 03'),
  ('VOLU-0004', 'Call Volume 04'),
  ('VOLU-0005', 'Call Volume 05'),
  ('VOLU-0006', 'Call Volume 06'),
  ('VOLU-0007', 'Call Volume 07');

INSERT INTO t_child (id, child) VALUES
  ('CHIL-0001', 'Child 01'),
  ('CHIL-0002', 'Child 02'),
  ('CHIL-0003', 'Child 03'),
  ('CHIL-0004', 'Child 04'),
  ('CHIL-0005', 'Child 05'),
  ('CHIL-0006', 'Child 06'),
  ('CHIL-0007', 'Child 07'),
  ('CHIL-0008', 'Child 08');

INSERT INTO t_clinical_care (id, clinical_care) VALUES
  ('CARE-0001', 'Clinical Care 01'),
  ('CARE-0002', 'Clinical Care 02'),
  ('CARE-0003', 'Clinical Care 03'),
  ('CARE-0004', 'Clinical Care 04'),
  ('CARE-0005', 'Clinical Care 05'),
  ('CARE-0006', 'Clinical Care 06'),
  ('CARE-0007', 'Clinical Care 07');

INSERT INTO t_communication_security_aspect (id, communication_security_aspect) VALUES
  ('ASPE-0001', 'Communication Security Aspect 01'),
  ('ASPE-0002', 'Communication Security Aspect 02'),
  ('ASPE-0003', 'Communication Security Aspect 03'),
  ('ASPE-0004', 'Communication Security Aspect 04');

INSERT INTO t_constructed_predicate (id, constructed_predicate) VALUES
  ('PRED-0001', 'Constructed Predicate 01'),
  ('PRED-0002', 'Constructed Predicate 02'),
  ('PRED-0003', 'Constructed Predicate 03'),
  ('PRED-0004', 'Constructed Predicate 04');

INSERT INTO t_continuous_emissions_monitoring_process (id, continuous_emissions_monitoring_process) VALUES
  ('PROC-0001', 'Continuous Emissions Monitoring Process 01'),
  ('PROC-0002', 'Continuous Emissions Monitoring Process 02'),
  ('PROC-0003', 'Continuous Emissions Monitoring Process 03'),
  ('PROC-0004', 'Continuous Emissions Monitoring Process 04');

INSERT INTO t_corporate_activity (id, corporate_activity) VALUES
  ('ACTI-0001', 'Corporate Activity 01'),
  ('ACTI-0002', 'Corporate Activity 02'),
  ('ACTI-0003', 'Corporate Activity 03'),
  ('ACTI-0004', 'Corporate Activity 04'),
  ('ACTI-0005', 'Corporate Activity 05'),
  ('ACTI-0006', 'Corporate Activity 06'),
  ('ACTI-0007', 'Corporate Activity 07'),
  ('ACTI-0008', 'Corporate Activity 08');

INSERT INTO t_corporate_audit_process (id, corporate_audit_process) VALUES
  ('PROC-0001', 'Corporate Audit Process 01'),
  ('PROC-0002', 'Corporate Audit Process 02'),
  ('PROC-0003', 'Corporate Audit Process 03'),
  ('PROC-0004', 'Corporate Audit Process 04'),
  ('PROC-0005', 'Corporate Audit Process 05'),
  ('PROC-0006', 'Corporate Audit Process 06'),
  ('PROC-0007', 'Corporate Audit Process 07');

INSERT INTO t_corporate_employment_process (id, corporate_employment_process) VALUES
  ('PROC-0001', 'Corporate Employment Process 01'),
  ('PROC-0002', 'Corporate Employment Process 02'),
  ('PROC-0003', 'Corporate Employment Process 03'),
  ('PROC-0004', 'Corporate Employment Process 04'),
  ('PROC-0005', 'Corporate Employment Process 05'),
  ('PROC-0006', 'Corporate Employment Process 06'),
  ('PROC-0007', 'Corporate Employment Process 07'),
  ('PROC-0008', 'Corporate Employment Process 08');

INSERT INTO t_corporate_reputation (id, corporate_reputation) VALUES
  ('REPU-0001', 'Corporate Reputation 01'),
  ('REPU-0002', 'Corporate Reputation 02'),
  ('REPU-0003', 'Corporate Reputation 03'),
  ('REPU-0004', 'Corporate Reputation 04'),
  ('REPU-0005', 'Corporate Reputation 05'),
  ('REPU-0006', 'Corporate Reputation 06');

INSERT INTO t_course (id, course) VALUES
  ('COUR-0001', 'Course 01'),
  ('COUR-0002', 'Course 02'),
  ('COUR-0003', 'Course 03'),
  ('COUR-0004', 'Course 04'),
  ('COUR-0005', 'Course 05');

INSERT INTO t_criminal_justice_process (id, criminal_justice_process) VALUES
  ('PROC-0001', 'Criminal Justice Process 01'),
  ('PROC-0002', 'Criminal Justice Process 02'),
  ('PROC-0003', 'Criminal Justice Process 03'),
  ('PROC-0004', 'Criminal Justice Process 04'),
  ('PROC-0005', 'Criminal Justice Process 05'),
  ('PROC-0006', 'Criminal Justice Process 06'),
  ('PROC-0007', 'Criminal Justice Process 07');

INSERT INTO t_customer_device (id, customer_device) VALUES
  ('DEVI-0001', 'Mac Anderson'),
  ('DEVI-0002', 'Susan Wagner'),
  ('DEVI-0003', 'Robert Sherman'),
  ('DEVI-0004', 'Stephanie Sutton'),
  ('DEVI-0005', 'Mary Alvarez'),
  ('DEVI-0006', 'Oscar Harrell');

INSERT INTO t_database_container (id, database_container) VALUES
  ('CONT-0001', 'Database Container 01'),
  ('CONT-0002', 'Database Container 02'),
  ('CONT-0003', 'Database Container 03'),
  ('CONT-0004', 'Database Container 04');

INSERT INTO t_decision_action (id) VALUES
  ('ACTI-0001'),
  ('ACTI-0002'),
  ('ACTI-0003'),
  ('ACTI-0004'),
  ('ACTI-0005'),
  ('ACTI-0006');

INSERT INTO t_decision_transition_action (id, decision_transition_action) VALUES
  ('ACTI-0001', 'Decision Transition Action 01'),
  ('ACTI-0002', 'Decision Transition Action 02'),
  ('ACTI-0003', 'Decision Transition Action 03'),
  ('ACTI-0004', 'Decision Transition Action 04'),
  ('ACTI-0005', 'Decision Transition Action 05'),
  ('ACTI-0006', 'Decision Transition Action 06'),
  ('ACTI-0007', 'Decision Transition Action 07');

INSERT INTO t_diagnostic_imaging (id, diagnostic_imaging) VALUES
  ('IMAG-0001', 'Diagnostic Imaging 01'),
  ('IMAG-0002', 'Diagnostic Imaging 02'),
  ('IMAG-0003', 'Diagnostic Imaging 03'),
  ('IMAG-0004', 'Diagnostic Imaging 04'),
  ('IMAG-0005', 'Diagnostic Imaging 05'),
  ('IMAG-0006', 'Diagnostic Imaging 06'),
  ('IMAG-0007', 'Diagnostic Imaging 07'),
  ('IMAG-0008', 'Diagnostic Imaging 08');

INSERT INTO t_ethical_investment (id, ethical_investment) VALUES
  ('INVE-0001', 'Ethical Investment 01'),
  ('INVE-0002', 'Ethical Investment 02'),
  ('INVE-0003', 'Ethical Investment 03'),
  ('INVE-0004', 'Ethical Investment 04'),
  ('INVE-0005', 'Ethical Investment 05');

INSERT INTO t_ethical_standard (id, ethical_standard) VALUES
  ('STAN-0001', 'Ethical Standard 01'),
  ('STAN-0002', 'Ethical Standard 02'),
  ('STAN-0003', 'Ethical Standard 03'),
  ('STAN-0004', 'Ethical Standard 04'),
  ('STAN-0005', 'Ethical Standard 05'),
  ('STAN-0006', 'Ethical Standard 06'),
  ('STAN-0007', 'Ethical Standard 07'),
  ('STAN-0008', 'Ethical Standard 08');

INSERT INTO t_executive_direction (id, executive_direction) VALUES
  ('DIRE-0001', 'Executive Direction 01'),
  ('DIRE-0002', 'Executive Direction 02'),
  ('DIRE-0003', 'Executive Direction 03'),
  ('DIRE-0004', 'Executive Direction 04'),
  ('DIRE-0005', 'Executive Direction 05');

INSERT INTO t_executive_implementation (id, executive_implementation) VALUES
  ('IMPL-0001', 'Executive Implementation 01'),
  ('IMPL-0002', 'Executive Implementation 02'),
  ('IMPL-0003', 'Executive Implementation 03'),
  ('IMPL-0004', 'Executive Implementation 04'),
  ('IMPL-0005', 'Executive Implementation 05'),
  ('IMPL-0006', 'Executive Implementation 06'),
  ('IMPL-0007', 'Executive Implementation 07');

INSERT INTO t_executive_leadership_role (id, executive_leadership_role) VALUES
  ('ROLE-0001', 'Chief Marketing Officer'),
  ('ROLE-0002', 'Chief Technology Officer'),
  ('ROLE-0003', 'Chief Legal Officer'),
  ('ROLE-0004', 'Chief Legal Officer'),
  ('ROLE-0005', 'Chief Legal Officer'),
  ('ROLE-0006', 'Chief Revenue Officer'),
  ('ROLE-0007', 'Chief Revenue Officer');

INSERT INTO t_external_business_partner (id, external_business_partner) VALUES
  ('PART-0001', 'External Business Partner 01'),
  ('PART-0002', 'External Business Partner 02'),
  ('PART-0003', 'External Business Partner 03'),
  ('PART-0004', 'External Business Partner 04'),
  ('PART-0005', 'External Business Partner 05');

INSERT INTO t_financial_instrument (id, financial_instrument, participates_in) VALUES
  ('INST-0001', 'Financial Instrument 01', 'Participates In 01'),
  ('INST-0002', 'Financial Instrument 02', 'Participates In 02'),
  ('INST-0003', 'Financial Instrument 03', 'Participates In 03'),
  ('INST-0004', 'Financial Instrument 04', 'Participates In 04'),
  ('INST-0005', 'Financial Instrument 05', 'Participates In 05'),
  ('INST-0006', 'Financial Instrument 06', 'Participates In 06'),
  ('INST-0007', 'Financial Instrument 07', 'Participates In 07');

INSERT INTO t_financial_strategy_oversight (id, financial_strategy_oversight) VALUES
  ('OVER-0001', 'DebtRefinancingStrategy'),
  ('OVER-0002', 'DerivativesHedgeMonitoring'),
  ('OVER-0003', 'MergersAcquisitionCompliance'),
  ('OVER-0004', 'CapitalExpenditureApproval'),
  ('OVER-0005', 'LiquidityStressTesting'),
  ('OVER-0006', 'TreasuryRiskAudit'),
  ('OVER-0007', 'DerivativesHedgeMonitoring');

INSERT INTO t_higher_education_institution (id, higher_education_institution) VALUES
  ('INST-0001', 'Higher Education Institution 01'),
  ('INST-0002', 'Higher Education Institution 02'),
  ('INST-0003', 'Higher Education Institution 03'),
  ('INST-0004', 'Higher Education Institution 04'),
  ('INST-0005', 'Higher Education Institution 05');

INSERT INTO t_institutional_investor (id, institutional_investor) VALUES
  ('INVE-0001', 'Institutional Investor 01'),
  ('INVE-0002', 'Institutional Investor 02'),
  ('INVE-0003', 'Institutional Investor 03'),
  ('INVE-0004', 'Institutional Investor 04');

INSERT INTO t_legal_proceeding (id, legal_proceeding) VALUES
  ('PROC-0001', 'Legal Proceeding 01'),
  ('PROC-0002', 'Legal Proceeding 02'),
  ('PROC-0003', 'Legal Proceeding 03'),
  ('PROC-0004', 'Legal Proceeding 04'),
  ('PROC-0005', 'Legal Proceeding 05'),
  ('PROC-0006', 'Legal Proceeding 06');

INSERT INTO t_network_user (id, network_user) VALUES
  ('USER-0001', 'Network User 01'),
  ('USER-0002', 'Network User 02'),
  ('USER-0003', 'Network User 03'),
  ('USER-0004', 'Network User 04'),
  ('USER-0005', 'Network User 05');

INSERT INTO t_observation_function (id, observation_function) VALUES
  ('FUNC-0001', 'Observation Function 01'),
  ('FUNC-0002', 'Observation Function 02'),
  ('FUNC-0003', 'Observation Function 03'),
  ('FUNC-0004', 'Observation Function 04');

INSERT INTO t_organization (id, organization) VALUES
  ('ORGA-0001', 'Sealed Air'),
  ('ORGA-0002', 'Intl. Business Machines'),
  ('ORGA-0003', 'E3 Alliance'),
  ('ORGA-0004', 'Sanniquellie Mahn'),
  ('ORGA-0005', 'Luddic Path'),
  ('ORGA-0006', 'Gogo Inc.'),
  ('ORGA-0007', 'Wikimedia Foundation Inc.'),
  ('ORGA-0008', 'Charlotte-Mecklenburg Schools');

INSERT INTO t_organizational_culture (id, organizational_culture) VALUES
  ('CULT-0001', 'Organizational Culture 01'),
  ('CULT-0002', 'Organizational Culture 02'),
  ('CULT-0003', 'Organizational Culture 03'),
  ('CULT-0004', 'Organizational Culture 04'),
  ('CULT-0005', 'Organizational Culture 05'),
  ('CULT-0006', 'Organizational Culture 06'),
  ('CULT-0007', 'Organizational Culture 07');

INSERT INTO t_original_document (id, original_document) VALUES
  ('DOCU-0001', 'Original Document 01'),
  ('DOCU-0002', 'Original Document 02'),
  ('DOCU-0003', 'Original Document 03'),
  ('DOCU-0004', 'Original Document 04'),
  ('DOCU-0005', 'Original Document 05'),
  ('DOCU-0006', 'Original Document 06'),
  ('DOCU-0007', 'Original Document 07'),
  ('DOCU-0008', 'Original Document 08');

INSERT INTO t_pdf_format (id, pdf_format) VALUES
  ('FORM-0001', 'Pdf Format 01'),
  ('FORM-0002', 'Pdf Format 02'),
  ('FORM-0003', 'Pdf Format 03'),
  ('FORM-0004', 'Pdf Format 04');

INSERT INTO t_personally_identifiable_information (id, personally_identifiable_information) VALUES
  ('INFO-0001', 'Personally Identifiable Information 01'),
  ('INFO-0002', 'Personally Identifiable Information 02'),
  ('INFO-0003', 'Personally Identifiable Information 03'),
  ('INFO-0004', 'Personally Identifiable Information 04');

INSERT INTO t_population (id, population) VALUES
  ('POPU-0001', 'Population 01'),
  ('POPU-0002', 'Population 02'),
  ('POPU-0003', 'Population 03'),
  ('POPU-0004', 'Population 04'),
  ('POPU-0005', 'Population 05'),
  ('POPU-0006', 'Population 06');

INSERT INTO t_professional_experience (id, professional_experience) VALUES
  ('EXPE-0001', 'Fatima Al-Mansour'),
  ('EXPE-0002', 'Liam O''Connor'),
  ('EXPE-0003', 'David Okonkwo'),
  ('EXPE-0004', 'David Okonkwo'),
  ('EXPE-0005', 'Marcus Chen'),
  ('EXPE-0006', 'Priya Sharma'),
  ('EXPE-0007', 'Elena Rostova'),
  ('EXPE-0008', 'Elena Rostova');

INSERT INTO t_qualification_level (id, qualification_level) VALUES
  ('LEVE-0001', 'Qualification Level 01'),
  ('LEVE-0002', 'Qualification Level 02'),
  ('LEVE-0003', 'Qualification Level 03'),
  ('LEVE-0004', 'Qualification Level 04');

INSERT INTO t_raffle (id, raffle) VALUES
  ('RAFF-0001', 'Raffle 01'),
  ('RAFF-0002', 'Raffle 02'),
  ('RAFF-0003', 'Raffle 03'),
  ('RAFF-0004', 'Raffle 04'),
  ('RAFF-0005', 'Raffle 05'),
  ('RAFF-0006', 'Raffle 06'),
  ('RAFF-0007', 'Raffle 07');

INSERT INTO t_prim_age (id, age) VALUES
  ('AGE-0001', 'Age 01'),
  ('AGE-0002', 'Age 02'),
  ('AGE-0003', 'Age 03'),
  ('AGE-0004', 'Age 04'),
  ('AGE-0005', 'Age 05'),
  ('AGE-0006', 'Age 06'),
  ('AGE-0007', 'Age 07');

INSERT INTO t_prim_continuousmode (id, continuous_mode) VALUES
  ('CONT-0001', 'Continuous Mode 01'),
  ('CONT-0002', 'Continuous Mode 02'),
  ('CONT-0003', 'Continuous Mode 03'),
  ('CONT-0004', 'Continuous Mode 04'),
  ('CONT-0005', 'Continuous Mode 05'),
  ('CONT-0006', 'Continuous Mode 06');

INSERT INTO t_prim_riskmanagementactivity (id, risk_management_activity) VALUES
  ('RISK-0001', 'Risk Management Activity 01'),
  ('RISK-0002', 'Risk Management Activity 02'),
  ('RISK-0003', 'Risk Management Activity 03'),
  ('RISK-0004', 'Risk Management Activity 04'),
  ('RISK-0005', 'Risk Management Activity 05'),
  ('RISK-0006', 'Risk Management Activity 06'),
  ('RISK-0007', 'Risk Management Activity 07');

INSERT INTO t_prim_chemical (id, chemical) VALUES
  ('CHEM-0001', 'Chemical 01'),
  ('CHEM-0002', 'Chemical 02'),
  ('CHEM-0003', 'Chemical 03'),
  ('CHEM-0004', 'Chemical 04'),
  ('CHEM-0005', 'Chemical 05'),
  ('CHEM-0006', 'Chemical 06'),
  ('CHEM-0007', 'Chemical 07');

INSERT INTO t_prim_schoolsecuritypolicy (id, school_security_policy) VALUES
  ('SCHO-0001', 'School Security Policy 01'),
  ('SCHO-0002', 'School Security Policy 02'),
  ('SCHO-0003', 'School Security Policy 03'),
  ('SCHO-0004', 'School Security Policy 04'),
  ('SCHO-0005', 'School Security Policy 05'),
  ('SCHO-0006', 'School Security Policy 06');

INSERT INTO t_prim_scientificorganization (id, scientific_organization) VALUES
  ('SCIE-0001', 'Gogo Inc.'),
  ('SCIE-0002', 'Texas Public Education Reform Foundation'),
  ('SCIE-0003', 'LINK Interchange Network Ltd'),
  ('SCIE-0004', 'Butterfly Network Inc.'),
  ('SCIE-0005', 'Ninja Van'),
  ('SCIE-0006', 'Visa USA'),
  ('SCIE-0007', 'Mondragon Corporation');

INSERT INTO t_prim_servicelevelagreement (id, service_level_agreement) VALUES
  ('SERV-0001', 'Service Level Agreement 01'),
  ('SERV-0002', 'Service Level Agreement 02'),
  ('SERV-0003', 'Service Level Agreement 03'),
  ('SERV-0004', 'Service Level Agreement 04'),
  ('SERV-0005', 'Service Level Agreement 05'),
  ('SERV-0006', 'Service Level Agreement 06');

INSERT INTO t_prim_stateaction (id, state_action) VALUES
  ('STAT-0001', 'State Action 01'),
  ('STAT-0002', 'State Action 02'),
  ('STAT-0003', 'State Action 03'),
  ('STAT-0004', 'State Action 04'),
  ('STAT-0005', 'State Action 05');

INSERT INTO t_prim_tariffstructure (id, tariff_structure) VALUES
  ('TARI-0001', 'Tariff Structure 01'),
  ('TARI-0002', 'Tariff Structure 02'),
  ('TARI-0003', 'Tariff Structure 03'),
  ('TARI-0004', 'Tariff Structure 04');

INSERT INTO t_prim_vulnerabilitystate (id, vulnerability_state) VALUES
  ('VULN-0001', 'Vulnerability State 01'),
  ('VULN-0002', 'Vulnerability State 02'),
  ('VULN-0003', 'Vulnerability State 03'),
  ('VULN-0004', 'Vulnerability State 04'),
  ('VULN-0005', 'Vulnerability State 05'),
  ('VULN-0006', 'Vulnerability State 06'),
  ('VULN-0007', 'Vulnerability State 07');

INSERT INTO t_prim_skillimprovement (id, skill_improvement) VALUES
  ('SKIL-0001', 'Skill Improvement 01'),
  ('SKIL-0002', 'Skill Improvement 02'),
  ('SKIL-0003', 'Skill Improvement 03'),
  ('SKIL-0004', 'Skill Improvement 04'),
  ('SKIL-0005', 'Skill Improvement 05');

INSERT INTO t_prim_socialnetworkingserviceusage (id, social_networking_service_usage) VALUES
  ('SOCI-0001', 'Social Networking Service Usage 01'),
  ('SOCI-0002', 'Social Networking Service Usage 02'),
  ('SOCI-0003', 'Social Networking Service Usage 03'),
  ('SOCI-0004', 'Social Networking Service Usage 04');

INSERT INTO t_board_member_role_realization (id, board_member_role_realization, participant) VALUES
  ('REAL-0001', 'Board Member Role Realization 01', 'Participant 01'),
  ('REAL-0002', 'Board Member Role Realization 02', 'Participant 02'),
  ('REAL-0003', 'Board Member Role Realization 03', 'Participant 03'),
  ('REAL-0004', 'Board Member Role Realization 04', 'Participant 04'),
  ('REAL-0005', 'Board Member Role Realization 05', 'Participant 05'),
  ('REAL-0006', 'Board Member Role Realization 06', 'Participant 06');

INSERT INTO t_chief_compliance_officer_service_delivery_process (id, chief_compliance_officer_service_delivery_process, participant) VALUES
  ('PROC-0001', 'Chief Compliance Officer Service Delivery Process 01', 'Participant 01'),
  ('PROC-0002', 'Chief Compliance Officer Service Delivery Process 02', 'Participant 02'),
  ('PROC-0003', 'Chief Compliance Officer Service Delivery Process 03', 'Participant 03'),
  ('PROC-0004', 'Chief Compliance Officer Service Delivery Process 04', 'Participant 04'),
  ('PROC-0005', 'Chief Compliance Officer Service Delivery Process 05', 'Participant 05'),
  ('PROC-0006', 'Chief Compliance Officer Service Delivery Process 06', 'Participant 06');

INSERT INTO t_college_administration_process (id, college_administration_process, participant) VALUES
  ('PROC-0001', 'College Administration Process 01', 'Participant 01'),
  ('PROC-0002', 'College Administration Process 02', 'Participant 02'),
  ('PROC-0003', 'College Administration Process 03', 'Participant 03'),
  ('PROC-0004', 'College Administration Process 04', 'Participant 04'),
  ('PROC-0005', 'College Administration Process 05', 'Participant 05'),
  ('PROC-0006', 'College Administration Process 06', 'Participant 06'),
  ('PROC-0007', 'College Administration Process 07', 'Participant 07'),
  ('PROC-0008', 'College Administration Process 08', 'Participant 08');

INSERT INTO t_general_manager_function_execution (id, general_manager_function_execution, participant) VALUES
  ('EXEC-0001', 'General Manager Function Execution 01', 'Participant 01'),
  ('EXEC-0002', 'General Manager Function Execution 02', 'Participant 02'),
  ('EXEC-0003', 'General Manager Function Execution 03', 'Participant 03'),
  ('EXEC-0004', 'General Manager Function Execution 04', 'Participant 04'),
  ('EXEC-0005', 'General Manager Function Execution 05', 'Participant 05'),
  ('EXEC-0006', 'General Manager Function Execution 06', 'Participant 06'),
  ('EXEC-0007', 'General Manager Function Execution 07', 'Participant 07'),
  ('EXEC-0008', 'General Manager Function Execution 08', 'Participant 08');

INSERT INTO t_legal_tech_service_delivery_process (id, legal_tech_service_delivery_process, participant) VALUES
  ('PROC-0001', 'Legal Tech Service Delivery Process 01', 'Participant 01'),
  ('PROC-0002', 'Legal Tech Service Delivery Process 02', 'Participant 02'),
  ('PROC-0003', 'Legal Tech Service Delivery Process 03', 'Participant 03'),
  ('PROC-0004', 'Legal Tech Service Delivery Process 04', 'Participant 04'),
  ('PROC-0005', 'Legal Tech Service Delivery Process 05', 'Participant 05'),
  ('PROC-0006', 'Legal Tech Service Delivery Process 06', 'Participant 06'),
  ('PROC-0007', 'Legal Tech Service Delivery Process 07', 'Participant 07');

INSERT INTO t_performance_based_care_delivery_process (id, performance_based_care_delivery_process, participant) VALUES
  ('PROC-0001', 'Performance Based Care Delivery Process 01', 'Participant 01'),
  ('PROC-0002', 'Performance Based Care Delivery Process 02', 'Participant 02'),
  ('PROC-0003', 'Performance Based Care Delivery Process 03', 'Participant 03'),
  ('PROC-0004', 'Performance Based Care Delivery Process 04', 'Participant 04');

INSERT INTO t_police_patrol_process (id, police_patrol_process, participant) VALUES
  ('PROC-0001', 'Police Patrol Process 01', 'Participant 01'),
  ('PROC-0002', 'Police Patrol Process 02', 'Participant 02'),
  ('PROC-0003', 'Police Patrol Process 03', 'Participant 03'),
  ('PROC-0004', 'Police Patrol Process 04', 'Participant 04'),
  ('PROC-0005', 'Police Patrol Process 05', 'Participant 05'),
  ('PROC-0006', 'Police Patrol Process 06', 'Participant 06'),
  ('PROC-0007', 'Police Patrol Process 07', 'Participant 07');

INSERT INTO t_qualified_source_testing_process (id, qualified_source_testing_process, participant) VALUES
  ('PROC-0001', 'Qualified Source Testing Process 01', 'Participant 01'),
  ('PROC-0002', 'Qualified Source Testing Process 02', 'Participant 02'),
  ('PROC-0003', 'Qualified Source Testing Process 03', 'Participant 03'),
  ('PROC-0004', 'Qualified Source Testing Process 04', 'Participant 04'),
  ('PROC-0005', 'Qualified Source Testing Process 05', 'Participant 05'),
  ('PROC-0006', 'Qualified Source Testing Process 06', 'Participant 06'),
  ('PROC-0007', 'Qualified Source Testing Process 07', 'Participant 07'),
  ('PROC-0008', 'Qualified Source Testing Process 08', 'Participant 08');

INSERT INTO t_clearing_broker_service_delivery_process (id, clearing_broker_service_delivery_process, participant) VALUES
  ('PROC-0001', 'Clearing Broker Service Delivery Process 01', 'Participant 01'),
  ('PROC-0002', 'Clearing Broker Service Delivery Process 02', 'Participant 02'),
  ('PROC-0003', 'Clearing Broker Service Delivery Process 03', 'Participant 03'),
  ('PROC-0004', 'Clearing Broker Service Delivery Process 04', 'Participant 04');

INSERT INTO t_rights_exercise_process (id, rights_exercise_process, participant) VALUES
  ('PROC-0001', 'Rights Exercise Process 01', 'Participant 01'),
  ('PROC-0002', 'Rights Exercise Process 02', 'Participant 02'),
  ('PROC-0003', 'Rights Exercise Process 03', 'Participant 03'),
  ('PROC-0004', 'Rights Exercise Process 04', 'Participant 04'),
  ('PROC-0005', 'Rights Exercise Process 05', 'Participant 05');

INSERT INTO t_authorized_entity_authorization_process (id, authorized_entity_authorization_process, participant) VALUES
  ('PROC-0001', 'Authorized Entity Authorization Process 01', 'Participant 01'),
  ('PROC-0002', 'Authorized Entity Authorization Process 02', 'Participant 02'),
  ('PROC-0003', 'Authorized Entity Authorization Process 03', 'Participant 03'),
  ('PROC-0004', 'Authorized Entity Authorization Process 04', 'Participant 04'),
  ('PROC-0005', 'Authorized Entity Authorization Process 05', 'Participant 05'),
  ('PROC-0006', 'Authorized Entity Authorization Process 06', 'Participant 06'),
  ('PROC-0007', 'Authorized Entity Authorization Process 07', 'Participant 07'),
  ('PROC-0008', 'Authorized Entity Authorization Process 08', 'Participant 08');

INSERT INTO t_joint_board_chair_service_delivery_process (id, joint_board_chair_service_delivery_process, participant) VALUES
  ('PROC-0001', 'Joint Board Chair Service Delivery Process 01', 'Participant 01'),
  ('PROC-0002', 'Joint Board Chair Service Delivery Process 02', 'Participant 02'),
  ('PROC-0003', 'Joint Board Chair Service Delivery Process 03', 'Participant 03'),
  ('PROC-0004', 'Joint Board Chair Service Delivery Process 04', 'Participant 04'),
  ('PROC-0005', 'Joint Board Chair Service Delivery Process 05', 'Participant 05'),
  ('PROC-0006', 'Joint Board Chair Service Delivery Process 06', 'Participant 06'),
  ('PROC-0007', 'Joint Board Chair Service Delivery Process 07', 'Participant 07');

INSERT INTO t_social_media_account_management_process (id, social_media_account_management_process, participant) VALUES
  ('PROC-0001', 'Social Media Account Management Process 01', 'Participant 01'),
  ('PROC-0002', 'Social Media Account Management Process 02', 'Participant 02'),
  ('PROC-0003', 'Social Media Account Management Process 03', 'Participant 03'),
  ('PROC-0004', 'Social Media Account Management Process 04', 'Participant 04'),
  ('PROC-0005', 'Social Media Account Management Process 05', 'Participant 05'),
  ('PROC-0006', 'Social Media Account Management Process 06', 'Participant 06'),
  ('PROC-0007', 'Social Media Account Management Process 07', 'Participant 07');

INSERT INTO t_community_healthcare_service_delivery_process (id, community_healthcare_service_delivery_process, participant) VALUES
  ('PROC-0001', 'Community Healthcare Service Delivery Process 01', 'Participant 01'),
  ('PROC-0002', 'Community Healthcare Service Delivery Process 02', 'Participant 02'),
  ('PROC-0003', 'Community Healthcare Service Delivery Process 03', 'Participant 03'),
  ('PROC-0004', 'Community Healthcare Service Delivery Process 04', 'Participant 04'),
  ('PROC-0005', 'Community Healthcare Service Delivery Process 05', 'Participant 05');

INSERT INTO t_decision_making_process (id, decision_making_process, participant) VALUES
  ('PROC-0001', 'Decision Making Process 01', 'Participant 01'),
  ('PROC-0002', 'Decision Making Process 02', 'Participant 02'),
  ('PROC-0003', 'Decision Making Process 03', 'Participant 03'),
  ('PROC-0004', 'Decision Making Process 04', 'Participant 04'),
  ('PROC-0005', 'Decision Making Process 05', 'Participant 05'),
  ('PROC-0006', 'Decision Making Process 06', 'Participant 06'),
  ('PROC-0007', 'Decision Making Process 07', 'Participant 07');

INSERT INTO t_parenting_process (id, parenting_process, participant) VALUES
  ('PROC-0001', 'Parenting Process 01', 'Participant 01'),
  ('PROC-0002', 'Parenting Process 02', 'Participant 02'),
  ('PROC-0003', 'Parenting Process 03', 'Participant 03'),
  ('PROC-0004', 'Parenting Process 04', 'Participant 04');

INSERT INTO t_rendering_environment (id, rendering_environment, participant) VALUES
  ('ENVI-0001', 'Rendering Environment 01', 'Participant 01'),
  ('ENVI-0002', 'Rendering Environment 02', 'Participant 02'),
  ('ENVI-0003', 'Rendering Environment 03', 'Participant 03'),
  ('ENVI-0004', 'Rendering Environment 04', 'Participant 04'),
  ('ENVI-0005', 'Rendering Environment 05', 'Participant 05');

INSERT INTO t_traditional_religious_healing_process (id, traditional_religious_healing_process, participant) VALUES
  ('PROC-0001', 'Traditional Religious Healing Process 01', 'Participant 01'),
  ('PROC-0002', 'Traditional Religious Healing Process 02', 'Participant 02'),
  ('PROC-0003', 'Traditional Religious Healing Process 03', 'Participant 03'),
  ('PROC-0004', 'Traditional Religious Healing Process 04', 'Participant 04'),
  ('PROC-0005', 'Traditional Religious Healing Process 05', 'Participant 05'),
  ('PROC-0006', 'Traditional Religious Healing Process 06', 'Participant 06'),
  ('PROC-0007', 'Traditional Religious Healing Process 07', 'Participant 07');

INSERT INTO t_organizational_leadership_process (id, organizational_leadership_process, participant) VALUES
  ('PROC-0001', 'Organizational Leadership Process 01', 'Participant 01'),
  ('PROC-0002', 'Organizational Leadership Process 02', 'Participant 02'),
  ('PROC-0003', 'Organizational Leadership Process 03', 'Participant 03'),
  ('PROC-0004', 'Organizational Leadership Process 04', 'Participant 04');

INSERT INTO t_young_researcher_research_process (id, young_researcher_research_process, participant) VALUES
  ('PROC-0001', 'Young Researcher Research Process 01', 'Participant 01'),
  ('PROC-0002', 'Young Researcher Research Process 02', 'Participant 02'),
  ('PROC-0003', 'Young Researcher Research Process 03', 'Participant 03'),
  ('PROC-0004', 'Young Researcher Research Process 04', 'Participant 04'),
  ('PROC-0005', 'Young Researcher Research Process 05', 'Participant 05'),
  ('PROC-0006', 'Young Researcher Research Process 06', 'Participant 06'),
  ('PROC-0007', 'Young Researcher Research Process 07', 'Participant 07'),
  ('PROC-0008', 'Young Researcher Research Process 08', 'Participant 08');

INSERT INTO t_review_panel_quorum (id, review_panel_session, participant) VALUES
  ('QUOR-0001', 'Review Panel Session 01', 'Participant 01'),
  ('QUOR-0002', 'Review Panel Session 02', 'Participant 02'),
  ('QUOR-0003', 'Review Panel Session 03', 'Participant 03'),
  ('QUOR-0004', 'Review Panel Session 04', 'Participant 04'),
  ('QUOR-0005', 'Review Panel Session 05', 'Participant 05');

INSERT INTO t_capacity_bounded_enrollment (id, cohort_enrollment_process, participant) VALUES
  ('ENRO-0001', 'Cohort Enrollment Process 01', 'Participant 01'),
  ('ENRO-0002', 'Cohort Enrollment Process 02', 'Participant 02'),
  ('ENRO-0003', 'Cohort Enrollment Process 03', 'Participant 03'),
  ('ENRO-0004', 'Cohort Enrollment Process 04', 'Participant 04');

INSERT INTO t_dual_custody_signoff (id, dual_custody_signoff_process, participant, realizes) VALUES
  ('SIGN-0001', 'Dual Custody Signoff Process 01', 'Participant 01', 'Realizes 01'),
  ('SIGN-0002', 'Dual Custody Signoff Process 02', 'Participant 02', 'Realizes 02'),
  ('SIGN-0003', 'Dual Custody Signoff Process 03', 'Participant 03', 'Realizes 03'),
  ('SIGN-0004', 'Dual Custody Signoff Process 04', 'Participant 04', 'Realizes 04'),
  ('SIGN-0005', 'Dual Custody Signoff Process 05', 'Participant 05', 'Realizes 05');

INSERT INTO t_bounded_committee_membership (id, standing_committee_assembly, participant) VALUES
  ('MEMB-0001', 'Standing Committee Assembly 01', 'Participant 01'),
  ('MEMB-0002', 'Standing Committee Assembly 02', 'Participant 02'),
  ('MEMB-0003', 'Standing Committee Assembly 03', 'Participant 03'),
  ('MEMB-0004', 'Standing Committee Assembly 04', 'Participant 04'),
  ('MEMB-0005', 'Standing Committee Assembly 05', 'Participant 05'),
  ('MEMB-0006', 'Standing Committee Assembly 06', 'Participant 06'),
  ('MEMB-0007', 'Standing Committee Assembly 07', 'Participant 07'),
  ('MEMB-0008', 'Standing Committee Assembly 08', 'Participant 08');

INSERT INTO t_identifier_bearer_union (id, registered_identifier_bearer, natural_person_registrant, registered_organization) VALUES
  ('UNIO-0001', 'Registered Identifier Bearer 01', 'Janice Johnston', 'Grupo Carso'),
  ('UNIO-0002', 'Registered Identifier Bearer 02', 'April Snyder', 'Blink Charging Co.'),
  ('UNIO-0003', 'Registered Identifier Bearer 03', 'Janice Johnston', 'American Electric Power'),
  ('UNIO-0004', 'Registered Identifier Bearer 04', 'Hinduja Hospital', 'Occidental Petroleum'),
  ('UNIO-0005', 'Registered Identifier Bearer 05', 'Walter Pratt', 'LDAP First Name Field');

INSERT INTO t_notification_target_union (id, compliance_notification_process, responsible_officer, delegated_agent) VALUES
  ('UNIO-0001', 'Compliance Notification Process 01', 'Responsible Officer 01', 'Delegated Agent 01'),
  ('UNIO-0002', 'Compliance Notification Process 02', 'Responsible Officer 02', 'Delegated Agent 02'),
  ('UNIO-0003', 'Compliance Notification Process 03', 'Responsible Officer 03', 'Delegated Agent 03'),
  ('UNIO-0004', 'Compliance Notification Process 04', 'Responsible Officer 04', 'Delegated Agent 04'),
  ('UNIO-0005', 'Compliance Notification Process 05', 'Responsible Officer 05', 'Delegated Agent 05'),
  ('UNIO-0006', 'Compliance Notification Process 06', 'Responsible Officer 06', 'Delegated Agent 06');

INSERT INTO t_escalation_channel_union (id, incident_escalation_process, supervisory_review, external_audit_review) VALUES
  ('UNIO-0001', 'Incident Escalation Process 01', 'Supervisory Review 01', 'External Audit Review 01'),
  ('UNIO-0002', 'Incident Escalation Process 02', 'Supervisory Review 02', 'External Audit Review 02'),
  ('UNIO-0003', 'Incident Escalation Process 03', 'Supervisory Review 03', 'External Audit Review 03'),
  ('UNIO-0004', 'Incident Escalation Process 04', 'Supervisory Review 04', 'External Audit Review 04'),
  ('UNIO-0005', 'Incident Escalation Process 05', 'Supervisory Review 05', 'External Audit Review 05'),
  ('UNIO-0006', 'Incident Escalation Process 06', 'Supervisory Review 06', 'External Audit Review 06'),
  ('UNIO-0007', 'Incident Escalation Process 07', 'Supervisory Review 07', 'External Audit Review 07');

INSERT INTO t_scored_assessment_bounds (id, scored_assessment_record) VALUES
  ('BOUN-0001', 'Scored Assessment Record 01'),
  ('BOUN-0002', 'Scored Assessment Record 02'),
  ('BOUN-0003', 'Scored Assessment Record 03'),
  ('BOUN-0004', 'Scored Assessment Record 04'),
  ('BOUN-0005', 'Scored Assessment Record 05');

INSERT INTO t_versioned_form_lineage (id, versioned_intake_form) VALUES
  ('LINE-0001', 'Versioned Intake Form 01'),
  ('LINE-0002', 'Versioned Intake Form 02'),
  ('LINE-0003', 'Versioned Intake Form 03'),
  ('LINE-0004', 'Versioned Intake Form 04'),
  ('LINE-0005', 'Versioned Intake Form 05'),
  ('LINE-0006', 'Versioned Intake Form 06'),
  ('LINE-0007', 'Versioned Intake Form 07'),
  ('LINE-0008', 'Versioned Intake Form 08');

INSERT INTO t_bounded_metric_series (id, bounded_metric_series) VALUES
  ('SERI-0001', 'Bounded Metric Series 01'),
  ('SERI-0002', 'Bounded Metric Series 02'),
  ('SERI-0003', 'Bounded Metric Series 03'),
  ('SERI-0004', 'Bounded Metric Series 04'),
  ('SERI-0005', 'Bounded Metric Series 05'),
  ('SERI-0006', 'Bounded Metric Series 06'),
  ('SERI-0007', 'Bounded Metric Series 07'),
  ('SERI-0008', 'Bounded Metric Series 08');

INSERT INTO t_restricted_participation_review (id, accredited_review_process, participant) VALUES
  ('REVI-0001', 'Accredited Review Process 01', 'Participant 01'),
  ('REVI-0002', 'Accredited Review Process 02', 'Participant 02'),
  ('REVI-0003', 'Accredited Review Process 03', 'Participant 03'),
  ('REVI-0004', 'Accredited Review Process 04', 'Participant 04'),
  ('REVI-0005', 'Accredited Review Process 05', 'Participant 05'),
  ('REVI-0006', 'Accredited Review Process 06', 'Participant 06'),
  ('REVI-0007', 'Accredited Review Process 07', 'Participant 07');

INSERT INTO t_typed_realization_channel (id, on_call_coverage_role, realized_in) VALUES
  ('CHAN-0001', 'On Call Coverage Role 01', 'Realized In 01'),
  ('CHAN-0002', 'On Call Coverage Role 02', 'Realized In 02'),
  ('CHAN-0003', 'On Call Coverage Role 03', 'Realized In 03'),
  ('CHAN-0004', 'On Call Coverage Role 04', 'Realized In 04'),
  ('CHAN-0005', 'On Call Coverage Role 05', 'Realized In 05'),
  ('CHAN-0006', 'On Call Coverage Role 06', 'Realized In 06'),
  ('CHAN-0007', 'On Call Coverage Role 07', 'Realized In 07');

INSERT INTO t_custody_scope_typing (id, archival_custody_process, participant) VALUES
  ('TYPI-0001', 'Archival Custody Process 01', 'Participant 01'),
  ('TYPI-0002', 'Archival Custody Process 02', 'Participant 02'),
  ('TYPI-0003', 'Archival Custody Process 03', 'Participant 03'),
  ('TYPI-0004', 'Archival Custody Process 04', 'Participant 04'),
  ('TYPI-0005', 'Archival Custody Process 05', 'Participant 05'),
  ('TYPI-0006', 'Archival Custody Process 06', 'Participant 06'),
  ('TYPI-0007', 'Archival Custody Process 07', 'Participant 07'),
  ('TYPI-0008', 'Archival Custody Process 08', 'Participant 08');

INSERT INTO t_measured_series_reading (id, measured_series_reading) VALUES
  ('READ-0001', 'Measured Series Reading 01'),
  ('READ-0002', 'Measured Series Reading 02'),
  ('READ-0003', 'Measured Series Reading 03'),
  ('READ-0004', 'Measured Series Reading 04'),
  ('READ-0005', 'Measured Series Reading 05'),
  ('READ-0006', 'Measured Series Reading 06'),
  ('READ-0007', 'Measured Series Reading 07');
