CREATE TABLE graphics_apis (
  graphics_api_id INTEGER NOT NULL,
  api_name VARCHAR(32),
  specification_version VARCHAR(32),
  conformance_status VARCHAR(32),
  standard_body VARCHAR(32),
  PRIMARY KEY (graphics_api_id)
);
