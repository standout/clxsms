require 'clxsms/connection'
require 'clxsms/request'

module Clxsms
  module Request
    def get(path, query={})
      connection(path, query)
    end
  end
end