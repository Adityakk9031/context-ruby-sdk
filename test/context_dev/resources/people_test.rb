# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::PeopleTest < ContextDev::Test::ResourceTest
  def test_enrich
    skip("Mock server tests are disabled")

    response = @context_dev.people.enrich

    assert_pattern do
      response => ContextDev::Models::PersonEnrichResponse
    end

    assert_pattern do
      response => {
        match: ContextDev::Models::PersonEnrichResponse::Match,
        request_id: String,
        key_metadata: ContextDev::Models::PersonEnrichResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end

  def test_search_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.people.search(query: "VPs of sales at solar companies in California")

    assert_pattern do
      response => ContextDev::Models::PersonSearchResponse
    end

    assert_pattern do
      response => {
        request_id: String,
        results: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::PersonSearchResponse::Result]),
        key_metadata: ContextDev::Models::PersonSearchResponse::KeyMetadata | nil,
        next_cursor: String | nil
      }
    end
  end
end
