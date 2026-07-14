# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Conversion Moment
- **genus**: `bfo:0000015`
- **definition**: A dramatic and personal encounter with Jesus that initiates a transformative spiritual conversion in a Christian's life.
- **attributes**: momentId, encounterDate, impactDescription, responseAction, isDramatic
- **relations**: initiatedBy→DivinePhysician, triggeredBy→ScripturalReference

## Scriptural Reference
- **genus**: `cco:ont00000958`
- **definition**: A specific citation from sacred texts used to illustrate or ground a theological concept or narrative.
- **attributes**: referenceId, bookName, chapterNumber, verseStart, verseEnd, textExcerpt
- **relations**: cites→BiblicalCharacter, illustrates→ConversionMoment

## Biblical Character
- **genus**: `bfo:0000015`
- **definition**: A named individual from sacred narratives who serves as an exemplar of faith or spiritual response.
- **attributes**: characterId, name, role, isDisciple, occupation
- **relations**: respondedTo→DivinePhysician, appearsIn→ScripturalReference

## Divine Physician
- **genus**: `bfo:0000015`
- **definition**: A theological designation for Jesus Christ in his role as healer of spiritual sickness and initiator of conversion.
- **attributes**: physicianId, title, healsSpiritualSickness, callsAllMen
- **relations**: heals→ConversionMoment, calls→BiblicalCharacter

## Spiritual Need
- **genus**: `bfo:0000015`
- **definition**: An identified area of spiritual deficiency or sickness in a believer's life requiring divine healing and conversion.
- **attributes**: needId, needType, severityLevel, isAddressedByPhysician, requiresConversion
- **relations**: addressedBy→DivinePhysician, manifestsIn→ConversionMoment
