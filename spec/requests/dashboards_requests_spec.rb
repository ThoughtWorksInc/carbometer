require 'spec_helper'

feature 'View a list of posts that are popular' do
  background 'User visits the Dashboard page' do
    @title = 'Popular Post'
    @author = FactoryGirl.create :user
    @posts = FactoryGirl.create_list :post, 8, :statistics, title: @title, author: @author
    visit '/dashboard'
  end

  scenario 'User sees listing of popular posts' do
    expect(page.body).to have_content(@title)
    expect(page.body).to have_css('.views')
  end

  scenario 'User sees the author and published date of posts' do
    expect(page.body).to have_content(@author.name)
    expect(page.body).to have_content(Time.now.strftime('%B'))
    expect(page.body).to have_content(Time.now.strftime('%Y'))
  end

  scenario 'User sees tweet count for posts' do
    tweet_counts = all('.tweets')
    expect(tweet_counts).to have(@posts.count).tweet_counts
    expect(tweet_counts.first).to have_content(0)
  end
end
