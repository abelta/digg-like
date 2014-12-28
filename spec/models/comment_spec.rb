require 'rails_helper'


RSpec.describe Comment, :type => :model do

  context "validations" do

    it "has a valid factory" do
      expect( build(:comment) ).to be_valid
    end

    it "is not valid without a user_id" do
      comment = build :comment, user_id: nil
      comment.valid?
      expect( comment.errors[:user_id].size ).to be >= 1
    end

    xit "is not valid without a user_name" do
      comment = build :comment, user_name: nil
      comment.valid?
      expect( comment.errors[:user_name].size ).to be >= 1
    end

    it "is not valid without content" do
      comment = build :comment, content: nil
      comment.valid?
      expect( comment.errors[:content].size ).to be >= 1
    end

  end


  context "initialize" do

    xit "throws error if it is not initialized with a user" do
      expect{ Comment.new }.to raise_error
    end
    
  end


  context "user" do

    it "returns assigned user" do
      comment = build :comment
      expect( comment.user ).to be_a User
    end

    xit "changes user" do
      comment = create :comment
      user = create :user
      comment.user = user
      expect( comment.user ).to eq user
    end

  end
  

  context "associations" do

    it "is embeded by a website" do
      relation = Comment.relations['article']
      expect( relation.klass ).to eq Article
      expect( relation.relation ).to eq Mongoid::Relations::Embedded::In
    end

  end
  
end