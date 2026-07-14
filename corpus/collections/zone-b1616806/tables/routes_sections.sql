CREATE TABLE routes_sections (
  planned_route_id INTEGER NOT NULL,
  arc_section_id INTEGER NOT NULL,
  PRIMARY KEY (planned_route_id, arc_section_id),
  FOREIGN KEY (planned_route_id) REFERENCES planned_routes (planned_route_id),
  FOREIGN KEY (arc_section_id) REFERENCES arc_sections (arc_section_id)
);
