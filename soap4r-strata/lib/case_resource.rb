require 'strata'
require 'xsd/mapping'
require 'strata_mapper'
require 'httpclient'
require 'uri'
require 'pp'
require 'strata_connection'
module Resources
  class CaseResource
    
    def initialize(url='',  user='',password='')
      @url = url
      @user = user
      @password = password
      @connection = StrataConnectionPool::StrataConnection.new(url, user, password)
      @mapper = StrataMapper.new
    end
  
    def create(kase)   
      xml = @mapper.obj2xml(kase)
      p xml
      path = '/rs/cases/' 
      p @url + path
      client = @connection.get_connection
      headers = [['Content-Type','application/xml'],['Accept','application/xml']]
      response = client.post(@url+path,xml,headers)      
      return response
    end
    
    def get(id)
      path = '/rs/cases/'+id
      p @url + path
      
      client = @connection.get_connection
      response = client.get(@url+path,:header=>{:Accept=>'application/xml'})        
      p response.status
      kase = @mapper.xml2obj(response.content)
      return kase   
    end
  end
end