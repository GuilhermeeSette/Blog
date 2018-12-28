require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    User.delete_all
    User.create(name: 'Fulano', password: '222')
  end
  context 'when i want to sign in to the site'do
    specify 'I click the sign in button and fill the fields expecting to have success' do
        visit home_index_path
        click_link('Sign in')
        fill_in('Nome...', with: 'Fulano')
        fill_in('Senha...', with: '222')
        click_on('Entrar')
        expect(page).to have_content('FULANO logado com sucesso')
    end
  end
  context 'when i want to sign in to the site with invalid inputs'do
    specify 'I click the sign in button and fill the fields expecting to have success' do
        visit home_index_path
        click_link('Sign in')
        fill_in('Nome...', with: 'Fulano')
        fill_in('Senha...', with: '333')
        click_on('Entrar')
        expect(page).to have_content('Usuário/Senha incorretos')
    end
  end
end
