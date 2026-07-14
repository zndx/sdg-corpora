CREATE TABLE drives_sprockets (
  drive_id VARCHAR(35) NOT NULL,
  sprocket_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (drive_id, sprocket_id),
  FOREIGN KEY (drive_id) REFERENCES chain_drives (drive_id),
  FOREIGN KEY (sprocket_id) REFERENCES sprockets (sprocket_id)
);
