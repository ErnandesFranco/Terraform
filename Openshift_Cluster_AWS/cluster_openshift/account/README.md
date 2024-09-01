# Account-wide IAM Roles

Before creating a ROSA STS cluster, you need to set up the required account-wide roles and policies. For detailed information, refer to the [Account-wide IAM role and policy reference](https://access.redhat.com/documentation/en-us/red_hat_openshift_service_on_aws/4/html/introduction_to_rosa/rosa-sts-about-iam-resources#rosa-sts-account-wide-roles-and-policies_rosa-sts-about-iam-resources) on the Red Hat Customer Portal.

## Prerequisites

- **AWS Account**: Ensure you have an AWS account.
- **ROSA CLI**: Install the latest version of the ROSA command-line interface (CLI) (`rosa`).
- **OpenShift Cluster Manager Token**: Obtain an offline OpenShift Cluster Manager token from the [Red Hat Hybrid Cloud Console](https://console.redhat.com/openshift/token).
- **Terraform**: Install Terraform. Download the latest version from the [Terraform page](https://developer.hashicorp.com/terraform/downloads).

## Open Issue

This example creates policies for operator roles. As a result, the operator policies are managed by this example. For instance, updating the version will also update the operator role policies.

## Account-wide IAM Role Creation

1. **Set Up Variables**: Configure required variables for `terraform apply`. This guide uses environment variables. For more on Terraform variables, see [Managing Variables](https://developer.hashicorp.com/terraform/enterprise/workspaces/variables/managing-variables).

   Export the following environment variables with your specific values:

    1. **ROSA CLI Token**: Your full [OpenShift Cluster Manager offline token](https://console.redhat.com/openshift/token).
        ```sh
        export TF_VAR_token=<ocm_offline_token>
        ```
    1. **Operator Role Prefix**: Prefix for your Operator role.
        ```sh
        export TF_operator_role_prefix=<prefix_name>
        ```
    1. **ROSA API URL**: Should be `https://api.openshift.com`.
        ```sh
        export TF_VAR_url=https://api.openshift.com
        ```
    1. **Optional - Account Role Prefix**: Prefix for account roles. Defaults to a generated string if not provided.
        ```sh
        export TF_VAR_account_role_prefix=<account_role_prefix>
        ```
    1. **Optional - OpenShift Version**: Desired OpenShift version (e.g., 4.13). Use `rosa list version | grep yes` to check available versions.
        ```sh
        export TF_VAR_openshift_version=<choose_openshift_version>
        ```
    1. **Optional - AWS Tags**: Tags for AWS resources.
        ```sh
        export TF_VAR_tags=<aws_resource_tags>
        ```

2. **Initialize Terraform**: Set up Terraform by initializing the working directory.
    ```sh
    terraform init
    ```

3. **Optional - Plan**: Review the Terraform plan before applying. This step is optional but recommended for verifying configurations.
    ```sh
    terraform plan -out account-roles.tfplan
    ```

4. **Apply Configuration**: Apply the Terraform configuration to create the account roles.
    > **Note**: If you skipped the `plan` step, you can apply directly without specifying a file.
    ```sh
    terraform apply <"account-roles.tfplan">
    ```

5. **Confirm Creation**: Terraform will prompt you to confirm the creation of resources. Type `yes` to proceed.

## Verification

1. **Check Account Roles**: Verify that the account roles have been created using the `rosa` CLI.
    ```sh
    rosa list account-roles
    ```

2. **Review Roles**: Check the output for your roles. You should see something like:
    ```plaintext
    I: Fetching account roles
    ROLE NAME                           ROLE TYPE      ROLE ARN                                                    OPENSHIFT VERSION  AWS Managed
    ManagedOpenShift-ControlPlane-Role  Control plane  arn:aws:iam::XXXXX:role/ManagedOpenShift-ControlPlane-Role  4.13               No
    ManagedOpenShift-Installer-Role     Installer      arn:aws:iam::XXXXX:role/ManagedOpenShift-Installer-Role     4.13               No
    ManagedOpenShift-Support-Role       Support        arn:aws:iam::XXXXX:role/ManagedOpenShift-Support-Role       4.13               No
    ManagedOpenShift-Worker-Role        Worker         arn:aws:iam::XXXXX:role/ManagedOpenShift-Worker-Role        4.13               No
    ```

## Resource Cleanup

When you no longer need the resources, use Terraform to delete them. Avoid manual deletion to prevent unresolvable issues.

1. **Destroy Resources**:
    ```sh
    terraform destroy
    ```

2. **Confirm Deletion**: Terraform will prompt you to confirm the destruction of resources. Type `yes` to proceed.

> **NOTE**: Manual deletion of resources may cause issues within your environment.

