---
chapter_id: 9cbfe25eabefe856
topic_id: 72
family: 04_ebpf_kernel
cited_terms: ['syscall_equiv_in_subsystem', 'syscall_at_security_tier', 'syscall_max_one_return', 'syscall_subclass', 'syscall_invoked_by_event']
model: cerebras/zai-glm-4.7
---

# Kernel Interface Classification and Security Stratification

## 1.0 Scope and Preamble

This chapter establishes the formal ontological framework for classifying kernel-level system calls (syscalls) within an extended Berkeley Packet Filter (eBPF) security context. The content herein defines the axiomatic relationships between Designative Information Content Entities (ICEs), their respective subsystems, security tiers, and event-driven invocation patterns. The objective is to provide a deterministic schema for auditing kernel behavior, ensuring that syscall definitions are anchored to specific security constraints and return type cardinalities. Compliance with these classifications is mandatory for systems requiring high-assurance execution environments and granular audit trails.

## 1.1 Syscall Equivalence within Subsystems

The first axiom of the ontology defines the conditions under which a system call class is considered equivalent to a Designative ICE residing within a specific subsystem. This equivalence is not merely nominal but structural; it asserts that the class `X` is functionally identical to a Designative ICE that participates in the `inSyscallSubsystem` relationship with class `Y`. In formal ontology terms, this is expressed as `Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})`.

This distinction is critical for audit log normalization. When a syscall is identified as equivalent to a Designative ICE within a subsystem, it inherits the ontological constraints of that subsystem. For instance, a network operation defined in this manner is not just a generic function call; it is formally recognized as an entity belonging to the network subsystem, subject to all relevant ingress and egress filtering policies.

**Table 1.1: Syscall Equivalence Mappings in Network Subsystems**

The following table details specific instances where syscall classes are axiomatically defined as equivalent to Designative ICEs within the Network Subsystem. These mappings serve as the primary lookup for runtime verification agents.

| ID | Syscall Class (X) | Subsystem Class (Y) |
| :--- | :--- | :--- |
| SEQ-1001 | `TCPAcceptOperation` | `NetworkSubsystem` |
| SEQ-1002 | `UDPSocketBind` | `NetworkSubsystem` |
| SEQ-1003 | `RawSocketCapture` | `NetworkSubsystem` |
| SEQ-1004 | `NetworkInterfaceQuery` | `NetworkSubsystem` |
| SEQ-1005 | `SocketOptionManipulation` | `NetworkSubsystem` |

*Table 1.1 illustrates the instantiation of Axiom 1, demonstrating that specific syscall classes are ontologically equivalent to Designative ICEs located within the Network Subsystem.*

## 2.0 Security Tier Stratification

Building upon the basic classification of syscalls, the ontology introduces a vertical layering model known as security tiers. Axiom 2 posits that a class `X` is a subclass of a Designative ICE and exists at a specific security tier `Y`. The verbalization of this axiom states: "{X} is something that at security tier {Y}". This relationship is formally encoded as `Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:atSecurityTier some {Y:Class}`.

This stratification enables enforcement of Boundary Control Policies (BCP). Syscalls residing in higher-security tiers (e.g., Ring 0 or Hypervisor layers) are subject to stricter invocation checks than those in user-space tiers. The ontology ensures that any entity classified as `X` cannot be invoked without the requisite privileges associated with tier `Y`. This is particularly relevant for eBPF programs, which must verify that the target syscall's security tier permits the requested operation without escalating privileges inadvertently.

**Table 2.1: Syscall Security Tier Assignments**

The table below enumerates the relationship between specific syscall classes and their mandated security tiers. These assignments are derived from the kernel's capability security model.

| ID | Syscall Class (X) | Security Tier (Y) |
| :--- | :--- | :--- |
| TIER-201 | `ProcessMemoryWrite` | `KernelModeTier` |
| TIER-202 | `IOControlPortAccess` | `HardwareAbstractionTier` |
| TIER-203 | `FilesystemMount` | `PrivilegedOperationTier` |
| TIER-204 | `UserSpaceMemoryAlloc` | `UserModeTier` |
| TIER-205 | `SystemTimeModification` | `SystemCriticalTier` |

