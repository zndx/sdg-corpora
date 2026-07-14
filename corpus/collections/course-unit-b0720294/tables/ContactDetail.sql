CREATE TABLE ContactDetail (
  id INTEGER NOT NULL,
  contactType VARCHAR(32),
  contactValue VARCHAR(32),
  contactStartDate TIMESTAMP,
  contactEndDate TIMESTAMP,
  isPrimary BOOLEAN,
  unitId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (unitId) REFERENCES CourseUnit (id)
);
