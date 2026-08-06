# Windows Firewall Baseline

## Policy

- Domain profile enabled
- Private profile enabled
- Public profile enabled
- Default inbound action: Block
- Default outbound action: Allow unless restricted
- Rules limited to required ports, programs, and remote subnets
- Logging enabled for dropped packets and successful connections where appropriate

## Validation

```powershell
Get-NetFirewallProfile
Get-NetFirewallRule -Enabled True
Get-NetFirewallPortFilter
```
