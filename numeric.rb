class Numeric

  SECONDS = 60.0

  def weeks
    self*7*24*SECONDS*SECONDS
  end
  def days
    return self*24*SECONDS*SECONDS
  end
  def hours
    return self*SECONDS*SECONDS
  end
  def minutes
    return self*SECONDS
  end
  def seconds
    return self
  end
  def toMinutes
    self/SECONDS
  end
  def toHours
    self/(SECONDS*SECONDS)
  end
  def toDays
    self/(SECONDS*SECONDS*24)
  end
  def toWeeks
    self/(SECONDS*SECONDS*24*7)
  end
  def toSeconds
    self
  end
end

time =  7.hours
puts time.toWeeks

time = 2.seconds + 20.minutes + 4.hours + 8.days + 2.weeks

puts time.toWeeks, time.toDays, time.toHours, time.toMinutes, time