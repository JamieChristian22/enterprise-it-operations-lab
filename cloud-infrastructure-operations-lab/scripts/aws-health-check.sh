#!/usr/bin/env bash
set -euo pipefail
REGION="${AWS_REGION:-us-east-1}"
printf 'AWS identity: '; aws sts get-caller-identity --query Account --output text
aws ec2 describe-instance-status --region "$REGION" --include-all-instances --query 'InstanceStatuses[].{Instance:InstanceId,System:SystemStatus.Status,InstanceStatus:InstanceStatus.Status}' --output table
aws elbv2 describe-target-health --region "$REGION" --target-group-arn "${TARGET_GROUP_ARN:?Set TARGET_GROUP_ARN}" --query 'TargetHealthDescriptions[].{Target:Target.Id,State:TargetHealth.State,Reason:TargetHealth.Reason}' --output table
aws rds describe-db-instances --region "$REGION" --query 'DBInstances[].{DB:DBInstanceIdentifier,Status:DBInstanceStatus,MultiAZ:MultiAZ,BackupRetention:BackupRetentionPeriod}' --output table
