module Clxsms
  class Client < API
    require 'clxsms/client/sendsms'

    include Clxsms::Client::Sendsms
  end
end
