CREATE TABLE performance_reviews (
  review_id VARCHAR(44) NOT NULL,
  review_date TIMESTAMP,
  rating INTEGER,
  status VARCHAR(32),
  comments VARCHAR(32),
  employee_id INTEGER,
  conducted_by_employee_id INTEGER,
  position_id INTEGER,
  collective_bargaining_agreement_id INTEGER,
  PRIMARY KEY (review_id),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  FOREIGN KEY (conducted_by_employee_id) REFERENCES employees (id),
  FOREIGN KEY (position_id) REFERENCES positions (id),
  FOREIGN KEY (collective_bargaining_agreement_id) REFERENCES collective_bargaining_agreements (id)
);
