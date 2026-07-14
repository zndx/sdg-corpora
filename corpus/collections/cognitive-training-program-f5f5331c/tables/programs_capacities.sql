CREATE TABLE programs_capacities (
  cognitive_training_program_id INTEGER NOT NULL,
  cognitive_capacity_id INTEGER NOT NULL,
  PRIMARY KEY (cognitive_training_program_id, cognitive_capacity_id),
  FOREIGN KEY (cognitive_training_program_id) REFERENCES cognitive_training_programs (id),
  FOREIGN KEY (cognitive_capacity_id) REFERENCES cognitive_capacities (cognitive_capacity_id)
);
