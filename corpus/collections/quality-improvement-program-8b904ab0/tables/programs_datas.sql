CREATE TABLE programs_datas (
  quality_improvement_program_id INTEGER NOT NULL,
  clinical_performance_data_id INTEGER NOT NULL,
  PRIMARY KEY (quality_improvement_program_id, clinical_performance_data_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id),
  FOREIGN KEY (clinical_performance_data_id) REFERENCES clinical_performance_datas (clinical_performance_data_id)
);
