---
chapter_id: ch_live_student_privacy_expectation_3094ae
topic_id: 185
family: 08_derived
cited_terms: ['student_privacy_expectation', 'division_assignment_record', 'dempster_combines_audit_evidences']
model: engine-refine
---

Athlete and division assignments are captured through a fact table that records the pairing of individual competitors with their respective competitive divisions, each entry carrying a confidence score, an uncertainty magnitude, and a numeric value that likely represents a measured or derived performance metric. The assignment records reference external identifiers for both the athlete and the division, which are themselves described in separate dimension tables that provide categorical labels and classification codes. For instance, record RECO-0001 links athlete key RECO-0001 to division key RECO-0007 with a confidence of 0.517 and an uncertainty of 96.89, while record RECO-0002 pairs athlete RECO-0004 with division RECO-0003 at a substantially higher confidence of 0.806 and an uncertainty of 738.86. The associated dimension tables supply human-readable labels—Assigns Athlete Label 01 through Assigns Athlete Label 04 and Assigns Division Label 01 through Assigns Division Label 04—alongside categorical designations such as Assigns Athlete Category 01 and Assigns Division Category 02, enabling downstream systems to resolve abstract foreign keys into meaningful organizational units.

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |

The Dempster-Shafer evidential framework is represented through a parallel fact table that stores belief assignments indexed by a Dempster key, each entry accompanied by a confidence value, an uncertainty measure, and a numeric value. These records—identified as EVID-0001 through EVID-0004—reference Dempster keys such as EVID-0007 and EVID-0003, which in turn are described in a dimension table providing Dempster Label 01 through Dempster Label 04 and Dempster Category 01 through Dempster Category 04. The confidence values span a wide range, from the low-evidence reading of 0.014 in record EVID-0002 to the comparatively strong assignment of 0.728 in EVID-0004, while the uncertainty figures exhibit commensurate variation, ranging from 9.49 to 687.80. The numeric values associated with these records—520.46, 137.18, 197.61, and 846.10—serve as the quantitative anchors for belief mass calculations within the Dempster-Shafer combination rules.

Student privacy expectations are formalized as a distinct entity that binds named individuals to the protected locations where their sensitive information is stored, with an associated confidence score and a dimension kind that classifies the nature of the protection requirement. The privacy expectation records—EXPE-0001 through EXPE-0004—associate students such as Casey Nguyen, Sam Rivera, Emma Wilson, and David Kim with protected locations including the Disciplinary Archive, Counseling Records, and the Biometric Scanner. The confidence values assigned to these expectations vary considerably: Sam Rivera's expectation carries a high confidence of 0.908, whereas Emma Wilson's is assigned a notably low confidence of 0.047, suggesting either weak evidentiary support or a deliberately conservative assessment. The dimension kind attribute further categorizes each expectation along physical measurement axes—mass, time, length, and pressure—which may correspond to different regulatory or technical protection modalities applied to the protected location.

**t_student_privacy_expectation**

| id | student_privacy_expectation | applies_to | confidence | dimension_kind |
| --- | --- | --- | --- | --- |
| EXPE-0001 | Casey Nguyen | Disciplinary Archive | 0.655 | mass |
| EXPE-0002 | Sam Rivera | Counseling Records | 0.908 | time |
| EXPE-0003 | Emma Wilson | Biometric Scanner | 0.047 | length |
| EXPE-0004 | David Kim | Biometric Scanner | 0.667 | pressure |
| EXPE-0005 | Emma Wilson | Athletics Roster | 0.940 | temperature |
| EXPE-0006 | Maria Gonzalez | Research Lab Server | 0.441 | temperature |
| EXPE-0007 | Alex Chen | Student Health Portal | 0.209 | time |
| EXPE-0008 | Priya Patel | Cafeteria POS | 0.835 | temperature |

The coexistence of confidence and uncertainty as paired metrics across the assignment and evidential fact tables reflects a deliberate design choice to quantify both the strength of belief and the residual ignorance inherent in each record. In the division assignment facts, confidence values such as 0.257 and 0.083 sit alongside uncertainty magnitudes of 500.56 and 740.08, respectively, indicating that low-confidence assignments are accompanied by proportionally large uncertainty bounds. Similarly, in the Dempster evidential facts, the record with the highest confidence (0.728) exhibits a moderate uncertainty of 479.57, while the record with the lowest confidence (0.014) carries an uncertainty of 392.06, demonstrating that the uncertainty metric does not scale linearly with confidence but instead captures domain-specific variance. The numeric values stored in these fact tables—ranging from 137.18 to 846.10 in the Dempster facts and from 254.97 to 407.11 in the division facts—provide the quantitative substrate upon which belief combination, allocation, and audit operations are performed.