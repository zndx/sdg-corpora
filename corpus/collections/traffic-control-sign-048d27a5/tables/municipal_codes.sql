CREATE TABLE municipal_codes (
  id INTEGER NOT NULL,
  code_title INTEGER,
  code_chapter VARCHAR(44),
  code_section VARCHAR(44),
  enactment_date DATE,
  amendment_date DATE,
  rule_code VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (rule_code) REFERENCES traffic_rules (rule_code)
);
