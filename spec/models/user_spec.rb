require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(Name: 'Emre') }

  it 'has many posts' do
    expect(subject).to respond_to(:posts)
  end

  it 'has many comments' do
    expect(subject).to respond_to(:comments)
  end

  it 'has many likes' do
    expect(subject).to respond_to(:likes)
  end

  it 'validates presence of name' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'validates numericality of posts_counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'has a recent_3_posts method' do
    expect(subject).to respond_to(:recent_3_posts)
  end
end
