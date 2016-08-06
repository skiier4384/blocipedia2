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
end
