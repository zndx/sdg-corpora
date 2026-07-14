CREATE TABLE shops_technicians (
  auto_repair_shop_id INTEGER NOT NULL,
  technician_id INTEGER NOT NULL,
  PRIMARY KEY (auto_repair_shop_id, technician_id),
  FOREIGN KEY (auto_repair_shop_id) REFERENCES auto_repair_shops (id),
  FOREIGN KEY (technician_id) REFERENCES technicians (id)
);
