module Clxsms
  class Client
    module Sendsms
      def send_sms(options={})
        response = get('sendsms', options)
      end
    end
  end
end
