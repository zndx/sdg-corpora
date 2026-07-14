# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Training Plan
- **genus**: `cco:ont00000995`
- **definition**: A structured regimen designed to condition a dog and its owner for a specific physical event.
- **attributes**: planIdentifier, planTitle, targetEvent, durationWeeks, startDate, endDate, status
- **relations**: designedFor→PhysicalEvent, contains→WeeklySchedule

## Weekly Schedule
- **genus**: `cco:ont00000995`
- **definition**: A recurring set of training activities assigned to specific days of the week within a training plan.
- **attributes**: weekNumber, planIdentifier, totalDistance, targetDistance, intensityLevel
- **relations**: partOf→TrainingPlan, includes→DailyActivity

## Daily Activity
- **genus**: `bfo:0000015`
- **definition**: A specific physical exercise or rest period assigned to a dog on a particular day.
- **attributes**: activityType, scheduledDay, durationMinutes, distanceKm, pace, isRestDay
- **relations**: scheduledIn→WeeklySchedule, performedBy→Dog, supervisedBy→Owner

## Dog
- **genus**: `bfo:0000002`
- **definition**: A domesticated canine participant in a training regimen.
- **attributes**: dogIdentifier, breed, ageYears, weightKg, fitnessLevel, healthStatus
- **relations**: participatesIn→TrainingPlan, performs→DailyActivity

## Owner
- **genus**: `bfo:0000002`
- **definition**: The human guardian responsible for supervising and executing the training activities with the dog.
- **attributes**: ownerIdentifier, fullName, contactEmail, experienceLevel
- **relations**: supervises→DailyActivity, owns→Dog

## Physical Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled public or private physical activity, such as a race or walk, that serves as the goal for a training plan.
- **attributes**: eventIdentifier, eventName, eventDate, distanceKm, eventStatus
- **relations**: hasTrainingPlan→TrainingPlan
