require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    before :all do
      DatabaseCleaner.clean
    end

    after :all do
      DatabaseCleaner.clean
    end

    it 'displays information for one article' do
      article = Article.create!(title: 'New Title', body: 'New Body')
      comment1 = article.comments.create(author_name: 'Me', body: 'Commenty comments')
      comment2 = article.comments.create(author_name: 'You', body: 'So much to say')

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)

      expect(page).to have_content(comment1.author_name)
      expect(page).to have_content(comment1.body)
      expect(page).to have_content(comment2.author_name)
      expect(page).to have_content(comment2.body)
    end
  end
end