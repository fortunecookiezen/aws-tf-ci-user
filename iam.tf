resource "aws_iam_user" "ci_user" {
  name = "${var.name}-${data.aws_region.current.name}"
  path = var.path
  tags = merge(var.tags, {})
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.ci-user.name
}

resource "aws_iam_policy" "ci_user" {
  name        = "${var.name}-${data.aws_region.current.name}-policy"
  path        = "/"
  description = "iam policy for ci-user"
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "a2c:*",
            "access-analyzer:*",
            "acm-pca:*",
            "acm:*",
            "airflow:*",
            "aoss:*",
            "apigateway:*",
            "app-integrations:*",
            "appconfig:*",
            "appflow:*",
            "application-autoscaling:*",
            "applicationinsights:*",
            "appmesh:*",
            "appsync:*",
            "aps:*",
            "arc-zonal-shift:*",
            "athena:*",
            "autoscaling-plans:*",
            "autoscaling:*",
            "awsconnector:*",
            "backup-gateway:*",
            "backup-storage:*",
            "backup:*",
            "batch:*",
            "cases:*",
            "cassandra:*",
            "ce:*",
            "cleanrooms:*",
            "cloud9:*",
            "cloudformation:*",
            "cloudfront:*",
            "cloudsearch:*",
            "cloudtrail-data:PutAuditEvents",
            "cloudtrail:CreateEventDataStore",
            "cloudtrail:CreateServiceLinkedChannel",
            "cloudtrail:CreateTrail",
            "cloudtrail:DescribeQuery",
            "cloudtrail:DescribeTrails",
            "cloudtrail:GetChannel",
            "cloudtrail:GetEventDataStore",
            "cloudtrail:GetEventSelectors",
            "cloudtrail:GetImport",
            "cloudtrail:GetInsightSelectors",
            "cloudtrail:GetQueryResults",
            "cloudtrail:GetResourcePolicy",
            "cloudtrail:GetServiceLinkedChannel",
            "cloudtrail:GetTrail",
            "cloudtrail:GetTrailStatus",
            "cloudtrail:ListChannels",
            "cloudtrail:ListEventDataStores",
            "cloudtrail:ListImportFailures",
            "cloudtrail:ListImports",
            "cloudtrail:ListPublicKeys",
            "cloudtrail:ListQueries",
            "cloudtrail:ListServiceLinkedChannels",
            "cloudtrail:ListTags",
            "cloudtrail:ListTrails",
            "cloudtrail:LookupEvents",
            "cloudtrail:PutEventSelectors",
            "cloudtrail:PutInsightSelectors",
            "cloudtrail:PutResourcePolicy",
            "cloudtrail:StartLogging",
            "cloudtrail:StartQuery",
            "cloudtrail:StopImport",
            "cloudtrail:UpdateChannel",
            "cloudtrail:UpdateEventDataStore",
            "cloudtrail:UpdateServiceLinkedChannel",
            "cloudtrail:UpdateTrail",
            "cloudwatch:*",
            "codewhisperer:*",
            "cognito-identity:*",
            "cognito-idp:*",
            "cognito-sync:*",
            "comprehend:*",
            "databrew:*",
            "dataexchange:*",
            "datapipeline:*",
            "datasync:*",
            "datazone:*",
            "datazonecontrol:*",
            "dax:*",
            "dbqms:*",
            "devicefarm:*",
            "devops-guru:*",
            "dlm:*",
            "dms:*",
            "docdb-elastic:*",
            "drs:*",
            "ds:*",
            "dynamodb:*",
            "ebs:*",
            "ec2:*",
            "ecr:*",
            "eks:*",
            "elastic-inference:*",
            "elasticache:*",
            "elasticfilesystem:*",
            "elasticloadbalancing:*",
            "elasticmapreduce:*",
            "emr-containers:*",
            "emr-serverless:*",
            "es:*",
            "events:*",
            "evidently:*",
            "execute-api:*",
            "finspace-api:*",
            "firehose:*",
            "fis:*",
            "forecast:*",
            "frauddetector:*",
            "fsx:*",
            "geo:*",
            "glacier:*",
            "globalaccelerator:*",
            "glue:*",
            "grafana:*",
            "health:*",
            "iam:*",
            "identitystore-auth:*",
            "identitystore:*",
            "imagebuilder:*",
            "importexport:*",
            "internetmonitor:*",
            "kafka-cluster:*",
            "kafka:*",
            "kafkaconnect:*",
            "kinesis:*",
            "kinesisanalytics:*",
            "kinesisvideo:*",
            "kms:*",
            "lakeformation:*",
            "lambda:*",
            "launchwizard:*",
            "logs:*",
            "machinelearning:*",
            "managedblockchain:*",
            "memorydb:*",
            "mgh:*",
            "migrationhub-orchestrator:*",
            "migrationhub-strategy:*",
            "mq:*",
            "neptune-db:*",
            "notifications-contacts:*",
            "oam:*",
            "organizations:DescribeAccount",
            "organizations:DescribeOrganization",
            "organizations:DescribeOrganizationalUnit",
            "organizations:DescribePolicy",
            "organizations:DescribeResourcePolicy",
            "osis:*",
            "pi:*",
            "pipes:*",
            "qldb:*",
            "quicksight:*",
            "ram:*",
            "rds-data:BatchExecuteStatement",
            "rds-data:BeginTransaction",
            "rds-data:CommitTransaction",
            "rds-data:ExecuteSql",
            "rds-data:ExecuteStatement",
            "rds-data:RollbackTransaction",
            "rds-db:connect",
            "rds:*",
            "refactor-spaces:*",
            "resiliencehub:*",
            "resource-explorer-2:*",
            "resource-explorer:*",
            "rhelkb:GetRhelURL",
            "route53-recovery-cluster:*",
            "route53-recovery-control-config:*",
            "route53-recovery-readiness:*",
            "route53:*",
            "route53resolver:*",
            "rum:*",
            "s3-object-lambda:*",
            "s3:*",
            "sagemaker-geospatial:*",
            "sagemaker-groundtruth-synthetic:*",
            "sagemaker:*",
            "scheduler:*",
            "schemas:*",
            "scn:*",
            "sdb:*",
            "secretsmanager:*",
            "securitylake:*",
            "serverlessrepo:*",
            "servicecatalog:*",
            "servicediscovery:*",
            "serviceextract:GetConfig",
            "sns:*",
            "sqs:*",
            "ssm-contacts:*",
            "ssm-incidents:*",
            "ssm:*",
            "states:*",
            "storagegateway:*",
            "sts:AssumeRole",
            "sts:DecodeAuthorizationMessage",
            "sts:GetAccessKeyInfo",
            "sts:GetCallerIdentity",
            "sts:GetFederationToken",
            "sts:GetServiceBearerToken",
            "sts:GetSessionToken",
            "sts:SetSourceIdentity",
            "sts:TagSession",
            "supportapp:*",
            "swf:*",
            "synthetics:*",
            "tag:*",
            "textract:*",
            "timestream:*",
            "transcribe:*",
            "transfer:*",
            "translate:*",
            "vpc-lattice-svcs:Invoke",
            "vpc-lattice:*",
            "waf-regional:*",
            "waf:*",
            "wafv2:*",
            "xray:*"
          ]
          Resource = "*"
        }
      ]
    }
  )
  tags = merge(var.tags, {})
}

resource "aws_iam_policy_attachment" "ci_user" {
  name       = "${aws_iam_user.ci_user.name}-policy"
  users      = [aws_iam_user.ci_user.name]
  policy_arn = aws_iam_policy.ci_user.arn
}

resource "aws_secretsmanager_secret" "ci_user" {
  name                    = "${var.name}-${data.aws_region.current.name}-user-key"
  description             = "access key for ci-user"
  kms_key_id              = var.kms_key_id != "" ? var.kms_key_id : ""
  recovery_window_in_days = 30
  tags                    = merge(var.tags, {})
}

resource "aws_secretsmanager_secret_version" "this" {
  # this just creates the initial format of the secret, the secret value needs to be filled in later
  secret_id     = aws_secretsmanager_secret.ci_user.id
  secret_string = jsonencode({ "AWS_ACCESS_KEY_ID" = "${aws_iam_access_key.this.id}", "AWS_SECRET_ACCESS_KEY" = "${aws_iam_access_key.this.secret}", "AWS_DEFAULT_REGION" = data.aws_region.current.name })
  lifecycle {
    ignore_changes = all
  }
}
