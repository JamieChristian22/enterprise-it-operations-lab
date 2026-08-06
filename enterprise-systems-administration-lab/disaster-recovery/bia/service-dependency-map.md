# Service Dependency Map

- AD/DNS depends on recovery-site compute, storage, routing, and time synchronization.
- DHCP depends on AD authorization, DNS dynamic updates, and recovery VLAN routing.
- File Services depends on AD authentication, DNS, backup repository, and storage.
- SQL Application depends on AD service accounts, DNS, SQL database, application server, and firewall rules.
- IIS Intranet depends on AD, DNS, certificate availability, and file/SQL backends.
- Monitoring depends on DNS, service accounts, database storage, and network reachability.
