# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'strata_connection_pool'
module StrataConnectionPool
  class StrataConnection
    def initialize(url, user, password)
      p 'Inside StrataConnection'
      @connections= Connections.new()
      @url = url
      @user = user
      @password = password
    end
    def get_connection()
      @connections.memcached.with_connection do |client|
        client.set_auth(@url,@user,@password)
        client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
        return client
      end
      
    end
  end
end
