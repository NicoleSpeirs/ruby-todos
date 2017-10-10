class Task
  attr_reader :text, :complete

  def initialize(text, complete=false)
    @text = text
    @complete = complete
  end

  def to_s
    "#{checkbox_mark} #{text}"
  end

  def toggle
     if @complete == false
      @complete = true
    else
      @complete = false
    end
  end

  def checkbox_mark
    if @complete == false
      "[ ]"
    else
      "[X]"
    end
  end


end
