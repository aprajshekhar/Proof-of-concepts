require 'strata'
require 'xsd/mapping'
require 'strata_mapper'
require 'httpclient'
require 'uri'
module Resources
  class CaseResource
    
    def initialize(url='',
        user='',password='')
      @url = url
      @user = user
      @password = password
    end
  
    def create(kase)
      mapper = StrataMapper.new
    
      xml = mapper.obj2xml(kase)
      p xml
      path = '/rs/cases'
      #using http client because in-built Net:HTTP is broken
      #for ssl and timeout configuration
      client = HTTPClient.new
      client.set_auth(@url,@user,@password)
      client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
      headers = [['Content-Type','application/xml'],['Accept','application/xml']]
      response = client.post(@url+path,xml,headers)
      
      return response
    end
  end
end