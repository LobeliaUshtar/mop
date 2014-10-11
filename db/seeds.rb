User.create!([
  {
    name: "Gabby",
    email: "gabby@example.com",
    password: "password",
    password_confirmation: "password",
    address: "123 Temp Street, Budd Lake, NJ 07828",
    phone: "555-555-5555",
    admin: true
  }
])

Donator.create!([
  {
    name: "Mt. Olive Bagels",
    website: "http://www.mtolivebagels.com",
    email: "mtolivebagels@gmail.com",
    address: "135 Rt 46 East Unit F, Budd Lake, New Jersey 07828",
    phone: "862-254-2100",
    hours: "5:30am - 4:00pm",
    description: "Mt. Olive Bagels uses only the finest and freshest ingredients; our commitment to excellence is at the core of our business. In addition to our signature hand rolled and kettle boiled bagels, we’ve rounded out the menu with a tempting selection of appetizers, salads, soups, burgers and sandwiches.

Ours is a casual spot – where your meal is prepared with care and served with a smile. Quality food, friendly courteous service and reasonable prices - it's what sets us apart from our competition and is quickly turning our first-timers into our regulars. So sit down, relax and take some time with the menu. You'll find a number of freshly prepared favorites sure to please.

Busy at work or in a hurry? Everything on our menu is available to go – just call or stop by. Free, fast delivery Monday – Friday,
7:00am-2:00pm. ($15 minimum)",
    logo_link: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/c3.0.160.160/p160x160/1604883_832175216809407_22432134_n.png?oh=06fb00f643b1f8888ad0e3bf4e651e14&oe=54B13669&__gda__=1420545899_5f6e8a52e936c452124aa1ce59a62c1c",
    donation: "freshly frozen bagels",
    current: true
  },
  {
    name: "Weis Markets Flanders",
    website: "https://www.weismarkets.com",
    email: "",
    address: "293 US Highway 206, Flanders, NJ 07836",
    phone: "973-598-8910",
    hours: "24 Hours",
    description: "",
    logo_link: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/c66.66.828.828/s160x160/249192_10151672798460056_357771915_n.jpg?oh=17d9923ed2e78115eb70753f569a760b&oe=54F73589&__gda__=1422020481_fa7037e4da428758ac486e1ad5e994d8",
    donation: "day old store made bakery items (bread, rolls, pastries, etc.)",
    current: true
  }
])