module Roadmap

  def get_roadmap(roadmap_id) #Rails roadmap ID : 31
      response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token })
      @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id) #A checkpoint ID : 1606
      response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token })
      @checkpoint = JSON.parse(response.body)
  end

end
