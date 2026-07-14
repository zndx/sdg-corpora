# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Genomic Sample
- **genus**: `cco:ont00000995`
- **definition**: A physical biological specimen collected from an individual for genomic and phenotypic analysis.
- **attributes**: sampleId, collectionDate, tissueType, sequencingCoverage, sampleStatus
- **relations**: analyzedBy→SequencingAssay, derivedFrom→Individual, storedIn→Biorepository

## Individual
- **genus**: `bfo:0000004`
- **definition**: A single human being from whom biological and health data are collected.
- **attributes**: individualId, dateOfBirth, sex, enrollmentStatus, insuranceProvider
- **relations**: hasSample→GenomicSample, hasHealthRecord→HealthRecord, enrolledIn→ClinicalProgram

## Sequencing Assay
- **genus**: `bfo:0000015`
- **definition**: A laboratory process or activity that determines the nucleotide sequence of a genomic sample.
- **attributes**: assayId, assayType, coverageDepth, platform, resultStatus
- **relations**: processes→GenomicSample, produces→GenomicDataset, performedBy→Laboratory

## Genomic Dataset
- **genus**: `cco:ont00000958`
- **definition**: A structured collection of digital data representing the sequenced genetic information of a sample.
- **attributes**: datasetId, format, sizeGB, uploadDate, accessLevel
- **relations**: derivedFrom→SequencingAssay, storedIn→Database, usedIn→AnalysisPipeline

## Health Record
- **genus**: `cco:ont00000958`
- **definition**: A curated digital document containing an individual's clinical, phenotypic, and behavioral health information.
- **attributes**: recordId, lastUpdated, completenessScore, recordType, privacyLevel
- **relations**: belongs_to→Individual, supplements→GenomicDataset, accessedBy→Researcher

## Clinical Program
- **genus**: `bfo:0000015`
- **definition**: A structured research or service initiative designed to investigate health outcomes or deliver genomic insights.
- **attributes**: programId, startDate, endDate, programType, targetDisease
- **relations**: enrolls→Individual, utilizes→GenomicDataset, fundedBy→PartnerOrganization

## Partner Organization
- **genus**: `bfo:0000040`
- **definition**: An external entity such as a pharmaceutical company, insurer, or academic center collaborating with the genomic intelligence provider.
- **attributes**: orgId, orgName, sector, contractStartDate, contractEndDate
- **relations**: funds→ClinicalProgram, licenses→GenomicDataset, collaboratesWith→Laboratory
