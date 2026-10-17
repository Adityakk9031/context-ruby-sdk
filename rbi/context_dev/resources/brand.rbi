# typed: strong

module ContextDev
  module Resources
    class Brand
      # Retrieve logos, colors, company details, and social links using one lookup
      # identifier. A direct URL limits extraction to that page.
      sig do
        params(
          body:
            T.any(
              ContextDev::BrandRetrieveParams::Body::ByDomain::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByName::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByEmail::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByTicker::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByDirectURL::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByTransaction::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandRetrieveResponse)
      end
      def retrieve(
        # One lookup, chosen by `type`.
        body:,
        request_options: {}
      )
      end

      # Find up to 10 brands by name or domain, ordered by popularity. Optionally filter
      # by country and primary language; both filters must match when provided together.
      # Results include description, country, and language when available. Use the
      # returned domain to retrieve a full brand profile.
      sig do
        params(
          query: String,
          autocomplete: T::Boolean,
          country: ContextDev::BrandSearchParams::Country::OrSymbol,
          language: ContextDev::BrandSearchParams::Language::OrSymbol,
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
          tags: T::Array[String],
          typo_tolerance: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandSearchResponse)
      end
      def search(
        # Search term, matched against the fields selected by queryBy (e.g. 'nike',
        # 'nike.com', 'nik').
        query:,
        # Whether the search term matches by prefix, so partial words match as they are
        # typed (e.g. 'nik' matches Nike). Set to false to match whole words only.
        autocomplete: nil,
        # Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
        # as US or GB.
        country: nil,
        # Only return brands with this primary language, such as english or french.
        language: nil,
        # Fields to match the search term against, as a comma-separated list or repeated
        # parameter: 'name', 'domain', or both. Defaults to both.
        query_by: nil,
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
        # typo tolerance).
        typo_tolerance: nil,
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
