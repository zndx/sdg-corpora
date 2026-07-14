CREATE TABLE building_inspections_divisions (
  id INTEGER NOT NULL,
  division_code VARCHAR(44),
  jurisdiction_name VARCHAR(32),
  reporting_period_start DATE,
  reporting_period_end DATE,
  total_permit_fees_collected VARCHAR(32),
  performance_target VARCHAR(32),
  permit_id VARCHAR(44),
  certificate_of_occupancy_id INTEGER,
  inspection_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (permit_id) REFERENCES building_permits (permit_id),
  FOREIGN KEY (certificate_of_occupancy_id) REFERENCES certificate_of_occupancies (certificate_of_occupancy_id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (id)
);
