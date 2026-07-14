CREATE TABLE missions_datas (
  satellite_mission_id INTEGER NOT NULL,
  earth_observation_data_id INTEGER NOT NULL,
  PRIMARY KEY (satellite_mission_id, earth_observation_data_id),
  FOREIGN KEY (satellite_mission_id) REFERENCES satellite_missions (id),
  FOREIGN KEY (earth_observation_data_id) REFERENCES earth_observation_datas (id)
);
