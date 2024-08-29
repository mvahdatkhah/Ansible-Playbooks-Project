# 🚀 Ansible Playbook for Docker Setup and Configuration

This Ansible playbook automates the process of uninstalling existing Docker packages, installing required system packages, and configuring Docker on both RedHat and Debian-based systems. It also manages Docker services, installs Python Docker modules, pulls Docker images, and handles related tasks like user management and file operations.

## 📋 Prerequisites

Before running this playbook, ensure the following:

- ✅ **Ansible** is installed on your control machine.
- 🔑 Proper **SSH access** and **sudo privileges** on the target machines.
- 🐍 **Python** and necessary packages are installed on the managed nodes.

## 📂 Playbook Structure

### 1. 🛠️ Filter and Return Selected Facts
- Gathers specific system information like `ansible_distribution`, `ansible_os_family`, and `ansible_distribution_file_variety`.

### 2. ❌ Uninstall Docker Packages
- **RedHat Systems**: Uninstalls Docker-related packages using `yum`.
- **Debian Systems**: Uninstalls Docker-related packages using `apt`.

### 3. 🗑️ Remove Docker-Related Files
- Deletes Docker-related directories and files from the system.

### 4. 🔄 Update System Packages
- **RedHat Systems**: Updates all packages excluding the kernel.
- **Debian Systems**: Updates and upgrades all packages.

### 5. 🧰 Install Required System Packages
- **RedHat Systems**: Installs packages like `yum-utils`, `lvm2`, `python-docker-py`, etc.
- **Debian Systems**: Installs packages like `ca-certificates`, `curl`, `python3-pip`, etc.

### 6. 🔑 Add Docker GPG Key and Repository
- Adds Docker's official GPG key and repository to both Ubuntu and Debian distributions.

### 7. 🐳 Install Docker Engine
- Installs Docker engine on both Debian and RedHat-based distributions.

### 8. ⚙️ Configure Docker Services
- Enables and starts the Docker service on the system.

### 9. 🐍 Manage Python Docker Modules
- Uninstalls old Python Docker modules and installs the latest version as required by Ansible.

### 10. 👤 User Management
- Adds the `ansible` user to the Docker group.

### 11. 📦 Docker Image Management
- Pulls the Prometheus Node Exporter Docker image and checks its status. If not running, the playbook executes the `run-node-exporter.sh` script.

### 12. 🛠️ Debugging and Verification
- Runs a script to check the Docker version and outputs the result.


## 🚀🔥 How to Run the Playbook
1. 📥 Clone the Repository:
```bahs
git clone --branch DockerUpandRunning https://github.com/mvahdatkhah/Ansible-Playbooks-Project.git
cd docker
```

2. 📝 Configure the Inventory: Create an inventory file (hosts) that lists the target servers where you want to run the playbook.

Example hosts file:
```bash
[web_servers]
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
ansible-playbook -i inventory/hosts docky.yml -e vault.yml --ask-vault-pass
```

This will run the playbook on all the servers listed in the hosts file under the web_servers group.
`

### 🏷️ Tags

- **setup**: Gathers system facts.
- **uninstall_docker**: Uninstalls Docker packages.
- **docker_remove_files**: Removes Docker-related files.
- **update_all_packages**: Updates all packages on RedHat systems.
- **req_sys_packages**: Installs required system packages.
- **add_docker_gpg**: Adds Docker's GPG key.
- **add_repo_apt**: Adds the Docker repository.
- **install_docker_engine**: Installs Docker engine.
- **docker_compose**: Installs Docker Compose.
- **enable_start_docker**: Enables and starts Docker service.
- **install_pip**: Installs Python Docker modules.
- **usermod**: Manages the ansible user.
- **docker_image_node-exporter**: Pulls the Prometheus Node Exporter Docker image.
- **docker_version**: Outputs Docker version information.
- **run_node_exporter**: Runs the Node Exporter container.
