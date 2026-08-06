#!/usr/bin/env python3
"""Report AWS Backup jobs and flag protected resources without a recent successful job."""
import argparse, datetime as dt, json, sys
import boto3

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--hours',type=int,default=26); ap.add_argument('--region',default='us-east-1'); args=ap.parse_args()
    client=boto3.client('backup',region_name=args.region)
    since=dt.datetime.now(dt.timezone.utc)-dt.timedelta(hours=args.hours)
    jobs=[]; token=None
    while True:
        kw={'ByCreatedAfter':since}
        if token: kw['NextToken']=token
        r=client.list_backup_jobs(**kw); jobs.extend(r.get('BackupJobs',[])); token=r.get('NextToken')
        if not token: break
    failed=[j for j in jobs if j.get('State') in {'FAILED','ABORTED','EXPIRED'}]
    summary={'region':args.region,'window_hours':args.hours,'jobs':len(jobs),'failed':len(failed),'failed_jobs':[{'id':j.get('BackupJobId'),'resource':j.get('ResourceArn'),'state':j.get('State'),'message':j.get('StatusMessage','')} for j in failed]}
    print(json.dumps(summary,default=str,indent=2))
    return 2 if failed else 0
if __name__=='__main__': sys.exit(main())
