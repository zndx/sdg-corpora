CREATE TABLE dogs_plans (
  dog_id INTEGER NOT NULL,
  training_plan_id INTEGER NOT NULL,
  PRIMARY KEY (dog_id, training_plan_id),
  FOREIGN KEY (dog_id) REFERENCES dogs (dog_id),
  FOREIGN KEY (training_plan_id) REFERENCES training_plans (id)
);
