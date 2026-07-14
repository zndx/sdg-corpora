CREATE TABLE cells_cells (
  cell_id INTEGER NOT NULL,
  divides_into_cell_id INTEGER NOT NULL,
  PRIMARY KEY (cell_id, divides_into_cell_id),
  FOREIGN KEY (cell_id) REFERENCES cells (cell_id),
  FOREIGN KEY (divides_into_cell_id) REFERENCES cells (cell_id)
);
