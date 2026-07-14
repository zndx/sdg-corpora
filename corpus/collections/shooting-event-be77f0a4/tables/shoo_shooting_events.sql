CREATE TABLE shoo_shooting_events (
  event_id VARCHAR(35) NOT NULL,
  event_name VARCHAR(32),
  host_city VARCHAR(32),
  host_country VARCHAR(32),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  PRIMARY KEY (event_id)
);
