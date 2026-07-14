CREATE TABLE enrolments (
  enrolment_id INTEGER NOT NULL,
  enrolment_status VARCHAR(32),
  duration_years INTEGER,
  donation_amount DECIMAL,
  enrolment_date TIMESTAMP,
  occasion_card_id INTEGER,
  perpetual_folder_id INTEGER,
  enrollee_id INTEGER,
  PRIMARY KEY (enrolment_id),
  FOREIGN KEY (occasion_card_id) REFERENCES occasion_cards (occasion_card_id),
  FOREIGN KEY (perpetual_folder_id) REFERENCES perpetual_folders (id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (enrollee_id)
);
