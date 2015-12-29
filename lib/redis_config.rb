class RedisConfig
  class << self
    def config
      @config ||= load
    end

    private
    def load
      config = YAML.load( File.open("#{Rails.root}/config/redis.yml") )
      config[Rails.env].symbolize_keys
    end
  end
end