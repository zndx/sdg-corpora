CREATE TABLE MedicalProfessional (
  id INTEGER NOT NULL,
  licenseState VARCHAR(32),
  boardCertificationBody VARCHAR(58),
  pediatricPracticePercentage DECIMAL,
  yearsPostFellowship INTEGER,
  peerReviewPublicationsCount INTEGER,
  meetsEligibilityCriteria BOOLEAN,
  categoryId INTEGER,
  meetingId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (categoryId) REFERENCES MembershipCategory (id),
  FOREIGN KEY (meetingId) REFERENCES SocietyMeeting (id)
);
