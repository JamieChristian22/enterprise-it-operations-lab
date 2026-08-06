SELECT 'service_tickets_missing_category' AS check_name, COUNT(*) AS failures
FROM service_tickets WHERE category IS NULL OR TRIM(category) = ''
UNION ALL
SELECT 'service_tickets_invalid_csat', COUNT(*)
FROM service_tickets WHERE csat_score NOT BETWEEN 1 AND 5
UNION ALL
SELECT 'patch_compliance_invalid_counts', COUNT(*)
FROM patch_compliance WHERE compliant_assets > assets OR assets <= 0
UNION ALL
SELECT 'backup_jobs_invalid_counts', COUNT(*)
FROM backup_jobs WHERE successful_jobs + failed_jobs != jobs
UNION ALL
SELECT 'cloud_costs_negative', COUNT(*)
FROM cloud_costs WHERE cost_usd < 0;
