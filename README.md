# Automated Linux User Provisioning & IAM Onboarding Script

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash Script](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Security](https://img.shields.io/badge/Security-OpenSSL-red?style=for-the-badge)
![IAM](https://img.shields.io/badge/IAM-User_Provisioning-blue?style=for-the-badge)

## Overview
An automated, security-first **Linux User Provisioning & IAM Onboarding toolkit** written in Bash. This utility streamlines batch account creation by interactively generating employee CSV data files and automatically onboarding users into the Linux operating system with cryptographically secure, randomized passwords.
---
The project consists of two core components:
* **`user_manage.sh` (Core Automation Script):** Reads batch user data from a CSV file, provisions system accounts, generates randomized OpenSSL passwords, and assigns credentials securely.
* **`create_csv.sh` (Helper & Demo Utility):** An interactive CLI tool that allows administrators or testers to quickly generate mock employee `.csv` lists for testing and onboarding automation.
---
## Features
* **Interactive CSV Data Parsing:** Easily input user usernames and full names via an interactive CLI prompt (`create_csv.sh`) to generate structured `.csv` records.
* **Batch User Onboarding:** Reads multiple account records using an Internal Field Separator (`IFS=,`) and provisions system users automatically (`user_manage.sh`).
* **Cryptographic Password Generation:** Utilizes **OpenSSL** (`openssl rand -hex 16`) to generate strong, unique 32-character hexadecimal passwords for every user account.
* **Forced Password Reset (IAM Security):** Implements `chage -d 0` to enforce a mandatory password change upon the user's first login, complying with enterprise security standards.
* **Secure Credential Assignment:** Seamlessly assigns generated passwords to newly created accounts using Linux `chpasswd`.
* **Auditing & Error Handling:** Employs explicit exit-status (`$?`) checks to verify successful account creation and report errors dynamically.
---
## Requirements
* **Linux OS** (Ubuntu / Debian / CentOS / RHEL).
* **OpenSSL** installed on the host system (pre-installed on most Linux distributions).
* **Root / Sudo Privileges** (Required for running `useradd` and `chpasswd`).

  ---
## Installation
### 1. Clone the Repository
```bash
git clone https://github.com/abdhamed22/linux-user-provisioning-automation.git
cd linux-user-provisioning-automation
```
### 2. Make the Scripts Executable
```bash
chmod +x create_csv.sh user_manage.sh
```
### 3. Step 1: Generate the Employee CSV List (Optional / Demo)
If you do not have an existing `user_data.csv` file, run the helper utility to generate one interactively:
```bash
./create_csv.sh
```
### 4. Step 2: Provision Users & Assign Credentials
Open with (nano & vi & vim) 'user_manage.sh' and edit :
```bash
file="/home/ubuntu/user_data.csv"   # Path to your .csv file (format: username,fullname)
```
Execute the core onboarding script with `sudo` privileges to provision accounts and assign OpenSSL-generated passwords:
```bash
sudo ./user_manage.sh
```
---
## Terminal Output
When running `user_manage.sh`, the system processes the CSV records and outputs the onboarding status alongside the generated credentials:

```text
The pass is a3f89c201b4e6d7a8c90123456789abc
User ahmed is created..
The pass is 7b4a2e109f3d5c8a1b203948576dcaeb
User omar is created..
```

---
  ## 👤 Author
**Abdulhamed.H**  
*Network & Systems Engineer | Cloud & Linux Automation*  
* [LinkedIn Profile](https://www.linkedin.com/in/abdulhamed22/)
* [GitHub Profile](https://github.com/abdhamed22)
