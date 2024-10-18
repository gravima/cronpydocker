import requests
import random
import string

def send_random_data():
    url = "https://webhook.site/57e5fab6-0fb0-4d4f-9c01-ca38454588b3"

    # Erstellen zufälliger Daten
    random_data = {
        "random_string": ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
        "random_number": random.randint(1, 100),
    }

    # POST-Request senden
    response = requests.post(url, json=random_data)

    # Antwortstatus drucken
    print(f"Response Status Code: {response.status_code}")

if __name__ == "__main__":
    send_random_data()
