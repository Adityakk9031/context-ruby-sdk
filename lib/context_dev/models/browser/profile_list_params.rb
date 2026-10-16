# frozen_string_literal: true

module ContextDev
  module Models
    module Browser
      # @see ContextDev::Resources::Browser::Profiles#list
      class ProfileListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute cursor
        #   The `next_cursor` from the previous page.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Number of profiles per page.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(cursor: nil, limit: nil, request_options: {})
        #   @param cursor [String] The `next_cursor` from the previous page.
        #
        #   @param limit [Integer] Number of profiles per page.
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