*Table 2.1 represents the instantiation of Axiom 2, categorizing syscalls by their requisite security clearance levels.*

## 3.0 Return Type Cardinality Constraints

To maintain type safety and predictability in kernel-audit interfaces, the ontology enforces strict cardinality constraints on return types. Axiom 3 defines that a class `X` is a subclass of a Designative ICE and possesses a return type relationship with class `Y` that has a maximum cardinality of 1. The Manchester syntax for this axiom is `Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:hasReturnType max 1 {Y:Class}`.

The verbalization, "{X} is a designative information content entity," emphasizes the informational nature of the syscall. The constraint `max 1` ensures that the syscall is deterministic in its output schema. In the context of automated log parsing and anomaly detection, this axiom guarantees that a syscall will not return polymorphic types unpredictably. If a syscall is defined under this axiom, an auditing system may confidently expect a single type of return value (e.g., an integer file descriptor or a void status), facilitating the construction of reliable regular expressions and parser logic.

**Table 3.1: Syscall Return Type Constraints**

This table provides the return type mappings for various syscall classes, adhering to the `max 1` cardinality constraint.

| ID | Syscall Class (X) | Return Type (Y) |
| :--- | :--- | :--- |
| RET-301 | `FileDescriptorOpen` | `IntegerType` |
| RET-302 | `ProcessIdentifierGet` | `IntegerType` |
| RET-303 | `BufferReadOperation` | `ByteCountType` |
| RET-304 | `SignalEmission` | `VoidType` |
| RET-305 | `SharedMemoryAttach` | `PointerType` |

*Table 3.1 demonstrates the application of Axiom 3, linking syscall classes to their singular, deterministic return types.*

## 4.0 Subsystem Hierarchies and Inheritance

While Axiom 1 establishes equivalence, Axiom 4 establishes hierarchical inheritance. This axiom asserts that a class `X` is a subclass of a Designative ICE that exists within a syscall subsystem `Y`. The formal definition is `Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:inSyscallSubsystem some {Y:Class}`. The verbalization clarifies: "{X} is something that in syscall subsystem {Y}".

This relationship is fundamental for applying subsystem-wide policies. By defining `X` as a subclass of an entity within subsystem `Y`, all properties and constraints applicable to `Y` propagate to `X`. For example, if the `ProcessManagementSubsystem` requires logging of all execution times, any syscall subclassed within this domain inherits that logging requirement automatically. This mechanism reduces policy redundancy and ensures that new syscalls introduced into the system are immediately governed by the ontological rules of their parent subsystem.

**Table 4.1: Syscall Subsystem Classifications**

The following table maps syscall classes to their parent subsystems, illustrating the subclass hierarchy defined in Axiom 4.

| ID | Syscall Class (X) | Subsystem Class (Y) |
| :--- | :--- | :--- |
| SUB-401 | `ThreadGroupCreate` | `ProcessManagementSubsystem` |
| SUB-402 | `VirtualMemoryMap` | `MemoryManagementSubsystem` |
| SUB-403 | `InterProcessCommunication` | `IPCSubsystem` |
| SUB-404 | `DeviceDriverRegister` | `DeviceManagementSubsystem` |
| SUB-405 | `CapabilitySet` | `SecurityFrameworkSubsystem` |

*Table 4.1 details the instantiation of Axiom 4, showing the inheritance of syscalls within specific kernel subsystems.*

## 5.0 Event-Driven Invocation Tracing

The final axiom addresses the causal chain of syscall execution. Axiom 5 states that a class `X` is a subclass of a Designative ICE that is invoked by a specific event class `Y`. The axiom is expressed as `Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:invokedByEvent some {Y:Class}`. Verbalized, "{X} is something that invoked by event {Y}".

