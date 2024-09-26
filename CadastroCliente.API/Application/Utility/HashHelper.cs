namespace CadastroCliente.API.Application.Utility;

public class HashHelper
{
    private static readonly int Iterations = 10000;
    private static readonly int HashSize = 32;
    private static readonly int SaltSize = 32;

    public static byte[] GerarSalt()
    {
        byte[] salt = new byte[SaltSize];
        RandomNumberGenerator.Fill(salt);
        return salt;
    }

    public static byte[] GerarHash(string password, byte[] salt)
    {
        using var rfc2898DeriveBytes = new Rfc2898DeriveBytes(password, salt, Iterations, HashAlgorithmName.SHA256);
        return rfc2898DeriveBytes.GetBytes(HashSize);
    }

    private static bool CompararHashes(byte[] hash1, byte[] hash2)
    {
        if (hash1.Length != hash2.Length)
            return false;

        for (int i = 0; i < hash1.Length; i++)
        {
            if (hash1[i] != hash2[i])
                return false;
        }

        return true;
    }

    public static bool VerificarSenha(string password, byte[] storedSalt, byte[] storedHash)
    {
        byte[] newHash = GerarHash(password, storedSalt);
        return CompararHashes(newHash, storedHash);
    }
}
