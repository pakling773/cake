export interface ICakeItem {
  id?: string;
  name?: string;
  category_id?: string;
  shop_id?: string;
  price?: number;
  imageUrl?: string;
  images?: string[];
  flavour_id?: string;
  category?: ICakeCategory;
  photo?: string;
  description?: string;
  specification?: string;
  featured?: boolean;
  deleted?: boolean;
  tags?: string[];
}

export interface ICakeCategory {
  id?: string;
  name?: string;
  featured?: boolean;
  created?: ICreated;
}

export interface ICreated {
  seconds?: number;
  nanoseconds?: number;
}
export interface IFlavour {
  id?: string;
  name?: string;
  photo?: String;
  featured?: boolean;
  deleted?: boolean;
}

export interface ISlide {
  id?: string;
  name?: string;
  photo?: String;
  featured?: boolean;
  deleted?: boolean;
}

export interface IAddress {
  address?: string;
  latitude?: number;
  longitude?: number;
}

export interface IShop {
  id?: string;
  address1?: IAddress;
  address2?: string;
  logo?: string;
  name?: string;
  phone_number?: string;
  user_id?: string;
  deleted?: boolean;
  openingHour?: string;
  closingHour?: string;
}

export interface IUser {
  id?: string;
  phone?: string;
  email?: string;
  name?: string;
  uid?: string;
  deleted?: boolean;
}

/* ProductCategories
All Desserts
Jar Cakes
Pastries
Cheese Cakes
Cup Cakes
Brownies
Tea Cakes
Personalised Cupcakes
Personalised Jar Cakes
Gift Hampers

*/

/* Flavours

Chocolate  
Butterscotch  
Mango  
Pineapple  
Black Forest  
Strawberry  
Red Velvet  
Vanilla  
Fruit  
Blueberry  

*/

/*
Ocasions

Father's Day Cake
Independence Day Cakes
Rakhi Cakes
Ganesh Chaturthi
Christmas Cakes
New Year Cakes
Republic Day Cakes
Valentine Cakes
Holi Cakes

*/

/*
other categoryires

Bestsellers
Gourmet Cakes
Eggless Cakes
Pinata Cakes
Photo Cakes
Surprise Cakes
Cheese Cakes
Pull Me Up Cakes
Bomb Cakes
Half Cakes
Photo Pulling Cakes
Rose Cakes
Heart Shaped Cakes
All Cakes

*/

/*
Special Events
Birthday
Anniversary
Father's Day
Mother's Day
 Weddings
Graduations
Holidays
*/
export interface IOrders {
  cart?: ICart[];
  id?: any;
  order_summary?: IOrdersSummary;
  payment_info?: PaymentInfo;
  points?: any;
  shipping_info?: ShippingInfo;
  user_id?: string;
  user?: IUser;
  completed?: boolean;
}

export interface ICart {
  cake?: ICakeItem;
  id?: any;
  price?: number;
  quantity?: number;
  total?: number;
}

export interface IOrdersSummary {
  delivery_charge?: any;
  quantity?: number;
  subtotal?: any;
  total?: number;
}

export interface PaymentInfo {
  account_number?: string;
  mayment_method?: any;
}

export interface ShippingInfo {
  address_1?: string;
  address_2?: string;
  name?: string;
}
