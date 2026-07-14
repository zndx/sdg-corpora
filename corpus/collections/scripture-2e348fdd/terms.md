# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Scripture
- **genus**: `cco:ont00000958`
- **definition**: A canonical book or collection of sacred texts, such as the Bible, containing divine teachings and historical records.
- **attributes**: bookCount, canonicalStatus, isGodBreathed, totalChapters, totalVerses, originalLanguage, isImmutable
- **relations**: contains→Verse, partOf→Testament

## Scripture Verse
- **genus**: `cco:ont00000958`
- **definition**: A specific textual unit within a canonical book, identified by book, chapter, and verse number.
- **attributes**: bookReference, chapterNumber, verseNumber, textContent, isPromise, isTeaching, isProphecy, isHistorical
- **relations**: partOf→Scripture, cites→Person

## Biblical Testament
- **genus**: `cco:ont00000958`
- **definition**: A major division of the Bible, comprising the Old Testament (pre-Christian) and New Testament (post-resurrection).
- **attributes**: name, isPreChristian, isPostResurrection, containsGospels, containsLaw, containsProphecy
- **relations**: contains→Scripture

## Biblical Person
- **genus**: `bfo:0000004`
- **definition**: A human or divine entity referenced in scripture, such as Jesus, Paul, or an apostle.
- **attributes**: name, isDivine, isApostle, isProphet, isDisciple, isMessiah
- **relations**: speaksIn→Verse, isSubjectOf→Verse

## Salvation Event
- **genus**: `bfo:0000015`
- **definition**: The spiritual process of being born again through faith in God's Word, resulting in eternal life.
- **attributes**: isInstantaneous, requiresFaith, isByGrace, isThroughWord, isIrreversible
- **relations**: causedBy→Verse, affects→Person

## Spiritual Change
- **genus**: `bfo:0000015`
- **definition**: The transformative process in a believer's life initiated by receiving and internalizing God's Word.
- **attributes**: isHealing, isSanctification, isEmpowerment, isOngoing, isInternal
- **relations**: triggeredBy→Verse, affects→Person
