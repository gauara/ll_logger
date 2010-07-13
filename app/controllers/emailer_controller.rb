class EmailerController < ApplicationController

 def self.sendmail
      #email = @params["email"]
        #recipient = "sharma4@usc.edu" #email["recipient"]
        #recipient = "gaurav@listenlogic.com" #email["recipient"]
        recipient = "ben@listenlogic.com" #email["recipient"]
        #recipient = "ls@listenlogic.com" #email["recipient"]
        subject = "The First Log Message Test" #email["subject"]
        message = "Message: Everything is under control "#email["message"]
      Emailer.deliver_contact(recipient, subject, message)
      #return if request.xhr?
      #render :text => 'Message sent successfully'
  end


end
