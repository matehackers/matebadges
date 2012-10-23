class BadgeMailer < ActionMailer::Base
  default from: "courses@matehackers.org"

  def badge_email(assertion)
    @user = assertion.user
    @title = assertion.badge.name
    @assertion = assertion
    mail(:to => @user.email, :subject => "Here's your #{@title} badge!")
  end
end
