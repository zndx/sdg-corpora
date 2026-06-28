---
chapter_id: ch_live_ebpfprogram_loaded_in_kernel_ddf3d0
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_loaded_in_kernel', 'annotation_governed_by_classification_policy', 'syscall_with_return_type']
model: engine-refine
---

In systems that track kernel-level programs and their associated metadata, every record is anchored by a unique identifier that serves as the primary key for cross-referencing and governance. eBPF programs carry identifiers such as KERN-0001 through KERN-0004, each representing a distinct program instance loaded into the kernel. Annotations follow a parallel convention with identifiers like POLI-0001 through POLI-0004, while syscall type records use identifiers such as TYPE-0001 through TYPE-0004. These identifiers are not merely labels; they form the connective tissue that allows program metadata, annotation records, and syscall classifications to be correlated across disparate data domains. The identifier KERN-0001, for instance, appears both as the primary key of an eBPF program record and as a reference point within the loaded_in dimension, ensuring that program provenance can be traced through multiple layers of metadata.

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |

**t_syscall_with_return_type**

| id | syscall | return_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | recvfrom | int64_t | sha1 | C-07 |
| TYPE-0002 | openat | long | md5 | B-12 |
| TYPE-0003 | write | size_t | crc32 | C-07 |
| TYPE-0004 | sendto | pid_t | md5 | C-07 |
| TYPE-0005 | connect | int | blake2b | C-07 |
| TYPE-0006 | mmap | size_t | sha1 | A-01 |
| TYPE-0007 | sendto | long | md5 | D-33 |
| TYPE-0008 | accept | int | crc32 | B-12 |

The loaded_in dimension provides categorical and descriptive context for where and how eBPF programs are deployed. Each program record references a loaded_in key—KERN-0003 for program KERN-0001, KERN-0002 for program KERN-0002—that resolves to a label such as "Loaded In Label 01" and a category like "Loaded In Category 01." This separation of factual program data from descriptive metadata follows a star-schema pattern that keeps program attributes lean while allowing rich categorization to be maintained independently. The size_bytes field on the program record itself captures the binary footprint of each program, ranging from 113,209,263 bytes for KERN-0003 to 784,335,640 bytes for KERN-0001, while the version field—values of 9, 11, and 12 across the dataset—tracks which iteration of the program is currently active. Together, these fields enable operators to assess not only what a program does but how much kernel memory it consumes and whether it is running a current or legacy version.

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |

Annotation records introduce a quality-assurance layer that quantifies the reliability of program assessments through confidence and uncertainty metrics. Each annotation carries a confidence score—0.845 for POLI-0001, for example, versus 0.236 for POLI-0002—and a corresponding uncertainty value measured in absolute units, such as 690.59 for POLI-0001 and 22.02 for POLI-0004. The inverse relationship between these two measures is intentional: high confidence correlates with low uncertainty, and vice versa, providing a dual-axis view of assessment quality. The annotation_key field on the fact table points to a dimension record that supplies the annotation_label and annotation_category, mirroring the loaded_in pattern and ensuring that annotations can be grouped and filtered by type without duplicating descriptive text across fact records. The value field on each annotation—ranging from 284.47 to 979.94—represents the quantitative result of the assessment itself, whether that be a performance score, a compliance rating, or a risk metric.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

Syscall classification records complete the governance picture by documenting the interface contracts between user-space applications and the kernel. The table t_syscall_with_return_type catalogs individual system calls—recvfrom, openat, write, sendto—alongside their return types (int64_t, long, size_t, pid_t) and the checksum algorithm used to verify their integrity (sha1, md5, crc32). The checksum_algo field is particularly significant for compliance auditing: md5 appears for both openat and sendto, while recvfrom uses sha1 and write uses crc32, reflecting different security postures or performance requirements across syscall families. The code field—values like C-07 and B-12—provides an additional classification layer that likely maps to internal policy codes or compliance categories. This combination of interface signature, return type, and integrity verification method allows auditors to verify that syscall usage adheres to approved patterns and that data integrity mechanisms are appropriately selected for each operation.