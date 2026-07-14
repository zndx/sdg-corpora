CREATE TABLE user_roles (
  id INTEGER NOT NULL,
  role_id VARCHAR(44),
  role_name VARCHAR(32),
  role_description VARCHAR(32),
  max_resources INTEGER,
  mobile_worker_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (mobile_worker_id) REFERENCES mobile_workers (mobile_worker_id)
);
