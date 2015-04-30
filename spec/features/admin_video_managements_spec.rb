require 'rails_helper'

RSpec.feature "AdminVideoManagements", type: :feature do
  it "should be able to upload a video" do
    visit 'admin/videos'
    fill_in "video[title]", with: "Title"
    fill_in "video[url]", with: "https://www.youtube.com/watch?v=2HFLwotYfl0"
    click_button "Submit"

    expect(page).to have_content("Video succesfully uploaded")
    expect(current_path).to eql(admin_videos_path)
  end

  it "should not be able to upload a video with invalid url" do
    visit 'admin/videos'
    fill_in "video[title]", with: "Title"
    fill_in "video[url]", with: "ww.youtube.com/watch?v=2HFLwotYfl0"
    click_button "Submit"

    expect(page).to have_content("Please check your YouTube format.")
    expect(current_path).to eql(admin_videos_path)

    fill_in "video[title]", with: "Title"
    fill_in "video[url]", with: "www.youtub.com/watch?v=2HFLwotYfl0"
    click_button "Submit"

    expect(page).to have_content("Please check your YouTube format.")

    fill_in "video[title]", with: "Title"
    fill_in "video[url]", with: "www.youtube.com/watch?"
    click_button "Submit"

    expect(page).to have_content("Please check your YouTube format.")

    fill_in "video[title]", with: "Title"
    fill_in "video[url]", with: "www.youtube.com"
    click_button "Submit"

    expect(page).to have_content("Please check your YouTube format.")

    fill_in "video[title]", with: "Title"
    fill_in "video[url]", with: "www.youtub.com/watch?v="
    click_button "Submit"

    expect(page).to have_content("Please check your YouTube format.")
  end
end
