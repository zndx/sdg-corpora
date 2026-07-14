CREATE TABLE inspection_bodies (
  inspection_body_id INTEGER NOT NULL,
  body_name VARCHAR(32),
  parent_department VARCHAR(32),
  statutory_powers BOOLEAN,
  jurisdiction VARCHAR(32),
  PRIMARY KEY (inspection_body_id)
);
