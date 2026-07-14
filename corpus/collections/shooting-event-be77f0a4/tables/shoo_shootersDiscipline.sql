CREATE TABLE shoo_shootersDiscipline (
  shooter_id INTEGER NOT NULL,
  discipline_id INTEGER NOT NULL,
  PRIMARY KEY (shooter_id, discipline_id),
  FOREIGN KEY (shooter_id) REFERENCES shoo_shooters (id),
  FOREIGN KEY (discipline_id) REFERENCES shoo_disciplines (id)
);
