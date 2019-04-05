data "archive_file" "lambda_layer" {
  type        = "zip"
  source_dir  = "../layer"
  output_path = "lambda_layer_payload.zip"
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename         = "${data.archive_file.lambda_layer.output_path}"
  layer_name       = "lambda-xray-layer"
  license_info     = "Apache-2.0"
  source_code_hash = "${data.archive_file.lambda_layer.output_base64sha256}"
  description = "Layer including AWS X-Ray, depend or not depend on it"
  compatible_runtimes = [
    "nodejs8.10",
  ]
}

data "aws_iam_policy_document" "" {

}

resource "aws_cloudwatch_log_resource_policy" "" {
  policy_document = ""
  policy_name = ""

}

resource "aws_iam_policy_attachment" "" {
  name = ""
  policy_arn = ""
}
