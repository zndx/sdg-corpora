# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Aid Recipient
- **genus**: `bfo:0000004`
- **definition**: A person who registers to receive Christmas aid packages for their family.
- **attributes**: contactName, cellPhone, physicalAddress, registrationDeadline, registrationStatus
- **relations**: hasDependent→Child, registeredFor→AidProgram, receivesPickupReminder→NotificationEvent

## Child
- **genus**: `bfo:0000004`
- **definition**: A minor dependent of an aid recipient for whom specific aid items are requested.
- **attributes**: childName, age, sex, shirtSize, pantsSize, shoeSize, diaperSize, favoriteColor
- **relations**: dependentOf→AidRecipient

## Aid Program
- **genus**: `bfo:0000002`
- **definition**: A charitable initiative providing Christmas aid packages to families in the local area.
- **attributes**: programName, season, supportingOrganization, registrationDeadline, pickupDate, pickupStartTime, pickupEndTime
- **relations**: deliveredAt→DistributionSite, enrollsRecipient→AidRecipient

## Distribution Site
- **genus**: `bfo:0000004`
- **definition**: A physical location where aid packages are made available for family pickup.
- **attributes**: siteName, streetAddress, city, state, postalCode
- **relations**: hostsProgram→AidProgram

## Notification Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled communication event, such as a text message reminder, sent to participants.
- **attributes**: notificationType, scheduledDate, deliveryStatus
- **relations**: targetsRecipient→AidRecipient, relatedToProgram→AidProgram
