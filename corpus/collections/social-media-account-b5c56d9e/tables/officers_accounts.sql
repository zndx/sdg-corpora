CREATE TABLE officers_accounts (
  public_information_officer_id INTEGER NOT NULL,
  social_media_account_id INTEGER NOT NULL,
  PRIMARY KEY (public_information_officer_id, social_media_account_id),
  FOREIGN KEY (public_information_officer_id) REFERENCES public_information_officers (id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (social_media_account_id)
);
