CREATE TABLE schemes_approvals (
  training_scheme_id INTEGER NOT NULL,
  trainer_approval_id INTEGER NOT NULL,
  PRIMARY KEY (training_scheme_id, trainer_approval_id),
  FOREIGN KEY (training_scheme_id) REFERENCES training_schemes (id),
  FOREIGN KEY (trainer_approval_id) REFERENCES trainer_approvals (trainer_approval_id)
);
