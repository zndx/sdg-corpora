CREATE TABLE docks_events (
  dock_id INTEGER NOT NULL,
  sailing_event_id INTEGER NOT NULL,
  PRIMARY KEY (dock_id, sailing_event_id),
  FOREIGN KEY (dock_id) REFERENCES docks (id),
  FOREIGN KEY (sailing_event_id) REFERENCES sailing_events (id)
);
