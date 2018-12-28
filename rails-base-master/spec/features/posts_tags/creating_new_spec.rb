require 'rails_helper'



describe 'As a user', js: true, type: :feature do
  before(:each) do
    Tagging.delete_all
    Post.delete_all
    Tag.delete_all
    User.delete_all


  end

  context 'when i am not logged and there are a post with a tag'do
    specify 'I see the feedback message that i need to login before continue' do
        visit new_post_path
        expect(page).to have_content('Necessário efetuar o login.')
    end
  end

  context 'when i am logged and there are a post with a tag'do
    specify 'I see the post title and the tags created' do
        user = User.create(name: 'Fulano', password: '123')
        allow_any_instance_of(::ApplicationController).to receive(:session).and_return(user_id: user.id)
        visit new_post_path
        fill_in('Título', :with => 'Título')
        fill_in('Conteúdo', :with => 'Conteudo')
        fill_in('Tags', :with => 'python, ruby')
        click_on('Criar post')
        expect(page).to have_content('Conteudo')
        expect(page).to have_content('python')
        expect(page).to have_content('ruby')
    end
  end

end
