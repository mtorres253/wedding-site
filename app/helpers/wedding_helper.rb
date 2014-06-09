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
  
  def rsvp_number_of_guests response
    @adult_copy = response.adults > 1 ? "adults" : "adult"
    @child_copy = response.children > 1 ? "children" : "child"
    @copy_number_of_guests = "I'm bringing"
    @copy_number_of_guests += " #{response.adults} "
    @copy_number_of_guests += @adult_copy
    @copy_number_of_guests += response.children > 0 ? " and #{response.children} #{@child_copy}" : ""
    return @copy_number_of_guests
  end
  
  def rsvp_friday_thingie response
    @copy_friday_thingie = response.friday_reception? ? "I'm coming to the Friday thingie" : "I'm not coming to the friday thingie"
  end
  
  def rsvp_comments response
    @copy_comments = response.comments? ? "And I've got something to say: #{response.comments}" : nil
  end
  
end
