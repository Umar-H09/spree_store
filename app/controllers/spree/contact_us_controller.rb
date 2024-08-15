module Spree
  class ContactUsController < Spree::BaseController
    
    def new
      @current_user = spree_current_user.email
      @contact = Contact.new
    end

    def create
      @store = current_store.name
      @contact = Contact.new(contact_params)
      if @contact.save
        redirect_to root_path
        ContactMailer.notify_owner(@contact,@store).deliver_now
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
