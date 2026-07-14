CREATE TABLE records_items (
  shipment_record_id INTEGER NOT NULL,
  inventory_item_id INTEGER NOT NULL,
  PRIMARY KEY (shipment_record_id, inventory_item_id),
  FOREIGN KEY (shipment_record_id) REFERENCES shipment_records (shipment_record_id),
  FOREIGN KEY (inventory_item_id) REFERENCES inventory_items (id)
);
