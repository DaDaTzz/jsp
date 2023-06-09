package fraction;

/**
 * @author Da
 * @date 2023/6/9 21:38
 */
/**
 * 分数实体
 */
public class Fraction {
    private Double num;
    private Integer fenZi; // 分子
    private Integer fenMu; // 分母

    public void setNum(Double num) {
        this.num = num;
    }

    public Double getNum(){
        return num;
    }


    public String res(){
        String[] split = num.toString().split("\\.");
        fenZi = Integer.parseInt(split[0] + split[1]);
        fenMu = (int)Math.pow(10, split[1].length());

        int  gcd  =  1;  //  最大公约数
        int  minNum  =  Math.min(fenZi,  fenMu);
        for  (int  i  =  2;  i  <=  minNum;  i++)  {
            if  (fenZi  %  i  ==  0  &&  fenMu  %  i  ==  0)  {
                gcd  =  i;
            }
        }
        if  (gcd  !=  1)  {  //  说明有公共因子，可以约分
            fenZi  /=  gcd;
            fenMu  /=  gcd;
        }
        return fenZi + "/" + fenMu;
    }
}
