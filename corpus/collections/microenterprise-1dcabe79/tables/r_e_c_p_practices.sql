CREATE TABLE r_e_c_p_practices (
  id INTEGER NOT NULL,
  practice_code VARCHAR(37),
  practice_name VARCHAR(32),
  category VARCHAR(32),
  resource_efficiency_gain DECIMAL,
  climate_resilience_score INTEGER,
  adoption_status VARCHAR(32),
  microenterprise_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (microenterprise_id) REFERENCES microenterprises (microenterprise_id)
);
