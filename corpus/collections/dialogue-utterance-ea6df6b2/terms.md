# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## A single spoken statement by a character in a conversation
- **genus**: `bfo:0000015`
- **definition**: A discrete verbal act performed by a character at a specific moment, containing quoted text and associated metadata.
- **attributes**: utteranceId, quotedText, speakerName, timestamp, isInternalThought, vocalizationMode
- **relations**: spokenBy→Character, partOfConversation→SocialInteractionEvent

## A person participating in the dialogue
- **genus**: `bfo:0000002`
- **definition**: A real physical entity (human) who speaks, acts, or thinks within the narrative context.
- **attributes**: characterId, fullName, ageGroup, gender, hasGoggles, swimmingAbility
- **relations**: utters→DialogueUtterance, interactsWith→Character, purchasesItem→SwimmingGoggle

## A structured conversation or social exchange between characters
- **genus**: `bfo:0000015`
- **definition**: A temporal process involving two or more characters exchanging dialogue and performing related actions.
- **attributes**: eventId, location, startTime, endTime, activityType, weatherCondition
- **relations**: containsUtterance→DialogueUtterance, involvesCharacter→Character, takesPlaceAt→Location

## A physical place where events or utterances occur
- **genus**: `bfo:0000004`
- **definition**: A spatial region or facility that serves as the setting for social interactions and physical activities.
- **attributes**: locationId, name, type, hasSlide, waterTemperature, isIndoor
- **relations**: hostsEvent→SocialInteractionEvent, containsFeature→LocationFeature

## A wearable item used for eye protection in water
- **genus**: `cco:ont00000995`
- **definition**: A manufactured artifact designed to protect the eyes from water irritation during swimming activities.
- **attributes**: goggleId, brand, price, comfortLevel, causesEyeIrritation, purchaseDate
- **relations**: purchasedBy→Character, usedInEvent→SocialInteractionEvent, sellsItem→Location
