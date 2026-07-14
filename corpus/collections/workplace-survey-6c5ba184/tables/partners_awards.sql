CREATE TABLE partners_awards (
  media_partner_id INTEGER NOT NULL,
  workplace_award_id INTEGER NOT NULL,
  PRIMARY KEY (media_partner_id, workplace_award_id),
  FOREIGN KEY (media_partner_id) REFERENCES media_partners (id),
  FOREIGN KEY (workplace_award_id) REFERENCES workplace_awards (workplace_award_id)
);
