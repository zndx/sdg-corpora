CREATE TABLE docks_sailboats (
  dock_id INTEGER NOT NULL,
  sailboat_id INTEGER NOT NULL,
  PRIMARY KEY (dock_id, sailboat_id),
  FOREIGN KEY (dock_id) REFERENCES docks (id),
  FOREIGN KEY (sailboat_id) REFERENCES sailboats (id)
);
