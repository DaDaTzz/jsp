package new_memorytest;

import java.util.Random;
/**
 * @author Da
 * @date 2023/6/9 21:34
 */
public class Memory {
    private String[] elements = {"✰","❤","♣","❋","★","◍","▲","✳"}; // 初始化元素
    private String grade = ""; // 等级
    private String answer = ""; // 随机生成的一组图案
    private String[] names = {}; // 前端提交的name


    public String[] getElements() {
        return elements;
    }

    public void setGrade(String grade){
        this.grade = grade;
    }

    public String getGrade() {
        return grade;
    }

    /**
     * 根据等级随机生成图案
     */
    public void setAnswer(){
        if(grade != ""){
            Random random = new Random();

            if(answer != ""){
                answer = "";
            }

            if("s".equals(grade)){
                for(int i = 0; i < 4; i++){
                    // 以随机数作为 elements 数组的下标，生成一组图案。
                    answer += elements[random.nextInt(elements.length)]; // 将随机生成的这组图案拼接成字符串
                }
            }else if("ss".equals(grade)){
                for(int i = 0; i < 8; i++){
                    answer += elements[random.nextInt(elements.length)];
                }
            }else if("sss".equals(grade)){
                for(int i = 0; i < 15; i++){
                    answer += elements[random.nextInt(elements.length)];
                }
            }
        }
    }

    public String getAnswer() {
        return answer;
    }

    /**
     * 根据答案的长度生成names
     */
    public void setNames(){
        if(answer != ""){
            names = new String[answer.length()]; // 初始化数组长度

            if(names[0] != null){
                names = null;
            }

            for(int i = 0; i < answer.length(); i++){
                names[i] = "chose" + (i+1);
            }
        }
    }

    public String[] getNames() {
        return names;
    }

}

