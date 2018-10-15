require 'test_helper'

class VocabularyTest < ActiveSupport::TestCase
  def setup
    @user = users(:akari)
    @vocabulary = @user.vocabularies.build(word: "sow", meaning: "種をまく", similarity: "seed", example: "I sowed pumpkin seeds.")
  end

  test "should be valid" do
    assert @vocabulary.valid?
  end

  test "user id should be present" do
    @vocabulary.user_id = nil
    assert_not @vocabulary.valid?
  end

  test "word should be present" do
    @vocabulary.word = "   "
    assert_not @vocabulary.valid?
  end

  test "word should be at most 50 characters" do
    @vocabulary.word = "a" * 51
    assert_not @vocabulary.valid?
  end

  test "meaning should be present" do
    @vocabulary.meaning = "   "
    assert_not @vocabulary.valid?
  end

  test "meaning should be at most 300 characters" do
    @vocabulary.meaning = "a" * 301
    assert_not @vocabulary.valid?
  end

  test "similarity should be at most 300 characters" do
    @vocabulary.similarity = "a" * 301
    assert_not @vocabulary.valid?
  end

  test "example should be at most 500 characters" do
    @vocabulary.example = "a" * 501
    assert_not @vocabulary.valid?
  end

  test "order should be most recent first" do
    assert_equal vocabularies(:travel), Vocabulary.first
  end
end
