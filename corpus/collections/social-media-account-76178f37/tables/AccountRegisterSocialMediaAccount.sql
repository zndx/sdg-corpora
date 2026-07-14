CREATE TABLE AccountRegisterSocialMediaAccount (
  registerId INTEGER NOT NULL,
  accountId VARCHAR(44) NOT NULL,
  PRIMARY KEY (registerId, accountId),
  FOREIGN KEY (registerId) REFERENCES AccountRegister (registerId),
  FOREIGN KEY (accountId) REFERENCES SocialMediaAccount (accountId)
);
