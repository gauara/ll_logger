include SMSFu


class SmsController < ApplicationController
def self.create
# Ben :   
deliver_sms("2133081594","AT&T","Notification From ListenLogic , Cheers !!" )
end
end
