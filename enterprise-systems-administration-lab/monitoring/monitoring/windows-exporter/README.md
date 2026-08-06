# Windows Exporter Deployment

Install Windows Exporter as a Windows service and enable required collectors:

- cpu
- logical_disk
- memory
- net
- os
- service
- system

Restrict TCP 9182 to the Prometheus server.
