require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    Tagging.delete_all
    Post.delete_all
    Tag.delete_all

  end
  context 'when there are a post with a tag'do
    specify 'I can see the feedback message and the tags created' do
        visit new_post_path
        fill_in('Título', :with => 'Título')
        fill_in('Conteúdo', :with => 'Conteudo')
        fill_in('Tags', :with => 'python, ruby')
        fill_in('Autor', :with => 'John')
        click_on('Criar post')
        expect(page).to have_content('Post criado com sucesso.')
        expect(page).to have_content('python')
        expect(page).to have_content('ruby')

    end
  end
end
