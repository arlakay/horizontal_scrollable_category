
class FontSizeAutomation{

  static double  fontSizeConfig(double height,double fontSizeInput){
      if(height < 750){
      return height * fontSizeInput/666 - 0.95;
      }else if (height > 750 && height < 1000){
        return height * fontSizeInput/666 - 3.8;
      }else if (height >= 1000){
        return height * fontSizeInput/666;
      }



  }


}