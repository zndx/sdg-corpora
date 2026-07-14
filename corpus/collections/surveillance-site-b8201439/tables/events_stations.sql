CREATE TABLE events_stations (
  monitoring_event_id INTEGER NOT NULL,
  radar_station_id INTEGER NOT NULL,
  PRIMARY KEY (monitoring_event_id, radar_station_id),
  FOREIGN KEY (monitoring_event_id) REFERENCES monitoring_events (id),
  FOREIGN KEY (radar_station_id) REFERENCES radar_stations (radar_station_id)
);
