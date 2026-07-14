CREATE TABLE SocialMediaPolicyStaffMember (
  policyId INTEGER NOT NULL,
  memberId INTEGER NOT NULL,
  PRIMARY KEY (policyId, memberId),
  FOREIGN KEY (policyId) REFERENCES SocialMediaPolicy (policyId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (memberId)
);
