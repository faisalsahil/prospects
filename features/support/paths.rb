module NavigationHelpers
  def current_path
    URI.parse(current_url).path
  end

  def path_to(page_name)
    case page_name
    when /^the sign in page$/
      "/users/sign_in"
    when /^the prospects page$/
      "/prospects"
    when /^the (.*?) prospect page$/
      prospect = Prospect.find_by_ticker!($1)
      "/prospects/#{prospect.id}"
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
