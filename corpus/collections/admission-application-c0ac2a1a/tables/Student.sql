CREATE TABLE Student (
  id INTEGER NOT NULL,
  studentId VARCHAR(32),
  fullName VARCHAR(36),
  dateOfBirth DATE,
  currentGradeLevel VARCHAR(32),
  schoolNumber VARCHAR(32),
  documentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (documentId) REFERENCES IdentityDocument (id)
);
