# Configuration-as-Code Standard

- Use descriptive task and resource names.
- Prefer idempotent modules over shell commands.
- Pin collection and module versions in controlled environments.
- Store environment-specific values in inventory variables.
- Use handlers for service restarts.
- Add assertions for prerequisites and postconditions.
- Never log secrets.
- Every role or configuration requires a validation test and rollback note.
- Changes must support check mode where the module allows it.
- Use tags for baseline, security, application, patching, and validation scopes.
