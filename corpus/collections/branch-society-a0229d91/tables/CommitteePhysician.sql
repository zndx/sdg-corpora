CREATE TABLE CommitteePhysician (
  committeeCode VARCHAR(44) NOT NULL,
  physicianId INTEGER NOT NULL,
  PRIMARY KEY (committeeCode, physicianId),
  FOREIGN KEY (committeeCode) REFERENCES Committee (committeeCode),
  FOREIGN KEY (physicianId) REFERENCES Physician (physicianId)
);
