module Goeat
  #Library that stores basic struct n const

  # Basic Structure
  Coordinate = Struct.new(:x, :y)

  # Useful Constant
  $COST_DIST = 3000 # cost user must pay to driver
  $DRIVER_NAME_SAMPLE = ["Asep","Ujang","John","Ujay","Wendy",
                        "Collin","Rex","Ruben","Dedi","Yohan",
                        "Ahmad","Saepul","Rendra","Yosua","Tom"]
  $STORE_NAME_SAMPLE = ["Blue","Royal","Wendy","Sun n Moon","Buck","Star","Gwen","Shiny"]
  $STORE_TYPENMENU_SAMPLE = {" Cafe " => [['Frappucino',rand(5..12)*1000],['Americano',rand(5..12)*1000],['Espresso',rand(5..12)*1000]],
                            " Pasta " => [["Lasagna", rand(25..50)*1000],["Spaghetti",rand(20..35)*1000],["Fussili"],rand(20..35)*1000],
                            " Resto " => [["Nasi Goreng", rand(20..30)*1000],["Bistik Sapi",rand(30..40)*1000],["Teh Manis", rand(3..7)*1000]],
                            " Oriental Food " => [["Fuyung Hai",rand(20..30)*1000],["Capcay",rand(12..20)*1000],["Mei Lan", rand(20..25)*1000]]}

end