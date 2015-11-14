require "json"
require "selenium-webdriver"
require "rspec"
require 'pry'
require_relative "../../spec/helpers/LoginHelper"
include RSpec::Expectations



describe "login" do

  before(:all) do
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @base_url = "https://core.futuresimple.com"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:all) do
    @driver.quit
    @verification_errors.should == []
  end

  it "Login" do

    @driver.get(@base_url + "/users/login")
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys Login.loginsettings.username
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys Login.loginsettings.password
    @driver.find_element(:xpath, "//form[@id='user_new']/fieldset/div[3]/div/button").click
    end

  it "Create Lead" do
    @driver.find_element(:id, "nav-leads").click
    @driver.find_element(:id, "leads-new").click
    @driver.find_element(:id, "lead-first-name").clear
    @driver.find_element(:id, "lead-first-name").send_keys "First Name"
    @driver.find_element(:id, "lead-last-name").clear
    @driver.find_element(:id, "lead-last-name").send_keys "Last name"
    @driver.find_element(:xpath, "//div[@id='container']/div/div/div/div/div[2]/button").click
  end
  it "Create Note" do
    @driver.find_element(:name, "note").click
    @driver.find_element(:name, "note").clear
    @driver.find_element(:name, "note").send_keys "Some text for note"
    @driver.find_element(:xpath, "//div[@id='updates']/form/fieldset/div/div/button").click
  end
  it "Validations" do
    @driver.find_element(:id, "nav-leads").click
    sleep(10)
    @driver.find_element(:partial_link_text, 'First Name').click
    sleep(10)
  #  @driver.find_element(:xpath, "//p[@class='activity-content note-content']")

    result = checkOfElement?(@driver.find_elements(:xpath, "//p[@class='activity-content note-content']"), "Some text for note")

    #puts "Result #{result}"

    expect(result).to be true



    @driver.find_element(:css, "i.base-icon-arrow-down").click
    sleep(2)
    @driver.find_element(:link, "Logout").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def checkOfElement? (listElements, name)
    res = false
    unless listElements.nil?
      for item in listElements do
          if item.text == name
            res = true
          end
      end
    else
      puts "There is no object"
    end
    res
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end

end

