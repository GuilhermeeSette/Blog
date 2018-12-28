require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    Tagging.delete_all
    Post.delete_all
    Tag.delete_all
    User.delete_all
  end

  context 'when there are a post with a tag'do
    specify 'I can search the posts by title' do
      user = User.create(name: 'Fulano', password: '123')
      allow_any_instance_of(::ApplicationController).to receive(:session).and_return(user_id: user.id)
      visit new_post_path
      fill_in('Título', :with => 'Título1')
      fill_in('Conteúdo', :with => 'Conteudo')
      fill_in('Tags', :with => 'python, ruby')
      click_on('Criar post')
      fill_in('search', :with => 'Título1')
      click_on('search_title')
      expect(page).to have_content('Título1')
    end
  end

  context 'when there are a post with a tag'do
    specify 'I can search the posts by tag' do
      user = User.create(name: 'Fulano', password: '123')
      allow_any_instance_of(::ApplicationController).to receive(:session).and_return(user_id: user.id)
      visit new_post_path
      fill_in('Título', :with => 'Título1')
      fill_in('Conteúdo', :with => 'Conteudo')
      fill_in('Tags', :with => 'python, ruby')
      click_on('Criar post')
      first(:link, 'python').click
      expect(page).to have_content('Título1')
    end
  end

  context 'when there are not a post that i am looking for'do
    specify 'I can see th feedback message' do
      user = User.create(name: 'Fulano', password: '123')
      allow_any_instance_of(::ApplicationController).to receive(:session).and_return(user_id: user.id)
      visit new_post_path
      fill_in('Título', :with => 'Título1')
      fill_in('Conteúdo', :with => 'Conteudo')
      fill_in('Tags', :with => 'python, ruby')
      click_on('Criar post')
      fill_in('search', :with => 'Título2')
      click_on('search_title')
      expect(page).to have_content('Não existe nenhum post!')
    end
  end
end
