using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowAppTest
{
    class Context
    {
        public static Users loginuser = null;
    }
    class Users
    {
        private String UserName;
        private String UserPassword;
        private int UserSex;

        public string Name { get => UserName; set => UserName = value; }
        public string Password { get => UserPassword; set => UserPassword = value; }
        public int Sex { get => UserSex; set => UserSex = value; }

        public Users(string userName, string userPassword, int userSex)
        {
            UserName = userName;
            UserPassword = userPassword;
            UserSex = userSex;
        }
        public Users()
        {
            UserName = null;
            UserPassword = null;
            UserSex = -1;
        }
    }
    public class Data
    {
        private String UserName;
        private DateTime SaveDate;
        private Int32 UserSex;
        private double SumScore;
        private double Height;
        private double Weight;
        private Int32 VitalCapacity;
        private double SitAndReach;
        private double StandingLeap;
        private double ShortRun;
        private double LongRun;
        private Int32 ChinningOrSitUp;
        static private double[] S = new double[21] { 0, 10, 20, 30, 40, 50, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 85, 90, 95, 100 };


        public Data()
        {

        }

        public Data(string userName, DateTime saveDate, double sumScore, double height, double weight, int vitalCapacity, double sitAndReach, double standingLeap, double shortRun, double longRun, int chinningOrSitUp)
        {
            UserName = userName;
            SaveDate = saveDate;
            SumScore = sumScore;
            Height = height;
            Weight = weight;
            VitalCapacity = vitalCapacity;
            SitAndReach = sitAndReach;
            StandingLeap = standingLeap;
            ShortRun = shortRun;
            LongRun = longRun;
            ChinningOrSitUp = chinningOrSitUp;
        }
        public Data(string userName, DateTime saveDate, int sex, double height, double weight, int vitalCapacity, double sitAndReach, double standingLeap, double shortRun, double longRun, int chinningOrSitUp)
        {
            UserName = userName;
            SaveDate = saveDate;
            UserSex = sex;
            Height = height;
            Weight = weight;
            VitalCapacity = vitalCapacity;
            SitAndReach = sitAndReach;
            StandingLeap = standingLeap;
            ShortRun = shortRun;
            LongRun = longRun;
            ChinningOrSitUp = chinningOrSitUp;
            SumScore = Calculate();
        }

        public Data(DateTime saveDate, int sex, double height, double weight, int vitalCapacity, double sitAndReach, double standingLeap, double shortRun, double longRun, int chinningOrSitUp)
        {
            SaveDate = saveDate;
            UserSex = sex;
            Height = height;
            Weight = weight;
            VitalCapacity = vitalCapacity;
            SitAndReach = sitAndReach;
            StandingLeap = standingLeap;
            ShortRun = shortRun;
            LongRun = longRun;
            ChinningOrSitUp = chinningOrSitUp;
            SumScore = Calculate();
        }
        private double Calculate()
        {
            double result = 0;
            result = BMIScore() * 0.15 + VitalCapacityScore() * 0.15 + SitAndReachScore() * 0.1 + StandingLeapScore() * 0.1 + ShortRunScore() * 0.2 + LongRunScore() * 0.2 + ChinningOrSitUpScore() * 0.1;
            return result;
        }
        //BMI得分
        public double BMIScore()
        {
            double result;
            double[] BMI = new double[3] { 17.8, 24, 28 };
            if (Sex == 1)
            {
                BMI = new double[3] { 17.2, 24, 28 };
            }
            double B = Weight / (Height * Height);
            if (B < BMI[0])
                result = 80;
            else if (B < BMI[1])
                result = 100;
            else if (B < BMI[2])
                result = 80;
            else
                result = 60;
            return result;
        }
        //肺活量得分
        public double VitalCapacityScore()
        {
            double result = 100;
            double[] V = new double[20] { 2350, 2520, 2690, 2860, 3030, 3200, 3320, 3440, 3560, 3680, 3800, 3920, 4040, 4160, 4280, 4040, 4650, 4900, 5020, 5140 };
            if (Sex == 1)
            {
                V = new double[20] { 1850, 1890, 1930, 1970, 2010, 2050, 2150, 2250, 2350, 2450, 2550, 2650, 2750, 2850, 2950, 3050, 3200, 3350, 3400, 3450 };
            }
            for (int i = 0; i < V.Length; i++)
                if (VitalCapacity < V[i])
                { result = S[i]; break; }
            return result;
        }

        //坐位体前屈得分
        public double SitAndReachScore()
        {
            double result = 100;
            double[] SP = new double[20] { -0.8, 0.2, 1.2, 2.2, 3.2, 4.2, 5.6, 7, 8.4, 9.8, 11.2, 12.6, 14, 15.4, 16.8, 18.2, 19.9, 21.5, 23.3, 25.1 };
            if (Sex == 1)
            {
                SP = new double[20] { 2.5, 3.3, 4.1, 4.9, 5.7, 6.5, 7.8, 9.1, 10.4, 11.7, 13, 14.3, 15.6, 16.9, 18.2, 19.5, 21, 22.4, 24.4, 26.3 };
            }
            for (int i = 0; i < SP.Length; i++)
                if (SitAndReach < SP[i])
                { result = S[i]; break; }
            return result;
        }
        //立定跳远得分
        public double StandingLeapScore()
        {
            double result = 100;
            double[] JP = new double[20] { 185, 190, 195, 200, 205, 210, 214, 218, 222, 226, 230, 234, 238, 242, 246, 250, 258, 265, 270, 275 };
            if (Sex == 1)
            {
                JP = new double[20] { 127, 132, 137, 142, 147, 152, 155, 158, 161, 164, 167, 170, 173, 176, 179, 182, 189, 196, 202, 208 };
            }
            for (int i = 0; i < JP.Length; i++)
                if (StandingLeap < JP[i])
                { result = S[i]; break; }
            return result;
        }
        //引体向上或仰卧起坐得分
        public double ChinningOrSitUpScore()
        {
            double result = 100;
            double[] UP = new double[20] { 6, 7, 8, 9, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 17, 18, 19, 20 };
            if (Sex == 1)
            {
                UP = new double[20] { 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 50, 53, 55, 57 };
            }
            for (int i = 0; i < UP.Length; i++)
                if (ChinningOrSitUp < UP[i])
                { result = S[i]; break; }
            return result;
        }
        //50米
        public double ShortRunScore()
        {
            double result = 100;

            double[] SR = new double[20] { 10, 9.8, 9.6, 9.4, 9.2, 9.0, 8.8, 8.6, 8.4, 8.2, 8.0, 7.8, 7.6, 7.4, 7.2, 7.0, 6.9, 6.8, 6.7, 6.6 };
            if (Sex == 1)
            {
                SR = new double[20] { 11.2, 11, 10.8, 10.6, 10.4, 10.2, 10, 9.8, 9.6, 9.4, 9.2, 9, 8.8, 8.6, 8.4, 8.2, 7.9, 7.6, 7.5, 7.4 };
            }
            for (int i = 0; i < SR.Length; i++)
                if (ShortRun > SR[i])
                { result = S[i]; break; }
            return result;
        }

        //1000米
        public double LongRunScore()
        {
            double result = 100;

            double[] LR = new double[20] { 370, 350, 330, 310, 290, 270, 265, 260, 255, 250, 245, 240, 235, 230, 225, 220, 212, 205, 200, 109 };
            if (Sex == 1)
            {
                LR = new double[20] { 322, 312, 302, 292, 282, 272, 267, 262, 257, 252, 247, 242, 237, 232, 227, 222, 215, 208, 202, 196 };
            }
            for (int i = 0; i < LR.Length; i++)
                if (LongRun > LR[i])
                { result = S[i]; break; }
            return result;
        }
        public string Name { get => UserName; set => UserName = value; }
        public DateTime Date { get => SaveDate; set => SaveDate = value; }
        public double Score { get => SumScore; set => SumScore = value; }
        public double H { get => Height; set => Height = value; }
        public double W { get => Weight; set => Weight = value; }
        public int VC { get => VitalCapacity; set => VitalCapacity = value; }//肺活量
        public double SAndR { get => SitAndReach; set => SitAndReach = value; }//坐位体前屈
        public double SLeap { get => StandingLeap; set => StandingLeap = value; }//立定跳远
        public double SRun { get => ShortRun; set => ShortRun = value; }//短跑
        public double LRun { get => LongRun; set => LongRun = value; }//长跑
        public int COrSU { get => ChinningOrSitUp; set => ChinningOrSitUp = value; }//引体向上或仰卧起坐
        public int Sex { get => UserSex; set => UserSex = value; }
    }
}
