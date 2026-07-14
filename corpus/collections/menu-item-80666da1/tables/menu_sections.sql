CREATE TABLE menu_sections (
  section_id INTEGER NOT NULL,
  name VARCHAR(32),
  sort_order INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (section_id)
);
