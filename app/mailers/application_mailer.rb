class ApplicationMailer < ActionMailer::Base
  default from: 'Meetup主催者<from@example.com>'
  layout 'mailer'
end
