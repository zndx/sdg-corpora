# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Directory Entry
- **genus**: `cco:ont00000995`
- **definition**: A record representing an individual or organization registered in the NIC WHOIS database, containing contact and network information.
- **attributes**: Handle, FullName, MiddleInitial, MailingAddress, ZipCode, Telephone, AutovonNumber, FtsNumber, NetworkMailbox, RegistrationDate
- **relations**: registeredWith→NetworkInformationCenter, associatedWith→NetworkHost, uses→NetworkMailbox

## Network Information Center
- **genus**: `bfo:0000015`
- **definition**: The administrative service and database maintained by SRI International on behalf of the Defense Communications Agency that stores and serves directory information.
- **attributes**: CenterName, OperatingInstitution, SponsoringAgency, ServicePort, ServiceProtocol, ServiceHost, ServiceStatus
- **relations**: maintains→DirectoryEntry, operates→DirectoryService

## Directory Service
- **genus**: `bfo:0000015`
- **definition**: The TCP-based query/response server process that delivers directory information to users across the network.
- **attributes**: ServiceName, Protocol, PortNumber, HostAddress, ResponseFormat, ConnectionBehavior
- **relations**: serves→DirectoryEntry, runsOn→NetworkHost

## Network Host
- **genus**: `bfo:0000015`
- **definition**: A computer system connected to the ARPANET, MILNET, or DDN Internet that hosts users and services.
- **attributes**: HostName, IpAddress, NetworkType, OperatingSystem, HostStatus
- **relations**: hosts→DirectoryEntry, runs→DirectoryService

## Network Mailbox
- **genus**: `cco:ont00000995`
- **definition**: An electronic mail address associated with a registered user or organization in the directory.
- **attributes**: MailboxAddress, MailboxType, MailboxStatus
- **relations**: belongsToMany→DirectoryEntry
