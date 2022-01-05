from faker import Faker
fake = Faker()

def factory_user():
    user = {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'abc123'
    }

    return user