This ontological link is essential for forensic analysis and root cause determination. By explicitly binding a syscall to an invoking event, the ontology creates a traceable path from hardware interrupts or software traps to the resulting kernel behavior. This allows security auditors to distinguish between syscalls that are triggered by legitimate user-space requests versus those triggered by asynchronous kernel events (such as page faults or timer expirations). Understanding this distinction is vital for constructing accurate Execution Flow Graphs (EFGs) during a post-mortem investigation.

**Table 5.1: Event-Driven Syscall Invocation**

The table below catalogs the specific events that trigger the invocation of various syscall classes, as defined by Axiom 5.

| ID | Syscall Class (X) | Invoking Event (Y) |
| :--- | :--- | :--- |
| EVT-501 | `PageFaultHandler` | `MemoryAccessViolationEvent` |
| EVT-502 | `SignalDispatch` | `HardwareInterruptEvent` |
| EVT-503 | `SchedulerYield` | `TimerExpirationEvent` |
| EVT-504 | `SocketPoll` | `NetworkPacketArrivalEvent` |
| EVT-505 | `ExitProcessCleanup` | `TerminationSignalEvent` |

*Table 5.1 provides evidence for Axiom 5, linking syscall execution to specific triggering events within the kernel environment.*

```json
{
  "tables": [
    {
      "name": "t_syscall_equiv_in_subsystem",
      "rows": [
        ["SEQ-1001", "TCPAcceptOperation", "NetworkSubsystem"],
        ["SEQ-1002", "UDPSocketBind", "NetworkSubsystem"],
        ["SEQ-1003", "RawSocketCapture", "NetworkSubsystem"],
        ["SEQ-1004", "NetworkInterfaceQuery", "NetworkSubsystem"],
        ["SEQ-1005", "SocketOptionManipulation", "NetworkSubsystem"]
      ]
    },
    {
      "name": "t_syscall_at_security_tier",
      "rows": [
        ["TIER-201", "ProcessMemoryWrite", "KernelModeTier"],
        ["TIER-202", "IOControlPortAccess", "HardwareAbstractionTier"],
        ["TIER-203", "FilesystemMount", "PrivilegedOperationTier"],
        ["TIER-204", "UserSpaceMemoryAlloc", "UserModeTier"],
        ["TIER-205", "SystemTimeModification", "SystemCriticalTier"]
      ]
    },
    {
      "name": "t_syscall_max_one_return",
      "rows": [
        ["RET-301", "FileDescriptorOpen", "IntegerType"],
        ["RET-302", "ProcessIdentifierGet", "IntegerType"],
        ["RET-303", "BufferReadOperation", "ByteCountType"],
        ["RET-304", "SignalEmission", "VoidType"],
        ["RET-305", "SharedMemoryAttach", "PointerType"]
      ]
    },
    {
      "name": "t_syscall_subclass",
      "rows": [
        ["SUB-401", "ThreadGroupCreate", "ProcessManagementSubsystem"],
        ["SUB-402", "VirtualMemoryMap", "MemoryManagementSubsystem"],
        ["SUB-403", "InterProcessCommunication", "IPCSubsystem"],
        ["SUB-404", "DeviceDriverRegister", "DeviceManagementSubsystem"],
        ["SUB-405", "CapabilitySet", "SecurityFrameworkSubsystem"]
      ]
    },
    {
      "name": "t_syscall_invoked_by_event",
      "rows": [
        ["EVT-501", "PageFaultHandler", "MemoryAccessViolationEvent"],
        ["EVT-502", "SignalDispatch", "HardwareInterruptEvent"],
        ["EVT-503", "SchedulerYield", "TimerExpirationEvent"],
        ["EVT-504", "SocketPoll", "NetworkPacketArrivalEvent"],
        ["EVT-505", "ExitProcessCleanup", "TerminationSignalEvent"]
      ]
    }
  ]
}
```