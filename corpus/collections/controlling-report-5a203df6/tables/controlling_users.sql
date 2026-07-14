CREATE TABLE controlling_users (
  user_id VARCHAR(44) NOT NULL,
  user_name VARCHAR(32),
  role_title VARCHAR(32),
  department VARCHAR(40),
  is_strategic_planner BOOLEAN,
  controlling_report_id INTEGER,
  strategic_plan_id INTEGER,
  PRIMARY KEY (user_id),
  FOREIGN KEY (controlling_report_id) REFERENCES controlling_reports (id),
  FOREIGN KEY (strategic_plan_id) REFERENCES strategic_plans (id)
);
