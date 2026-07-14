CREATE TABLE policies_accounts (
  board_policy_id INTEGER NOT NULL,
  social_media_account_id INTEGER NOT NULL,
  PRIMARY KEY (board_policy_id, social_media_account_id),
  FOREIGN KEY (board_policy_id) REFERENCES board_policies (id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (social_media_account_id)
);
