import UIKit
//: [Previous](@previous)

//: Pre-requisites
//:
//: - `itemPrices`: An array containing prices of 7 (or any number of) items.
//: - `discounts`: A dictionary with `discountType`:`discounrPercentage` pairs:
//:     - `discountType`: Type of discount to be applied on an item. Discount types could be Default discount (5%), Thanksgiving discount (10%), Christmas discount (15%), New year discount (20%).
//:     - `discountPercentage`: A percentage discount number. For example: 5%, 10%.


//: Calculated amounts:
//: - `totalAmount`: Total amount of all items before applying discount. (A single value.)
//: - `discountedAmount`: Amount after applying `discount` on `totalAmount`. Formula: `totalAmount * 0.5` (if a discount of 5% is applied).
//: - `totalAmountAfterDiscount`: `totalAmount - discountedAmount`.


//: [JRogel]: Creating an `enum` to hold the prerequisites.
enum DiscountConstants {
    // Defining a defaultDiscount to be used in the app
    public static let defaultDiscount: Double = 0.05
    
    public static let itemPrices: [Double] = [12.3, 11.5, 7.8, 9.5, 4.75, 8.9, 20.0]
    
    // Defining a dictionary - This will be used later for Assignment 6
    public static let discounts: [String:Double] = ["Default": defaultDiscount, "Thanksgiving": 0.1, "Christmas": 0.15, "New Year": 0.2]
}

//: ## Assignment 1: Function
//:
//: - Create a function with 2 parameters: `totalAmount` and `discountPercentage` (5%, 10% and so on).
//: - Calculate the `discountedAmount `and subtract this from the `totalAmount` (using formulae above).
//: - Return the `totalAmountAfterDiscount`.

// Naming this function `calculateDiscount`. If necessary comment this code out.
func calculateDiscount(for totalAmount: Double, discountPercentage: Double) -> Double {
    var discountedAmount: Double
    var totalAmountAfterDiscount: Double
    
    discountedAmount = totalAmount * discountPercentage
    totalAmountAfterDiscount = totalAmount - discountedAmount
    
    return totalAmountAfterDiscount
}

calculateDiscount(for: 100, discountPercentage: DiscountConstants.discounts["Christmas"] ?? 0.0 )

//: ## Assignment 2: Function
//:
//: - Modify the function above to now take in a default discount percentage that will be applied by default to all. Hint: Use function overloading.

func calculateDiscount(totalAmount: Double, discountPercentage: Double =  DiscountConstants.defaultDiscount) -> Double {
    let discountedAmount: Double
    let totalAmountAfterDiscount: Double
    
    discountedAmount = totalAmount * discountPercentage
    totalAmountAfterDiscount = totalAmount - discountedAmount
    
    return totalAmountAfterDiscount
}

calculateDiscount(totalAmount: 100)
calculateDiscount(totalAmount: 100, discountPercentage: 0.5)

//: ## Assignment 3: typealias
//:
//: - Create a `typealias` for a function type that takes in `totalAmount` and `discountType` as parameters. It returns the `totalAmountAfterDiscount`. Hint: (Double, String) -> Double

//: [JRogel]: I clarified in the session, I am creating a function that returns the `totalAmointAfterDiscount` but uses the typealias as the signature of the function.
//: Here we go:

typealias GetDiscount = (Double, String) -> Double

// Let us now use the typealias to overload our `calculateDiscount` function with the help of the following function:
func holidayDiscount(totalAmount: Double, discountType: String) -> Double {
    totalAmount * (1 - (DiscountConstants.discounts[discountType] ?? 0.0) )
}

// Overloading `calculateDiscount`
func calculateDiscount(_ discount: GetDiscount, _ totalAmount: Double, _ discountType: String) -> Double {
    let result = discount(totalAmount, discountType)
    return result
}

calculateDiscount(holidayDiscount, 100, "Thanksgiving")

//: - Now create a `printDiscountfunction` to print the `totalAmountAfterDiscount` for all discount types. It takes function (typealias) as a parameter

//: [JRogel]: I read this as creating a function that then I can use to print the `totalAmountAfterDiscount` upon request:

func printDiscount(_ discount: GetDiscount, _ totalAmount: Double, _ discountType: String) {
    let result = discount(totalAmount, discountType)
    print("The discounted amount for \(discountType) is \(result).")
}

//: Testing:
printDiscount(holidayDiscount, 100, "Christmas")

//:  Printing the `totalAmountAfterDiscount` for all discount types. I am using `forEach` to do this:
DiscountConstants.discounts.keys.forEach { holiday in
    printDiscount(holidayDiscount, 100, holiday)
}

//: Assignment 4: Closure
//:
//: - Create a closure that calculates the discount. Closures takes parameters as: total amount, discount type and subtracts discounted amount from total amount and prints the total amount.

