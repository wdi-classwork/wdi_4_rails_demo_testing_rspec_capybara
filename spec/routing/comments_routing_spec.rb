require 'rails_helper'

RSpec.describe 'routes for comments' do
  it 'routes GET /articles/1/comments/new to the comments controller' do
    expect(get('/articles/1/comments/new')).to route_to(
      controller: "comments",
      action: "new",
      article_id: "1"
      )
  end

  it 'routes POST /comments to the comments controller' do
    expect(post('/articles/1/comments')).to route_to(
      controller: "notes"
      action: "create"
      id: "1"
      )
  end


  it 'routes GET /comments/1/edit to the articles controller and sets id' do
    expect(get('articles/1/comments/1/edit')).to route_to(
     controller: "notes"
      action: "edit"
      id: "1"
    )
  end

  # it 'routes PATCH /articles/1 to the articles controller and sets id' do
  #   expect(patch('articles/1')).to route_to(
  #     controller: 'articles',
  #     action: 'update',
  #     id: '1'
  #   )
  # end




end
