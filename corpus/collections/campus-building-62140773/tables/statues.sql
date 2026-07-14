CREATE TABLE statues (
  id INTEGER NOT NULL,
  statue_id VARCHAR(44),
  statue_name VARCHAR(32),
  dedicated_person VARCHAR(32),
  gift_from VARCHAR(32),
  dedication_year INTEGER,
  is_decorated_by_students BOOLEAN,
  campus_area_id INTEGER,
  historical_figure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (campus_area_id) REFERENCES campus_areas (id),
  FOREIGN KEY (historical_figure_id) REFERENCES historical_figures (id)
);
