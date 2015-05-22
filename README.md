# et_monitoring cookbook

Installs basic server monitoring.

# Requirements

# Usage

Include the `et_monitoring::agent` recipe and/or the `et_monitoring::aws` recipe.

# Attributes

`cloudwatch_alarms` - A hash of hashes defining CloudWatch alarms to be sent to the `et_cloudwatch_alarm` resource.

# Recipes

## default

Empty

## agent

1. Collects necessary API keys
2. Assigns them to attributes
3. Includes the newrelic-ng default recipe

## aws

Sets up CloudWatch alarms according to the `node['cloudwatch_alarms']` hash.

# Author

Author:: EverTrue, Inc. (<devops@evertrue.com>)
