CREATE TABLE breakfast_services (
  breakfast_service_id INTEGER NOT NULL,
  service_id VARCHAR(44),
  name VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  status VARCHAR(32),
  is_buffet_style BOOLEAN,
  guest_reservation_id INTEGER,
  PRIMARY KEY (breakfast_service_id),
  FOREIGN KEY (guest_reservation_id) REFERENCES guest_reservations (guest_reservation_id)
);
