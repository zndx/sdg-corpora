CREATE TABLE catalytic_materials (
  id INTEGER NOT NULL,
  material_identifier VARCHAR(32),
  material_class VARCHAR(32),
  synthesis_method VARCHAR(33),
  surface_area DECIMAL,
  band_gap_energy DECIMAL,
  patent_status VARCHAR(32),
  research_project_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id)
);
