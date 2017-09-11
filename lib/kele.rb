require 'httparty'
require 'json'
require './lib/roadmap'
require './lib/messages'

class Kele
  include HTTParty
  include Roadmap
  include Messages
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    response = self.class.post("/sessions", body: { "email": email, "password": password} ) #retrieve the authentication token
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get("/users/me", headers: { "authorization" => @auth_token })
    @user_data = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id) #ID : 592292
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

  def create_submission(id, branch, commit_link, comment, enrollment)
    response = self.class.post("/checkpoint_submissions",
                                headers: { "authorization" => @auth_token },
                                body: { checkpoint_id: id,
                                        assignment_branch: branch,
                                        assignment_commit_link: commit_link,
                                        comment: comment,
                                        enrollment_id: enrollment }) #29906
    @checkpoint_submission = JSON.parse(response.body)
  end

end
