CREATE TABLE approvals_schemes (
  trainer_approval_id INTEGER NOT NULL,
  training_scheme_id INTEGER NOT NULL,
  PRIMARY KEY (trainer_approval_id, training_scheme_id),
  FOREIGN KEY (trainer_approval_id) REFERENCES trainer_approvals (trainer_approval_id),
  FOREIGN KEY (training_scheme_id) REFERENCES training_schemes (id)
);
