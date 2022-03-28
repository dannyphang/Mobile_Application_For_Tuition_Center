async function importCredentials() {
    const response = await fetch("../stripe.json");
    const credentials = response.json();
    return credentials;
}

const credentials = await importCredentials();

var stripe = Stripe(credentials.PublishableKey);
var stripe_form = document.getElementById("form_1");