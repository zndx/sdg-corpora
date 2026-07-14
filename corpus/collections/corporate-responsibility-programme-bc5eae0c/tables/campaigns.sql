CREATE TABLE campaigns (
  id INTEGER NOT NULL,
  campaign_id INTEGER,
  campaign_title VARCHAR(32),
  launch_date TIMESTAMP,
  end_date TIMESTAMP,
  reach INTEGER,
  campaign_status VARCHAR(32),
  professional_id INTEGER,
  c_s_r_component_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id),
  FOREIGN KEY (c_s_r_component_id) REFERENCES c_s_r_components (id)
);
