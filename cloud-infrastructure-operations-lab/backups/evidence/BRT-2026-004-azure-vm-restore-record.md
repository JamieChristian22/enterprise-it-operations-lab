# Restore Test Record — BRT-2026-004

**Resource:** `corp-app-vm01`  
**Recovery point:** 2026-04-17 02:02 UTC  
**Restore start:** 2026-04-17 13:10 UTC  
**Restore complete:** 2026-04-17 13:48 UTC  
**Actual RTO:** 38 minutes  
**Outcome:** Passed

The VM was restored as `corp-app-vm01-restore` into an isolated validation subnet. OS disk encryption, managed identity, NSG, boot diagnostics, Azure Monitor Agent, and Log Analytics heartbeat were verified. System services reported no failed units. The local application health endpoint returned HTTP 200, and a service-owner transaction completed successfully. The restored VM was never connected to production traffic and was deleted under change `CHG-2026-0081` after evidence approval.
