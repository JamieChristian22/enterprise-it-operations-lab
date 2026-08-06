#!/usr/bin/env python3
import csv, pathlib, sys
p=pathlib.Path(__file__).resolve().parents[2]/'inventory'/'protected-resources.csv'
required={'asset_id','resource_name','platform','tier','method','frequency','retention','rpo','rto','encryption','owner','last_restore_test','status'}
with p.open(newline='',encoding='utf-8') as f:
    rows=list(csv.DictReader(f))
missing=required-set(rows[0]) if rows else required
errors=[]
if missing: errors.append('Missing columns: '+','.join(sorted(missing)))
for i,r in enumerate(rows,2):
    for k in required:
        if not r.get(k,'').strip(): errors.append(f'Row {i}: empty {k}')
    if r.get('status') not in {'Compliant','Exception','Remediation'}: errors.append(f'Row {i}: invalid status')
print(f'Validated {len(rows)} protected resources')
if errors:
    print('\n'.join(errors)); sys.exit(1)
print('Inventory validation passed')
