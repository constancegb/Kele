module Messages

  def get_messages(page)
    if page == nil
      response = self.class.get("/message_threads", headers: { "authorization" => @auth_token })
    else
      response = self.class.get("/message_threads/?page#{page}", headers: { "authorization" => @auth_token })
    end
    @message_threads = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, stripped_text)
      self.class.post("/messages", headers: { "authorization" => @authorization_token }, body: { "sender": sender, "recipient_id": recipient_id, "subject": subject, "stripped_text": stripped_text })
  end

end
