CREATE TABLE firms_partners (
  research_firm_id INTEGER NOT NULL,
  media_partner_id INTEGER NOT NULL,
  PRIMARY KEY (research_firm_id, media_partner_id),
  FOREIGN KEY (research_firm_id) REFERENCES research_firms (research_firm_id),
  FOREIGN KEY (media_partner_id) REFERENCES media_partners (id)
);
