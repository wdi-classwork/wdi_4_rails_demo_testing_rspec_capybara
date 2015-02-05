require 'rails_helper'

article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

RSpec.feature 'Managing comments' do
  scenario 'List all article comments' do
    article.comments.create!(body: 'stupid comment')
    visit "/articles/#{article.id}/comments"
    expect(page).to have_content 'Comments'
    expect(page).to have_selector 'p', count: 1
  end
  scenario 'Create a comment' do
    visit "/articles/#{article.id}/comments/new"

    fill_in 'Body', with: 'stupid comment'
    click_on 'Create Comment'

    expect(page).to have_content(/success/i)
  end


end
