# frozen_string_literal: true

require_relative "../../test_helper"

class ContextDev::Test::Resources::Browser::ProfilesTest < ContextDev::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @context_dev.browser.profiles.list

    assert_pattern do
      response => ContextDev::Models::Browser::ProfileListResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::Browser::ProfileListResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil,
        request_id: String,
        key_metadata: ContextDev::Models::Browser::ProfileListResponse::KeyMetadata | nil
      }
    end
  end
end
