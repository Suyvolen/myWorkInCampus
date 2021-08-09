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
    public partial class Register : Form
    {
        public Register()
        {
            InitializeComponent();
        }

        private void Form2_FormClosed(object sender, FormClosedEventArgs e)
        {
            
        }

        private void btn_Login_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            login.Show();
            this.Close();
        }

        private void btn_CommitClick(object sender, EventArgs e)
        {
            String name = textBox1.Text.Trim();
            String password = textBox2.Text.Trim();
            Int32 sex = sexChoose.SelectedIndex;
            Users register = new Users(name, password, sex);
            Dao dao = new Dao();
            if (dao.RegisterByName(register))
            {
                Login login = new Login();
                login.Show();
                this.Visible = false;
            }
            else
            {
                MessageBox.Show("用户名已被占用，请重新输入！");
            }
        }
    }
}
