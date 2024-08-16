module Spree
  class ContactUsController < Spree::BaseController
    
    def new
      @contact = Contact.new
    end

    def create
      @store = current_store.name
      user_email = spree_user_signed_in? ? spree_current_user.email : contact_params[:email]
      @contact = Contact.new(contact_params.merge(email: user_email))
      if @contact.save
        ContactMailer.notify_owner(@contact,@store).deliver_now
        redirect_to root_path, notice: 'Your message has been sent!'
      else
        render :new
      end
    end

    private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :message)
    end
  end
end
