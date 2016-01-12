require 'clxsms/connection'
require 'clxsms/request'
require 'clxsms/version'

module Clxsms
  module Configuration
    VALID_OPTIONS_KEYS = [
        :username,
        :password,
        :ssl_enabled,
        :user_agent,
        :dlr_url,
        :dlr_mask,
        :from
    ].freeze

    SSL_ENABLED = false

    DEFAULT_USERNAME = nil

    DEFAULT_PASSWORD = nil

    HTTPS_HOST = "https://sms1.clxnetworks.net:3801"

    HTTP_HOST = "http://sms1.clxnetworks.net:3800"

    DEFAULT_USER_AGENT = "Clxsms Ruby Client/#{Clxsms::VERSION}".freeze

    DEFAULT_DLR_URL = "http://localhost/"
    DEFAULT_DLR_MASK = 7

    DEFAULT_FROM = "0"


    attr_accessor *VALID_OPTIONS_KEYS
    attr_reader :http_host, :https_host

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each { |k| options[k] = send(k) }
      options
    end

    def http_host
      HTTP_HOST
    end

    def https_host
      HTTPS_HOST
    end

    # Reset to defaults
    def reset
      self.username = DEFAULT_USERNAME
      self.password = DEFAULT_PASSWORD
      self.ssl_enabled = SSL_ENABLED
      self.user_agent = DEFAULT_USER_AGENT
      self.dlr_url = DEFAULT_DLR_URL
      self.dlr_mask = DEFAULT_DLR_MASK
      self.from = DEFAULT_FROM
      self
    end
  end
end