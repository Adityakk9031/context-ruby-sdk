# typed: strong

module ContextDev
  module Models
    module Browser
      class ProfileListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Browser::ProfileListParams,
              ContextDev::Internal::AnyHash
            )
          end

        # The `next_cursor` from the previous page.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Number of profiles per page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The `next_cursor` from the previous page.
          cursor: nil,
          # Number of profiles per page.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              limit: Integer,
              request_options: ContextDev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
