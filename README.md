# datadog-impossible-traveller

Python script to generate logs into Datadog and monitor for impossible travel (Demo for medium article on [medium.com](https://tjtharrison.medium.com/))

# Datadog configuration

Create an API key and make a note of your API_KEY and DD_SITE.

Create a file `resources/.env` with the following content:

```
DD_API_KEY=<your API key>
DD_SITE=<your site>
```

You should also use this opportunity to create an app key to be used by Terraform (make a note of this).

# Terraform configuration

Create a file `terraform/demo.tfvars` with the following content:

```
datadog_api_key = "<your API key>"
datadog_app_key = "<your app key>"
```

# Running the demo

## Create the Datadog resources

```
cd terraform
terraform init
terraform apply -var-file=demo.tfvars
```

## Run the script

To properly test the script, you will need to run it twice, in two very geographically different locations (Eg use your flavour of cloud provider to launch an instance in a different region).

```
cd ../resources
docker-compose up -d
```

The script will write logs into Datadog from the two instances and, all being well, will trigger an alert.