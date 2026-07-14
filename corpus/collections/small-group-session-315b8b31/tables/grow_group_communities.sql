CREATE TABLE grow_group_communities (
  grow_group_community_id INTEGER NOT NULL,
  group_id VARCHAR(32),
  group_name VARCHAR(32),
  group_type VARCHAR(32),
  duration_weeks INTEGER,
  cost_per_couple DECIMAL,
  start_date DATE,
  registration_status VARCHAR(32),
  marriage_prayer_focus_id INTEGER,
  PRIMARY KEY (grow_group_community_id),
  FOREIGN KEY (marriage_prayer_focus_id) REFERENCES marriage_prayer_focuses (id)
);
