CREATE TABLE lenders_businesses (
  institutional_lender_id INTEGER NOT NULL,
  small_business_id INTEGER NOT NULL,
  PRIMARY KEY (institutional_lender_id, small_business_id),
  FOREIGN KEY (institutional_lender_id) REFERENCES institutional_lenders (institutional_lender_id),
  FOREIGN KEY (small_business_id) REFERENCES small_businesses (id)
);
