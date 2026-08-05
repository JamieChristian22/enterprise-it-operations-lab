# NTFS Permissions Review

| Resource | Principal | Permission | Inheritance | Result |
|---|---|---|---|---|
| IT | DL_IT_Share_Modify | Modify | This folder/subfolders/files | PASS |
| HR | DL_HR_Share_Modify | Modify | This folder/subfolders/files | PASS |
| Finance | DL_Finance_Share_Modify | Modify | This folder/subfolders/files | PASS |
| Sales | DL_Sales_Share_Modify | Modify | This folder/subfolders/files | PASS |
| Operations | DL_Operations_Share_Modify | Modify | This folder/subfolders/files | PASS |
| Public | DL_Public_Share_Read | Read & Execute | Inherited | PASS |
| Home | CREATOR OWNER | Full Control | Subfolders/files only | PASS |
| Home | DL_Home_Folders_Full | Full Control | This folder/subfolders/files | PASS |

No `Everyone: Full Control` NTFS entry was found.
