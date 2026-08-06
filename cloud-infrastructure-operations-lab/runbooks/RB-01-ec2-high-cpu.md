# EC2 High CPU

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** CloudWatch CPUUtilization above 80% for 10 minutes

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `aws cloudwatch get-metric-data; aws autoscaling describe-auto-scaling-groups; top -b -n1; pidstat -u 5 12`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Terminate a single unhealthy instance only after confirming ASG capacity; scale desired capacity by one when traffic is legitimate; stop runaway process when application owner approves.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
CPU below 60% for 15 minutes, target healthy, 5xx rate normal, no backlog growth.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
