using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tuition_Center_Application
{
    public partial class testing3 : System.Web.UI.Page
    {
        public string sessionId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            stripe_checkout();
        }

        void stripe_checkout()
        {

            StripeConfiguration.ApiKey = "sk_test_51KLfunFk6dh40g5t1gLqZvN5hOpYVBqp4LK6YJorr0v20oUw05YOuKbs56vxdMa3mQFWE68w5os9Bl6MqTJvcLjl00kUpS4ld0";

            var options = new SessionCreateOptions
            {
                SuccessUrl = "https://www.google.com",
                CancelUrl = "https://www.youtube.com",
                LineItems = new List<SessionLineItemOptions>
                {
                    new SessionLineItemOptions
                    {
                        Name = "T-shirt",
                        Description = "hihi",
                        Currency = "myr",
                        Amount = 100,
                        Quantity = 2,
                    },
                },
                Mode = "payment",
            };
            var service = new SessionService();
            service.Create(options);
        }
    }
}