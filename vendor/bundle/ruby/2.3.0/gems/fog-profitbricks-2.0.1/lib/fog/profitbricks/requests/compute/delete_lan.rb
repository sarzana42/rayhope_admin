module Fog
  module Compute
    class ProfitBricks
      class Real
        # Delete the specified LAN
        #
        # ==== Parameters
        # * datacenter_id<~String> - UUID of the data center
        # * lan_id<~String>         - UUID of the data center
        #
        # ==== Returns
        # * response<~Excon::Response> - No response parameters
        #   (HTTP/1.1 202 Accepted)
        #
        # {ProfitBricks API Documentation}[https://devops.profitbricks.com/api/cloud/v2/#delete-lan]
        def delete_lan(datacenter_id, lan_id)
          request(
              :expects => [202],
              :method  => 'DELETE',
              :path    => "/datacenter/#{datacenter_id}/lans/#{lan_id}"
          )
        rescue => error
          Fog::Errors::NotFound.new(error)
        end
      end

      class Mock
        def delete_lan(datacenter_id, lan_id)
          response = Excon::Response.new
          response.status = 202

          if lan = self.data[:lans]["items"].find {
              |attribute| attribute["datacenter_id"] == datacenter_id && attribute["id"] == lan_id
          }
          else
            raise Fog::Errors::NotFound.new("The requested lan could not be found")
          end

          response
        end
      end
    end
  end
end
