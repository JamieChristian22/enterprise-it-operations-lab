DROP TABLE IF EXISTS service_tickets;
CREATE TABLE service_tickets (
    ticket_id TEXT PRIMARY KEY,
    opened_date TEXT NOT NULL,
    category TEXT NOT NULL,
    priority TEXT NOT NULL,
    status TEXT NOT NULL,
    resolution_minutes INTEGER NOT NULL,
    first_contact_resolved INTEGER NOT NULL CHECK (first_contact_resolved IN (0,1)),
    csat_score INTEGER NOT NULL CHECK (csat_score BETWEEN 1 AND 5),
    sla_met INTEGER NOT NULL CHECK (sla_met IN (0,1))
);

DROP TABLE IF EXISTS patch_compliance;
CREATE TABLE patch_compliance (
    snapshot_date TEXT NOT NULL,
    platform TEXT NOT NULL,
    assets INTEGER NOT NULL,
    compliant_assets INTEGER NOT NULL,
    exceptions INTEGER NOT NULL
);

DROP TABLE IF EXISTS backup_jobs;
CREATE TABLE backup_jobs (
    snapshot_date TEXT NOT NULL,
    workload TEXT NOT NULL,
    jobs INTEGER NOT NULL,
    successful_jobs INTEGER NOT NULL,
    failed_jobs INTEGER NOT NULL
);

DROP TABLE IF EXISTS cloud_costs;
CREATE TABLE cloud_costs (
    month TEXT NOT NULL,
    provider TEXT NOT NULL,
    environment TEXT NOT NULL,
    cost_usd REAL NOT NULL
);

DROP TABLE IF EXISTS vulnerability_findings;
CREATE TABLE vulnerability_findings (
    finding_id TEXT PRIMARY KEY,
    asset TEXT NOT NULL,
    severity TEXT NOT NULL,
    detected_date TEXT NOT NULL,
    remediated_date TEXT,
    status TEXT NOT NULL
);

DROP TABLE IF EXISTS change_records;
CREATE TABLE change_records (
    change_id TEXT PRIMARY KEY,
    change_date TEXT NOT NULL,
    change_type TEXT NOT NULL,
    result TEXT NOT NULL,
    rollback_required INTEGER NOT NULL,
    incident_created INTEGER NOT NULL
);

DROP TABLE IF EXISTS major_incidents;
CREATE TABLE major_incidents (
    incident_id TEXT PRIMARY KEY,
    incident_date TEXT NOT NULL,
    priority TEXT NOT NULL,
    mttr_minutes INTEGER NOT NULL,
    users_impacted INTEGER NOT NULL
);
