CREATE TABLE campus_areas (
  id INTEGER NOT NULL,
  area_id VARCHAR(44),
  area_name VARCHAR(32),
  area_type VARCHAR(32),
  is_wireless_enabled BOOLEAN,
  area_description VARCHAR(32),
  campus_building_id INTEGER,
  statue_id INTEGER,
  campus_area_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (campus_building_id) REFERENCES campus_buildings (id),
  FOREIGN KEY (statue_id) REFERENCES statues (id),
  FOREIGN KEY (campus_area_id) REFERENCES campus_areas (id)
);
