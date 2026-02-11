# Process and Service Inspection Project:
## Objective:
The objective of this project is to understand how Linux manages running programs and background system services.

The project focuses on identifying active processes, understanding resource usage, and inspecting system-managed services in order to build foundational operational skills required for DevOps and Cloud Engineering roles.

## Scope of the Project:
In this project, I will:
- Inspect running processes on a Linux system.
- Observe CPU and memory usage.
- Identify system services and their status.
- Understand how services are started, stopped, and monitored.
- Verify findings using standard Linux tools.

This project does not include or involve system service modification or making permanent configuration changes.

## Key Concepts:
### 1. Process:
- A process is an instance of a program that is currently running on the system.
- Each process has a process ID (PID), an owner, and consumes system resources such as CPU and memory.

### 2. Service:
- A service is a long-running background process that is typically managed by the system and often starts automatically at boot.
- Services are responsible for essential system functions such as networking, logging, and time synchronisation.

## Why This Matters:
In real-world systems, performance issues and outages often occur because:
- A system consumes excessive system resources.
- A service crashes or fails to start.
- A background service behaves unexpectedly.

Understanding how to inspect and reason about processes and services is essential for diagnosing and resolving these issues.

## Project Structure:
- commands.md: Commands used during the project with explanations.
- lessons-learned.md: Reflections and understanding gained.
- verification.md: Evidence and outputs verifying the work.
