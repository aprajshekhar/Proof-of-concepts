# To change this template, choose Tools | Templates
# and open the template in the editor.

module Utils
  class XmlUtil
   def self.genrate_class_def(xsd_path)
     generate = "/usr/bin/xsd2ruby.rb --xsd  "+xsd_path+"  --classdef strata --mapping_registry --mapper --force"
     puts generate
     return system(generate)
   end
   
  end
end
