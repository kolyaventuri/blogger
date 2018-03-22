require 'rails_helper'

describe 'user deletes an article' do
  describe 'they visit the article page' do
    before :all do
      DatabaseCleaner.clean
    end

    after :all do
      DatabaseCleaner.clean
    end

    context 'they click delete on the show view' do
      it 'deltes the article' do
        article1 = Article.create!(title: 'Title 1', body: 'Body 1')
        article2 = Article.create!(title: 'Title 2', body: 'Body 2')

        visit article_path(article1)
        click_link 'Delete'

        expect(current_path).to eq(article_path)

        expect(page).to_not have_link(article1.title)
        expect(page).to have_link(article2.title)
      end
    end
  end
end
