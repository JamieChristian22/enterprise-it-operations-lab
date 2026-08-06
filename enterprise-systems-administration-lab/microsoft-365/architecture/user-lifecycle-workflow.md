# Microsoft 365 User Lifecycle Workflow

```mermaid
flowchart TD
    A[Approved HR Request] --> B[Validate employee and manager data]
    B --> C[Create Entra ID user]
    C --> D[Assign location and license]
    D --> E[Add role-based groups]
    E --> F[Configure mailbox and collaboration access]
    F --> G[Require MFA registration]
    G --> H[Validate sign-in and service access]
    H --> I[Document completion]

    J[Offboarding Request] --> K[Block sign-in]
    K --> L[Revoke sessions]
    L --> M[Preserve mailbox and OneDrive]
    M --> N[Transfer ownership and access]
    N --> O[Remove licenses and groups]
    O --> P[Document retention and completion]
```

## Control Principles

- Every lifecycle action starts with an approved request.
- Access is assigned from role templates, not personal preference.
- Sensitive changes require verification and logging.
- Offboarding blocks access before data transfer work begins.
- Validation is required before closure.
