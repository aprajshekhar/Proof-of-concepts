# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'connection_pool'
module StrataConnectionPool
    class Connections
      attr_reader :memcached 
      def initialize()
        @memcached = ConnectionPool.new(:size=>5, :timeout=>5){
          HTTPClient.new()
                    
        }
      end
    end
end
