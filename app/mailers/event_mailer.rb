class EventMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def event_email(attendance)
    @attendance = attendance 

    @url  = 'http://monsite.fr/login' 

    mail(to: @attendance.user.email, subject: 'Bienvenu la famille !') 
  end
end
