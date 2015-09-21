# create admin users
mailgun_key = SecureRandom.hex(10)
puts "mailgun_key: #{mailgun_key}"
marketforms_key = SecureRandom.hex(10)
puts "marketforms_key: #{marketforms_key}"
User.create :email => "mailgun@marketforms.com", :password => mailgun_key, :password_confirmation => mailgun_key
User.create :email => "marketforms@marketforms.com", :password => marketforms_key, :password_confirmation => marketforms_key
User.create :email => "keith@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Keith", :phone => "518-907-4779", :last_name => "Tom"
User.create :email => "niraj@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Niraj", :phone => "518-907-4779", :last_name => "Khanna"
User.create :email => "alex@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Alex", :phone => "518-907-4779", :last_name => "Zervakos"
User.create :email => "jeshuaborges@gmail.com", :password => "testing", :password_confirmation => "testing", :first_name => "Jesh", :phone => "518-907-4779", :last_name => "Borges"

# initial cold callers
ashley = User.create :email => "ashley@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Ashley", :phone => "", :last_name => ""
liane   = User.create :email => "liane@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Liane", :phone => "518-907-4881", :last_name => "Young"
michelle = User.create :email => "michelle.salazar@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Michelle", :phone => "518-907-4877", :last_name => "Salazar"
chase   = User.create :email => "chase@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Chase", :phone => "518-907-4778", :last_name => "Badon"
fred     = User.create :email => "fredb@marketforms.com", :password => "testing", :password_confirmation => "testing", :first_name => "Fred", :phone => "518-907-4701", :last_name => "Bermillo"

test_prospect = Prospect.create! :ticker => "TEST", :company_name => "TEST", :raw_cik => "0000000000", :filing_agent => "Marketforms", :contact_name => "Test", :contact_email => "info@marketforms.com"
User.all.each do |user|
  ProspectAssignment.create!(:user_id => user.id, :prospect_id => test_prospect.id)
end

# Import csv fixture
prospect_csv_path = Rails.root.join('assets', 'prospects2.csv')
ProspectImport.new(prospect_csv_path).process!

# Assign prospects to their respective cold callers

# list of assigned prospect IDs.  The values come from row #'s from an external excel spreadsheet.
# the offset converts row # to prospect ID
offset = 0


michelle_prospect_ids = [(1187..1189), (1197..1203), (1207..1213), (2278..2278), (2280..2282), (2284..2284),
                         (2287..2287), (2289..2300), (2303..2304), (2306..2309), (2699..2749), (2910..2934)].map {|range| range.to_a }.flatten.map { |i| i - offset }
chase_prospect_ids = [(2975..3000), (2587..2637), (2315..2334), (1358..1365), (1430..1436)].map {|range| range.to_a }.flatten.map { |i| i - offset }
fred_prospect_ids = [(1183..1186), (1190..1196), (1204..1206), (1214..1238), (1243..1249), (1251..1252), (1254..1256),
               (1259..1277), (1280..1281), (1290..1311), (1313..1316), (1318..1319), (1321..1321), (1328..1336),
               (1338..1356), (1366..1369), (1371..1373), (1375..1376), (1379..1407), (1410..1429), (1437..1477),
               (1484..1486), (1488..1498), (1501..1509)].map {|range| range.to_a }.flatten.map { |i| i - offset }
liane_prospect_ids = [1664,1667,1668,1669,1679,1680,1690,1694,1699,1706,1708,1711,1715,1716,1717,1720,1727,1730,1732,1733,1747,1752,1761,
             1516,1517,1520,1522,1524,1531,1534,1544,1553,1563,1564,1568,1570,1572,1573,1574,1575,1579,1600,1606,1607,1611,1612,1613,1626,1627,1628,1634,
             2372,2376,2380,2382,2385,2389,2390,2399,2400,2403,2308,2418,2419,2426,2430,2438,2447,2450,2457,2466,
             2468,2472,2485,2489,2491,2492,2493,2498,2508,2516,2517,2518,2524,2525,2533,2543,2552,2557,2560,2563,2568,2571,2572,
             2372,2376,2380,2382,2385,2389,2390,2392,2399,2400,2403,2408,2418,2419,2426,2430,2438,2447,2450,2457,2466,
             2760,2763,2768,2771,2775,2778,2782,2783,2792,2797,2820,2824,2838,2840,2846,2855,2856,2859,2870,2876,2877,2883,2890,
             2574,2575,2581,
             2688,2689,2690,2692,2694,2695,
             2898,2902,2903,2904,
             2646,2649,2653,2664,2667,2668,2669].uniq
ashley_prospect_ids = []

hash = {
  michelle => michelle_prospect_ids,
  chase  => chase_prospect_ids,
  fred     => fred_prospect_ids,
  liane     => liane_prospect_ids,
  ashley     => ashley_prospect_ids,
}

hash.each do |user, prospect_ids|
  prospect_ids.each do |id|
    ProspectAssignment.create! :user_id => user.id, :prospect_id => id
  end
end
