import 'package:flutter/material.dart';

class Politic extends StatelessWidget {
  final TextStyle titleStyle =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
  final TextStyle textStyle = new TextStyle();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: new AppBar(
            title: new Text("Politic"),
          ),
          body: new Material(
            color: const Color(0x25524222),
            child: new SingleChildScrollView(
                child: new Padding(
                    padding: EdgeInsets.all(16.0),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Image(
                              width: MediaQuery.of(context).size.width,
                              image: new AssetImage("assets/dressme.png")),
                          createNewTitleWidget(_confidencePoliticTitle),
                          createNewTitleWidget(_confidencePoliticTitle1),
                          createNewTextWidget(_confidencePolitic1),
                          createNewTitleWidget(_confidencePoliticTitle2),
                          createNewTextWidget(_confidencePolitic2),
                          createNewTitleWidget(_confidencePoliticTitle3),
                          createNewTextWidget(_confidencePolitic3),
                          createNewTitleWidget(_confidencePoliticTitle4),
                          createNewTextWidget(_confidencePolitic4),
                          createNewTitleWidget(_confidencePoliticTitle5),
                          createNewTextWidget(_confidencePolitic5),
                          createNewTitleWidget(_confidencePoliticTitle6),
                          createNewTextWidget(_confidencePolitic6),
                          createNewTitleWidget(_confidencePoliticTitle7),
                          createNewTextWidget(_confidencePolitic7),
                        ]))),
          ),
    );
  }

  Widget createNewTextWidget(String text) {
    return new Text(
      text,
      style: textStyle,
      textAlign: TextAlign.left,
    );
  }

  Widget createNewTitleWidget(String title) {
    return new Text(
      title,
      style: titleStyle,
      textAlign: TextAlign.left,
    );
  }

  final String _confidencePoliticTitle =
      "\nПОЛИТИКА КОНФИДЕНЦИАЛЬНОСТИ\n01/09/2018";
  final String _confidencePoliticTitle1 = "\n1.ОБЩИЕ СВЕДЕНИЯ";
  final String _confidencePolitic1 =
      "\nПриложения DressMe(далее —приложение) поможет вам познакомиться с последними новинками фэшн ритейла. Вы сможете найти ближайший к Вам магазин и уточнить наличие и цену, а при желании и отложить для дальнейшей покупки, понравившуюся Вам вещь.Текст настоящей Политики конфиденциальности (далее — Политика) доступен в сети интернет по данной ссылке.";
  final String _confidencePoliticTitle2 = "\n2.УСЛОВИЯ ИСПОЛЬЗОВАНИЯ";
  final String _confidencePolitic2 =
      "\nПри скачивании, установке приложения, Вы в полном объеме принимаете условия настоящей Политики и выражаете свое добровольное согласие на обработку Ваших данных способом и в целях как это описано в настоящей Политике. Если Вы не согласны с настоящей Политикой, пожалуйста, откажитесь от загрузки мобильных приложений.Политика подлежит постоянным изменениям и дополнениям без предварительного письменного уведомления пользователей. Вам необходимо периодически знакомиться с актуальной версией Политики, на предмет внесенных в нее изменений и/или дополнений. Если Вы продолжаете пользоваться Приложением, Вы подтверждаете свое согласие с новой редакцией Политики.";
  final String _confidencePoliticTitle3 =
      "\n3.ЦЕЛИ СБОРА И ОБРАБОТКИ ДАННЫХ ПОЛЬЗОВАТЕЛЕЙ";
  final String _confidencePolitic3 =
      "\nПриложение собирает и обрабатывает Ваши данных, для последующего анализа функционирования приложения, улучшения его удобного, быстрого и безопасного использования.Приложение собирает и обрабатывает следующие данные:gps-данные о месте нахождения Вашего мобильного устройства;информацию и сведения, переданные Вами через форму обратной связи и иные каналы коммуникации (email, телефоны и др.).";
  final String _confidencePoliticTitle4 =
      "\n4.ИСПОЛЬЗОВАНИЕ, РАСПРОСТРАНЕНИЕ И ПЕРЕДАЧА ВАШИХ ДАННЫХ";
  final String _confidencePolitic4 =
      "\nСобранные, при Вашей работе с приложением, данные могут записываться, систематизироваться, храниться, модифицироваться и обрабатываться для улучшения и развития приложения.В случаем, когда это требуется для защиты прав и свобод человека и гражданина, Ваши данные могут быть переданы третьим лицам, включая партнеров, а также государственные органы и органы международной защиты прав человека.Настоящим Вы выражаете свое добровольное согласие, что Ваши данные могут быть предоставлены третьим лицам в следующих случаях:когда это необходимо с целью соблюдения законодательства;в случаях, когда это необходимо для защиты прав человека и основных свобод.";
  final String _confidencePoliticTitle5 = "\n5.ХРАНЕНИЕ ДАННЫХ";
  final String _confidencePolitic5 =
      "\nДанное согласие может быть расторгнуто по заявлению, направленного в соответствии с процедурой описанной в разделе «Контакты». В случаи отсутствия заявления о расторжении, согласие действует на протяжении всего срока использования Приложения.Собранные ранее данные, могут быть удалены по факту получения соответствующего обращения.";
  final String _confidencePoliticTitle6 = "\n6.ИНЫЕ ОБЯЗАННОСТИ СТОРОН";
  final String _confidencePolitic6 =
      "\nВы являетесь ответственным за полноту и достоверность предоставляемых Вами данных. В случае наличия несоответствий и/или некорректности в предоставленных Вами данных, они должны быть изменены  путем направления запроса, как это указано в разделе «Контакты».В случае удаления и/или изменении по запросу Ваших данных, те данные, которые необходимы для целей соблюдения применимого законодательства, обеспечения безопасности и эффективности Приложения, могут быть сохранены.В случае Вашего обращения могут потребоваться дополнительные данные, необходимые для рассмотрения соответствующего запроса. При непредставлении таких данных рассмотрение запроса может быть не осуществлено.";
  final String _confidencePoliticTitle7 = "\n7.КОНТАКТЫ";
  final String _confidencePolitic7 =
      "\nПри возникновении вопросов касательно настоящей Политики или обработки и использования Ваших данных в связи с использованием Приложения Вы можете обратиться по электронной почте: lofesdev@gmail.com. Ваш запрос обязательно должен включать имя, фамилию, контактные данные для связи, а также иную информацию, необходимую для всестороннего и полного рассмотрения Вашего запроса.";
}
