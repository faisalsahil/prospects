module ProspectsHelper
  def display_time(time)
    time.strftime("%b. %-d %l:%M%P %Z")
  end
end
