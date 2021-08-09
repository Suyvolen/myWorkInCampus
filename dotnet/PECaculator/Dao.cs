using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
namespace PhysicalFitnessTest
{
    class Dao
    {
        private string connStr = "Data Source=.;Initial Catalog=PhysicalFitnessTest;Integrated Security=True"; //数据库连接字符串,.表示本机服务器DataBase为表名,Integrated Security=True是采用windows身份验证方式登录
        private SqlConnection conn = null;
        public Dao()
        {
            this.conn = new SqlConnection(connStr); //根据连接字符串,新建数据库连接

        }
        public Users FindByNameAndPass(Users user)//根据用户名和密码查对象
        {
            Users result = null;
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * from Users where UserName='" + user.Name + "'and UserPassword  = '" + user.Password + "'";
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            SqlDataAdapter dbAdapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dbAdapter.Fill(ds);
            if (ds.Tables.Count != 0 && ds.Tables[0].Rows.Count != 0)
            {
                result = new Users();
                result.Name = (String)ds.Tables[0].Rows[0][0];
                result.Password = (String)ds.Tables[0].Rows[0][1];
                result.Sex = (Int32)ds.Tables[0].Rows[0][2];
            }
            conn.Close();
            return result;
        }
        public Boolean RegisterByName(Users user)
        {
            if (FindByNameAndPass(user) != null)
            {
                return false;
            }
            else
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "INSERT INTO Users(UserName,UserPassword,UserSex) values('" + user.Name + "','" + user.Password + "','" + user.Sex + "')";
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                }
                catch (System.Data.SqlClient.SqlException E)
                {
                    conn.Close();
                    return false;
                }

            }
            conn.Close();
            return true;
        }
        public Boolean InsertByNameAndData(Data data)
        {
            if (FindByNameAndData(data) == true)
            {
                DeleteByNameAndData(data);

            }
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "INSERT INTO Data(UserName,SaveDate,SumScore,Height,Weight,VitalCapacity,SitAndReach,StandingLeap,ShortRun,LongRun,ChinningOrSitUp) " +
                    "values('" + data.UserInfprmation.Name + "','" + data.Date + "','" + data.Score + "','" + data.H + "','" + data.W + "','" + data.VC +
                    "','" + data.SAndR + "','" + data.SLeap + "','" + data.SRun + "','" + data.LRun + "','" + data.COrSU + "')";
                cmd.Connection = conn;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException E)
            {
                conn.Close();
                return false;
            }
            conn.Close();
            return true;
        }

        public Boolean FindByNameAndData(Data data)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * from Data where UserName='" + data.UserInfprmation.Name + "'and SaveDate  = '" + data.Date + "'";
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            SqlDataAdapter dbAdapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dbAdapter.Fill(ds);
            if (ds == null)
            {
                conn.Close();
                return false;
            }
            conn.Close();
            return true;
        }
        public Boolean DeleteByNameAndData(Data data)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Delete  from Data where UserName='" + data.UserInfprmation.Name + "'and  SaveDate = '" + data.Date + "'";
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            conn.Close();
            return true;
        }

        public Data[] FindDataByName(Users user)
        {
            conn.Open();
            Data[] datas = null;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * from Data where UserName='" + user.Name + "'";
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            SqlDataAdapter dbAdapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dbAdapter.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables.Count != 0 && ds.Tables[0].Rows.Count != 0)
            {
                datas = new Data[count];
                for (int i = 0; i < count; i++)
                    datas[i] = new Data((String)ds.Tables[0].Rows[i][0], (DateTime)ds.Tables[0].Rows[i][1], (double)ds.Tables[0].Rows[i][2], (double)ds.Tables[0].Rows[i][3], (double)ds.Tables[0].Rows[i][4], (Int32)ds.Tables[0].Rows[i][5], (double)ds.Tables[0].Rows[i][6], (double)ds.Tables[0].Rows[i][7], (double)ds.Tables[0].Rows[i][8], (double)ds.Tables[0].Rows[i][9], (Int32)ds.Tables[0].Rows[i][10]);
            }
            conn.Close();
            return datas;
        }

    }
}

