require 'rails_helper'

 article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what happens next...")

RSpec.describe CommentsController do
  let(:valid_attributes) {
    { body: "You won't believe what happens next..." }
  }

  let(:invalid_attributes) {
    { body: nil }
  }

  describe 'GET index' do
    it 'assigns @comment' do
      comments = article.comments
      get :index, article_id: article.id
      expect(assigns(:comments)).to eq comments
    end
  end

  describe 'GET new' do
    it 'assigns @article' do
      get :new, article_id: article.id
      expect(assigns(:article)).to eq article
    end
    it 'assigns @comments' do
      get :new, article_id: article.id
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  describe 'POST create' do
    context 'with valid attribute' do
      it 'saves a new comment' do
        expect {
          post :create, comment: valid_attributes, article_id: article.id
        }.to change(Comment, :count).by 1
      end

      it 'assigns @comment' do
        post :create, comment: valid_attributes, article_id: article.id
        expect(assigns(:comment)).to be_an Comment
        expect(assigns(:comment)).to be_persisted
      end

      it 'redirects to the created comments' do
        post :create, comment: valid_attributes, article_id: article.id
        expect(response).to redirect_to article_comments_path(article)
      end

    context 'with invalid attributes' do
      it 'assigns @comment, but does not save a new comment' do
        post :create, comment: invalid_attributes, article_id: article.id
        expect(assigns(:comment)).to be_a_new Comment
      end

      it 're-renders the new template' do
        post :create, comment: invalid_attributes, article_id: article.id
        expect(response).to render_template 'new'
      end
      end
    end
  end

    describe 'GET edit' do
    it 'has a 200 status code' do
      comments = article.comments.new(valid_attributes)
      get :edit, article_id: article.id
      expect(response.status).to eq 200
      end
    end

end



  #   it 'has a 200 status code' do
  #     get :index
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the index template' do
  #     get :index
  #     expect(response).to render_template('index')
  #   end


