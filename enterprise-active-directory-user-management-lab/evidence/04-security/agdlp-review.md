# AGDLP Access Review

## Model
Accounts → Global Groups → Domain Local Groups → Permissions

## Reviewed Paths
- IT users → `GG_IT_Users` → `DL_IT_Share_Modify` → `\\FS01\IT`
- HR users → `GG_HR_Users` → `DL_HR_Share_Modify` → `\\FS01\HR`
- Finance users → `GG_Finance_Users` → `DL_Finance_Share_Modify` → `\\FS01\Finance`
- Sales users → `GG_Sales_Users` → `DL_Sales_Share_Modify` → `\\FS01\Sales`
- Operations users → `GG_Operations_Users` → `DL_Operations_Share_Modify` → `\\FS01\Operations`

## Findings
- No user accounts were directly assigned to department share ACLs.
- Domain Local groups were used for resource permissions.
- Global groups represented business roles.
- Cross-department access required a documented exception.

**Result:** PASS
