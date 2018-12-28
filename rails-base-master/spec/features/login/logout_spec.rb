require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    User.delete_all
    User.create(name: 'Fulano', password: '222')
  end
  context 'when i want to sign out the site'do
    specify 'I click the sign out button and fill the fields expecting to have success' do
        visit home_index_path
        click_link('Sign in')
        fill_in('Nome...', with: 'Fulano')
        fill_in('Senha...', with: '222')
        click_on('Entrar')
        click_on('Sign out')
        expect(page).to have_content('Usuário saiu!')
    end
  end
end
