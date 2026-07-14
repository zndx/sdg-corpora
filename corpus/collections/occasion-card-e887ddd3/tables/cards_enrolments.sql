CREATE TABLE cards_enrolments (
  occasion_card_id INTEGER NOT NULL,
  enrolment_id INTEGER NOT NULL,
  PRIMARY KEY (occasion_card_id, enrolment_id),
  FOREIGN KEY (occasion_card_id) REFERENCES occasion_cards (occasion_card_id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id)
);
