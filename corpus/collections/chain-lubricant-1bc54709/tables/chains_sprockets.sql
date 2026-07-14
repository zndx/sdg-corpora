CREATE TABLE chains_sprockets (
  chain_id INTEGER NOT NULL,
  sprocket_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (chain_id, sprocket_id),
  FOREIGN KEY (chain_id) REFERENCES chains (chain_id),
  FOREIGN KEY (sprocket_id) REFERENCES sprockets (sprocket_id)
);
