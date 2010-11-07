require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  before do
    @new = Project.new
  end

  test "project must belong to person and organization" do
    assert_not_nil @new.errors.on(:person)
    assert_not_nil @new.errors.on(:orgaization)
  end

  test "Project must have a due date" do
    assert_not_nil @new.errors.on('due_datetime')
    @new.due_datetime = DateTime.now
    assert_nil @new.errors.on('due_datetime')
  end

  test "project must track when it's past due" do
    @new.due_datetime = DateTime.yesterday
    assert @new.past_due?

    # Projects aren't past due until the day AFTER they are due
    @new.due_datetime = DateTime.today
    assert !@new.past_due?

    @new.due_datetime = DateTime.tomorrow
    assert !@new.past_due?
  end

end
