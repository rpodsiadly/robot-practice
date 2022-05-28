from faker import Faker

def fake_email(self):
        fake = Faker()
        return ((fake.name()).replace(" ", "") + str(fake.random.randint(0, 1000)) + "@" + (fake.name()).replace(" ",
                                                                                                                 "") + str(
            fake.random.randint(0, 1000)) + ".com").lower()