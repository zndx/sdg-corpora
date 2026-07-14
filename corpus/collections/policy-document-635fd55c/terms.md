# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Policy Document
- **genus**: `cco:ont00000958`
- **definition**: A formal administrative document that establishes rules, procedures, and standards for organizational conduct.
- **attributes**: policyNumber, title, lastUpdated, issuedBy, approvedBy, status
- **relations**: supersedes→PolicyDocument, isSupersededBy→PolicyDocument, references→PolicyDocument, appliesTo→PersonnelRole

## Personnel Role
- **genus**: `bfo:0000023`
- **definition**: A role assumed by an individual within the organization, such as employee, volunteer, or contractor.
- **attributes**: roleType, department, clearanceLevel, startDate, endDate, isActive
- **relations**: holdsRole→PersonnelRole, authorizedBy→PolicyDocument, subjectTo→PolicyDocument

## Social Media Platform
- **genus**: `cco:ont00000995`
- **definition**: A digital service or application used for social networking and content sharing.
- **attributes**: platformName, platformUrl, isOfficial, approvalDate, monitoringSection, contactInfo
- **relations**: maintainedBy→PersonnelRole, subjectTo→PolicyDocument, contains→SocialMediaPost

## Social Media Post
- **genus**: `cco:ont00000995`
- **definition**: A piece of content published on a social media platform, including text, images, or videos.
- **attributes**: postId, content, postDate, postType, isOfficial, isMonitored, isSubjectToDisclosure
- **relations**: publishedOn→SocialMediaPlatform, authoredBy→PersonnelRole, relatedTo→PolicyDocument

## Investigation
- **genus**: `bfo:0000015`
- **definition**: A formal inquiry or examination conducted to establish facts and determine the truth regarding a specific incident or crime.
- **attributes**: investigationId, caseNumber, startDate, endDate, status, leadInvestigator
- **relations**: hasSubject→SocialMediaPost, approvedBy→PersonnelRole, subjectTo→PolicyDocument
