# et_monitoring cookbook

Installs basic New Relic & CopperEgg server monitoring.

# Requirements

# Usage

Include the `et_monitoring::agent` recipe.

# Attributes

* `node['et_monitoring']['newrelic_enabled']` If overridden in another cookbook, enables server monitoring via New Relic.

# Recipes

## default

Empty

## agent

1. Collects necessary API keys
2. Assigns them to attributes
3. Includes the `copperegg::default` recipe
4. Includes the `newrelic-ng::default` if `node['et_monitoring']['newrelic_enabled']` is true

# Author

Author:: EverTrue, Inc. (<devops@evertrue.com>)
