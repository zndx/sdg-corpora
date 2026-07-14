CREATE TABLE StudentAdmissionApplication (
  studentId INTEGER NOT NULL,
  applicationId INTEGER NOT NULL,
  PRIMARY KEY (studentId, applicationId),
  FOREIGN KEY (studentId) REFERENCES Student (id),
  FOREIGN KEY (applicationId) REFERENCES AdmissionApplication (applicationId)
);
