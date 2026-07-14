# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Shooting Event
- **genus**: `bfo:0000015`
- **definition**: A competitive shooting competition held at a specific location and time.
- **attributes**: event_id, event_name, host_city, host_country, start_date, end_date, status
- **relations**: hasParticipant→Shooter, hasResult→CompetitionResult

## Shooter
- **genus**: `bfo:0000015`
- **definition**: An athlete who participates in shooting competitions.
- **attributes**: shooter_id, first_name, last_name, nationality, gender, birth_date
- **relations**: participatesIn→ShootingEvent, competesIn→Discipline, hasResult→CompetitionResult

## Discipline
- **genus**: `bfo:0000015`
- **definition**: A specific shooting event category within a competition.
- **attributes**: discipline_id, discipline_name, weapon_type, distance, gender_category, format
- **relations**: partOf→ShootingEvent, hasResult→CompetitionResult

## Competition Result
- **genus**: `cco:ont00000995`
- **definition**: A record of a shooter's performance in a specific discipline.
- **attributes**: result_id, qualification_score, final_score, aggregate_score, rank, medal, status
- **relations**: recordedBy→Shooter, forDiscipline→Discipline, partOfEvent→ShootingEvent

## Team Result
- **genus**: `cco:ont00000995`
- **definition**: A record of a team's performance in a team discipline.
- **attributes**: team_result_id, total_score, rank, medal, team_name
- **relations**: forDiscipline→Discipline, partOfEvent→ShootingEvent, composedOf→Shooter
