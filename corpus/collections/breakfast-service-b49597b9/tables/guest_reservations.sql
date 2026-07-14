CREATE TABLE guest_reservations (
  guest_reservation_id INTEGER NOT NULL,
  reservation_id VARCHAR(44),
  guest_name VARCHAR(32),
  check_in_date DATE,
  room_number VARCHAR(32),
  dietary_restrictions VARCHAR(32),
  status VARCHAR(32),
  breakfast_service_id INTEGER,
  menu_option_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (guest_reservation_id),
  FOREIGN KEY (breakfast_service_id) REFERENCES breakfast_services (breakfast_service_id),
  FOREIGN KEY (menu_option_id) REFERENCES menu_options (menu_option_id)
);
