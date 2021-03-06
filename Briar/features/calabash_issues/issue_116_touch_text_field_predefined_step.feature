Feature: issue 116 - should be able to touch text field by mark or placeholder
  https://github.com/calabash/calabash-ios/pull/116

  Background: get us to the text related views so we can test the test the new feature
    Given I am looking at the Text tab

  # this is unexpected:
  #
  # Then /^I (?:press|touch) the "([^\"]*)" (?:input|text) field$/ do |name|
  #   touch("textField placeholder:'#{name}'")
  #   sleep(STEP_PAUSE)
  # end
  #
  @issue_116
  @issues
  Scenario: i should be able to touch the text field by mark or placeholder
    # look by placeholder
    Then I touch the "placeholder!" text field

    # dismiss the keyboard
    Then I should be able to dock the keyboard
    Then I am done text editing
    Then I should not see the keyboard

    # look by mark
    # expected to fail until the proposed fix is installed
    Then I touch the "top tf" text field
    Then I should see the keyboard
    Then I am done text editing
