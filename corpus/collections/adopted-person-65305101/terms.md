# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Adopted Person
- **genus**: `bfo:0000040`
- **definition**: A justified person who has been legally and spiritually adopted into the family of God, receiving the status and privileges of a child of God.
- **attributes**: personId, justificationDate, adoptionStatus, spiritualName, inheritanceStatus, redemptionDay
- **relations**: receivesSpiritOf→AdoptionSpirit, enjoysPrivilegeOf→DivinePrivilege, subjectToChasteningBy→DivineChastening, sealedBy→AdoptionSeal

## Spirit of Adoption
- **genus**: `bfo:0000040`
- **definition**: The Holy Spirit given to adopted persons, enabling them to know God as Father and bear His image.
- **attributes**: spiritId, bestowalDate, spiritType, functionDescription
- **relations**: enablesAccessTo→ThroneOfGrace, guaranteesInheritanceFor→AdoptedPerson

## Divine Privilege
- **genus**: `bfo:0000040`
- **definition**: A specific liberty or benefit granted to adopted persons, such as bold access to God's presence or divine provision.
- **attributes**: privilegeId, privilegeType, scripturalReference, beneficiaryCount
- **relations**: enjoyedBy→AdoptedPerson, grantedBy→DivineFather

## Divine Father
- **genus**: `bfo:0000040`
- **definition**: God as the adoptive parent who numbers persons as children, bestows His name, and provides for their needs.
- **attributes**: fatherId, divineName, relationshipType, covenantStatus
- **relations**: adopts→AdoptedPerson, bestowsNameOn→AdoptedPerson, chastens→AdoptedPerson

## Adoption Seal
- **genus**: `bfo:0000040`
- **definition**: The spiritual guarantee or mark placed on adopted persons, signifying their secure status as children of God until the day of redemption.
- **attributes**: sealId, sealDate, sealType, validUntil
- **relations**: marks→AdoptedPerson, guarantees→EternalInheritance

## Eternal Inheritance
- **genus**: `bfo:0000040`
- **definition**: The everlasting salvation and promises received by adopted persons upon the completion of their adoption.
- **attributes**: inheritanceId, inheritanceType, distributionDate, valueDescription
- **relations**: receivedBy→AdoptedPerson, guaranteedBy→AdoptionSeal
