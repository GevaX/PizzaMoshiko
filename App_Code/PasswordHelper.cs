using System;
using System.Security.Cryptography;
using System.Text;

public class PasswordHelper
{
    // Hash a password using SHA-256
    public static string HashPassword(string password, string salt)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            // Combine password with salt
            string combined = password + salt;
            byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(combined));

            // Convert to a readable string
            return Convert.ToBase64String(hashBytes);
        }
    }

    // Generate a random salt
    public static string GenerateSalt()
    {
        byte[] saltBytes = new byte[16]; // 16-byte salt
        using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
        {
            rng.GetBytes(saltBytes);
        }
        return Convert.ToBase64String(saltBytes);
    }

    // Verify password during login
    public static bool VerifyPassword(string enteredPassword, string storedHash, string storedSalt)
    {
        string hashAttempt = HashPassword(enteredPassword, storedSalt);
        return hashAttempt == storedHash; // Compare hashes
    }
}
