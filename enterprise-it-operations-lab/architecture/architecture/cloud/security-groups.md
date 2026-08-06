# Security Group Design

## ALB Security Group

- Allow HTTPS from approved internet sources.
- Forward only to application security group.

## Application Security Group

- Allow application traffic from ALB.
- Allow database traffic to database security group.
- Allow Systems Manager connectivity.

## Database Security Group

- Allow database port only from application security group.
- No direct internet access.
