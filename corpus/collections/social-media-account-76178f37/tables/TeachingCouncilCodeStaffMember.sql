CREATE TABLE TeachingCouncilCodeStaffMember (
  codeId INTEGER NOT NULL,
  memberId INTEGER NOT NULL,
  PRIMARY KEY (codeId, memberId),
  FOREIGN KEY (codeId) REFERENCES TeachingCouncilCode (id),
  FOREIGN KEY (memberId) REFERENCES StaffMember (memberId)
);
