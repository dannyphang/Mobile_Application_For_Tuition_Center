async function importCredentials() {
    const response = await fetch("../stripe.json");
    const credentials = response.json();
    return credentials;
}

const credentials = await importCredentials();

var stripe = Stripe(credentials.PublishableKey);
var stripe_form = document.getElementById("form_1");

stripe_form.addEventListener('submit', function (e) {
    e.preventDefault();
    //stripe.redirectToCheckout({
    //    sessionId: "<%= sessionId %>", 
    //});

    //console.log(sessionId);
})