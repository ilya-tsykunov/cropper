if Rails.env.production?
  redis_url = ENV['REDISCLOUD_URL'].presence || ENV['REDIS_URL'].presence || 'redis://localhost:6379/0'

  Sidekiq.configure_client do |config|
    config.redis = { url: redis_url, size: 2 }
  end

  # https://github.com/mperham/sidekiq/wiki/Using-Redis#complete-control
  #
  number_of_sidekiq_connections =
    if ENV['RAILS_MAX_THREADS'].present?
      ENV['RAILS_MAX_THREADS'] + 2
    else
      5
    end

  Sidekiq.configure_server do |config|
    config.redis = { url: redis_url, size: number_of_sidekiq_connections }

    # http://julianee.com/rails-sidekiq-and-heroku/
    #
    Rails.application.config.after_initialize do
      Rails.logger.info("DB Connection Pool size for Sidekiq Server before disconnect is: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
      ActiveRecord::Base.connection_pool.disconnect!

      ActiveSupport.on_load(:active_record) do
        config = Rails.application.config.database_configuration[Rails.env]
        config['reaping_frequency'] = ENV['DATABASE_REAP_FREQ'] || 10 # seconds
        # config['pool'] = ENV['WORKER_DB_POOL_SIZE'] || Sidekiq.options[:concurrency]
        config['pool'] = 16
        ActiveRecord::Base.establish_connection(config)

        Rails.logger.info("DB Connection Pool size for Sidekiq Server is now: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
      end
    end
  end
end
