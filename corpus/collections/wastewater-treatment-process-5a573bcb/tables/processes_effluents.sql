CREATE TABLE processes_effluents (
  wastewater_treatment_process_id INTEGER NOT NULL,
  industrial_effluent_id INTEGER NOT NULL,
  PRIMARY KEY (wastewater_treatment_process_id, industrial_effluent_id),
  FOREIGN KEY (wastewater_treatment_process_id) REFERENCES wastewater_treatment_processes (id),
  FOREIGN KEY (industrial_effluent_id) REFERENCES industrial_effluents (id)
);
