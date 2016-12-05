class RejectsController < ApplicationController
    
    def self.why_input(importation)
            xlsx = Roo::Spreadsheet.open importation.file

    xlsx.each_row_streaming( pad_cells: true) do |row|
      data = {
        importation_id: importation.id,
        first_name: row.first.value,
        last_name: row[1].value,
        email: row[2].value,
      }
      allcontacts = Reject.new data
      Reject.why_input allcontacts
      
    end
    end
    def self.why(allcontacts)
        #mail unique
        if  Contact.where(email: @reject.mail).exists? 
        @reject.reason = "mail en double"
        #3lettre moins
        elsif @reject.first_name.lenght < 3 
        @reject.reason = "prenom trop court"
        elsif @reject.last_name.lenght < 3 
        @reject.reason = "nom trop court"
        #caractères invalides
    elsif @rejet.firt_name /= @rejet.firt_name.gsub(/[^0-9a-z ]/i, '') 
    @reject.reason = "caractères invalides dans le prenom"
    elsif @rejet.last_name /= @rejet.last_name.gsub(/[^0-9a-z ]/i, '') 
     @reject.reason = "caractères invalides dans le nom"
    elsif @rejet.email /= @rejet.email.gsub(/[^0-9a-z ]/i, '') 
     @reject.reason = "caractères invalides dans le mail"
     else
       @reject.reason = "ok" 
        end
    end
    
    
    
end
