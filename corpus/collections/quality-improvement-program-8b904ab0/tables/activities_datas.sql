CREATE TABLE activities_datas (
  measurement_activity_id INTEGER NOT NULL,
  clinical_performance_data_id INTEGER NOT NULL,
  PRIMARY KEY (measurement_activity_id, clinical_performance_data_id),
  FOREIGN KEY (measurement_activity_id) REFERENCES measurement_activities (id),
  FOREIGN KEY (clinical_performance_data_id) REFERENCES clinical_performance_datas (clinical_performance_data_id)
);
