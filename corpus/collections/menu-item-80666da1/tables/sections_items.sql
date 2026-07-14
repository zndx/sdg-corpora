CREATE TABLE sections_items (
  section_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (section_id, menu_item_id),
  FOREIGN KEY (section_id) REFERENCES menu_sections (section_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
