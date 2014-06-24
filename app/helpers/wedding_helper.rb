module WeddingHelper
  def coming_class coming
    if coming == true
      'medium button left expand selected [radius round]'
    else
      'medium button left expand deselected [radius round]'
    end
  end
  
  def not_coming_class coming
    if coming == false
      'medium button left expand selected [radius round]'
    else
      'medium button left expand deselected [radius round]'
    end
  end
  
  def form_container_class coming
    if coming == false
      'hidden'
    else
      ''
    end
  end
  
  def not_coming_message_class coming
    if coming == false
      ''
    else
      'hidden'
    end
  end
  
  def rsvp_number_of_guests response
    @total_in_party = response.adults + response.children
    @verb = @total_in_party > 1 ? 'are' : 'is'
    @copy_number_of_guests = "There #{@verb} #{@total_in_party} #{'guest'.pluralize(@total_in_party)} in our party: #{response.adults} #{'adult'.pluralize(response.adults)}" 
    @copy_number_of_guests += response.children > 0 ? " and #{response.children} #{'child'.pluralize(response.children)}" : ""
    @copy_number_of_guests += "."
    return @copy_number_of_guests
  end
  
  def rsvp_friday_thingie response
    @total_in_party = response.adults + response.children
    @noun_verb = @total_in_party > 1 ? "We're" : "I'm"
    @copy_friday_thingie = response.friday_reception? ? "#{@noun_verb} coming to the Friday reception." : "#{@noun_verb} not coming to the friday reception."
  end
  
  def rsvp_comments response
    @total_in_party = response.adults + response.children
    @verb = @total_in_party > 1 ? "we've" : "I've"
    @copy_comments = response.comments? ? "And #{@verb} got something to say: #{response.comments}." : nil
  end
  
  def rsvp_message response
    if response.coming == true || response.coming == false
      "Make sure to click the big blue button to save any changes."
    else
      "RSVP for #{@guest.name} using form below, then click the big blue button."
    end
  end
  
  def rsvp_button response
    if response.coming == true || response.coming == false
      "Change your RSVP"
    else
      "Save your RSVP"
    end
  end
    
end
