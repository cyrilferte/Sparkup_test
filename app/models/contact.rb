class Contact < ApplicationRecord
    validates :first_name, presence: true, length: { minimum: 3 }
    validates :last_name, presence: true, length: { minimum: 3 }
    validates_email_format_of :email
    validates :email, presence: true, uniqueness: true
      
    def self.savecontact(importation)
        xlsx = Roo::Spreadsheet.open importation.file

        xlsx.each_row_streaming( pad_cells: true) do |row|
            data = {
                importation_id: importation.id,
                first_name: row.first.value,
                last_name: row[1].value,
                email: row[2].value,
                }
            contact = Contact.new data
        end
    end
end
