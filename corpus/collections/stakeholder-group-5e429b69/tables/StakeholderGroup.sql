CREATE TABLE StakeholderGroup (
  groupId INTEGER NOT NULL,
  identifier VARCHAR(32),
  groupName VARCHAR(32),
  description VARCHAR(32),
  priorityLevel INTEGER,
  influenceScore DECIMAL,
  PRIMARY KEY (groupId)
);
