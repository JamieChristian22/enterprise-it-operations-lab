# Lessons Learned Register

| ID | Incident | Lesson | Control introduced | Verification |
|---|---|---|---|---|
| LL-01 | INC-1007 | Redundant DNS servers do not guarantee fast client failover | Balanced resolver order and synthetic identity transactions | Quarterly DNS failover exercise |
| LL-02 | INC-1018 | Circuit-up status does not equal usable application quality | Application-aware loss, jitter, and MOS thresholds | Monthly degraded-path test |
| LL-03 | INC-1024 | Mail connector reachability is not end-to-end delivery validation | External delivery and TLS-name tests | Three-domain pre-production test |
| LL-04 | INC-1031 | Temporary data requires isolation and quotas | Dedicated quota and automated cleanup | Daily cleanup report |
| LL-05 | INC-1042 | Certificate lifecycle must have accountable ownership | Central inventory, backup owner, automated renewal | Monthly certificate audit |
| LL-06 | INC-1055 | Credential rotation is incomplete until dependencies pass | Dependency inventory and post-rotation tests | Change closure gate |
| LL-07 | INC-1063 | Malware containment must include identity and email | Integrated device, token, account, and message response | Quarterly security tabletop |
| LL-08 | INC-1071 | Oversized VMs can degrade shared cluster performance | Capacity review and rightsizing policy | Monthly vSphere report |

## Review Cadence

The Infrastructure Manager reviews this register during the monthly operations review. New lessons must map to a measurable control, named owner, validation method, and recurring review where appropriate.
