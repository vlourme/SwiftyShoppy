<p align="center">
    <img src="Media/Board.png" />
</p>

# SwiftyShoppy
![GitHub](https://img.shields.io/github/license/vlourme/SwiftyShoppy)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/vlourme/SwiftyShoppy?color=ff1a55&label=version)
> SwiftyShoppy is an API wrapper written in Swift for Shoppy.gg online commerce website.
> The API is user-friendly, fast and need less than 10 lines to write to start using it!

## Installation
SwiftyShoppy can be installed via Swift Package Manager.

### Install from XCode
1. Select `File / Swift Package / Add package dependency` from the menu
2. Paste `https://github.com/vlourme/SwiftyShoppy.git`
3. Follow the steps

### Install for a package
1. Add this line to your `Package.swift`, in the dependencies array: `
.package(url: "https://github.com/vlourme/SwiftyShoppy.git", .upToNextMajor(from: "1.1.4"))
`

## Getting started
Using *SwiftyShoppy* is very simple, check these examples.
So, right after installed dependency and getting your API key from your Shoppy account, you can start import the library in your code using this: 
```swift
import SwiftyShoppy
```

Now, if you want to get your list of orders:
```swift
NetworkManager
    // Precise your API key for each request
    .prepare(token: "API_KEY")
    // Define your target
    .target(.getOrders)
    // We are getting a list so use .asArray
    // We want to get our request parsed as an Order
    // So define the type as Order.self
    .asArray(Order.self,
        success: { orders in
            print("Amount of orders: \(orders.count)")
        }, error: { error in
            // These is an error...
        })
```

It is really simple, isn't it?

Another example: We want to get account settings:
```swift
NetworkManager
    // Precise your API key for each request
    .prepare(token: "API_KEY")
    // Define your target
    .target(.getSettings)
    // We are getting a list so use .asArray
    // We want to get our request parsed as an Order
    // So define the type as Order.self
    .asObject(Settings.self,
        success: { settings in
            print("Username: \(settings.user?.username)")
            print("Bitcoin Address: \(settings.settings?.bitcoinAddress)")
        }, error: { error in
            // These is an error...
        })
```

### More ressources
- Check out the wiki for more complex situations: [Wiki](https://github.com/vlourme/SwiftyShoppy/wiki)
- A list of endpoints is available here: [Endpoints.swift](https://github.com/vlourme/SwiftyShoppy/blob/master/SwiftyShoppy/Endpoints/Endpoints.swift)
- More examples are available in unit test: [Tests.swift](https://github.com/vlourme/SwiftyShoppy/blob/master/Tests/SwiftyShoppyTests/Tests.swift)


## Contribute
Issues, questions and pull requests are welcome. If you want to help in the development, you should know how tests are working.

You'll need to register at shoppy.gg and get your API key to paste it in `Tests/SwiftyShoppyTests/Keys.swift`

Everything being worked on is displayed in [Projects](https://github.com/vlourme/SwiftyShoppy/projects) tab.
