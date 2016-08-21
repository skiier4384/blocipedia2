require 'rails_helper'

RSpec.describe Wiki, type: :model do

  describe "attributes" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:private).of_type(:boolean) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    xit { should have_many(:collaborations) }
    xit { should have_many(:users) }
  end

  describe "validations" do
    xit { should validate_presence_of(:title) }
    xit { should validate_length_of(:title).is_at_least(5)}

    xit { should validate_presence_of(:body) }
    xit { should validate_length_of(:body).is_at_least(20) }

    xit { should validate_presence_of(:user) }
  end
  
  describe "scopes" do
     before do
       @public_wiki = Wiki.create!(name: "Public Wiki", description: "This is a private wiki", private: false)
       @private_wiki = Wiki.create!(name: "Private Wiki", description: "This is a public wiki")
     end
 
     describe "visible_to(user)" do
       it "returns all wikis if the user is present" do
         user = User.new
         expect(Wiki.visible_to(user)).to eq(Wiki.all)
       end
 
       it "returns only public wikis if user is nil" do
         expect(Wiki.visible_to(nil)).to eq([@public_topic])
       end
     end
   end

end
