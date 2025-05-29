# Visitação de páginas
Dado(/^(?:que )?(?:eu )?visitei a página "(.*)"$/) do |path|
  visit path
end

Então(/^que eu estou na página "(.*)"$/) do |path|
  expect(page).to have_current_path path
end

# Cliques
Quando(/^(?:eu )?clico (?:em|no|na) "(.*)"$/) do |element|
  clickable = all('button, input[type="submit"], a, .cursor-pointer', text: element, visible: true).last
  page.execute_script('arguments[0].click();', clickable.native)
end

Dado(/^(?:que )?(?:eu )?cliquei (?:em|no|na) "(.*)"$/) do |element|
  clickable = all('button, input[type="submit"], a, .cursor-pointer', text: element, visible: true).last
  page.execute_script('arguments[0].click();', clickable.native)
end

# Preenchimento de campos
Quando(/^eu preencho "(.*)" com "(.*)"$/) do |campo, valor|
  fill_in campo, with: valor
end

Quando(/^eu preencho o campo "(.*)" com "(.*)"$/) do |campo, valor|
  fill_in campo, with: valor
end

Quando("eu preencho os seguintes campos:") do |table|
  table.rows_hash.each do |campo, valor|
    fill_in campo, with: valor
  end
end

# Seleções, checkboxes e arquivos
Quando(/^eu seleciono "(.*)" com "(.*)"$/) do |field, value|
  select value, from: field
end

Quando(/^eu marco "(.*)"$/) do |field|
  check field
end

Quando(/^eu desmarco "(.*)"$/) do |field|
  uncheck field
end

Quando(/^eu anexo (?:em|no|na) "(.*)" o arquivo "(.*)"$/) do |field, path|
  attach_file field, path
end

# Verificações de conteúdo
Então(/^eu vejo "(.*)" na página$/) do |mensagem|
  expect(page).to have_content mensagem
end

Então(/^eu vejo "(.*)" (\d+) vezes$/) do |mensagem, n|
  expect(page).to have_content mensagem, count: n.to_i
end

Então(/^eu vejo "(.*)" em (?:o|a|no|na) "(.*)"$/) do |mensagem, seletor|
  within seletor do
    expect(page).to have_content mensagem
  end
end

# Verificações de elementos
Então(/^existe "(.*)"$/) do |element|
  expect(page).to have_selector element
end

Então(/^existe "(.*)" (\d+) vezes$/) do |element, n|
  expect(page).to have_selector element, count: n.to_i
end

Então(/^existe "(.*)" em (?:o|a|no|na) "(.*)"$/) do |child, parent|
  within parent do
    expect(page).to have_selector child
  end
end

Então(/^existe "(.*)" em (?:o|a|no|na) "(.*)" (\d+) vezes$/) do |child, parent, n|
  within parent do
    expect(page).to have_selector child, count: n.to_i
  end
end

# Espera
Dado(/^que eu espero "(.*)" segundo(?:s)?$/) do |seconds|
  sleep seconds.to_i
end

# Criação de dados
Dado(/^existe (?:um|uma) "(.*)" cadastrad(?:o|a) com:$/) do |model, table|
  attrs = table.rows_hash.symbolize_keys
  obj = model.classify.constantize.create(attrs)
  puts obj.errors.full_messages unless obj.valid?
  expect(obj.persisted?).to be true
end

Dado(/^existe (?:um|uma) "(.*)" cadastrad(?:o|a) na conta com:$/) do |model, table|
  attrs = table.rows_hash.symbolize_keys
  attrs[:account_id] = @account.id if @account
  obj = model.classify.constantize.create(attrs)
  puts obj.errors.full_messages unless obj.valid?
  expect(obj.persisted?).to be true
end

# Exemplo específico
Quando("eu crio um cliente com sucesso") do
  criar_cliente(email: "onepet@teste.com")
end