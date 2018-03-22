require 'rails_helper'

describe 'user creates a new article' do
  article_title = 'New article!'
  article_body = 'This an article.'

  describe 'they link from the articles index' do
    context 'they fill in a title and body' do
      it 'creates a new article' do
        visit '/articles'

        click_on 'Create a New Article'

        expect(current_path).to eq(new_article_path)

        fill_in('article[title]', with: article_title)
        fill_in('article[body]', with: article_body)

        click_on 'Create Article'

        expect(current_path).to eq(article_path(1))

        expect(page).to have_content(article_title)
        expect(page).to have_content(article_body)
      end
    end
  end
end