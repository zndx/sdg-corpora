CREATE TABLE StakeholderGroupStakeholderNeed (
  groupId INTEGER NOT NULL,
  needId INTEGER NOT NULL,
  PRIMARY KEY (groupId, needId),
  FOREIGN KEY (groupId) REFERENCES StakeholderGroup (groupId),
  FOREIGN KEY (needId) REFERENCES StakeholderNeed (id)
);
