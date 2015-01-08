Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load

  config.assets.debug = true
  config.assets.raise_runtime_errors = true

  config.solr_host = "http://ec2-54-94-206-228.sa-east-1.compute.amazonaws.com:8983/solr/jobs"

end
