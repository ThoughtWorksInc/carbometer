require 'spec_helper'

feature 'View a list of posts that are popular' do

  background 'User visits the Dashboard page' do
    @title = 'Popular Post'
    FactoryGirl.create_list :post, 10, :statistics, title: @title
    visit '/dashboard'
  end

  scenario 'User sees listing of popular posts' do
    expect(page.body).to have_content(@title)
    expect(page.body).to have_css('.visit-count')
  end

end
