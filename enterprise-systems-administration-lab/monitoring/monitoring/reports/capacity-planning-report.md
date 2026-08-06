# Capacity Planning Report

## Findings

- `linux-db-01` storage growth averaged 6.2% per month.
- At the current rate, the data volume reaches 80% utilization in approximately five months.
- `win-file-01` memory utilization peaks at 78% during backup windows.
- Container CPU remains below 45% under normal load.

## Recommendations

1. Expand database storage before November 2026.
2. Review backup scheduling on `win-file-01`.
3. Keep current container CPU allocation.
4. Continue monthly growth review.
