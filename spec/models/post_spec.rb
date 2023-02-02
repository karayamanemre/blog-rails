require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Emre') }
  subject { Post.create(title: 'Test Title', text: 'Test Text') }

  it 'belongs to an author' do
    expect(subject.title).to eq 'Test Title'
  end

  it 'has many comments' do
    expect(subject).to respond_to(:comments)
  end

  it 'has many likes' do
    expect(subject).to respond_to(:likes)
  end

  it 'validates presence of title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'validates maximum length of title' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'has a recent_5_comments method' do
    expect(subject).to respond_to(:recent_5_comments)
  end
end
