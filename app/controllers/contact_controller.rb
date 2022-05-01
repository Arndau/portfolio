class ContactController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.name = params[:name]
    @contact.email = params[:email]
    @contact.message = params[:message]
    if @contact.deliver
      render json: {message: "Email sent successfully"}
    else
      render json: @contact.errors
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end

  end
