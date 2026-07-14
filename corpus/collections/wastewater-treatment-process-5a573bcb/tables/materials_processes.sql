CREATE TABLE materials_processes (
  catalytic_material_id INTEGER NOT NULL,
  wastewater_treatment_process_id INTEGER NOT NULL,
  PRIMARY KEY (catalytic_material_id, wastewater_treatment_process_id),
  FOREIGN KEY (catalytic_material_id) REFERENCES catalytic_materials (id),
  FOREIGN KEY (wastewater_treatment_process_id) REFERENCES wastewater_treatment_processes (id)
);
