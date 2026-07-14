CREATE TABLE photorealistic_renders (
  render_id VARCHAR(32) NOT NULL,
  render_date TIMESTAMP,
  lighting_setup VARCHAR(32),
  resolution INTEGER,
  render_time_hours DECIMAL,
  file_size_m_b DECIMAL,
  product_design_id INTEGER,
  software_tool_id INTEGER,
  design_competition_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (render_id),
  FOREIGN KEY (product_design_id) REFERENCES product_designs (id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (id),
  FOREIGN KEY (design_competition_id) REFERENCES design_competitions (id)
);
