CREATE TABLE benefit_options (
  id INTEGER NOT NULL,
  option_id VARCHAR(44),
  option_name VARCHAR(32),
  payment_duration VARCHAR(32),
  has_guarantee_period BOOLEAN,
  guarantee_months INTEGER,
  survivor_benefit_percentage DECIMAL,
  PRIMARY KEY (id)
);
