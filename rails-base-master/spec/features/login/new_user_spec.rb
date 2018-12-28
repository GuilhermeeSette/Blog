require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    User.delete_all
  end
  context 'when i want to sign up to the site'do
    specify 'I click the sign up button and fill the fields expecting to have success' do
        visit home_index_path
        click_link('Sign up')
        fill_in('Nome...', with: 'Fulano')
        fill_in('Senha...', with: '123')
        fill_in('Confirme a senha...', with: '123')
        click_on('Cadastrar-se')
        expect(page).to have_content('Usuário Fulano criado com sucesso!')
    end
  end
  context 'when i want to sign up to the site but put an existent user'do
    specify 'I click the sign up button and fill the fields expecting to have failure' do
        User.create(name: 'Fulano', password: '222')
        visit home_index_path
        click_link('Sign up')
        fill_in('Nome...', with: 'Fulano')
        fill_in('Senha...', with: '123')
        fill_in('Confirme a senha...', with: '123')
        click_on('Cadastrar-se')
        expect(page).to have_content('Name has already been taken')
    end
  end
end
