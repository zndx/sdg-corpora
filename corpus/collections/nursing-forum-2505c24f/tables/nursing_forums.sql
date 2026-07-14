CREATE TABLE nursing_forums (
  nursing_forum_id INTEGER NOT NULL,
  forum_identifier VARCHAR(32),
  forum_name VARCHAR(32),
  established_date DATE,
  status VARCHAR(32),
  jurisdiction VARCHAR(32),
  nursing_professional_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (nursing_forum_id),
  FOREIGN KEY (nursing_professional_id) REFERENCES nursing_professionals (id)
);
