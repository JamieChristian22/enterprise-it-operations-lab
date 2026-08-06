# SLI, SLO, and Error Budget

## Customer Portal

**SLI:** Percentage of successful HTTP probes  
**SLO:** 99.9% availability over 30 days  
**Error budget:** 0.1% failed availability

## API Latency

**SLI:** 95th percentile HTTP probe duration  
**SLO:** p95 latency below 1 second for 99% of 5-minute windows

## Infrastructure Monitoring

**SLI:** Percentage of expected scrape targets reporting `up == 1`  
**SLO:** 99.5% target visibility over 30 days

## Operational Use

When error-budget consumption is high:

1. Reduce risky changes.
2. Prioritize reliability work.
3. Investigate recurring incidents.
4. Tune monitoring and dependencies.
