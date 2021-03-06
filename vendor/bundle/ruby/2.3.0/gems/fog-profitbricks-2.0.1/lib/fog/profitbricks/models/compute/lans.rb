require File.expand_path('../lan', __FILE__)
require File.expand_path('../../helpers/compute/data_helper', __dir__)

module Fog
  module Compute
    class ProfitBricks
      class Lans < Fog::Collection
        include Fog::Helpers::ProfitBricks::DataHelper
        model Fog::Compute::ProfitBricks::Lan

        def all(datacenter_id)
          result = service.get_all_lans(datacenter_id)

          lans = result.body['items'].each {|lan|
            lan['datacenter_id'] = datacenter_id
          }

          result.body['items'] = lans

          load(result.body['items'].each {|lan| flatten(lan)})
        end

        def get(datacenter_id, lan_id)
          lan = service.get_lan(datacenter_id, lan_id).body

          Excon::Errors
          lan['datacenter_id'] = datacenter_id

          new(flatten(lan))
        rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end
