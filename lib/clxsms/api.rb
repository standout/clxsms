require 'clxsms/connection'
require 'clxsms/request'

module Clxsms
  class API
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = Clxsms.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
  end
end