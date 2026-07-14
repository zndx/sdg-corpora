CREATE TABLE pricing_tiers (
  id INTEGER NOT NULL,
  tier_id VARCHAR(44),
  course_count INTEGER,
  price DECIMAL,
  valid_days VARCHAR(32),
  valid_start TIMESTAMP,
  valid_end TIMESTAMP,
  course_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES menu_courses (course_id)
);
