
# 🚀 Ansible Nginx Server Check Playbook

This Ansible playbook is designed to perform a series of checks on an Nginx server to ensure that it is running correctly, configured properly, and serving content as expected. The playbook covers tasks like checking if Nginx is listening on the correct ports, verifying configuration syntax, and ensuring that Nginx is enabled and running.

## 🛠️ Prerequisites

Before running this playbook, ensure the following prerequisites are met:

1. 🔧 Ansible Installed: Ansible should be installed on your local machine or control node.
2. 🔑 SSH Access: Ensure you have SSH access to the target server(s) where Nginx is installed.
3. 🔐 Sudo Privileges: The user running this playbook should have sudo privileges on the target server(s).
4. 🌐 Nginx Installed: Nginx should already be installed on the target server(s).

## 📋 Playbook Tasks Overview
### 1. 🔍 Verify Nginx is Listening on Ports 443 and 80

- Commands:
  - **`ss -tulpen | grep :443`**
  - **`ss -tulpen | grep :80`**

### 2. 🛠️ Check Nginx Configuration Syntax
- Command: `nginx -t`
- Purpose: Validates the Nginx configuration syntax. If the configuration is invalid, the task will fail.

### 3. ✅ Ensure Nginx is Active
- Command: systemctl is-active nginx
- Purpose: Checks if the Nginx service is currently active (running).

### 4. 🕔 Ensure Nginx is Enabled at Boot
- Command: systemctl is-enabled nginx
- Purpose: Verifies that Nginx is set to start on system boot.

### 5. ⏱️ Check Server Uptime
- Command: uptime
- Purpose: Retrieves the uptime of the server.

### 6. 🧩 Ensure Nginx Processes Are Running
- Command: ps aux | grep [n]ginx
- Purpose: Ensures that the Nginx processes are running.

### 7. 🔐 Optional - Check SSL/TLS Certificate Status
- Command: **`openssl x509 -in /etc/nginx/ssl/fullchain.crt -text -noout | grep 'Not After'`**
- Purpose: Checks the expiration date of the SSL/TLS certificate (optional).

## 🚀 How to Run the Playbook
1. 📥 Clone the Repository:
```bahs
git clone https://github.com/your-repo/nginx-check-playbook.git
cd nginx-check-playbook
```

2. 📝 Configure the Inventory: Create an inventory file (hosts) that lists the target servers where you want to run the playbook.

Example hosts file:
```bash
[nginx_servers]
server1.example.com
server2.example.com
```

3. ▶️ Run the Playbook: Use the following command to execute the playbook:
ansible-playbook -i hosts Nginx_Up_and_Running.yml

This will run the playbook on all the servers listed in the hosts file under the nginx_servers group.

## 📊 Playbook Output
The playbook will output debug information at each step, including:

- 📡 Ports Nginx is listening on.
- 🛠️ Configuration syntax validation results.
- ✅ Nginx service status (active and enabled).
- ⏱️ Server uptime.
- 🧩 Running Nginx processes.
- 🔐 SSL/TLS certificate expiration date (if applicable).

## 🛠️ Troubleshooting
If any tasks fail:

- 📝 Configuration Errors: Check the Nginx configuration using nginx -t and fix any syntax issues.
- ⚙️ Service Issues: Ensure Nginx is installed and running using system commands like systemctl status nginx.
- 🌐 Port Issues: Ensure that the correct ports are open and that Nginx is configured to listen on them.

## 🤝 Contributing
Feel free to submit issues, fork the repository, and send pull requests. Contributions are welcome! 🎉
