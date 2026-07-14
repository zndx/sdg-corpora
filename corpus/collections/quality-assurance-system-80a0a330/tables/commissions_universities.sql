CREATE TABLE commissions_universities (
  national_commission_id INTEGER NOT NULL,
  university_id INTEGER NOT NULL,
  PRIMARY KEY (national_commission_id, university_id),
  FOREIGN KEY (national_commission_id) REFERENCES national_commissions (id),
  FOREIGN KEY (university_id) REFERENCES universities (university_id)
);
