import 'dart:math';



class Calculate {

  Calculate({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI()
  {
    _bmi = (weight)/pow(height, 2);
    _bmi = _bmi*10000;
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if(_bmi >= 25)
      {
        return 'คุณน้ำหนักเกิน';
      }
    else if(_bmi >18.5 && _bmi <24.9)
      {
        return 'สมส่วน';
      }
    else {
      return 'คุณน้ำหนักต่ำกว่าเกณฑ์';
    }
  }

  String getReview () {
    if(_bmi >= 25)
    {
      return 'คุณน้ำหนักเกิน อยู่ในเกณฑ์อ้วน มีความเสี่ยงต่อโรคที่มากับความอ้วน เช่น โรคเบาหวาน ความดันสูง ควรออกกำลังกาย และ คุมอาหารควบคู่';
    }
    else if(_bmi >18.5)
    {
      return 'คุณน้ำหนักปกติ โอกาสเกิดโรคที่มาจากความอ้วนน้อย ควรรักษาระดับค่า BMI ให้อยยู่ในระดับนี้';
    }
    else {
      return 'น้ำหนักน้อยกว่าปกติก็ไม่ค่อยดี หากคุณสูงมากแต่น้ำหนักน้อยเกินไป อาจเสี่ยงต่อการได้รับสารอาหารไม่เพียงพอ';
    }
  }


}