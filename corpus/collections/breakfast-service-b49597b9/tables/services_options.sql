CREATE TABLE services_options (
  breakfast_service_id INTEGER NOT NULL,
  menu_option_id INTEGER NOT NULL,
  PRIMARY KEY (breakfast_service_id, menu_option_id),
  FOREIGN KEY (breakfast_service_id) REFERENCES breakfast_services (breakfast_service_id),
  FOREIGN KEY (menu_option_id) REFERENCES menu_options (menu_option_id)
);
