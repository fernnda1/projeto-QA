module CreateCustomerHelpers
  def create_customer(name: "Cliente teste", email: "teste@example.com", password: "teste" )
    visit "customers/sign_up"
    fill_in "Nome", with: name
    fill_in "Email", with: email
    fill_in "Senha", with: password
    click_button "Criar conta"
    expect(page).to have_content "Conta criada com sucesso"
   end
  end    
    