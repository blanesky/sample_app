require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

 test "layout links" do
   get root_path
   assert_template 'static_pages/home'
   assert_select "a[href=?]", root_path, count: 2
   assert_select "a[href=?]", help_path
   assert_select "a[href=?]", about_path
   assert_select "a[href=?]", contact_path
   get contact_path
   assert_select "title", full_title("Contact")
  end

  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "Ruby on Rails Tutorial Sample App"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end
end
