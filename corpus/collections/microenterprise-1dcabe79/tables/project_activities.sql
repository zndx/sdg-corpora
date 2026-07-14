CREATE TABLE project_activities (
  id INTEGER NOT NULL,
  activity_i_d VARCHAR(32),
  activity_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  location VARCHAR(32),
  PRIMARY KEY (id)
);
