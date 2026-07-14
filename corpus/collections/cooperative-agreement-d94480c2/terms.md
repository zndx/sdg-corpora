# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cooperative Agreement
- **genus**: `bfo:0000015`
- **definition**: A formal partnership arrangement between two organizations to collaborate on shared goals in the field of augmentative and alternative communication.
- **attributes**: AgreementIdentifier, StartDate, EndDate, Status, Description
- **relations**: initiatedBy→Organization, hasObjective→CommunicationGoal

## Organization
- **genus**: `bfo:0000040`
- **definition**: A structured entity, such as a society or industry association, that operates to advance specific missions in assistive technology and communication.
- **attributes**: OrganizationIdentifier, OrganizationName, LegalStatus, HeadquartersLocation, WebsiteUrl
- **relations**: initiates→CooperativeAgreement, hasMember→Individual, hosts→Conference

## Individual
- **genus**: `bfo:0000004`
- **definition**: A human person who participates in the field of augmentative and alternative communication as a user, practitioner, or professional.
- **attributes**: IndividualIdentifier, FirstName, LastName, Role, NeedsComplexCommunication
- **relations**: servedBy→Organization, uses→AssistiveTechnology

## Assistive Technology
- **genus**: `cco:ont00000995`
- **definition**: A manufactured device, system, or software designed to enhance learning, working, or daily living for persons with disabilities.
- **attributes**: TechnologyIdentifier, ProductName, TechnologyType, Manufacturer, AvailabilityStatus
- **relations**: manufacturedBy→Organization, usedBy→Individual, supports→CommunicationGoal

## Communication Goal
- **genus**: `bfo:0000015`
- **definition**: A specific objective related to the promotion, recognition, or utilization of augmentative and alternative communication methods.
- **attributes**: GoalIdentifier, GoalDescription, TargetAudience, PriorityLevel
- **relations**: pursuedBy→Organization, supportedBy→AssistiveTechnology, achievedBy→Individual

## Conference
- **genus**: `bfo:0000015`
- **definition**: A periodic educational event hosted by an organization to disseminate knowledge and resources in the field of augmentative and alternative communication.
- **attributes**: ConferenceIdentifier, ConferenceName, StartDate, EndDate, Frequency, Location
- **relations**: hostedBy→Organization, attends→Individual, covers→CommunicationGoal
