CREATE TABLE arc_sections (
  arc_section_id INTEGER NOT NULL,
  arc_id INTEGER,
  radius DECIMAL,
  start_angle DECIMAL,
  end_angle DECIMAL,
  segment_id VARCHAR(44),
  planned_route_id INTEGER,
  PRIMARY KEY (arc_section_id),
  FOREIGN KEY (segment_id) REFERENCES straight_line_segments (segment_id),
  FOREIGN KEY (planned_route_id) REFERENCES planned_routes (planned_route_id)
);