//: Starting with a long closure syntax - NICE TO HAVE!!
var discountClosure: GetDiscount = { (totalAmount: Double, discountType: String) -> Double in
    let totalAmountAfterDiscount: Double
    
    totalAmountAfterDiscount = totalAmount * (1 - (DiscountConstants.discounts[discountType] ?? 0.0) )
    print("The discounted amount for \(discountType) is \(totalAmountAfterDiscount).")
    return totalAmountAfterDiscount
}

var testDiscountClosure = discountClosure(100, "Christmas")
print(testDiscountClosure)

//: As part of the NICE TO HAVE I am rewritting the closure with no parameter names and return type
var shortDiscountClosure: GetDiscount = {
    let totalAmountAfterDiscount = $0 * (1 - (DiscountConstants.discounts[$1] ?? 0.0) )
    print("The discounted amount for \($0) is \(totalAmountAfterDiscount).")
    return totalAmountAfterDiscount
}

shortDiscountClosure(100, "Christmas")


//: Assignment 5: Map
//:
//: - Take `itemPrices`. Let's say the prices of all of these items are to be increased by 50%. Multiply each element in an array with 0.5. Print the new item price.
//:
//:  For example: Price of item 1 is $100. Price of item 1 is to be increased by 50% (that's $100 * 0.5 = $50). The new price of item 1 is now $150. Hint: Use Swift's map

let increaseAmount = 0.5

var increasedItemPrices = DiscountConstants.itemPrices.map { (price) -> Double in
    price * ( 1 + increaseAmount)
}

print("Before discount: \(DiscountConstants.itemPrices)")
print("After discount: \(increasedItemPrices)")

//: Assignment 6: Sorted
//:
//: - Create a Discount type dictionary (with discount type and percentage amount). Sort this dictionary from highest discount to lowest discount. Hint: Use Swift's sorted.


let sortedDiscountTypes = DiscountConstants.discounts.sorted {
    return $0.value > $1.value
}

print(sortedDiscountTypes)

// Or in a nicer way:
sortedDiscountTypes.forEach { dt in
    print("The discount for \(dt.key) is \(dt.value)")
}

//: Assignment 7: Enums and Switch cases
//:
//: - Use enums for discount types.
//: - Create a function printDiscount to print the value for discount types. Use switch cases and enums to do this.

enum DiscountTypes: Double {
    case defaultDiscount = 0.05
    case thanksgiving = 0.1
    case christmas = 0.15
    case newYear = 0.2
}

func printDiscount(for discountType: DiscountTypes) {
    switch discountType {
    case .defaultDiscount:
        print(discountType.rawValue)
    case .thanksgiving:
        print(discountType.rawValue)
    case .christmas:
        print(discountType.rawValue)
    case .newYear:
        print(discountType.rawValue)
    }
}

printDiscount(for: .newYear)

//: Assignment 8: Computed property
//: Create a computed property: `currentDiscountedAmount` that returns the current discounted amount that you apply on the `itemPrices`.

//: Since a computed property belongs to a named type I am going to create a struct called `selectedDishes`

//: Assignment 9: Lazy Property
//: - I am using the implementation from Assignment 8. I will point out the additions in the code below

let currentSeason = DiscountTypes.christmas.rawValue

struct selectedDish {
    let name: String
    var itemPrice: Double
    
    var currentDiscountedAmount: Double {
        return calculateDiscount(totalAmount: itemPrice, discountPercentage: currentSeason)
    }
    
    // Code for Assignment 9 - Lazy Property
    // Not a very realistic thing to do, but here we go - Offering a max Discount for next purchase selected at random up to 20%...
    // The rounding can be done with the extension for Assignment 12. Leaving this as is to show progress.
    lazy var maxDiscount =  Double(100 * Double.random(in: 0.0...0.2)).rounded() / 100.0
    
}

let pasta = selectedDish(name: "Pasta", itemPrice: 10.0)

print("Hohoho! Your dish is part of our seasonal promotion. Pay only £\(pasta.currentDiscountedAmount)!")

// Trying now to replicate the idea of getting a list of `itemPrices`
var dish1 = selectedDish(name: "Dish 1", itemPrice: 12.3)
var dish2 = selectedDish(name: "Dish 2", itemPrice: 11.5)
var dish3 = selectedDish(name: "Dish 3", itemPrice: 7.8)
var dish4 = selectedDish(name: "Dish 4", itemPrice: 9.5)
var dish5 = selectedDish(name: "Dish 5", itemPrice: 4.75)
var dish6 = selectedDish(name: "Dish 6", itemPrice: 8.9)
var dish7 = selectedDish(name: "Dish 7", itemPrice: 20.0)

let dishes = [dish1, dish2, dish3, dish4, dish5, dish6, dish7]

let currentDiscountAmounts = dishes.map { (dish) -> Double in
    dish.currentDiscountedAmount
}

