CREATE TABLE logos_copies (
  corporate_logo_id INTEGER NOT NULL,
  ad_copy_id INTEGER NOT NULL,
  PRIMARY KEY (corporate_logo_id, ad_copy_id),
  FOREIGN KEY (corporate_logo_id) REFERENCES corporate_logos (id),
  FOREIGN KEY (ad_copy_id) REFERENCES ad_copies (ad_copy_id)
);
