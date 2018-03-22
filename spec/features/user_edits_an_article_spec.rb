require 'rails_helper'

describe 'user edits an article' do
  describe 'they visit the article page' do
    before :each do
      DatabaseCleaner.clean
      @article1 = Article.create!(title: 'Title 1', body: 'Body 1')
      @article2 = Article.create!(title: 'Title 2', body: 'Body 2')
    end

    after :all do
      DatabaseCleaner.clean
    end

    context 'they click edit on the show view' do
      it 'allows them to edit the article' do

        visit article_path(@article1)
        click_link 'Edit'

        expect(current_path).to eq(edit_article_path(@article1))
      end
    end
  end
end
