using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;
namespace WindowAppTest
{
    public partial class Showhistory : Form
    {
        public Showhistory()
        {
            InitializeComponent();
            c();
        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }
        private void c()
        {
            var chart = chart1.ChartAreas[0];
            chart.AxisX.LabelStyle.Format = "yyyy-MM-dd";
            chart.AxisY.LabelStyle.IsEndLabelVisible = true;
            Users user = new Users(Context.loginuser.Name, Context.loginuser.Password, Context.loginuser.Sex);
            Dao dao = new Dao();
            Data[] data = dao.FindDataByName(user);
            double min = 100;
            double max = 0;
            foreach (Data i in data)
            {
                if (i.Score > max) max = i.Score;
                if (i.Score < min) min = i.Score;
            }
            if (max + 10 > 100) max = 100;
            else
                max = ((int)(max + 10) / 10) * 10;
            if (min - 10 < 0) min = 0;
            else
                min = ((int)(min - 10) / 10) * 10;

            chart.AxisY.Minimum = min;
            chart.AxisY.Maximum = max;
            chart.AxisY.Interval = 10;
            chart.AxisX.IntervalType = DateTimeIntervalType.Months;
            chart.AxisX.Interval = 6;

            chart.AxisX.Title = "时间";
            chart.AxisY.Title = "分数";
            chart.AxisY.MajorGrid.LineColor = Color.LightGray;
            chart.AxisX.MajorGrid.LineColor = Color.LightGray;
            //绘制折线图
            chart1.Series.Add("分数");
            chart1.Series["分数"].ChartType = SeriesChartType.Line;
            chart1.Series["分数"].MarkerBorderColor = Color.Blue;
            chart1.Series["分数"].MarkerBorderWidth = 3;
            chart1.Series["分数"].MarkerColor = Color.White;
            chart1.Series["分数"].MarkerStyle = MarkerStyle.Square;
            chart1.Series["分数"].Color = Color.Red;
            this.chart1.Legends.Add("分数");
            chart1.Series["分数"].IsVisibleInLegend = true;
            chart1.Series["分数"].Label = "#VALX" + "\n" + "#VAL";
            foreach (Data i in data)
            {
                chart1.Series["分数"].Points.AddXY(i.Date, i.Score);
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Close();
        }
    }
}
