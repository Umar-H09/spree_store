class ContactMailer < ApplicationMailer
  def notify_owner(contact,store)
    @store = store
    @contact = contact
    mail(to: ENV['EMAIL_TO'], subject: 'Contact Us Form')
  end
end