# et_monitoring CHANGELOG

## 3.1.6:

* Removed newrelic

## 3.0.1:

* Switch to using a test cookbook to set test datadog attributes to more accurately reflect how wrappers do it
* kitchen yaml: datadog recipe now run as part of agent recipe (reflect this in the test rig)
* `datadog_monitor`: Set `use_integration_template` to **true** if `cookbook` is not defined

## 3.0.0:

* Run datadog as part of agent but only if there are attributes defined

## 2.4.1:

* Avoid `normal` level attribute precedence for Datadog attributes
* Install Datadog Agent v5.8.4

## 2.4.0:

* Add `datadog` recipe for install & configuration of Datadog Agent & integrations (#6)
* Clean up `snmpd` tests (#5)
* Add testing usin Travis CI (#7)

## 2.3.0:

* Update New Relic Server Agent user to belong to `docker` user group if it exists
    - Ensures any instance that has Docker installed can monitor its containers in NR

## 2.2.3:

* Add snmpd

## 2.2.2:

* Set empty default hash for `cloudwatch_alarms`

## 2.2.1:

* Fix setting of node attribute in `et_monitoring::threatstack`

## 2.2.0:

* Add optional installation of Threat Stack agent
* Clean up Kitchen testing for `et_monitoring::agent`
    - Drop dupe stuff, misnamed suites etc.

## 2.1.2:

* Define empty cloudwatch_alarms hash

## 2.1.1:

* add et_cloudwatch monitoring suite
* Test in EC2 and use the "dev" environment name
* Actually test setting of license key via data bag
* Rename test to correlate with its recipe

## 2.1.0:

* Add real Test Kitchen testing of NR server monitoring installation
* Clean up unnecessary files
* Test on Ubuntu 14.04

## 2.0.3:

* Fix another typo (in the CHANGELOG this time)
* Remove et_datadog

## 2.0.2:

* Fix typo

## 2.0.1:

* Fix newrelic attribute setting for license

## 2.0.0:

* Switch to newrelic cookbook in favor of newrelic-ng

## 1.8.1:

* Add et_datadog cookbook back, with modifications to remove the Datadog agent from all nodes upon convergence
    - Properly removes datadog

## 1.8.0:

* Remove datadog

## 1.7.0:

* Split monitor server out to its own cookbook

## 1.6.0:

* Add server mode
* Add test-kitchen

## 1.5.1:

* Remove all trace of CopperEgg from cookbook

## 1.5.0:

* Uninstall CopperEgg monitoring

## 1.4.1:

* Use copperegg ~> 0.2.3 to fix idempotency; i.e., the collector re-installing every chef run

## 1.4.0:

* Undo previous version; always install NR server monitoring (turns out, it’s free)

## 1.3.0:

* Determine whether or not to install New Relic server monitoring based on an attribute

## 1.2.0:

* Use newrelic-ng instead of newrelic
* Optimize to only make one `Chef::EncryptedDataBagItem.load()` call
* Pin to Berkshelf ~> 2.0.10
* Use generic email address
* Flesh out README

## 1.1.0:

* Add Datadog

## 1.0.3:

* Re-enabled CopperEgg

## 1.0.2:

* Temporarily disabled copperegg because their API is not working and this is blocking chef runs.

## 1.0.1:

* Introduced the changelog
* Consolidated New Relic agent into monitoring cookbook
