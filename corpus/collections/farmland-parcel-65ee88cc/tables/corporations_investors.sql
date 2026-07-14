CREATE TABLE corporations_investors (
  parent_corporation_id INTEGER NOT NULL,
  institutional_investor_id INTEGER NOT NULL,
  PRIMARY KEY (parent_corporation_id, institutional_investor_id),
  FOREIGN KEY (parent_corporation_id) REFERENCES parent_corporations (parent_corporation_id),
  FOREIGN KEY (institutional_investor_id) REFERENCES institutional_investors (institutional_investor_id)
);
