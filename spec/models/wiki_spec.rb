require 'rails_helper'

RSpec.describe Wiki, type: :model do
   let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: boolean) }
   let(:user) { User.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "helloworld") }
   
   it { is_expected.to belong_to(:user) }

   describe "attributes" do
     it "has title and body attributes" do
       expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: boolean)
     end
   end
end
