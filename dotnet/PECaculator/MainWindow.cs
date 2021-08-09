using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhysicalFitnessTest
{
    public partial class MainWindow : Form
    {
        public MainWindow()
        {
            InitializeComponent();
            label13.Visible = false;
            label14.Visible = false;
            label15.Visible = false;
            label16.Visible = false;
            label17.Visible = false;
            label18.Visible = false;
            label19.Visible = false;
        }

        private void TotalScoreCalculation(object sender, EventArgs e)
        {
            try
            {
                Data data = new Data(DateTime.Now, comboBox1.SelectedIndex, double.Parse(text_height.Text.Trim()), double.Parse(text_weight.Text.Trim()), Int32.Parse(text_vitalCapacity.Text.Trim()), double.Parse(text_sitAndReach.Text.Trim()), double.Parse(text_jump.Text.Trim()), double.Parse(text_shortRun.Text.Trim()), double.Parse(text_longRun.Text.Trim()), Int32.Parse(text_upper.Text.Trim()));
                text_totalScore.Text = data.Score.ToString();
                label13.Text = data.BMIScore().ToString();
                label14.Text = data.VitalCapacityScore().ToString();
                label15.Text = data.LongRunScore().ToString();
                label16.Text = data.ShortRunScore().ToString();
                label17.Text = data.StandingLeapScore().ToString();
                label18.Text = data.ChinningOrSitUpScore().ToString();
                label19.Text = data.SitAndReachScore().ToString();
            }
            catch (FormatException)
            {
                MessageBox.Show("输入必须且必须是数字，请重新输入");
            }
        }

        private void Guest_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Context.loginuser = null;
            Login login = new Login();
            login.Show();
            this.Visible = false;
        }

        private void btn_SaveClick(object sender, EventArgs e)
        {
            if (Context.loginuser == null)
            {
                MessageBox.Show("此功能请在登录后使用！");
                return;
            }
            try
            {
                Data data = new Data(Context.loginuser, DateTime.Now, double.Parse(text_totalScore.Text), double.Parse(text_height.Text.Trim()), double.Parse(text_weight.Text.Trim()), Int32.Parse(text_vitalCapacity.Text.Trim()), double.Parse(text_sitAndReach.Text.Trim()), double.Parse(text_jump.Text.Trim()), double.Parse(text_shortRun.Text.Trim()), double.Parse(text_longRun.Text.Trim()), Int32.Parse(text_upper.Text.Trim()));
                Dao dao = new Dao();
                dao.InsertByNameAndData(data);
                MessageBox.Show("保存成功");
            }
            catch (FormatException)
            {
                MessageBox.Show("输入必须且必须是数字，请重新输入");
            }
        }

        private void btn_LogClick(object sender, EventArgs e)
        {
            if (Context.loginuser == null)
            {
                MessageBox.Show("历史记录请在登录后查看！");
                return;
            }
            try
            {
                Showhistory showhistory = new Showhistory();
                showhistory.Show();
                this.Visible = false;
            }
            catch
            {
                MessageBox.Show("无历史记录");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (label13.Visible == true)
            {
                label13.Visible = false;
                label14.Visible = false;
                label15.Visible = false;
                label16.Visible = false;
                label17.Visible = false;
                label18.Visible = false;
                label19.Visible = false;
            }
            else
            {
                label13.Visible = true;
                label14.Visible = true;
                label15.Visible = true;
                label16.Visible = true;
                label17.Visible = true;
                label18.Visible = true;
                label19.Visible = true;
            }
        }
    }
}
