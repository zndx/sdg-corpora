CREATE TABLE processes_materials (
  wastewater_treatment_process_id INTEGER NOT NULL,
  catalytic_material_id INTEGER NOT NULL,
  PRIMARY KEY (wastewater_treatment_process_id, catalytic_material_id),
  FOREIGN KEY (wastewater_treatment_process_id) REFERENCES wastewater_treatment_processes (id),
  FOREIGN KEY (catalytic_material_id) REFERENCES catalytic_materials (id)
);
