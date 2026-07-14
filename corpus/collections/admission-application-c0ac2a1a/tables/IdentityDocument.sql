CREATE TABLE IdentityDocument (
  id INTEGER NOT NULL,
  documentId VARCHAR(44),
  documentType VARCHAR(32),
  issueDate DATE,
  expiryDate DATE,
  verificationStatus VARCHAR(32),
  studentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (studentId) REFERENCES Student (id)
);
