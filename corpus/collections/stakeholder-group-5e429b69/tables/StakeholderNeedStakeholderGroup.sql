CREATE TABLE StakeholderNeedStakeholderGroup (
  needId INTEGER NOT NULL,
  groupId INTEGER NOT NULL,
  PRIMARY KEY (needId, groupId),
  FOREIGN KEY (needId) REFERENCES StakeholderNeed (id),
  FOREIGN KEY (groupId) REFERENCES StakeholderGroup (groupId)
);
