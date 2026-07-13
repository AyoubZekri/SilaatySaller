import 'package:Saller/view/screen/invoices/Shwoinvoice.dart';
import 'package:Saller/view/screen/invoices/invoicesconvict.dart';
import 'package:Saller/view/screen/Dashboard/Client.dart';
import 'package:Saller/view/screen/Dashboard/InvoicesallClient.dart';
import 'package:Saller/view/screen/Dashboard/Sale.dart';
import 'package:Saller/view/screen/NavigationBar.dart';
import 'package:Saller/view/screen/Prodact/AddProductSale.dart';
import 'package:Saller/view/screen/Prodact/Additem.dart';
import 'package:Saller/view/screen/Prodact/Payment.dart';
import 'package:Saller/view/screen/Prodact/edititem.dart';
import 'package:Saller/view/screen/Prodact/informationItem.dart';
import 'package:Saller/view/screen/Prodact/items.dart';
import 'package:Saller/view/screen/Profaile/Convicts.dart';
import 'package:Saller/view/screen/Profaile/Dealer.dart';
import 'package:Saller/view/screen/Profaile/necessary.dart';
import 'package:Saller/view/screen/Setteng/InformationAPP.dart';
import 'package:Saller/view/screen/Setteng/Privacypolicy.dart';
import 'package:Saller/view/screen/Setteng/Profail.dart';
import 'package:Saller/view/screen/categoris/Addcat.dart';
import 'package:Saller/view/screen/categoris/Editcat.dart';
import 'package:Saller/view/screen/categoris/ShwoCat.dart';
import 'package:Saller/view/screen/profailedata.dart';
import 'package:get/get.dart';
import 'package:Saller/core/constant/routes.dart';
import 'package:Saller/view/screen/Auth/login.dart';

import 'view/screen/Convict/AddConvict.dart';
import 'view/screen/Convict/EditConvict.dart';
import 'view/screen/Dealer/Adddealer.dart';
import 'view/screen/Dealer/Editdealer.dart';
import 'view/screen/SplashScreen.dart';
import 'view/screen/activationExpiredPage.dart';
import 'view/screen/UpgradeRequiredPage.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const SplashScreen()),
  //  name: "/",page: () => const Checkout()),
  GetPage(name: Approutes.Login, page: () => const Login()),
  GetPage(name: Approutes.splashScreen, page: () => const SplashScreen()),

  GetPage(name: Approutes.HomeScreen, page: () => const Homescreen()),
  GetPage(name: Approutes.informationitem, page: () => const Informationitem()),
  GetPage(name: Approutes.edititemcontroller, page: () => const Edititem()),
  GetPage(name: Approutes.Additem, page: () => const Additem()),
  GetPage(name: Approutes.item, page: () => const Items()),

  GetPage(name: Approutes.Informationapp, page: () => const Informationapp()),

  GetPage(name: Approutes.Privacypolicy, page: () => const Privacypolicy()),
  // GetPage(name: Approutes.Zakat, page: () => const Zakat()),
  GetPage(name: Approutes.Dealer, page: () => const Dealer()),
  GetPage(name: Approutes.Convicts, page: () => const Convicts()),
  GetPage(name: Approutes.AddDealer, page: () => const AddDealer()),
  GetPage(name: Approutes.EditDealer, page: () => const EditDealer()),

  GetPage(name: Approutes.AddConvict, page: () => const AddConvict()),
  GetPage(name: Approutes.EditConvict, page: () => const EditConvict()),
  GetPage(name: Approutes.invoice, page: () => const Invoices()),
  GetPage(name: Approutes.shwoinvoice, page: () => const Shwoinvoice()),
  GetPage(name: Approutes.shwocat, page: () => const Shwocat()),
  GetPage(name: Approutes.addcat, page: () => const Addcat()),
  GetPage(name: Approutes.editCat, page: () => const Editcat()),

  GetPage(name: Approutes.necessary, page: () => const Necessary()),


  GetPage(name: Approutes.invoicesall, page: () => const Invoicesall()),
  GetPage(name: Approutes.newSale, page: () => NewSale()),
  GetPage(name: Approutes.profail, page: () => Profail()),
  GetPage(name: Approutes.profailedata, page: () => Profailedata()),
  GetPage(name: Approutes.addProductSale, page: () => AddProductSale()),
  GetPage(name: Approutes.payment, page: () => Payment()),
  GetPage(name: Approutes.client, page: () => Client()),

  GetPage(
      name: Approutes.activationExpiredPage,
      page: () => const activationExpiredPage()),
  GetPage(
      name: Approutes.upgradeRequiredPage,
      page: () => const UpgradeRequiredPage()),
];
