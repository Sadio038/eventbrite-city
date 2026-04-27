require "test_helper"

class AttendanceMailerTest < ActionMailer::TestCase
  test "notify_creator" do
    mail = AttendanceMailer.notify_creator
    assert_equal "Notify creator", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
