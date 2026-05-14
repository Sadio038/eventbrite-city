require "test_helper"

class EventMailerTest < ActionMailer::TestCase
  test "event_approved" do
    mail = EventMailer.event_approved
    assert_equal "Event approved", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "event_rejected" do
    mail = EventMailer.event_rejected
    assert_equal "Event rejected", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
