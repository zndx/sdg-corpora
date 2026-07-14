CREATE TABLE mitigation_alerts (
  mitigation_alert_id INTEGER NOT NULL,
  alert_id INTEGER,
  severity VARCHAR(32),
  threshold_exceeded DECIMAL,
  generated_date_time TIMESTAMP,
  is_acknowledged BOOLEAN,
  status VARCHAR(32),
  forti_d_do_s_appliance_id INTEGER,
  service_id VARCHAR(44),
  d_do_s_attack_id INTEGER,
  PRIMARY KEY (mitigation_alert_id),
  FOREIGN KEY (forti_d_do_s_appliance_id) REFERENCES forti_d_do_s_appliances (id),
  FOREIGN KEY (service_id) REFERENCES verisign_d_do_s_services (service_id),
  FOREIGN KEY (d_do_s_attack_id) REFERENCES d_do_s_attacks (id)
);
