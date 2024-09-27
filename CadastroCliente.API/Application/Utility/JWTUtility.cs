namespace CadastroCliente.API.Application.Utility;

public class JWTUtility
{
    public static string GenerateJwtToken(IConfiguration configuration, PessoaEntity entity)
    {
        var jwtSettings = configuration.GetSection("JwtSettings");
        var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings["Secret"]));
        var signingCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);

        var claims = new List<Claim>
        {
            new (JwtRegisteredClaimNames.Email, entity.Email),
            new (JwtRegisteredClaimNames.Jti, entity.Id.ToString()),
        };

        var tokenOptions = new JwtSecurityToken(
            issuer: jwtSettings["Issuer"],
            claims: claims,
            expires: DateTime.Now.AddMinutes(Convert.ToDouble(jwtSettings["ExpirationInMinutes"])),
            signingCredentials: signingCredentials
        );

        var tokenString = new JwtSecurityTokenHandler().WriteToken(tokenOptions);
        return tokenString;
    }
}
