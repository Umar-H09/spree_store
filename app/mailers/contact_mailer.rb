class ContactMailer < ApplicationMailer
  def notify_owner(contact,store)
    @store = store
    @contact = contact
    mail(to: ENV['GMAIL_USERNAME'], subject: 'Contact Us Form')
  end
end