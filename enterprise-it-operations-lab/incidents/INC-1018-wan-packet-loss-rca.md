# Incident Report: Distribution Site WAN Packet Loss

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1018 |
| Severity | SEV-2 High |
| Status | Closed |
| Start time | June 18, 2026, 13:11 ET |
| Detection time | June 18, 2026, 13:18 ET |
| Mitigation time | June 18, 2026, 13:47 ET |
| Restoration time | June 18, 2026, 14:47 ET |
| Duration | 96 minutes |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Alex Romero, Network Administrator |
| Service Owner | Elena Brooks, Distribution Operations Director |
| Affected service | WAN, VoIP, warehouse management access |
| Affected scope | 116 users at Distribution Site 2 |
| Detection source | Service-desk calls followed by WAN monitoring |
| Vendor case | NBR-884219 |
| Problem record | PRB-2026-021 |

## Executive Summary

A carrier edge-interface fault caused 18–35% packet loss on the primary MPLS circuit at Distribution Site 2. The SD-WAN appliance did not fail over automatically because its configured loss threshold required 40% loss for five consecutive minutes. Voice quality, remote desktop sessions, label printing, and warehouse transactions degraded. The team manually failed traffic to the secondary broadband circuit, then the carrier replaced a failing optical transceiver.

## Impact

- 116 warehouse and office users experienced intermittent connectivity.
- 41 VoIP calls dropped and mean opinion score fell to 2.4.
- 238 warehouse transactions required retry.
- Shipping label generation was delayed by an average of 6 minutes.
- No transactions or data were lost.
- The SEV-2 four-hour restoration target was met.

## Severity Justification

An entire business site experienced major degradation of WAN, voice, and warehouse operations. A secondary circuit existed, but automatic failover did not engage. This met SEV-2 criteria.

## Detection

Users reported choppy calls at 13:18. Monitoring had recorded elevated loss beginning at 13:11 but did not alert because the threshold was set above the observed degradation. MTTD was seven minutes, revealing a detection-control gap.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 13:11 | Packet loss began on primary MPLS circuit | Carrier telemetry | NBR-884219 |
| 13:18 | Service desk linked five calls and escalated | Service Desk | SD-MI-1018 |
| 13:22 | Network analyst confirmed 22% loss beyond local gateway | Alex Romero | NET-TEST-1018-01 |
| 13:27 | SEV-2 declared; carrier case opened | Jamie Christian | BRIDGE-1018 |
| 13:34 | LAN switching, CPU, errors, and secondary circuit checked healthy | Network | NET-TEST-1018-02 |
| 13:39 | SD-WAN threshold identified as preventing failover | Network | CFG-SDWAN-02 |
| 13:43 | Manual failover risk reviewed and approved | Incident Commander | DEC-1018-01 |
| 13:47 | Traffic moved to secondary broadband circuit | Network | CHG-EMG-260618-02 |
| 13:53 | Loss below 0.5%; voice and WMS tests passed | Operations | VAL-1018-01 |
| 14:21 | Carrier isolated failing optical transceiver | Carrier | NBR-884219 |
| 14:39 | Carrier replaced transceiver; primary circuit stabilized | Carrier | NBR-884219 |
| 14:47 | Primary placed in monitored standby; incident closed | Incident Commander | CLOSE-1018 |

## Technical Investigation

Testing compared LAN, primary WAN, secondary WAN, VPN, and application paths.

- Switch interfaces showed no local CRC errors, drops, duplex mismatch, or congestion.
- Continuous ping to the LAN gateway showed 0% loss.
- Traceroute and path tests showed loss beginning at the carrier edge.
- Secondary broadband circuit held below 0.5% loss and 29 ms latency.
- SD-WAN policy used a 40% loss threshold and a five-minute hold time.
- Voice degradation began above 5% loss, far below the configured failover point.
- Carrier optical levels fluctuated outside normal tolerance.

Local switching, firewall CPU, application server load, DNS, and Wi-Fi were eliminated.

## Mitigation and Recovery

The team manually failed traffic to the secondary circuit after confirming available bandwidth and validating VPN tunnel health. Quality-of-service rules prioritized voice and warehouse traffic. The carrier replaced the defective optical transceiver. The primary circuit remained in standby until a 60-minute clean test was completed after incident closure.

## Root Cause Analysis

- **Trigger:** Progressive failure of a carrier optical transceiver.
- **Direct cause:** Sustained packet loss on the primary MPLS circuit.
- **Root cause:** SD-WAN health thresholds were designed around complete circuit failure rather than application-quality requirements.
- **Contributing factors:** Monitoring threshold matched the SD-WAN threshold; voice quality telemetry was not integrated into alerting; carrier escalation began only after user reports.
- **Failed controls:** Application-aware network monitoring, failover testing, and threshold review.
- **Why redundancy did not prevent impact:** The secondary circuit was healthy, but the policy considered the degraded primary usable.

## Five Whys

1. Calls and warehouse sessions failed because packets were lost.
2. Packets were lost because the carrier edge transceiver was failing.
3. Traffic stayed on the failed path because SD-WAN did not consider 18–35% loss unhealthy.
4. The threshold was too high because it was based on link availability, not application tolerance.
5. The design was not corrected because monthly failover tests simulated hard-down events only.

## Metrics

| Metric | Result | Target | Status |
|---|---:|---:|---|
| MTTD | 7 min | 5 min internal goal | Missed |
| MTTA | 4 min | 10 min | Met |
| Time to mitigation | 36 min | 45 min internal goal | Met |
| MTTR | 96 min | 240 min | Met |
| Update cadence | Every 30 min | Every 30 min | Met |

## What Went Well

- Service-desk correlation identified a site-wide incident quickly.
- The secondary circuit had enough capacity.
- Manual failover restored core operations before carrier repair.
- Carrier evidence was collected before the circuit was moved to standby.
- Warehouse users validated the highest-priority workflows.

## What Did Not Go Well

- Monitoring failed to alert at application-impacting loss levels.
- Failover testing did not include partial degradation.
- Voice-quality metrics were not included in the network dashboard.
- The carrier escalation trigger was not documented.

## Corrective and Preventive Actions

| ID | Action | Owner | Priority | Due date | Success criteria | Status |
|---|---|---|---|---|---|---|
| CA-1018-01 | Lower SD-WAN loss trigger to 8% for 60 sec | Alex Romero | High | 2026-06-19 | Lab and site test fail over within 90 sec | Complete |
| CA-1018-02 | Alert at 3% warning and 5% critical packet loss | Jamie Christian | High | 2026-06-20 | Test alert received within 2 min | Complete |
| CA-1018-03 | Add MOS, jitter, and call-drop dashboard | Alex Romero | Medium | 2026-06-26 | Dashboard shows site and circuit trends | Complete |
| CA-1018-04 | Test degraded-path failover monthly | Priya Shah | High | 2026-07-01 | 10%, 20%, and high-latency scenarios pass | Complete |
| CA-1018-05 | Escalate carrier after 10 min sustained degradation | Jamie Christian | Medium | 2026-06-23 | Runbook approved and service desk trained | Complete |

## Validation and Closure

The team completed 100 pings with less than 0.5% loss, a 20-minute voice test with MOS above 4.1, 25 warehouse transactions, five label prints, and three remote desktop sessions. Distribution Operations approved closure.

## Lessons Learned

A circuit can be technically “up” while the business service is unusable. Failover and alert thresholds must reflect application experience.

## References

`NBR-884219`, `CHG-EMG-260618-02`, `PRB-2026-021`, `NET-RUNBOOK-008`, `VAL-1018-01`.
