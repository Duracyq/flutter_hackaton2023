// import "dart:convert";
// import "package:http/http.dart" as http;
// import "package:flutter/foundation.dart";


// class Api {
//     static const baseUrl = 'http://127.0.0.1/api/'
//     static getProduct() async {
//         try {
//             final res = await http.get(Uri.parse('${baseUrl}+/read'));
            

//             var data = jsonDecode(res.body);
//             print(data);
//         }
//         catch (err) {
//             print(err);
//         }
//     }
// }

// Api.getProduct();