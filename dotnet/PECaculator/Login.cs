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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void btn_Register_Click(object sender, EventArgs e)
        {
            Register reg = new Register();
            reg.Show();
            this.Visible = false;
        }

        private void btn_Login_Click(object sender, EventArgs e)
        {
            String name = textBox1.Text.Trim();
            String password = textBox2.Text.Trim();
            Users login=new Users(name, password, 0);
            Dao dao= new Dao();
            Users user = dao.FindByName(login);
            if (user != null)
            {
                Context.loginuser= user;
                MainWindow guest = new MainWindow();
                guest.Show();
                this.Visible = false;
            }
            else
            {
                MessageBox.Show("用户名或密码错误，请重新输入！");
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void btn_Guest_Click(object sender, EventArgs e)
        {
            MainWindow guest = new MainWindow();
            guest.Show();
            this.Visible = false;
        }

    }
}
