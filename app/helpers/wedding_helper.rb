module WeddingHelper
  def coming_class coming
    if coming == true
      'small button left expand selected [radius round]'
    else
      'small button left expand deselected [radius round]'
    end
  end
  
  def not_coming_class coming
    if coming == false
      'small button left expand selected [radius round]'
    else
      'small button left expand deselected [radius round]'
    end
  end
end
