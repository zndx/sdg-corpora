# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Genomic Sample
- **genus**: `cco:ont00000995`
- **definition**: A biological specimen collected from an individual for genomic and phenotypic analysis.
- **attributes**: sampleId, collectionDate, tissueType, sequencingCoverage, qualityScore, storageLocation
- **relations**: analyzedBy→SequencingAssay, linkedTo→Individual

## Sequencing Assay
- **genus**: `bfo:0000015`
- **definition**: A laboratory process that determines the nucleotide sequence of a genomic sample.
- **attributes**: assayId, assayType, startDate, endDate, coverageDepth, platform
- **relations**: produces→GenomicDataset, performedOn→GenomicSample

## Genomic Dataset
- **genus**: `cco:ont00000995`
- **definition**: A structured collection of genomic data derived from a sequencing assay.
- **attributes**: datasetId, creationDate, sizeInGB, format, checksum, accessLevel
- **relations**: derivedFrom→SequencingAssay, storedIn→DataRepository

## Data Repository
- **genus**: `cco:ont00000995`
- **definition**: A digital storage system that houses genomic datasets and associated metadata.
- **attributes**: repositoryId, repositoryName, location, capacityTB, lastUpdated, accessProtocol
- **relations**: hosts→GenomicDataset

## Individual
- **genus**: `bfo:0000002`
- **definition**: A human person whose health and genomic data are collected and analyzed.
- **attributes**: individualId, dateOfBirth, sex, ethnicity, enrollmentDate, status
- **relations**: hasSample→GenomicSample, linkedTo→HealthRecord

## Health Record
- **genus**: `cco:ont00000995`
- **definition**: A curated compilation of an individual's clinical, biological, and behavioral health information.
- **attributes**: recordId, compilationDate, riskScore, diagnosisCodes, medicationList, lastReviewDate
- **relations**: belongsToOne→Individual, includes→GenomicDataset

## Clinical Trial
- **genus**: `bfo:0000015`
- **definition**: A research study performed on human participants to evaluate medical interventions.
- **attributes**: trialId, phase, startDate, endDate, status, primaryOutcome
- **relations**: enrolls→Individual, uses→GenomicDataset
