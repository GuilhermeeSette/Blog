require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    Tagging.delete_all
    Post.delete_all
    Tag.delete_all
  end

  context 'when there are a post with a tag'do
    specify 'I can search the posts by title' do
      visit new_post_path
      fill_in('Título', :with => 'Título1')
      fill_in('Conteúdo', :with => 'Conteudo')
      fill_in('Tags', :with => 'python, ruby')
      fill_in('Autor', :with => 'John')
      click_on('Criar post')
      fill_in('search', :with => 'Título1')
      click_on('search_title')
      expect(page).to have_content('Título1')
    end
  end
  context 'when there are a post with a tag'do
    specify 'I can search the posts by tag' do
      visit new_post_path
      fill_in('Título', :with => 'Título1')
      fill_in('Conteúdo', :with => 'Conteudo')
      fill_in('Tags', :with => 'python, ruby')
      fill_in('Autor', :with => 'John')
      click_on('Criar post')
      fill_in('search', :with => 'Título1')
      click_on('search_title')
      expect(page).to have_content('Título1')
    end
  end
end
