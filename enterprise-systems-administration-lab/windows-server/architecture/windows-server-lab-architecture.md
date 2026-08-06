# Windows Server Lab Architecture
```mermaid
flowchart LR
 ADM[Admin Workstation]-->DC[NSS-DC01 AD DS/DNS]
 ADM-->FILE[NSS-FILE01 File Services/FSRM]
 ADM-->PRINT[NSS-PRINT01 Print Services]
 ADM-->APP[NSS-APP01 Internal App]
 MON[NSS-MON01 Monitoring]-->DC
 MON-->FILE
 MON-->PRINT
 MON-->APP
 FILE-->BACKUP[NSS-BACKUP01]
```
