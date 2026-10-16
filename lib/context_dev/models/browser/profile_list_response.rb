# frozen_string_literal: true

module ContextDev
  module Models
    module Browser
      # @see ContextDev::Resources::Browser::Profiles#list
      class ProfileListResponse < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #   Browser profiles, newest first.
        #
        #   @return [Array<ContextDev::Models::Browser::ProfileListResponse::Data>]
        required :data,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::Browser::ProfileListResponse::Data] }

        # @!attribute has_more
        #   Whether a next page exists.
        #
        #   @return [Boolean]
        required :has_more, ContextDev::Internal::Type::Boolean

        # @!attribute next_cursor
        #   Pass as `cursor` to fetch the next page.
        #
        #   @return [String, nil]
        required :next_cursor, String, nil?: true

        # @!attribute request_id
        #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        #   support.
        #
        #   @return [String]
        required :request_id, String

        # @!attribute key_metadata
        #   Credits this request used and your remaining balance.
        #
        #   @return [ContextDev::Models::Browser::ProfileListResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Browser::ProfileListResponse::KeyMetadata }

        # @!method initialize(data:, has_more:, next_cursor:, request_id:, key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Browser::ProfileListResponse} for more details.
        #
        #   @param data [Array<ContextDev::Models::Browser::ProfileListResponse::Data>] Browser profiles, newest first.
        #
        #   @param has_more [Boolean] Whether a next page exists.
        #
        #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page.
        #
        #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
        #
        #   @param key_metadata [ContextDev::Models::Browser::ProfileListResponse::KeyMetadata] Credits this request used and your remaining balance.

        class Data < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #   Profile ID to pass as `sharedParams.profile.profileId` on `/web/scrape`.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   When the profile was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute description
          #   The description supplied when the profile was created, or null.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!method initialize(id:, created_at:, description:)
          #   @param id [String] Profile ID to pass as `sharedParams.profile.profileId` on `/web/scrape`.
          #
          #   @param created_at [Time] When the profile was created.
          #
          #   @param description [String, nil] The description supplied when the profile was created, or null.
        end

        # @see ContextDev::Models::Browser::ProfileListResponse#key_metadata
        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          # @!attribute credits_consumed
          #   Credits charged for this request.
          #
          #   @return [Integer]
          required :credits_consumed, Integer

          # @!attribute credits_remaining
          #   Credits remaining for your organization.
          #
          #   @return [Integer]
          required :credits_remaining, Integer

          # @!method initialize(credits_consumed:, credits_remaining:)
          #   Credits this request used and your remaining balance.
          #
          #   @param credits_consumed [Integer] Credits charged for this request.
          #
          #   @param credits_remaining [Integer] Credits remaining for your organization.
        end
      end
    end
  end
end
