CREATE TABLE workplace_culture_dimensions (
  id INTEGER NOT NULL,
  dimension_id INTEGER,
  dimension_name VARCHAR(32),
  description VARCHAR(32),
  measurement_scale VARCHAR(32),
  is_core_metric BOOLEAN,
  employee_feedback_survey_id INTEGER,
  health_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (employee_feedback_survey_id) REFERENCES employee_feedback_surveys (employee_feedback_survey_id),
  FOREIGN KEY (health_id) REFERENCES organizational_healths (health_id)
);
