CREATE TABLE occasion_cards (
  occasion_card_id INTEGER NOT NULL,
  card_type VARCHAR(32),
  reference_number VARCHAR(32),
  suggested_donation DECIMAL,
  is_pre_signed BOOLEAN,
  is_free BOOLEAN,
  perpetual_folder_id INTEGER,
  PRIMARY KEY (occasion_card_id),
  FOREIGN KEY (perpetual_folder_id) REFERENCES perpetual_folders (id)
);
