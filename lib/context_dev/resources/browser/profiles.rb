# frozen_string_literal: true

module ContextDev
  module Resources
    class Browser
      # See the authenticated browser profiles your organization created.
      class Profiles
        # List the browser profiles your organization created with `/web/scrape`, newest
        # first.
        #
        # @overload list(cursor: nil, limit: nil, request_options: {})
        #
        # @param cursor [String] The `next_cursor` from the previous page.
        #
        # @param limit [Integer] Number of profiles per page.
        #
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Browser::ProfileListResponse]
        #
        # @see ContextDev::Models::Browser::ProfileListParams
        def list(params = {})
          parsed, options = ContextDev::Browser::ProfileListParams.dump_request(params)
          query = ContextDev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "org/browser/profiles",
            query: query,
            model: ContextDev::Models::Browser::ProfileListResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [ContextDev::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
