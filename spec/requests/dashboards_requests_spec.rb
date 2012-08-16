require 'spec_helper'

feature 'View a list of posts that are popular' do

  background 'User visits the Dashboard page' do
    @title = 'Popular Post'
    @author = FactoryGirl.create :user
    FactoryGirl.create_list :post, 10, :statistics, title: @title, author: @author
    visit '/dashboard'
  end

  scenario 'User sees listing of popular posts' do
    expect(page.body).to have_content(@title)
    expect(page.body).to have_css('.visit-count')
  end

  scenario 'User sees the author and published date of posts' do
    expect(page.body).to have_content(@author.name)
    expect(page.body).to have_content(Time.now.strftime('%B'))
    expect(page.body).to have_content(Time.now.strftime('%Y'))
  end

end
