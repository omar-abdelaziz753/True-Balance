class EndPoints {
  /// BaseUrl
  static const String baseUrl = 'https://powerline-app.vercel.app/';

  /// Auth
  static const String login = 'hr/login';
  static const String checkInEP = 'employee/checkIn';
  static const String checkOutEP = 'employee/checkOut';
  static const String makeStationCleanerEp = 'task/cleaningJobTask';
  static const String getAllPumpsEp = 'station/getPumps';
  static const String getPumpTypesEp = 'station/getPumpTypes';
  static const String makeInventoryJobTaskEp = 'task/inventoryJobTask';
  static const String getAllProfileDataEP = 'employee/profile';
  static const String logout = 'hr/logout';
  static const String getTasks = 'todo/getAllTasks';
  static const String changeTaskStatusEP = 'todo/changeStatus';
  static const String supplierRequest = 'supplier/supplierRequest';
  static const String reviewRequest = 'supplier/reviewRequest';
  static const String getContacts = 'contact/getContacts';
  static String getMessagesDetails(String messageId) => 'message/getMessages/$messageId';
  static String supplies(String status, {int page = 1}) => 'supplier/getStaSupplierReq?status=$status&page=$page';


  /// Home
  static const String getAllOffers = 'general/getOffer';
  static const String getAllCompletedUsersInProvider = 'provider/getProviderRequests?status=Accepted';
  static const String getCategoriesInHome = 'general/getCategoriesInHome';
  static String getAllReviews(String providerId) => 'user/getReviews/$providerId';
  static const String getFeaturedServices = 'general/getFeaturedServices';
  static const String makeOrder = 'user/createBooking';

  /// Search
  static const String search = 'general/getAllServices';

  /// Categories
  static const String getAllCategories = 'general/getAllCategories';
  static String getAllSubCategoriesByCategoryId (String categoryId) => 'general/getSubcategoriesByCategory/$categoryId';
  static const String customizeScreen = 'user/customizationScreen';
  static String getAllServicesByCategoryIdAndSubCategoryId(String categoryId, String subCategoryId) => 'general/getServicesByCategory/$categoryId/$subCategoryId';
  static const  String userMakeOrderByCategoryIdAndSubCategoryId ='user/createServiceRequest';

  /// Orders
  static String userGetAllOrders(String status) => 'user/viewBookings?status=$status';

  /// Customer Orders
  static String userGetAllCustomerOrders(String status) => 'provider/viewProviderBookings?status=$status';
  static const String makeChangeStatus = 'provider/changeStatus';
  static const String completeOrder = 'provider/completeBooking';

  /// Reservation
  static const String userGetAllReservations = 'user/viewRequestService';
  static const String userChooseProvider = 'user/getAndChooseProvider';
  static String userAskedProvidersByReservationId(String reservationId) => 'user/askedProviders/$reservationId';
  static String userGetReservationDetails(String reservationId) => 'user/viewSPRequestService/$reservationId';

  /// Profile
  static const String getProfileDetails = 'user/accountProfile';
  static const String updateProfileDetails = 'user/updateAccount';
  static const String updatePassword = 'user/changePassword';
  static const String deleteAccount = 'user/deleteUser';
  static const String aboutCompany = 'general/getAbout';
  static const String addProblem = 'general/addProblem';
  static const String contactMethods = 'general/getContactMethods';
  static const String getAllProviderServices = 'provider/getProviderServices';
  static const String addProviderService = 'provider/createService';

  /// Addresses
  static const String userGetAllAddresses = 'general/getAddresses';
  static const String userAddAddress = 'user/addAddress';
  static const String userGetCities = 'general/getCities';
  static String userGetZones(String cityId) => 'general/getZones/$cityId';
  static String userUpdateAddress(String addressId) => 'user/updateAddress/$addressId';
  static String userDeleteAddress(String addressId) => 'user/deleteAddress/$addressId';

  /// Favorite
  static const String userGetAllFavorite = 'user/accountFavorites';
  static String userAddFavorite(String serviceId) => 'user/toggleFavorite/$serviceId';


  static const String showAllBanners = 'api/frontend/sliders';
  static const String searchforproduct = 'api/frontend/products/filter';
  static const String getVariationFilter =
      'api/frontend/products/filter/attributes';
  static const String getBestSeller = 'api/frontend/products/bestSeller';
  static const String getBestOffers = 'api/frontend/products/bestOffers';
  static const String getDeliveredOrders = 'api/frontend/orders/delivered';
  static const String getCanceledOrders = 'api/frontend/orders/canceled';
  static const String getProgressOrders = 'api/frontend/orders/progress';
  static String showProductDetails(int productId) =>
      'api/frontend/products/show/$productId';
  static String getProductReviews(int productId) =>
      'api/frontend/rates/getProductRates/$productId';
  static const String makeRateToProduct = 'api/frontend/rates/rateProduct';

  /// Category
  static String getProductsByCategory(int brandId) =>
      'api/frontend/categories/fetchProducts/$brandId';
  static String getChildrenCategories(int mainCategoryId) =>
      'api/frontend/categories/children/$mainCategoryId';

  /// Cart
  static const String addToCart = 'api/frontend/cart/product/add';
  static const String applyCoupon = 'api/frontend/coupon/apply';
  static const String removeCoupon = 'api/frontend/coupon/remove';
  static const String removeFromCart = 'api/frontend/cart/product/delete';
  static const String plusIncrementCart =
      'api/frontend/cart/product/plusQuantity';
  static const String minusIncrementCart =
      'api/frontend/cart/product/minusQuantity';
  static const String getCartDetails = 'api/frontend/cart/invoice';
  static const String getCart = 'api/frontend/cart/details';
  static const String removeAllCartItems = 'api/frontend/cart/clearCart';
  static const String addOrder = 'api/frontend/orders/make';

  /// Brands
  static const String getAllBrands = 'api/frontend/brands/homepage';
  static const String makeRateBrand = 'api/frontend/rates/rateBrand';
  static String getBrandsByCategory(int categoryId) =>
      'api/frontend/categories/fetchBrands/$categoryId';

  /// Profile
  static const String updateProfile = 'api/user/profile/updateData';
  static const String getAllAddresses = 'api/frontend/addresses';
  static const String addAddress = 'api/frontend/addresses/add';
  static String editAddress(int addressId) =>
      'api/frontend/addresses/add/$addressId';
  static String deleteAddress(int addressId) =>
      'api/frontend/addresses/delete/$addressId';
  static String getSimilarProducts(int productId) =>
      'api/frontend/products/getProductSimilarProductsPaginated/$productId';
  static String getProductsByBrands(int brandId) =>
      'api/frontend/brands/fetchProducts/$brandId';
  static const String getFavorite = 'api/frontend/products/favourites';

  static String showOrderDetails(int addressId) =>
      'api/frontend/orders/details/$addressId';

  static const String createTicket = 'api/frontend/userTicket/create';
  static const String getAllTickets = 'api/frontend/userTicket/list';
  static const String sendMessage = 'api/frontend/userTicket/createMessage';
  static String getSpecificTicket(int ticketId) =>
      'api/frontend/userTicket/show/$ticketId';
  static String getSettings(String title) => 'api/frontend/staticPages/$title';
}
