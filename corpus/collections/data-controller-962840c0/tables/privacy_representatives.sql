CREATE TABLE privacy_representatives (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  appointment_date DATE,
  data_controller_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id)
);
