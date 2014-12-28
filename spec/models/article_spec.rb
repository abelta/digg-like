require 'rails_helper'


RSpec.describe Article, :type => :model do

  context "validations" do

    it "has a valid factory" do
      expect( build :article ).to be_valid
    end

    it "is not valid without a url" do
      article = build :article, url: nil
      article.valid?
      expect( article.errors[:url].size ).to be >= 1
    end

    it "is not valid without a title" do
      article = build :article, title: nil
      article.valid?
      expect( article.errors[:title].size ).to be >= 1
    end

    it "is not valid without a excerpt" do
      article = build :article, url: nil
      article.valid?
      expect( article.errors[:url].size ).to be >= 1
    end

    it "is not valid without a content" do
      article = build :article, content: nil
      article.valid?
      expect( article.errors[:content].size ).to be >= 1
    end

    it "is not valid without a uploader_id" do
      article = build :article, uploader_id: nil
      article.valid?
      expect( article.errors[:uploader_id].size ).to be >= 1
    end


    xit "is not valid without a uploader_name" do
      article = build :article, uploader_name: nil
      article.valid?
      expect( article.errors[:uploader_name].size ).to be >= 1
    end


  end
  


  context "initialize" do
     
    xit "can't be initialized without a user" do
      expect { new Article }.to raise_error
    end

    xit "has a user name that matches that of the one who uploaded it" do
      article = build :article
      uploader = User.find article.uploader_id
      expect( article.uploader_name ).to eq uploader.name
    end

  end


  context "uploader" do
    
    it "returns the user who uploaded the article" do
      article = create :article
      expect( article.uploader ).to be_a User
    end

    it "only allows read of uploader_id" do
      article = create :article
      expect { article.update_attribute :uploader_id, '1' }.to raise_error
    end

  end


  context "domain" do

    it "is automatically calculated from the url" do
      article = build :article, url:'http://exampledomain.com/exampletitle'
      expect( article.domain ).to eql 'exampledomain.com'
    end

  end


  context "uploader_name" do

    it "can not be changed directly" do
      article = create :article
      expect { article.update_attribute :uploader_name, 'random_name' }.to raise_error
    end

    it "is set when the article is created from its user" do
      article = create :article
      user = article.uploader
      expect( article.uploader_name ).to eql user.name
    end

    xit "is updated when the uploader is updated" do
      article = build :article
      user = create :user
      article.uploader = user
      expect( article.uploader_name ).to eql user.name
    end

  end


  context "associations" do

    it "embeds many comments" do
      relation = Article.relations['comments']
      expect( relation.klass ).to eq Comment
      expect( relation.relation ).to eq Mongoid::Relations::Embedded::Many
    end

  end

end