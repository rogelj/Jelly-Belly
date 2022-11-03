////
////  DiscountGridView.swift
////  Jelly Belly
////
////  Created by J Rogel PhD on 16/09/2022.
////
//
//import SwiftUI
//
//struct DiscountGridView: View {m
//
//    var downloader: MenuItems
//
////    @State var menuDishes = dishes
//    @ObservedObject var orderCaretaker: OrderCaretaker
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    BigText(text: "Jelly Belly Discounts")
//                        .padding()
//                    Spacer()
//                    RoundLogoView(imageSize: Constants.Logo.logoViewSizeTiny )
//                        .padding()
//
//                }
//                ScrollView {
//                    ScrollViewReader { scrollProxy in
//                        LazyVGrid(
//                            columns: [.init(.adaptive(minimum: 150))]
//                        ) {
//                            ForEach(DishParts.MealCategory.allCases, id: \.self) { category in
//                                Section(header: MenuHeaderView(title: category.rawValue)) {
//                                    ForEach(self.getDiscountDishes(by: category)) { dish in
//                                        NavigationLink(destination: MenuDetailedView(dish: dish, orderCaretaker: orderCaretaker)) {
//                                            DishImage(dishName: dish.name)
//                                                .padding(.leading)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    func getDiscountDishes(by mealCategory: DishParts.MealCategory) -> [Dish] {
//        downloader.myMenuDishes.filter { dish in
//            dish.mealCategory == mealCategory && dish.discountable == true
//        }
//    }
//}
//
//struct DishImage: View {
//    var dishName: String
//
//    var body: some View {
//        VStack{
//            GeometryReader { proxy in
//                ZStack(alignment: .topTrailing) {
//                    DishCircle(dishName: dishName)
//                    Image(systemName: "exclamationmark.bubble.fill")
//                        .font(.largeTitle)
//                        .foregroundColor(Color("Belly"))
//                        .background(Color.white.opacity(0.1))
//                        .frame(width: proxy.size.width / 4, height: proxy.size.height / 5)
//                        .padding(proxy.size.width / 30)
//                }
//            }
//            .frame(width: 100, height: 100)
//            Text(dishName)
//                .font(.body)
//                .foregroundColor(Color("Belly"))
//        }
//    }
//}
//
//struct DiscountGridView_Previews: PreviewProvider {
//    static private var downloader = MenuItems()
//    static private var orderCaretaker = OrderCaretaker()
//
//    static var previews: some View {
//        DiscountGridView(downloader: downloader, orderCaretaker: orderCaretaker)
//        DiscountGridView(downloader: downloader, orderCaretaker: orderCaretaker)
//            .preferredColorScheme(.dark)
//    }
//}
