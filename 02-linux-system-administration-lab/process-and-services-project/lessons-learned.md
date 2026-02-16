# Lessons Learned: Process and Services Inspection.
This document captures what I learned while inspecting processes and services on a Linux system, focusing on practical understanding rather than memorization.

## 1. Processes vs Services:
- Before this project, I treated processes and services as the same thing.
- I now understand that a **process** is any running program, while a **service** is a long-running background process designed to provide system functionality.
- Services are usually started automatically and managed by the operating system.

## 2. System Visibility Matters:
- Running ps aux showed how many processes are running even when I was not actively doing anything.
- This made me realise that modern systems rely on many background processes to function correctly.

## 3. Resource Usage is Dynamic:
- Using 'top' made it clear that CPU and memory usage constantly change.
- Processes start, stop, and consume resources in real time, and this explains why systems slow down unexpectedly.

## 4. Not All Tools are Guaranteed to Exist:
- Attempting to use 'htop' showed that some tools may not be installed by default.
- This reinforced the importance of understanding core tools like 'ps' and 'top' that are always available.

## 5. Services are Managed Differently:
- Using 'systemctl' showed that services are not controlled like regular processes.
- They have states, logs, and startup rules, which makes them more predictable and manageable.

## 6. Boot Persistance is Critical:
- Checking whether a service is enabled at boot helped me understand why some systems break after restarts.
- A service that is running now but not enabled can silently disappear after a reboot.

## 7. Logs are Part of Understanding Behaviour:
- Viewing service status showed that logs are directly tied to services.
- This emphasized that troubleshooting is not guesswork but reading what the system is already telling you.

## 8. Confidence Improvement:
- This project reduced my fear of "hidden system behaviour".
- I now know how to inspect what is running, and where to look when something goes wrong.
