# frozen_string_literal: true

module ContextDev
  module Models
    class CrawlControls < ContextDev::Internal::Type::BaseModel
      # @!attribute exclude_url_pattern
      #   RE2 pattern URLs must not match to be crawled. Null when the crawl set none.
      #
      #   @return [String, nil]
      required :exclude_url_pattern, String, nil?: true

      # @!attribute follow_subdomains
      #   Whether links to subdomains were followed. Always false for a sitemap crawl.
      #
      #   @return [Boolean]
      required :follow_subdomains, ContextDev::Internal::Type::Boolean

      # @!attribute languages
      #   Languages whose pages were followed: `same_as_start_url` or a list of language
      #   codes. Null when every language was followed, which is always the case for a
      #   sitemap crawl.
      #
      #   @return [Symbol, Array<Symbol, ContextDev::Models::CrawlControls::Languages::UnionMember1>, ContextDev::Models::CrawlControls::Languages, nil]
      required :languages, union: -> { ContextDev::CrawlControls::Languages }, nil?: true

      # @!attribute max_depth
      #   Link depth limit. Always 0 for a sitemap crawl, which never follows links off
      #   its URLs; null when a `start_url` crawl set no limit.
      #
      #   @return [Integer, nil]
      required :max_depth, Integer, nil?: true

      # @!attribute max_pages
      #   The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs
      #   its sitemap actually lists, up to this many, so `input.reserved` is often lower.
      #
      #   @return [Integer]
      required :max_pages, Integer

      # @!attribute source
      #   Where the crawl started.
      #
      #   @return [ContextDev::Models::CrawlControls::Source::StartURL, ContextDev::Models::CrawlControls::Source::Sitemap]
      required :source, union: -> { ContextDev::CrawlControls::Source }

      # @!attribute url_pattern
      #   RE2 pattern URLs had to match to be crawled. Null when the crawl set none.
      #
      #   @return [String, nil]
      required :url_pattern, String, nil?: true

      # @!method initialize(exclude_url_pattern:, follow_subdomains:, languages:, max_depth:, max_pages:, source:, url_pattern:)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::CrawlControls} for more details.
      #
      #   Crawl settings as submitted.
      #
      #   @param exclude_url_pattern [String, nil] RE2 pattern URLs must not match to be crawled. Null when the crawl set none.
      #
      #   @param follow_subdomains [Boolean] Whether links to subdomains were followed. Always false for a sitemap crawl.
      #
      #   @param languages [Symbol, Array<Symbol, ContextDev::Models::CrawlControls::Languages::UnionMember1>, ContextDev::Models::CrawlControls::Languages, nil] Languages whose pages were followed: `same_as_start_url` or a list of language c
      #
      #   @param max_depth [Integer, nil] Link depth limit. Always 0 for a sitemap crawl, which never follows links off it
      #
      #   @param max_pages [Integer] The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs it
      #
      #   @param source [ContextDev::Models::CrawlControls::Source::StartURL, ContextDev::Models::CrawlControls::Source::Sitemap] Where the crawl started.
      #
      #   @param url_pattern [String, nil] RE2 pattern URLs had to match to be crawled. Null when the crawl set none.

      # Languages whose pages were followed: `same_as_start_url` or a list of language
      # codes. Null when every language was followed, which is always the case for a
      # sitemap crawl.
      #
      # @see ContextDev::Models::CrawlControls#languages
      module Languages
        extend ContextDev::Internal::Type::Union

        variant const: -> { ContextDev::Models::CrawlControls::Languages::SAME_AS_START_URL }

        variant -> { ContextDev::Models::CrawlControls::Languages::UnionMember1Array }

        module UnionMember1
          extend ContextDev::Internal::Type::Enum

          AM = :am
          AR = :ar
          AZ = :az
          BE = :be
          BG = :bg
          BN = :bn
          CA = :ca
          CEB = :ceb
          CS = :cs
          CY = :cy
          DA = :da
          DE = :de
          EL = :el
          EN = :en
          ES = :es
          ET = :et
          EU = :eu
          FA = :fa
          FI = :fi
          FR = :fr
          GU = :gu
          HA = :ha
          HAW = :haw
          HE = :he
          HI = :hi
          HR = :hr
          HU = :hu
          HY = :hy
          ID = :id
          IS = :is
          IT = :it
          JA = :ja
          KA = :ka
          KK = :kk
          KN = :kn
          KO = :ko
          KU = :ku
          KY = :ky
          LO = :lo
          LT = :lt
          LV = :lv
          MK = :mk
          ML = :ml
          MN = :mn
          MR = :mr
          MS = :ms
          NE = :ne
          NL = :nl
          NO = :no
          OR = :or
          PA = :pa
          PL = :pl
          PS = :ps
          PT = :pt
          RO = :ro
          RU = :ru
          SK = :sk
          SL = :sl
          SO = :so
          SQ = :sq
          SR = :sr
          SV = :sv
          SW = :sw
          TA = :ta
          TE = :te
          TH = :th
          TL = :tl
          TR = :tr
          UK = :uk
          UR = :ur
          UZ = :uz
          VI = :vi
          YO = :yo
          ZH = :zh

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Symbol, Array<Symbol, ContextDev::Models::CrawlControls::Languages::UnionMember1>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Languages::TaggedSymbol,
              T::Array[ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol]
            )
          end
        end

        # @!group

        SAME_AS_START_URL = :same_as_start_url

        # @!endgroup

        # @type [ContextDev::Internal::Type::Converter]
        UnionMember1Array =
          ContextDev::Internal::Type::ArrayOf[enum: -> { ContextDev::CrawlControls::Languages::UnionMember1 }]
      end

      # Where the crawl started.
      #
      # @see ContextDev::Models::CrawlControls#source
      module Source
        extend ContextDev::Internal::Type::Union

        # The crawl discovered pages by following links from one URL.
        variant -> { ContextDev::CrawlControls::Source::StartURL }

        # The crawl scraped the pages listed in the domain's sitemap.
        variant -> { ContextDev::CrawlControls::Source::Sitemap }

        class StartURL < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, ContextDev::Models::CrawlControls::Source::StartURL::Type]
          required :type, enum: -> { ContextDev::CrawlControls::Source::StartURL::Type }

          # @!attribute url
          #   Page the crawl started from.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(type:, url:)
          #   The crawl discovered pages by following links from one URL.
          #
          #   @param type [Symbol, ContextDev::Models::CrawlControls::Source::StartURL::Type]
          #
          #   @param url [String] Page the crawl started from.

          # @see ContextDev::Models::CrawlControls::Source::StartURL#type
          module Type
            extend ContextDev::Internal::Type::Enum

            START_URL = :start_url

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain whose sitemap supplied the pages.
          #
          #   @return [String]
          required :domain, String

          # @!attribute type
          #
          #   @return [Symbol, ContextDev::Models::CrawlControls::Source::Sitemap::Type]
          required :type, enum: -> { ContextDev::CrawlControls::Source::Sitemap::Type }

          # @!method initialize(domain:, type:)
          #   The crawl scraped the pages listed in the domain's sitemap.
          #
          #   @param domain [String] Domain whose sitemap supplied the pages.
          #
          #   @param type [Symbol, ContextDev::Models::CrawlControls::Source::Sitemap::Type]

          # @see ContextDev::Models::CrawlControls::Source::Sitemap#type
          module Type
            extend ContextDev::Internal::Type::Enum

            SITEMAP = :sitemap

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::CrawlControls::Source::StartURL, ContextDev::Models::CrawlControls::Source::Sitemap)]
      end
    end
  end
end
