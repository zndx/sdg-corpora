CREATE TABLE packages_documents (
  security_software_package_id INTEGER NOT NULL,
  official_identification_document_id INTEGER NOT NULL,
  PRIMARY KEY (security_software_package_id, official_identification_document_id),
  FOREIGN KEY (security_software_package_id) REFERENCES security_software_packages (id),
  FOREIGN KEY (official_identification_document_id) REFERENCES official_identification_documents (official_identification_document_id)
);
