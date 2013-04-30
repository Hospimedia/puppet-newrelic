class newrelic(
	$license = $::newrelic_license
) {
		include newrelic::repository
  	include newrelic::package
		include newrelic::server
}