# Capacity Forecast Analysis

## Findings
1. **HQ-Users DHCP scope** is the highest immediate risk. At current growth it exceeds the critical threshold within 6 days and would exhaust before 30 days.
2. **FS01 data volume** crosses 85% in approximately 35 days and reaches projected exhaustion in about 83 days.
3. **SQL01 data volume** crosses 85% in approximately 45 days.
4. **BR01 backup repository** crosses 90% in approximately 79 days.

## Approved Recommendations
- Expand HQ-Users from a /24-style allocation to a larger scope by adding 10.20.11.0/24 through a superscope and reducing lease duration from 8 days to 4 days.
- Add 2 TB to FS01 and archive files older than 5 years.
- Add 1 TB to SQL01 and complete table-partition cleanup.
- Add 4 TB to BR01 and move monthly archives to offsite object storage.
