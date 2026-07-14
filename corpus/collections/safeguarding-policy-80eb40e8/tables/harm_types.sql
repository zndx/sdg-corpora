CREATE TABLE harm_types (
  id INTEGER NOT NULL,
  harm_code VARCHAR(40),
  harm_category VARCHAR(32),
  severity_level INTEGER,
  description VARCHAR(32),
  requires_mandatory_reporting BOOLEAN,
  PRIMARY KEY (id)
);
