# HUG Lagos/Ibadan Terraform Challenge - Week Three

## Project: Deploy a Two-Tier Application on AWS Using Terraform

## Overview

This project provisions a secure two-tier application environment on AWS using Terraform.

The infrastructure consists of a public-facing web server running Nginx and a private database layer running Amazon RDS MySQL.

The solution follows infrastructure best practices by using:
- Terraform modules
- Variables and outputs
- Remote Terraform state storage
- Secure networking
- Least privilege security group rules
- Resource tagging

# Architecture

The deployment includes:

## Networking

- One AWS VPC
- Two public subnets across different Availability Zones
- Two private subnets across different Availability Zones
- Internet Gateway
- NAT Gateway
- Public and private route tables
- Route table associations

## Compute

- One EC2 instance deployed in a public subnet
- Ubuntu Linux AMI
- Nginx web server installed using Terraform startup script
- Custom HTML page deployed automatically

## Database

- Amazon RDS MySQL database
- Deployed inside private subnets
- Public accessibility disabled
- Storage and instance class configured using Terraform variables

## Security

Web Server Security Group:
- HTTP port 80 accessible from the internet
- SSH port 22 restricted to administrator IP address

Database Security Group:
- MySQL port 3306 only accessible from the EC2 security group
- No public database access

# Terraform Project Structure
