require 'resque/server'
require 'redis_config'

Resque.redis = Redis.new(RedisConfig.config)
Resque.logger = Logger.new("#{Rails.root}/log/resque.log")