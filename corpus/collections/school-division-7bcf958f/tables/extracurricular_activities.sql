CREATE TABLE extracurricular_activities (
  extracurricular_activity_id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_name VARCHAR(32),
  category VARCHAR(32),
  is_competitive BOOLEAN,
  season VARCHAR(32),
  school_division_id INTEGER,
  PRIMARY KEY (extracurricular_activity_id),
  FOREIGN KEY (school_division_id) REFERENCES school_divisions (school_division_id)
);
