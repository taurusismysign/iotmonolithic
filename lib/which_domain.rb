class InternetOfCoursesCheck
  def self.matches?(request)
    request.domain == "internetofcourses.com"
  end
end

class InternetOfTweetsCheck
  def self.matches?(request)
    request.domain == "internetoftweets.com"
  end
end

class WhatTheDingsCheck
  def self.matches?(request)
    request.domain == "whattheding.com"
  end
end
