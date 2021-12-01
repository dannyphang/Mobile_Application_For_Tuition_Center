using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application
{
    public partial class testing2 : System.Web.UI.Page
    {
        protected static string[] level_list = Course.level_list;
        protected void Page_Load(object sender, EventArgs e)
        {
            level_item();
        }

        public void level_item()
        {
            level_ddl.Items.Clear();
            for (int i = 0; i < level_list.Length; i++)
            {
                level_ddl.Items.Add(level_list[i]);
            }
        }
    }
}