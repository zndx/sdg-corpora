CREATE TABLE segments_devices (
  network_segment_id INTEGER NOT NULL,
  network_device_id INTEGER NOT NULL,
  PRIMARY KEY (network_segment_id, network_device_id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (id)
);
