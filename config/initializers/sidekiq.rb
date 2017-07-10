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
  end
end
