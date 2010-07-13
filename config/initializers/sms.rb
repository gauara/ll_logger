SmsOnRails::ServiceProviders::Clickatell.config =
{
   :api_id => '3247449',
   :user_name => 'gre.gaurav@gmail.com',
   :password => 'sha110'
}
 
 
SmsOnRails::ServiceProviders::EmailGateway.config =
{
   :sender => 'no-reply@domain.com',
   :subject => 'Default Subject Text'
   #:bcc => nil,
   #:mailer_klass => nil
}
 
 
SmsOnRails::ServiceProviders::Base.set_default_service_provider :clickatell
