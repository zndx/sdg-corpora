# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Investigation Case
- **genus**: `bfo:0000015`
- **definition**: A formal inquiry or examination into potential legal, compliance, or security incidents initiated by a company or independent committee.
- **attributes**: caseId, caseTitle, startDate, endDate, caseStatus, caseType, dataVolume
- **relations**: handledBy→LegalTechSolutionLab, uses→AIEngine, uses→DataAnalysisTool

## LegalTech Solution Lab
- **genus**: `cco:ont00000995`
- **definition**: A specialized facility integrating discovery, forensics, and cyber-security capabilities to handle large-scale investigations with tight schedules using proprietary AI and expert skills.
- **attributes**: labId, labName, location, establishmentDate, ismsCompliant, serviceScope, supportedLanguages
- **relations**: integrates→DiscoveryOperationCenter, integrates→ForensicOperationCenter, employs→AIEngine, employs→DataAnalysisTool

## Discovery Operation Center
- **genus**: `cco:ont00000995`
- **definition**: A facility supporting the discovery process, which involves evidence disclosure for international litigation, by analyzing data and logs to identify relevant information.
- **attributes**: centerId, centerName, focusArea, dataSources, analysisTechniques
- **relations**: integratedInto→LegalTechSolutionLab, supports→InvestigationCase

## Forensic Operation Center
- **genus**: `cco:ont00000995`
- **definition**: A facility that investigates fraud and other incidents using digital forensics techniques, including data salvaging, restoration, and log tracing.
- **attributes**: centerId, centerName, focusArea, techniques, reportingCapability
- **relations**: integratedInto→LegalTechSolutionLab, supports→InvestigationCase

## AI Engine
- **genus**: `cco:ont00000995`
- **definition**: A proprietary artificial intelligence engine developed by FRONTEO to enable efficient data processing, prioritization, and analysis in legal tech investigations.
- **attributes**: engineId, engineName, version, trainingData, supportedLanguages, processingEfficiency
- **relations**: usedBy→LegalTechSolutionLab, usedIn→InvestigationCase

## Data Analysis Tool
- **genus**: `cco:ont00000995`
- **definition**: A software system or tool used for data analysis, log tracing, and information aggregation in legal tech investigations, including the Lit i View series.
- **attributes**: toolId, toolName, toolType, developer, version, features
- **relations**: usedBy→LegalTechSolutionLab, usedIn→InvestigationCase
