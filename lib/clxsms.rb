require 'clxsms/error'
require 'clxsms/configuration'
require 'clxsms/api'
require 'clxsms/client'
require 'clxsms/version'
require 'rest-client'

module Clxsms
  extend Configuration
  # Alias
  def self.client(options={})
    Clxsms::Client.new(options)
  end

  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private = false)
    client.respond_to?(method, include_private) || super(method, include_private)
  end
end
