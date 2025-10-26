import 'package:get/get.dart';

import 'package:mementum/modules/chat_details/chat_model.dart';

class ChatDetailsController extends GetxController {
  late String img;
  late String name;
  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    img = args['image'];
    name = args['name'];
  }

  var msgs = [
    ChatModel(msg: "Hi", time: '2:30 AM', isme: true, img: ''),
    ChatModel(msg: "Hello", time: '2:30 AM', img: '', isme: false),
    ChatModel(msg: "How are you", time: '2:30 AM', img: '', isme: true),
    ChatModel(
      msg: "How is it been going ",
      time: '2:30 AM',
      img: '',
      isme: false,
    ),
    ChatModel(
      msg: "Everything is fine.What about you?",
      time: '2:30 AM',
      img: '',
      isme: true,
    ),
    ChatModel(
      msg: "All good .Wonna go for a drink?",
      time: '2:30 AM',
      img: '',
      isme: false,
    ),
    ChatModel(msg: "Why not ?", time: '2:30 AM', img: '', isme: true),
    ChatModel(
      msg: "Tonight sharp 9:00 PM.Don't be late!",
      time: '2:30 AM',
      img: '',
      isme: false,
    ),
    ChatModel(
      msg: "Sure.I will be there.Can't wait to catch up with you.",
      time: '2:30 AM',
      img: '',
      isme: true,
    ),
    ChatModel(
      msg: "Same here.Hope to spend the best hangout tonight",
      time: '2:30 AM',
      img: '',
      isme: false,
    ),
    ChatModel(
      msg: "Of course.It's gonna be the best.",
      time: '2:30 AM',
      img: '',
      isme: true,
    ),
    ChatModel(
      msg: "Alright see you then.Bye....",
      time: '2:30 AM',
      img: '',
      isme: false,
    ),
  ];
}
