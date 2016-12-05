class ContactsController < ApplicationController
    def index
        @contacts = Contact.all.order(:created_at).reverse
    end
end
