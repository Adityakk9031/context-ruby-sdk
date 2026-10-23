# typed: strong

module ContextDev
  module Models
    class PersonSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::PersonSearchParams, ContextDev::Internal::AnyHash)
        end

      # Describe the people to find.
      sig { returns(String) }
      attr_accessor :query

      # Use next_cursor with the same query and filters to fetch the next page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Additional constraints every result must match.
      sig { returns(T.nilable(ContextDev::PersonSearchParams::Filters)) }
      attr_reader :filters

      sig do
        params(filters: ContextDev::PersonSearchParams::Filters::OrHash).void
      end
      attr_writer :filters

      # Labels for filtering usage in the dashboard.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        params(
          query: String,
          cursor: String,
          filters: ContextDev::PersonSearchParams::Filters::OrHash,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Describe the people to find.
        query:,
        # Use next_cursor with the same query and filters to fetch the next page.
        cursor: nil,
        # Additional constraints every result must match.
        filters: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            cursor: String,
            filters: ContextDev::PersonSearchParams::Filters,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Filters < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonSearchParams::Filters,
              ContextDev::Internal::AnyHash
            )
          end

        # Countries people live in as two-letter codes, such as US or GB.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :countries

        sig { params(countries: T::Array[String]).void }
        attr_writer :countries

        # Maximum years of professional experience.
        sig { returns(T.nilable(Integer)) }
        attr_reader :years_of_experience_max

        sig { params(years_of_experience_max: Integer).void }
        attr_writer :years_of_experience_max

        # Minimum years of professional experience.
        sig { returns(T.nilable(Integer)) }
        attr_reader :years_of_experience_min

        sig { params(years_of_experience_min: Integer).void }
        attr_writer :years_of_experience_min

        # Additional constraints every result must match.
        sig do
          params(
            countries: T::Array[String],
            years_of_experience_max: Integer,
            years_of_experience_min: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Countries people live in as two-letter codes, such as US or GB.
          countries: nil,
          # Maximum years of professional experience.
          years_of_experience_max: nil,
          # Minimum years of professional experience.
          years_of_experience_min: nil
        )
        end

        sig do
          override.returns(
            {
              countries: T::Array[String],
              years_of_experience_max: Integer,
              years_of_experience_min: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
