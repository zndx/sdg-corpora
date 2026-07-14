CREATE TABLE groups_barriers (
  vulnerable_group_id INTEGER NOT NULL,
  rights_barrier_id INTEGER NOT NULL,
  PRIMARY KEY (vulnerable_group_id, rights_barrier_id),
  FOREIGN KEY (vulnerable_group_id) REFERENCES vulnerable_groups (id),
  FOREIGN KEY (rights_barrier_id) REFERENCES rights_barriers (rights_barrier_id)
);
