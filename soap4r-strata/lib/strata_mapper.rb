require 'strata_mapping_registry.rb'

class StrataMapper < XSD::Mapping::Mapper
  def initialize
    super(StrataMappingRegistry::Registry)
  end
end
