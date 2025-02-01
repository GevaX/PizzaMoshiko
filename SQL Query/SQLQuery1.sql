INSERT INTO [dbo].[Users] ([username], [email], [password_hash], [fname], [lname], [gender], [age], [favorite_topping], [crust_preference], [cheese_level], [spicy_level])
VALUES
    ('user1', 'user1@example.com', 'hashedpassword1', 'John', 'Doe', 'Male', '19to30', 'Pepperoni', 'thin', 'regular', 'medium'),
    ('user2', 'user2@example.com', 'hashedpassword2', 'Jane', 'Smith', 'Female', '31to45', 'Mushroom', 'thick', 'extra', 'mild'),
    ('user3', 'user3@example.com', 'hashedpassword3', 'Mike', 'Johnson', 'Pizza', '13to18', 'Pineapple', 'extra-crispy', 'all-the-cheese', 'spicy'),
    ('user4', 'user4@example.com', 'hashedpassword4', 'Emily', 'Brown', 'Female', '46to60', 'Olives', 'surprise-me', 'regular', 'fire'),
    ('user5', 'user5@example.com', 'hashedpassword5', 'Chris', 'White', 'Male', '1to13', 'Sausage', 'thin', 'extra', 'mild');