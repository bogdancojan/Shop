# Products
Product.create([
  {
    name: "ACER Nitro 5",
    price: 3899.9,
    barcode: "n3am47",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/N/i/2bd48d28d1c32adea0e55139a4e6434a/Nitro5_AN515-45_1.jpg"
  },
  {
    name: "APPLE Watch Series 7",
    price: 4774.0,
    barcode: "mq56q1",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/A/P/2bd48d28d1c32adea0e55139a4e6434a/APPLE_Watch_Series_7_GPS_Cellular_45mm_Graphite_Stainless_Steel_Case_Graphite_Milanese_Loop_6_.jpg"
  },
  {
    name: "SAMSUNG Galaxy Z Flip3",
    price: 3299.0,
    barcode: "rk71m7",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/T/e/2bd48d28d1c32adea0e55139a4e6434a/Telefon_SAMSUNG_Galaxy_Z_Flip3_5G_256GB_8GB_RAM_Dual_SIM_Green_1_.jpg"
  },
  {
    name: "LED IPS DELL",
    price: 3429.9,
    barcode: "o9zmy1",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/m/o/2bd48d28d1c32adea0e55139a4e6434a/monitor-u3023e-gallery-2.jpg"
  },
  {
    name: "APPLE MacBook Air 13",
    price: 8399.9,
    barcode: "ouy93q",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/M/a/2bd48d28d1c32adea0e55139a4e6434a/MacBook_Air_Space_Gray-1.jpg"
  },
  {
    name: "APPLE iPhone 13",
    price: 4048.99,
    barcode: "tynm9m",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/T/e/2bd48d28d1c32adea0e55139a4e6434a/Telefon_APPLE_iPhone_13_5G_Green_1_.jpg"
  },
  {
    name: "RAZER Naga Pro",
    price: 687.9,
    barcode: "i02kqh",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/M/o/2bd48d28d1c32adea0e55139a4e6434a/Mouse-Gaming-Razer-Naga-Pro-Screenshot-01.jpg"
  },
  {
    name: "BEATS Studio3",
    price: 1299.99,
    barcode: "e8nd62",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/C/A/2bd48d28d1c32adea0e55139a4e6434a/CASSTUDIO3DEC_427deb3e.jpg"
  },
  {
    name: "Smart Band XIAOMI Mi 6",
    price: 179.99,
    barcode: "l559uy",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/B/r/2bd48d28d1c32adea0e55139a4e6434a/Bratara_fitness_XIAOMI_Mi_Smart_Band_6_Android-iOS_Black.jpg"
  },
  {
    name: "SAMSUNG Galaxy Tab S8 Ultra",
    price: 6838.8,
    barcode: "dl09nb",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/T/a/2bd48d28d1c32adea0e55139a4e6434a/Tableta_SAMSUNG_Galaxy_Tab_S8_Ultra_14.6_128GB_8GB_RAM_Wi-Fi_Gray_6_.jpg"
  },
  {
    name: "RAZER Huntsman V2",
    price: 1039.9,
    barcode: "qs78ii",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/T/a/2bd48d28d1c32adea0e55139a4e6434a/Tastatura-Gaming-Razer-Huntsman-V2-Screenshot-04.jpg"
  },
  {
    name: "APPLE iPad Pro",
    price: 6299.92,
    barcode: "hc2na1",
    photo_url: "https://lcdn.altex.ro/resize/media/catalog/product/r/e/2bd48d28d1c32adea0e55139a4e6434a/res_02adc651999290fceb66bf4a662da33e_full_990a0fab.jpg"
  }
])

# Discounts
Discount.create([
  {
    code: "EASTER22",
    percentage: 45
  }
])

# Admins
User.create([
  {
    email: 'bogdan@admin.com',
    password: 'superman',
    password_confirmation: 'superman',
    admin: true
  }
])
