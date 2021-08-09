using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowAppTest
{
    public partial class Guest : Form
    {
        public Guest()
        {
            InitializeComponent();
        }

        private void TotalScoreCalculation(object sender, EventArgs e)
        {

            try
            {
                Data data = new Data(Context.loginuser.Name, DateTime.Now, Context.loginuser.Sex, double.Parse(text_height.Text.Trim()), double.Parse(text_weight.Text.Trim()), Int32.Parse(text_vitalCapacity.Text.Trim()), double.Parse(text_sitAndReach.Text.Trim()), double.Parse(text_jump.Text.Trim()), double.Parse(text_shortRun.Text.Trim()), double.Parse(text_longRun.Text.Trim()), Int32.Parse(text_upper.Text.Trim()));
                text_totalScore.Text = data.Score.ToString();
                /*Dao dao = new Dao();
                dao.InsertByNameAndData(data);*/
            }
            catch (FormatException)
            {
                MessageBox.Show("必须为数字,请重新输入！");
            }
            catch (NullReferenceException )
            {
                MessageBox.Show("不能为空,请重新输入！");
            }

        }

        private void Guest_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            login.Show();
            this.Visible = false;
        }
    }
}
