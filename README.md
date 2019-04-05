# Lambda X-Ray Layer
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
5. Create `backend-config`.conf (see `backend-config.tpl`). Create `terrafrom.tfvars` or update `variables.tf` to match your 
settings. 
5. `terraform init -backend-config=backend-config.conf`
5. `terraform plan -out plan`
6. `terraform apply plan`

Now you have your Layer, when creating your lambda do the following terraform:
```hcl-terraform
resource "aws_lambda_function" "example" {
  ...

  tracing_config {
    mode = "Active"
  }

  layers = [
    "${aws_lambda_layer_version.lambda_layer.arn}",
  ]
}
```



## XRay in your test environment

I prefer not to use XRay locally. You can of course download the deamon etc. but doing so complicates the CI/CD chain
not to mention put lots of load onto the developers that need it. So in my function code I do:
```javascript
let AWSXRay = {
  captureHTTPsGlobal: () => {}
}

try {
  AWSXRay = require('aws-xray-sdk')
} catch (e) {
}

const https = require('https')
AWSXRay.captureHTTPsGlobal(require('https'))
```

Now I can trace where the Layer is available and not where it is not.

## Enhancements 

* When available in the Terraform AWS provider add a resource policy. 

