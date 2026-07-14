CREATE TABLE inventory_items (
  id INTEGER NOT NULL,
  sku VARCHAR(32),
  item_type VARCHAR(32),
  quantity_on_hand INTEGER,
  unit_cost DECIMAL,
  location_code INTEGER,
  status VARCHAR(32),
  shipment_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (shipment_record_id) REFERENCES shipment_records (shipment_record_id)
);
