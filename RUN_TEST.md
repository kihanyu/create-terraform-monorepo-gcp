# Run the Test

## 1.Set Up Your Environment

- Ensure you have a valid Google Cloud service account with permissions to create networks and subnets in your target project.
- Save your service account JSON key and reference its path in the provider block.

## 2.Initialize Terraform

- Navigate to the test directory

```sh
cd modules/network/vpc/v1/test/
```

- Run the following commands

```sh
terraform init
```

## 3.Plan the Deployment

- Verify what will be created

```sh
terraform plan -var="project_id=<YOUR_PROJECT_ID>"
```

## 4.Apply the Test

Apply the configura- tion to create the resources:

```sh
terraform apply -var="project_id=<YOUR_PROJECT_ID>" -auto-approve
```

## 5.Verify Outputs

- Check the outputs to confirm that the VPC and subnets were created:

```sh
terraform output
```

## 6.Clean Up

- After verification, destroy the resources you created to avoid unwanted charges:

```sh
terraform destroy -var="project_id=<YOUR_PROJECT_ID>" -auto-approve
```
