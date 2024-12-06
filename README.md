### README Overview for "bash_scripts_for_automation" – DevOps Engineer Perspective

#### Project Overview
This repository contains a suite of shell scripts designed to address common challenges in DevOps automation, system monitoring, and real-time troubleshooting. As a DevOps Engineer, managing and maintaining infrastructure, automating processes, and ensuring the system’s health is critical. These scripts focus on automating routine tasks, monitoring system resources, and providing quick alerts for security vulnerabilities or performance issues. With real-time monitoring and automated error detection, these scripts help optimize DevOps workflows, ensuring faster deployments, reduced downtime, and more secure systems.

#### Why I Wrote These Scripts
As a DevOps Engineer, you often deal with various tools, technologies, and frameworks that need to work seamlessly together. Automation is key to minimizing manual interventions and ensuring consistency across environments. These scripts were created to:

1. **Automate Routine Tasks:**  
   Repetitive tasks like package installation, system monitoring, file comparisons, and error checking should not require manual intervention. With the help of these scripts, you can automate these processes, ensuring they run smoothly and without human error.

2. **Enhance Monitoring and Alerts:**  
   DevOps engineers need to monitor a variety of system metrics (CPU, disk usage, memory, processes) to ensure smooth operations and prevent issues from affecting application performance or uptime. These scripts provide real-time monitoring and alerts based on threshold values to detect issues early, enabling quick remediation.

3. **Ensure Security and Compliance:**  
   Security is a top priority in any DevOps environment. Scripts like `check_user_privileges.sh` and `security_vul.sh` provide checks for vulnerabilities, helping to maintain secure configurations and prevent unauthorized access.

4. **Version Control Automation:**  
   The `git_push_script.sh` script automates the process of pushing changes to a repository, streamlining continuous integration/continuous deployment (CI/CD) pipelines, and reducing the manual effort involved in updating repositories.

#### Importance of These Scripts in Solving Real-Time Problems

1. **Automation for Continuous Integration (CI):**  
   With automated scripts, repetitive and error-prone tasks, such as checking system status, installing packages, or pushing code changes, can be scheduled or triggered automatically. This frees up time for more valuable work and ensures consistency across environments.

2. **Real-Time Monitoring for Continuous Delivery (CD):**  
   Continuous delivery relies on constant monitoring to ensure system health. The scripts like `cpu_monitoring.sh`, `monitor_sys_metrics.sh`, and `check_application_errors.sh` ensure that system metrics are regularly tracked. This monitoring allows DevOps engineers to detect performance bottlenecks, resource overages, or misconfigurations before they impact the application.

3. **Security and Compliance Automation:**  
   Automating security checks through `security_vul.sh` ensures that the system is compliant with security policies, reducing the risk of attacks or configuration drift. Checking for vulnerabilities or user privileges automatically enables a proactive security posture.

4. **Scalability and Efficiency:**  
   As the infrastructure scales, the need for managing large numbers of systems becomes critical. With these scripts, a DevOps engineer can manage numerous systems at scale, quickly running checks for package installation, system status, or file integrity across multiple machines, improving operational efficiency.

5. **Rapid Troubleshooting and Incident Management:**  
   When a problem occurs in production, DevOps teams need to act quickly. These scripts enable rapid identification of issues (e.g., CPU usage spikes, missing files, or application errors). By automating the monitoring and alerting process, DevOps engineers can focus on solving issues rather than hunting them down manually.

#### List of Scripts in the Repository (in Master branch)

- **check_application_errors.sh**: Monitors and identifies application-specific errors, crucial for tracking and resolving production issues.
- **check_files_diff.sh**: Compares two files for differences, ensuring configuration integrity across systems.
- **check_linux_distribution.sh**: Checks the system’s Linux distribution and version, ensuring compatibility across environments.
- **check_package_installed.sh**: Verifies the installation status of essential packages, ensuring that required tools are present in the system.
- **check_process_port.sh**: Monitors running processes and their associated ports to track resource usage and service availability.
- **check_user_privileges.sh**: Monitors user privileges to ensure compliance with security best practices and prevent unauthorized access.
- **comp_two_files.sh**: Compares two files and highlights differences, helping ensure configuration consistency.
- **confirm_remove_file.sh**: Confirms the deletion of files to prevent accidental loss of critical data.
- **cpu_monitoring.sh**: Monitors CPU usage, alerting the user when usage exceeds a defined threshold, preventing resource exhaustion.
- **find_distribution.sh**: Retrieves system distribution and version, providing crucial information for package compatibility and deployment automation.
- **find_file.sh**: Searches for files based on user-defined criteria, aiding in configuration management and auditing.
- **find_top5_files.sh**: Identifies the five largest files on the system, useful for disk space management.
- **git_push_script.sh**: Automates pushing updates to a GitHub repository, essential for streamlining CI/CD workflows.
- **git_push_script.txt**: A text file detailing the steps for pushing changes using Git, useful for documentation.
- **install_package.sh**: Installs necessary packages on the system, ensuring systems are ready for deployment.
- **monitor_sys_metrics.sh**: Monitors critical system metrics such as CPU, memory, disk usage, and process status, helping maintain system health.
- **security_vul.sh**: Detects security vulnerabilities or misconfigurations in the system, ensuring compliance with security policies.

#### Real-Time Use Cases for DevOps

- **Automating System Setup and Maintenance:**  
  Using `install_package.sh` or `check_package_installed.sh`, you can ensure that all systems in your environment have the required software and are kept up to date without manual intervention.

- **Resource Monitoring and Alerts for Continuous Operations:**  
  `cpu_monitoring.sh` and `monitor_sys_metrics.sh` continuously monitor system resources, sending real-time alerts when resources exceed thresholds. This allows DevOps engineers to preemptively address system resource issues before they affect application performance.

- **Security Automation for Compliance:**  
  With `security_vul.sh` and `check_user_privileges.sh`, DevOps engineers can ensure that security policies are enforced automatically. These scripts help track privileged users and potential vulnerabilities, reducing the risk of breaches and unauthorized access.

- **Automated Git Operations for CI/CD:**  
  The `git_push_script.sh` automates the process of pushing changes to a repository, which is essential for DevOps workflows. This simplifies integration with CI/CD tools like Jenkins or GitLab CI, ensuring smooth deployment pipelines.

- **Real-Time Troubleshooting for Incident Management:**  
  In the event of a system error, you can quickly detect the issue using scripts like `check_application_errors.sh`, `find_file.sh`, and `find_files_diff.sh`. These scripts provide rapid feedback, which is crucial for maintaining uptime and reducing incident resolution time.
