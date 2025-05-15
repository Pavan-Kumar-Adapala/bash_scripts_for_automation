### **Repository Overview: Linux Administration and Automation with Bash Scripts**

This repository contains a collection of Bash scripts aimed at automating essential Linux administration tasks, focusing on system monitoring, security auditing, and efficient resource management. These scripts are designed for system administrators and DevOps engineers to streamline operations, reduce manual intervention, and maintain optimal system health.

---

### **Highlighted Scripts and Real-Time Problem-Solving Use Cases**

1. **System Monitoring and Alerts:**

   * **Scripts:** `cpu_monitoring.sh`, `monitor_sys_metrics.sh`, `check_process_port.sh`
   * **Problem:** Identifying CPU spikes, memory overconsumption, and potential resource bottlenecks in real time.
   * **Solution:**

     * `cpu_monitoring.sh`: Continuously monitors CPU usage and triggers alerts when usage exceeds a predefined threshold, preventing service disruptions due to resource exhaustion.
     * `monitor_sys_metrics.sh`: Tracks system metrics such as CPU, memory, and disk usage, providing a comprehensive view of system health.
     * `check_process_port.sh`: Identifies running processes and their associated ports, useful for detecting unauthorized or rogue processes.

---

2. **Security Auditing and Vulnerability Checks:**

   * **Scripts:** `security_vul.sh`, `check_user_privileges.sh`
   * **Problem:** Detecting security vulnerabilities and ensuring proper user permissions to prevent unauthorized access.
   * **Solution:**

     * `security_vul.sh`: Scans the system for potential vulnerabilities and misconfigurations, acting as a proactive security measure.
     * `check_user_privileges.sh`: Audits user privileges to ensure compliance with security policies and detects potential access violations.

---

3. **Automated User Management:**

   * **Script:** `auto_user_creation.sh`
   * **Problem:** Managing multiple user accounts in environments with frequent onboarding/offboarding.
   * **Solution:**

     * Reads a file containing usernames, automates user creation or deletion, and offers the option to remove user directories. Reduces repetitive administrative tasks and ensures consistency in user management.

---

4. **Log Management and Disk Space Optimization:**

   * **Script:** `rotate_logs.sh`
   * **Problem:** Preventing disk space overflow due to excessive log accumulation.
   * **Solution:**

     * Automates log rotation by renaming logs with timestamps, deleting old logs, and maintaining disk space. This is crucial for systems generating high log volumes (e.g., application servers).

---

5. **File Integrity and Storage Management:**

   * **Scripts:** `find_top5_files.sh`, `comp_two_files.sh`, `check_files_diff.sh`, `find_file.sh`
   * **Problem:** Identifying large files consuming excessive disk space and detecting unintended file changes.
   * **Solution:**

     * `find_top5_files.sh`: Identifies the top 5 largest files on the system, allowing for targeted cleanup.
     * `comp_two_files.sh`: Compares two files and prompts for action (e.g., deletion of the larger file), aiding in storage optimization.
     * `check_files_diff.sh`: Highlights differences between two files, useful for version control or configuration file verification.
     * `find_file.sh`: Locates files based on user-defined criteria, enabling quick access to critical files.

---

6. **Git Operations and Deployment Automation:**

   * **Scripts:** `git_push_script.sh`, `git_push_script.txt`
   * **Problem:** Automating code deployment to Git repositories for continuous integration (CI) workflows.
   * **Solution:**

     * `git_push_script.sh`: Automates the process of pushing code changes to a GitHub repository, minimizing manual steps and ensuring consistency in deployments.
     * `git_push_script.txt`: Provides step-by-step guidance for manual pushes, serving as a reference for junior engineers or as documentation.

---

### **Scalability and Efficiency:**

* The repository demonstrates practical automation techniques that can be scaled across multiple systems, whether for monitoring, log management, or user administration.
* By centralizing these scripts and enabling scheduled execution (e.g., via Cron jobs), system administrators can maintain operational stability with minimal intervention.
