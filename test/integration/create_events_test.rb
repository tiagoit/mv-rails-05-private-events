require 'test_helper'

class CreateEventsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'create a valid event' do
    log_in_as(@user.email)
    assert is_logged_in?
    get root_path
    assert_select 'form'
    assert_difference 'Event.count', 1 do
      post events_path, params: {
        event: {
          description: 'event test',
          location: 'location test',
          date: Time.now,
          user_id: @user.id
        }
      }
    end
    assert_difference 'Attendee.count', 1 do
      post attendance_path, params: {
        user_id: @user.id,
        event_id: events(:three).id
      }
    end
    delete logout_path
    assert_not is_logged_in?
  end
end
