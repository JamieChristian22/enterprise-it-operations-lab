# Organizational Unit Configuration

The OU structure separates policy targets, administrative boundaries, and lifecycle states. Disabled accounts are moved to `OU=Disabled Users,OU=Users,DC=corp,DC=jamiechristian,DC=lab`, where interactive logon is denied and standard access GPOs no longer apply. Quarantined computers are moved to `OU=Quarantine,OU=Workstations,...` for restrictive firewall and remediation policy.

Protected Tier-0 objects are isolated from delegated departmental administration. `Block Inheritance` is not used on business OUs; the Domain Controllers OU retains Microsoft-recommended processing behavior.
