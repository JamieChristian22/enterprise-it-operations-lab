# Runbook: RDP Connectivity Failure

1. Confirm the server responds to DNS and ICMP.
2. Test `Test-NetConnection <server> -Port 3389` from the management subnet.
3. Confirm `TermService` is running.
4. Confirm RDP is enabled and NLA remains enabled.
5. Verify the inbound firewall rule is enabled and scoped to `10.20.30.0/24`.
6. Confirm the user belongs to an approved remote-access group.
7. Review Security and TerminalServices event logs.
8. Use PowerShell remoting for recovery when available.

Never disable NLA or open RDP to `Any` as a troubleshooting shortcut. Escalate suspected account lockout or malicious sign-in activity to Security.
