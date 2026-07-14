CREATE TABLE stations_centres (
  radar_station_id INTEGER NOT NULL,
  control_centre_id INTEGER NOT NULL,
  PRIMARY KEY (radar_station_id, control_centre_id),
  FOREIGN KEY (radar_station_id) REFERENCES radar_stations (radar_station_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id)
);
