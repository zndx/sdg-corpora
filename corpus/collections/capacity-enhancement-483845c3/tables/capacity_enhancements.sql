CREATE TABLE capacity_enhancements (
  capacity_enhancement_id INTEGER NOT NULL,
  planned_capacity_m_w DECIMAL,
  actual_capacity_m_w DECIMAL,
  planning_period VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  manufacturing_facility_id INTEGER,
  enterprise_id INTEGER,
  PRIMARY KEY (capacity_enhancement_id),
  FOREIGN KEY (manufacturing_facility_id) REFERENCES manufacturing_facilities (id),
  FOREIGN KEY (enterprise_id) REFERENCES enterprises (id)
);
