CREATE TABLE sites_stations (
  surveillance_site_id INTEGER NOT NULL,
  radar_station_id INTEGER NOT NULL,
  PRIMARY KEY (surveillance_site_id, radar_station_id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id),
  FOREIGN KEY (radar_station_id) REFERENCES radar_stations (radar_station_id)
);
