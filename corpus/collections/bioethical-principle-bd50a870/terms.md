# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Bioethical Principle
- **genus**: `bfo:0000040`
- **definition**: A foundational normative rule or standard used to guide medical ethical decision-making.
- **attributes**: principleCode, principleName, isFoundational, description
- **relations**: appliedIn→EthicalDecision

## Ethical Decision
- **genus**: `bfo:0000015`
- **definition**: A deliberative process or outcome in medical practice where conflicting bioethical principles are weighed to determine a course of action.
- **attributes**: decisionIdentifier, decisionDate, decisionStatus, clinicalContext, isControversial
- **relations**: appliesPrinciple→BioethicalPrinciple, addressesTopic→BioethicalTopic, evaluatedBy→MedicalProfessional

## Bioethical Topic
- **genus**: `bfo:0000040`
- **definition**: A specific controversial subject matter within medical ethics, such as assisted suicide or genetic manipulation, that serves as the focus of ethical deliberation.
- **attributes**: topicCode, topicName, isControversial, regulatoryStatus
- **relations**: studiedIn→Course, addressedBy→EthicalDecision

## Medical Professional
- **genus**: `bfo:0000002`
- **definition**: A qualified individual, such as a practicing physician, who possesses the clinical expertise to evaluate and make decisions regarding medical ethics.
- **attributes**: professionalID, fullName, medicalLicenseNumber, employmentStatus, specialty
- **relations**: evaluates→EthicalDecision, teaches→Course

## Course
- **genus**: `bfo:0000040`
- **definition**: An educational unit or module designed to teach foundational principles and controversial topics in medical bioethics.
- **attributes**: courseCode, courseTitle, scheduleStart, scheduleEnd, location, durationHours
- **relations**: coversTopic→BioethicalTopic, taughtBy→MedicalProfessional
