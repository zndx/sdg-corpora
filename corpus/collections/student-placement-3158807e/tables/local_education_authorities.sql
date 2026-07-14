CREATE TABLE local_education_authorities (
  local_education_authority_id INTEGER NOT NULL,
  lea_code INTEGER,
  region_name VARCHAR(32),
  contact_email VARCHAR(32),
  funding_status VARCHAR(32),
  education_health_care_plan_id INTEGER,
  student_placement_id INTEGER,
  PRIMARY KEY (local_education_authority_id),
  FOREIGN KEY (education_health_care_plan_id) REFERENCES education_health_care_plans (id),
  FOREIGN KEY (student_placement_id) REFERENCES student_placements (id)
);
