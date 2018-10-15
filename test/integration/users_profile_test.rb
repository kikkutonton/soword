require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:akari)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.vocabularies.count.to_s, response.body
    assert_select 'div.pagination'

    get user_path(@user), params: {q: {word_cont: "a"}}
    q = @user.vocabularies.ransack(word_cont: "a")
    q.result.paginate(page:1).each do |vocabulary|
      assert_match vocabulary.word, response.body
    end
  end
end
