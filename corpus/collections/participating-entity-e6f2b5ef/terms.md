# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Participating Entity
- **genus**: `bfo:0000004`
- **definition**: A legal or informal group of farmers, such as an FPO, FPC, FIG, or Farmers' Club, or an individual farmer, that applies to participate in the Sufal Bangla Project and the Ahare Bangla Food Festival.
- **attributes**: entityIdentifier, entityType, entityName, contactPerson, contactAddress, contactPhone, enrolmentStatus
- **relations**: submitsApplicationFor→FestivalParticipation, displaysProductsAt→FestivalBooth

## Festival Participation
- **genus**: `bfo:0000015`
- **definition**: The activity of a Participating Entity enrolling in and participating in the Ahare Bangla Food Festival under the Sufal Bangla Project.
- **attributes**: participationId, festivalName, applicationDate, evaluationResult, qualityScore, standardCompliance
- **relations**: hasParticipatingEntity→ParticipatingEntity, hasFestivalBooth→FestivalBooth, hasProductDisplay→ProductDisplay

## Festival Booth
- **genus**: `bfo:0000040`
- **definition**: A physical stall or space allocated at the Milan Mela Ground for a Participating Entity to display and sell their products during the Ahare Bangla Food Festival.
- **attributes**: boothId, boothLocation, boothSize, boothStatus, setupDate, dismantleDate
- **relations**: hostedAt→FestivalVenue, assignedToParticipation→FestivalParticipation, displaysProducts→ProductDisplay

## Festival Venue
- **genus**: `bfo:0000002`
- **definition**: The physical location, Milan Mela Ground in Kolkata, where the Ahare Bangla Food Festival is held.
- **attributes**: venueId, venueName, city, district, state, pinCode, festivalStartDate, festivalEndDate
- **relations**: hostsBooths→FestivalBooth

## Product Display
- **genus**: `bfo:0000040`
- **definition**: The specific agricultural produce or product that a Participating Entity displays and sells at their Festival Booth.
- **attributes**: displayId, productName, productCategory, quantity, unitOfMeasure, pricePerUnit, qualityGrade
- **relations**: displayedBy→FestivalParticipation, locatedAt→FestivalBooth
