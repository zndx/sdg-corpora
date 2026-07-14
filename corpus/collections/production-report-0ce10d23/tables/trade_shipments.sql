CREATE TABLE trade_shipments (
  shipment_id INTEGER NOT NULL,
  shipment_date DATE,
  volume_tonnes DECIMAL,
  commodity_type VARCHAR(32),
  origin_country VARCHAR(32),
  destination_country VARCHAR(32),
  geographic_region_id INTEGER,
  destined_for_geographic_region_id INTEGER,
  PRIMARY KEY (shipment_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (destined_for_geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
