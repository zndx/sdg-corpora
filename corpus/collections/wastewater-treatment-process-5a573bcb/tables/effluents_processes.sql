CREATE TABLE effluents_processes (
  industrial_effluent_id INTEGER NOT NULL,
  wastewater_treatment_process_id INTEGER NOT NULL,
  PRIMARY KEY (industrial_effluent_id, wastewater_treatment_process_id),
  FOREIGN KEY (industrial_effluent_id) REFERENCES industrial_effluents (id),
  FOREIGN KEY (wastewater_treatment_process_id) REFERENCES wastewater_treatment_processes (id)
);
