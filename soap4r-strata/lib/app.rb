#using soap4r gem because ruby's in-built obj2xml is broken
require 'rubygems'
gem 'soap4r'
require 'xml_util'
require 'file_util'
require 'case_resource'
require 'strata_mapper'
#check whether strata.xsd is newer than strata.rb
#if yes generate mapping classes
if Utils::FileUtil.is_new?('strata.xsd', 'strata.rb')
 status = Utils::XmlUtil.genrate_class_def('strata.xsd')
 exit unless status == true
end

require 'strata'

#create a case
#provide url, user and password
kases = Resources::CaseResource.new('','','')
kase = Case.new
kase.summary = 'test from ruby'
kase.product = 'Red Hat Enterprise Linux'
kase.version = '6.0'
response = kases.create(kase)
p response.status
kase = kases.get('00644583')
p kase.owner