print("The current discounted amount for your dishes are: \(currentDiscountAmounts)")

print("Spin the wheel and see if you get a surprise discount...\nCongratulations your \(dish1.name) has a voucher of \(dish1.maxDiscount * 100)% for your next purchase!")

//: Assignment 10: Method
//:
//: - Create a method that calculates and returns `totalAmountAfterDiscount`. Hint: Method belongs to a class/ struct/ enum.

// To make this more suitable to my existing use case I am thinking of my `Order` struct. I create a minimal example here

struct Order {
    var order: [selectedDish] = []
    
    // Method 1 - Same as the one used in my HW for week 2
    mutating func totalOrder() -> Double {
        var total: Double = 0.0
        for entry in order {
            total += entry.itemPrice
        }
        return total
    }
    
    // New method - so as to comply with this week's HW :]
    mutating func totalOrderDiscounted() -> Double {
        let partialTotal = totalOrder()
        return calculateDiscount(totalAmount: partialTotal, discountPercentage: currentSeason)
    }
    
}

var myOrder = Order()
myOrder.order.append(dish1)
myOrder.order.append(dish2)
myOrder.order.append(dish3)
myOrder.order.append(dish4)
myOrder.order.append(dish5)
myOrder.order.append(dish6)
myOrder.order.append(dish7)

myOrder.totalOrder()

myOrder.totalOrderDiscounted()

//: Assignment 11: Protocol
//:
//: - Create a protocol and class for Discount that has discountType and discountPercentage and a method to calculate discount.

protocol Discount {
    var discountType: String { get }
    var discountPercentage: Double { get }
    
    init(discountType: String, discountPercentage: Double)
    
    func calculateDiscount(totalAmount: Double) -> Double
}


class SeasonalDiscount: Discount {
    var discountType: String
    var discountPercentage: Double
    
    required init(discountType: String, discountPercentage: Double) {
        self.discountType = discountType
        self.discountPercentage = discountPercentage
    }
    
    func calculateDiscount(totalAmount: Double) -> Double {
        let totalAmountAfterDiscount: Double
        totalAmountAfterDiscount = totalAmount * ( 1 -  discountPercentage )
        return totalAmountAfterDiscount
    }
}

//: Assignment 12: Extension
//:
//: - Create an extension that rounds off the `totalDiscountedAmount`. Rounding to closest integer... using the logic described in the assignment sheet

extension Double {
    func roundNearest() -> Double {
        let intPart: Int = Int(self)
        let decimalPart: Double = self - Double(intPart)
        if decimalPart >= 0.5 {
            return Double(intPart) + 1.0
        } else {
            return Double(intPart)
        }
        // The block inside the extension could be replaced by:
        // return self.rounded()
    }
}


let christmas = SeasonalDiscount(discountType: "Christmas", discountPercentage: 0.15)

let discount1 = christmas.calculateDiscount(totalAmount: 100.45)
print("Your dish costs £\(discount1) after discount")
print("Rounded to £\(discount1.roundNearest())")

let discount2 = christmas.calculateDiscount(totalAmount: 100.67)
print("Your dish costs £\(discount2) after discount")
print("Rounded to £\(discount2.roundNearest())")

//: ## NICE TO HAVE
//:
//: Display a date or a string (preferably a long string) in a nice readable format using NSAttributedString.

func welcome(name: String) -> NSAttributedString {
    let jellyColour = UIColor(red: CGFloat(183)/CGFloat(255), green: CGFloat(43)/CGFloat(255), blue: CGFloat(211)/CGFloat(255), alpha: 1)

    let jellyShadow = NSShadow()
    jellyShadow.shadowColor = jellyColour
    jellyShadow.shadowBlurRadius = 5
    let attributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 20),
        .foregroundColor: UIColor.white,
        .shadow: jellyShadow
    ]
    let message = NSAttributedString(string: "Welcome to Jelly Belly \(name)!", attributes: attributes)
//    let message2 = NSAttributedString(string: "Ready to order?", attributes: attributes2)

    return message
}

func visitDate() -> NSAttributedString {
    let bellyColour = UIColor(red: CGFloat(31)/CGFloat(255), green: CGFloat(42)/CGFloat(255), blue: CGFloat(221)/CGFloat(255), alpha: 1)
    
    let bellyShadow = NSShadow()
    bellyShadow.shadowColor = bellyColour
    bellyShadow.shadowBlurRadius = 12
    let attributes2: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 18),
        .foregroundColor: UIColor.white,
        .shadow: bellyShadow
    ]
    
    let formattedToday = Date().formatted(
        .dateTime
            .day().month(.wide).year()
            .hour().minute()
    )
    
    let message = NSAttributedString(string: "Thanks for your visit on \(formattedToday)", attributes: attributes2)
    return message
    
}

welcome(name: "Jay")
visitDate()




//: [Next](@next)

