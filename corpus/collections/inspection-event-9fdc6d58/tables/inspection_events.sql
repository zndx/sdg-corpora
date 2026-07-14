CREATE TABLE inspection_events (
  inspection_event_id INTEGER NOT NULL,
  inspection_date TIMESTAMP,
  inspection_type VARCHAR(32),
  regulatory_basis VARCHAR(32),
  overall_safety_rating VARCHAR(32),
  overall_effectiveness_rating VARCHAR(32),
  overall_caring_rating VARCHAR(32),
  overall_responsive_rating VARCHAR(32),
  overall_well_led_rating VARCHAR(32),
  clinical_service_id INTEGER,
  PRIMARY KEY (inspection_event_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (id)
);
