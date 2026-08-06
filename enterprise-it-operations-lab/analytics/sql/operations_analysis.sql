-- 1. Service desk KPI summary
SELECT
    COUNT(*) AS total_tickets,
    ROUND(AVG(resolution_minutes), 1) AS avg_resolution_minutes,
    ROUND(100.0 * AVG(first_contact_resolved), 1) AS first_contact_resolution_pct,
    ROUND(AVG(csat_score), 2) AS avg_csat,
    ROUND(100.0 * AVG(sla_met), 1) AS sla_attainment_pct
FROM service_tickets;

-- 2. SLA attainment by category
SELECT
    category,
    COUNT(*) AS tickets,
    ROUND(100.0 * AVG(sla_met), 1) AS sla_attainment_pct,
    ROUND(AVG(resolution_minutes), 1) AS avg_resolution_minutes,
    ROUND(AVG(csat_score), 2) AS avg_csat
FROM service_tickets
GROUP BY category
ORDER BY tickets DESC, category;

-- 3. Monthly ticket trend
SELECT
    SUBSTR(opened_date, 1, 7) AS month,
    COUNT(*) AS ticket_count,
    ROUND(AVG(resolution_minutes), 1) AS avg_resolution_minutes,
    ROUND(100.0 * AVG(sla_met), 1) AS sla_attainment_pct
FROM service_tickets
GROUP BY SUBSTR(opened_date, 1, 7)
ORDER BY month;

-- 4. Patch compliance
SELECT
    platform,
    assets,
    compliant_assets,
    ROUND(100.0 * compliant_assets / assets, 1) AS compliance_pct,
    exceptions
FROM patch_compliance
ORDER BY compliance_pct ASC;

-- 5. Backup success
SELECT
    workload,
    jobs,
    successful_jobs,
    ROUND(100.0 * successful_jobs / jobs, 1) AS success_pct,
    failed_jobs
FROM backup_jobs
ORDER BY success_pct ASC;

-- 6. Cloud cost trend
SELECT
    month,
    SUM(cost_usd) AS total_cost_usd
FROM cloud_costs
GROUP BY month
ORDER BY month;

-- 7. Vulnerability exposure
SELECT
    severity,
    COUNT(*) AS findings,
    SUM(CASE WHEN status != 'Closed' THEN 1 ELSE 0 END) AS open_findings
FROM vulnerability_findings
GROUP BY severity
ORDER BY CASE severity WHEN 'Critical' THEN 1 WHEN 'High' THEN 2 WHEN 'Medium' THEN 3 ELSE 4 END;

-- 8. Change performance
SELECT
    COUNT(*) AS total_changes,
    ROUND(100.0 * AVG(CASE WHEN result='Success' THEN 1 ELSE 0 END), 1) AS success_rate_pct,
    SUM(rollback_required) AS rollbacks,
    SUM(incident_created) AS change_caused_incidents
FROM change_records;

-- 9. Major incident performance
SELECT
    COUNT(*) AS major_incidents,
    ROUND(AVG(mttr_minutes), 1) AS avg_mttr_minutes,
    SUM(users_impacted) AS total_users_impacted
FROM major_incidents;
