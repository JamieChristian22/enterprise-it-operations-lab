# PRB-DR-001 — DNS Cutover Delay

Root cause: Production service records used a 3600-second TTL.
Corrective action: Use 300-second TTL before planned exercises and maintain pre-staged recovery aliases.
Validation: Retest completed in six minutes.
