# Mining with RandomX Using XMRig on Azure

This guide outlines the process of setting up a mining operation using the RandomX algorithm with XMRig CLI tool in Azure. It covers setting up the Azure account, deploying a VM with Terraform, configuring the miner, and essential points to consider if using Azure's Free Trial account.

## **Azure Free Trial Account Consideration**
- With the Azure Free Trial ($200 credit), you're limited to 4 virtual CPUs.
- This guide uses the `Standard_F2` instance with 4 virtual cores, and the CPU usage is intentionally reduced to 75%.

## **1. Setting Up Azure Account & Terraform**

### Azure Account
- **Sign Up/Login**: Ensure you have an Azure account.
- **Permissions**: Verify necessary permissions for resource creation.

### Azure CLI Download and Login

#### Download the Installer
- Navigate to the [Azure CLI download page](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli).
- Download the latest MSI installer for Windows.

#### Run the Installer
- Locate the downloaded MSI file and run it.
- Follow the on-screen instructions to complete the installation.

#### Verify the Installation
- Open a new Command Prompt or PowerShell window.
- Type `az --version` and press Enter to display the Azure CLI version.

### Retrieve Azure Subscription ID
- **Log in to Azure Portal**: Visit [Azure Portal](https://portal.azure.com) and sign in.
- **Find Subscription ID**: Navigate to 'Subscriptions', select your subscription, and note the Subscription ID.

### Log in to Azure CLI
- Open Command Prompt or PowerShell.
- Run `az login` and enter your Azure credentials.

### Create a Service Principal
- **Set Azure Subscription** (Optional): `az account set --subscription "<your-subscription-id>"`
- **Create Service Principal**: 
   ```bash
   az ad sp create-for-rbac --name "<your-service-principal-name>" --role Contributor --scopes /subscriptions/<your-subscription-id>
### Terraform Configuration
- **Install Terraform**: Ensure Terraform is installed on your machine.
- **Set Environment Variables**:
  - `ARM_CLIENT_ID`: Azure Service Principal Client ID.
  - `ARM_CLIENT_SECRET`: Azure Service Principal Client Secret.
  - `ARM_SUBSCRIPTION_ID`: Azure Subscription ID.
  - `ARM_TENANT_ID`: Azure Tenant ID.
  - Use Azure CLI or Azure Portal to set these variables.

## **2. Deploying a Virtual Machine for Mining**

### Terraform Script
- Write a Terraform script for a VM in Azure using an Ubuntu Server image.
- Include network and security configurations.

### Terraform Execution
- Run `terraform init` and `terraform apply`.

## **3. Installing and Configuring XMRig**

### Access the VM
- SSH into the VM using its public IP or DNS name.

### XMRig Installation (MoneroOcean Fork)
  
    ```bash
    sudo apt-get update
    sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
    git clone https://github.com/MoneroOcean/xmrig.git
    cd xmrig
    mkdir build && cd build
    cmake ..
    make

### Configuration
- Modify `config.json` in the `build` directory with your pool, wallet, and other settings.

## **4. Running the Miner**

- Start XMRig: `./xmrig`.
- Verify the connection to the mining pool.

## **5. Monitoring and Management**

- Monitor performance via the mining pool dashboard.
- Watch the Azure VM for resource usage.
- Regularly update your system and XMRig.

## **Conclusion**

This guide assists in setting up a cryptocurrency mining operation on Azure. Mindful consideration of costs and adherence to Azure's terms of service is important. For advanced configurations, refer to XMRig's and Azure's official documentation.
