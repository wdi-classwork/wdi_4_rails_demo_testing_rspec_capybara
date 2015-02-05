require 'rails_helper'

RSpec.feature 'Managing comments' do
  scenario 'List all article comments' do
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    article.comments.create!(body: 'stupid comment')

    visit "/articles/#{article.id}/comments"

    expect(page).to have_content 'Comments'
    expect(page).to have_selector 'p', count: 1
  end

end
