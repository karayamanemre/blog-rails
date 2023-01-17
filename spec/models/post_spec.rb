require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(Name: 'Emre') }
  subject { Post.create(Title: 'Test Title', Text: 'Test Text') }

  it 'belongs to an author' do
    expect(subject.Title).to eq 'Test Title'
  end

  it 'has many comments' do
    expect(subject).to respond_to(:comments)
  end

  it 'has many likes' do
    expect(subject).to respond_to(:likes)
  end

  it 'validates presence of title' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'validates maximum length of title' do
    subject.Title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'has a recent_5_comments method' do
    expect(subject).to respond_to(:recent_5_comments)
  end
end
