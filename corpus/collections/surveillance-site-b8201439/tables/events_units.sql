CREATE TABLE events_units (
  monitoring_event_id INTEGER NOT NULL,
  data_acquisition_unit_id INTEGER NOT NULL,
  PRIMARY KEY (monitoring_event_id, data_acquisition_unit_id),
  FOREIGN KEY (monitoring_event_id) REFERENCES monitoring_events (id),
  FOREIGN KEY (data_acquisition_unit_id) REFERENCES data_acquisition_units (id)
);
