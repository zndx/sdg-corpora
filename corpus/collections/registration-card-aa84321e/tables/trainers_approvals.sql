CREATE TABLE trainers_approvals (
  trainer_id INTEGER NOT NULL,
  trainer_approval_id INTEGER NOT NULL,
  PRIMARY KEY (trainer_id, trainer_approval_id),
  FOREIGN KEY (trainer_id) REFERENCES trainers (id),
  FOREIGN KEY (trainer_approval_id) REFERENCES trainer_approvals (trainer_approval_id)
);
