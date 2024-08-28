
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
git clone --branch NginxUpandRunning https://github.com/mvahdatkhah/Ansible-Playbooks-Project.git
cd provision
```

2. 📝 Configure the Inventory: Create an inventory file (hosts) that lists the target servers where you want to run the playbook.

Example hosts file:
```bash
[nginx_servers]
server1.example.com
server2.example.com
```
3. 🔐 Creating New Encrypted Files

To create a new file encrypted with Vault, use the ansible-vault create command. Pass in the name of the file you wish to create. For example, to create an encrypted YAML file called vault.yml to store sensitive variables, you could type:
```bash
ansible-vault create vault.yml
```
You will be prompted to enter and confirm a password:

```bash
Output
New Vault password: 
Confirm New Vault password:
```

When you have confirmed your password, Ansible will immediately open an editing window where you can enter your desired contents.

To test the encryption function, enter some test text:
```bash
vault.yml
Secret information
```

Ansible will encrypt the contents when you close the file. If you check the file, instead of seeing the words you typed, you will see an encrypted block:
```bash
cat vault.yml
Output
$ANSIBLE_VAULT;1.1;AES256
65316332393532313030636134643235316439336133363531303838376235376635373430336333
3963353630373161356638376361646338353763363434360a363138376163666265336433633664
30336233323664306434626363643731626536643833336638356661396364313666366231616261
3764656365313263620a383666383233626665376364323062393462373266663066366536306163
31643731343666353761633563633634326139396230313734333034653238303166
```
We can see some header information that Ansible uses to know how to handle the file, followed by the encrypted contents, which display as numbers.

### Viewing Encrypted Files
Sometimes, you may need to reference the contents of a vault-encrypted file without needing to edit it or write it to the filesystem unencrypted. The ansible-vault view command feeds the contents of a file to standard out. By default, this means that the contents are displayed in the terminal.

Pass the vault encrypted file to the command:
```bash
ansible-vault view vault.yml
```
You will be asked for the file’s password. After entering it successfully, the contents will be displayed:

```bash
Output
Vault password:
Secret information
```
As you can see, the password prompt is mixed into the output of file contents. Keep this in mind when using ansible-vault view in automated processes.

### Editing Encrypted Files
When you need to edit an encrypted file, use the ansible-vault edit command:

```bash
ansible-vault edit vault.yml
```
4. ▶️ Run the Playbook: Use the following command to execute the playbook:

```bash
ansible-playbook -i hosts Nginx_Up_and_Running.yml -e vault.yml --ask-vault-pass
```

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
