# lambda-xray-layer
An out of the box layer for Lambda that have X-Ray, configured with Terraform

## Why?

B/C you want a "stand-alone" layer with X-Ray that you can depend upon. Adding
this in every project is tedious so I created it separately.

## How?

Clone the repo, make necessary changes and deploy with Terraform. Now you have a layer to use.

You can now reference that layer and hence `let AWSXRray = require('aws-xray-sdk`) in your lambdas.

### Step by step

Requires git, yarn, terraform 

1. `git clone git@github.com:rexsuecia/lambda-xray-layer.git`
2. `cd lambda-xray-layer/layer/nodejs`
3. `yarn`
4. `cd ../terraform`
5. Create backend-config.conf (see backend-config.tpl). Create terrafrom.tfvars or update variables.tf to match your 
settings. 
5. `terraform plan -out plan`
6. `terraform apply plan`

## Enhancements 

* When available in the Terrafrom AWS provider add a resource policy. 

