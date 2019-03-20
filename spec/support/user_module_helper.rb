module UserModuleHelper

  def login_user(username, password)
    visit '/users/sign_in'
    sleep 2
    fill_in "user_login", with: username
    fill_in "user_password", with: password
    # find_element(:css, "button[type='submit']").click()
    click_login
  end

  def sign_up_user(email, username, password)
    p "=========visit"
    visit '/users/sign_up'
    sleep 2
    fill_in "user_email", with: email
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password
    click_signup
  end

  def edit_profile
    find("a", text: "Welcome").click()
    sleep 2
    find("a", text: "Profile").click()
  end

  def update_profile_attributes(user, password = nil, confirm_password = nil)
    fill_in "user_email", with: user.email
    fill_in "user_username", with: user.username
    if !password.nil?
      fill_in "user_password", with: password
    end
    if !confirm_password.nil?
      fill_in "user_password_confirmation", with: confirm_password
    end
    click_button 'Update'
  end

  def click_login
    click_button 'Log in'
  end

  def click_signup
    click_button 'Sign up'
  end

  def new_seminar
    find("a", text: "Back").click()
    sleep 2
    find("a", text: "New Seminartopic").click()
  end

  def new_topic(title, descripton, studname)
    p "======new"
    visit '/seminartopics/new'

    sleep 2
    fill_in "seminartopic_title", with: title
    fill_in "seminartopic_descripton", with: descripton
    fill_in "seminartopic_studname", with: studname

    # find_element(:css, "button[type='submit']").click()
    click_new
  end

  def edit_seminar
    #visit '/seminartopics/1'
    find("a", text: "Edit").click()
  end

  def edit_topic(title, descripton, studname)
    p "======edit"
    visit '/seminartopics/1/edit'
    sleep 2
    fill_in "seminartopic_title", with: title
    fill_in "seminartopic_descripton", with: descripton
    fill_in "seminartopic_studname", with: studname

    # find_element(:css, "button[type='submit']").click()
    click_edit
  end

  def show_seminar
    find("a", text: "Back").click()
    sleep 2
    find("a", text: "Show").click()
  end

  def show_topic
    p "=====show"
    visit '/seminartopics/1'
  end

  def delete_seminar
    find("a", text: "Back").click()
    sleep 2
    #find("a", text: "Destroy").click()
  end

  def delete_topic
    p "=====delete"
    visit '/seminartopics'
    click_delete
  end

  def click_delete
    find('a[data-method="delete"]').click
    sleep 2
    page.driver.browser.switch_to.alert.accept
  end

  def click_new
    click_button 'Create Seminartopic'
  end

  def click_edit
    click_button 'Update Seminartopic'
  end
end
