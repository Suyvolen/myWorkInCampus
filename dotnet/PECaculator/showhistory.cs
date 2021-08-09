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
namespace PhysicalFitnessTest
{
    public partial class Showhistory : Form
    {
        private Data[] data=null;
        public Showhistory()
        {
            InitializeComponent();
            this.panel1.Visible = false;
            c();
        }

        private void c()
        {
            chart1.GetToolTipText += new EventHandler<ToolTipEventArgs>(chart1_GetToolTipText);
            var chart = chart1.ChartAreas[0];
            chart.AxisX.LabelStyle.Format = "yyyy-MM-dd";
            chart.AxisY.LabelStyle.IsEndLabelVisible = true;
            Users user = new Users(Context.loginuser.Name, Context.loginuser.Password, Context.loginuser.Sex);
            Dao dao = new Dao();
            data = dao.FindDataByName(user);
            if (data == null)
            {
                this.Close();
            }
            else
            {
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
        }
        private void chart1_GetToolTipText(object sender, ToolTipEventArgs e)
        {
            if (e.HitTestResult.ChartElementType == ChartElementType.DataPoint)
            {
                Data p = data[e.HitTestResult.PointIndex];
                this.dataGridView1.Rows.Clear();
                dataGridView1.Columns[0].HeaderText = "成绩";
                dataGridView1.Columns[1].HeaderText = "得分";
                dataGridView1.Rows.Add(p.Date);
                dataGridView1.Rows.Add(p.Score);
                dataGridView1.Rows.Add(p.H);
                dataGridView1.Rows.Add(p.W, p.BMIScore());
                dataGridView1.Rows.Add(p.VC, p.VitalCapacityScore());
                dataGridView1.Rows.Add(p.SAndR, p.SitAndReachScore());
                dataGridView1.Rows.Add(p.SLeap, p.StandingLeapScore());
                dataGridView1.Rows.Add(p.SRun, p.ShortRunScore());
                dataGridView1.Rows.Add(p.LRun, p.LongRunScore());
                dataGridView1.Rows.Add(p.COrSU, p.ChinningOrSitUpScore());

                dataGridView1.Rows[0].HeaderCell.Value = "时间";
                dataGridView1.Rows[1].HeaderCell.Value = "总成绩";
                dataGridView1.Rows[2].HeaderCell.Value = "身高";
                dataGridView1.Rows[3].HeaderCell.Value = "体重";
                dataGridView1.Rows[4].HeaderCell.Value = "肺活量";
                dataGridView1.Rows[5].HeaderCell.Value = "坐位体前屈";
                dataGridView1.Rows[6].HeaderCell.Value = "立定跳远";
                dataGridView1.Rows[7].HeaderCell.Value = "50米跑";
                if (Context.loginuser.Sex == 0)
                {
                    dataGridView1.Rows[8].HeaderCell.Value = "1000米跑";
                    dataGridView1.Rows[9].HeaderCell.Value = "引体向上";
                }
                else if (Context.loginuser.Sex == 1)
                {
                    dataGridView1.Rows[8].HeaderCell.Value = "800米跑";
                    dataGridView1.Rows[9].HeaderCell.Value = "仰卧起坐";
                }

                Point formPoint = this.PointToClient(Control.MousePosition);
                int x = formPoint.X;
                int y = formPoint.Y;
                //显示提示信息
                this.panel1.Visible = true;
                this.panel1.Location = new Point(x, y);

            }
            //鼠标离开数据标记点，则隐藏提示信息
            else
            {
                this.panel1.Visible = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Close();
        }

    }
}
