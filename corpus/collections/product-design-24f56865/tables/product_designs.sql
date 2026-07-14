CREATE TABLE product_designs (
  id INTEGER NOT NULL,
  design_identifier VARCHAR(32),
  design_name VARCHAR(32),
  design_status VARCHAR(32),
  creation_date TIMESTAMP,
  designer_role VARCHAR(32),
  rendering_complexity INTEGER,
  designer_id INTEGER,
  software_tool_id INTEGER,
  design_competition_id INTEGER,
  render_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (designer_id) REFERENCES designers (id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (id),
  FOREIGN KEY (design_competition_id) REFERENCES design_competitions (id),
  FOREIGN KEY (render_id) REFERENCES photorealistic_renders (render_id)
);
