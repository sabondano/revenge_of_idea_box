class Idea < ActiveRecord::Base
  enum quality: %w(swill plausible genius)

  def thumbs_up
    quality_integer = Idea.qualities[quality]
    update(quality: quality_integer + 1) if quality_integer < 2
  end

  def thumbs_down
    quality_integer = Idea.qualities[quality]
    update(quality: quality_integer - 1) if quality_integer > 0
  end
end
