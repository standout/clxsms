require 'clxsms/connection'
require 'clxsms/request'
require 'rest-client'

module Clxsms
  module Connection
    private

    def connection(path, params={})
      host = Clxsms.ssl_enabled == true ? Clxsms.https_host : Clxsms.http_host
      params.merge!({ 'dlr-mask': Clxsms.dlr_mask, 'dlr-url': Clxsms.dlr_url }) if params[:delivery_report] == true
      params.delete :delivery_report

      resource = RestClient::Resource.new(
        host,
        :headers => {
          :content_type => "text/plain",
          :timeout => 5,
          :open_timeout => 5,
          :user_agent => Clxsms.user_agent,
        }
      )

      resource[path].get(
        params: params.merge(
          {
            username: Clxsms.username,
            password: Clxsms.password,
          }
        )
      ){ |response, request, result, &block|
        case response.code
        when 202
          { success: true, message: response }
        else
          { success: false, message: response }
        end
      }
    end
  end
end
