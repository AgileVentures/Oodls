require 'mandrill'
require 'json'
require 'dotenv'
Dotenv.load

class Mailer

  def initialize
    @mandrill = Mandrill::API.new ENV['MANDRILL_TEST_APIKEY']
    @message = {}
  end

  def set_content(email, token)
    @message = {
      :subject => 'Reset password',
      :from_name => 'Oodls',
      :text => "copy and paste: localhost:9292/charity/reset_password/#{token}",
      # this ^ is obvs temporary
      :to => [
        {
          :email => "#{email}"
        }
      ],
      #:html => '<html><p><a href=/charity/reset_password/'+ "#{token}" + '>Follow this link</a> to reset your password<p><html>',
      :from_email => 'oodls.team@gmail.com'
      }
  end

  def send_email(email, token)
    set_content(email, token)
    @mandrill.messages.send(@message)
  end

end
