# typed: strong

module ContextDev
  module Resources
    class Browser
      # See the authenticated browser profiles your organization created.
      class Profiles
        # List the browser profiles your organization created with `/web/scrape`, newest
        # first.
        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Browser::ProfileListResponse)
        end
        def list(
          # The `next_cursor` from the previous page.
          cursor: nil,
          # Number of profiles per page.
          limit: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ContextDev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
