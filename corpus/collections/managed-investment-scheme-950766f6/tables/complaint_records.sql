CREATE TABLE complaint_records (
  id INTEGER NOT NULL,
  complaint_id VARCHAR(44),
  lodged_date TIMESTAMP,
  status VARCHAR(32),
  resolution_date DATE,
  escalated_to VARCHAR(35),
  investor_id INTEGER,
  authorised_representative_id INTEGER,
  external_ombudsman_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (investor_id) REFERENCES investors (investor_id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id),
  FOREIGN KEY (external_ombudsman_id) REFERENCES external_ombudsmans (external_ombudsman_id)
);
